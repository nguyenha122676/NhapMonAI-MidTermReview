$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$errors = [System.Collections.Generic.List[string]]::new()
$pointPattern = @('1.5','1.0','1.0','1.0','1.5','2.0','2.0')

foreach ($i in 1..5) {
    $id = '{0:D2}' -f $i
    $exam = Join-Path $root "DE_$id.md"
    $answer = Join-Path $root "DAP_AN_$id.md"
    foreach ($path in @($exam,$answer)) {
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
            $errors.Add("Missing file: $([IO.Path]::GetFileName($path))")
        }
    }
    if (Test-Path -LiteralPath $exam) {
        $text = Get-Content -LiteralPath $exam -Raw
        if ($text -notmatch 'Time allowed:\s*90 minutes') { $errors.Add("DE_$id missing 90-minute header") }
        if ($text -notmatch 'Total:\s*10 points') { $errors.Add("DE_$id missing 10-point header") }
        $questionMatches = [regex]::Matches($text,'(?m)^## Question (\d+) \(')
        $questionNumbers = @($questionMatches | ForEach-Object { [int]$_.Groups[1].Value })
        if (($questionNumbers.Count -ne 7) -or (($questionNumbers -join ',') -ne '1,2,3,4,5,6,7')) {
            $errors.Add("DE_$id must contain exactly Question 1 through Question 7 in order")
        }
        if ($text -match '(?im)^## (Solution|Answer)|Lời giải|Đáp án') { $errors.Add("DE_$id leaks answers") }
        foreach ($q in 1..7) {
            if ($text -notmatch [regex]::Escape("## Question $q ($($pointPattern[$q-1]) points)")) {
                $errors.Add("DE_$id Question $q has wrong/missing points")
            }
        }
    }
    if (Test-Path -LiteralPath $answer) {
        $text = Get-Content -LiteralPath $answer -Raw
        $answerMatches = [regex]::Matches($text,'(?m)^## Câu (\d+) \(')
        $answerNumbers = @($answerMatches | ForEach-Object { [int]$_.Groups[1].Value })
        if (($answerNumbers.Count -ne 7) -or (($answerNumbers -join ',') -ne '1,2,3,4,5,6,7')) {
            $errors.Add("DAP_AN_$id must contain exactly Câu 1 through Câu 7 in order")
        }
        if ([regex]::Matches($text,'(?m)^### Question \(English\)$').Count -ne 7) {
            $errors.Add("DAP_AN_$id must repeat all 7 questions in English")
        }
        if ([regex]::Matches($text,'(?m)^### Câu hỏi \(Tiếng Việt\)$').Count -ne 7) {
            $errors.Add("DAP_AN_$id must include Vietnamese translations for all 7 questions")
        }
        if ($text -notmatch 'Tổng:\s*10/10') { $errors.Add("DAP_AN_$id missing total rubric") }
        foreach ($q in 1..7) {
            if ($text -notmatch [regex]::Escape("## Câu $q ($($pointPattern[$q-1]) điểm)")) {
                $errors.Add("DAP_AN_$id Câu $q has wrong/missing points")
            }
        }
    }
}

$readme = Join-Path $root 'README.md'
if (-not (Test-Path -LiteralPath $readme)) {
    $errors.Add('Missing README.md')
} else {
    $readmeText = Get-Content -LiteralPath $readme -Raw
    $links = [regex]::Matches($readmeText,'\]\(([^)]+\.md)\)')
    foreach ($link in $links) {
        $target = Join-Path $root $link.Groups[1].Value
        if (-not (Test-Path -LiteralPath $target -PathType Leaf)) {
            $errors.Add("README has broken link: $($link.Groups[1].Value)")
        }
    }
}

if ($errors.Count) {
    $errors | ForEach-Object { Write-Error $_ -ErrorAction Continue }
    throw "Exam-pack validation failed with $($errors.Count) error(s)."
}

Write-Output 'PASS: required files, README links, exact Question/Câu 1-7 headings, bilingual question blocks, point headings, totals, and answer-leak markers satisfy the structural contract.'
