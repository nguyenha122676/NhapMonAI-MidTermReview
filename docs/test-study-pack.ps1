$ErrorActionPreference = 'Stop'

$reviewRoot = Split-Path -Parent $PSScriptRoot
$chapters = @(
    'Chapter 1 - Introduction',
    'Chapter 2 - Propositional Logic',
    'Chapter 3 - First-order Predicate Logic',
    'Chapter 4 - Limitations of Logic',
    'Chapter 5 - Logic Programming with PROLOG',
    'Chapter 6 - Search Games and Problem Solving',
    'Chapter 7 - Reasoning with Uncertainty'
)
$requiredFiles = @(
    '01_LY_THUYET_CHI_TIET.md',
    '02_DANG_BAI_TRONG_TAM_VA_LOI_GIAI.md',
    '03_KHAI_NIEM_BAT_BUOC_HOC_THUOC.md'
)
$errors = [System.Collections.Generic.List[string]]::new()

foreach ($chapter in $chapters) {
    $chapterPath = Join-Path $reviewRoot $chapter
    if (-not (Test-Path -LiteralPath $chapterPath -PathType Container)) {
        $errors.Add("Missing chapter directory: $chapter")
        continue
    }
    foreach ($file in $requiredFiles) {
        $path = Join-Path $chapterPath $file
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
            $errors.Add("Missing file: $chapter/$file")
            continue
        }
        $content = Get-Content -LiteralPath $path -Raw
        if ([string]::IsNullOrWhiteSpace($content)) { $errors.Add("Empty file: $chapter/$file") }
        foreach ($heading in @('## Dễ nhầm trong phòng thi', '## Tự kiểm tra nhanh', '## Nguồn đã dùng', 'Ngày kiểm tra: 23/10/2026')) {
            if ($content -notmatch [regex]::Escape($heading)) { $errors.Add("Missing '$heading': $chapter/$file") }
        }
        if ($content -match '(?i)chắc chắn.{0,12}(ra|xuất hiện)') { $errors.Add("Overclaim in: $chapter/$file") }
    }
}

foreach ($rootFile in @('README.md', 'docs/EVIDENCE_MATRIX.md')) {
    if (-not (Test-Path -LiteralPath (Join-Path $reviewRoot $rootFile) -PathType Leaf)) {
        $errors.Add("Missing root document: $rootFile")
    }
}

$contentChecks = @{
    'Chapter 5 - Logic Programming with PROLOG/02_DANG_BAI_TRONG_TAM_VA_LOI_GIAI.md' = @('### Cây SLD đầy đủ', 'min_cut(2,5,5)')
    'Chapter 6 - Search Games and Problem Solving/02_DANG_BAI_TRONG_TAM_VA_LOI_GIAI.md' = @('### Bảng Open/Closed đầy đủ', 'Bài 2 – Manhattan')
    'Chapter 7 - Reasoning with Uncertainty/02_DANG_BAI_TRONG_TAM_VA_LOI_GIAI.md' = @('### Lagrangian và đạo hàm', 'tính lõm nghiêm ngặt')
    'README.md' = @('CC-BY-SA 4.0')
}
foreach ($relativePath in $contentChecks.Keys) {
    $path = Join-Path $reviewRoot $relativePath
    if (-not (Test-Path -LiteralPath $path)) { continue }
    $content = Get-Content -LiteralPath $path -Raw
    foreach ($needle in $contentChecks[$relativePath]) {
        if ($content -notmatch [regex]::Escape($needle)) { $errors.Add("Missing deep-review requirement '$needle': $relativePath") }
    }
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ -ErrorAction Continue }
    throw "Study-pack validation failed with $($errors.Count) error(s)."
}

Write-Output 'PASS: 7 chapter directories, 21 chapter files, README and evidence matrix are present with required sections.'
