# ĐÁP ÁN VÀ THANG ĐIỂM — ĐỀ 05

## Câu 1 (1.5 điểm)

### Question (English)

Consider the definition: “Artificial Intelligence is the study of systems that act like humans.”

1. Give one strength and two limitations of this definition.
2. Contrast it with the **rational-agent** view of AI and give one example in which rational behavior need not imitate human behavior.

### Câu hỏi (Tiếng Việt)

Xét định nghĩa: “Trí tuệ nhân tạo là ngành nghiên cứu các hệ thống hành động giống con người.”

1. Nêu một ưu điểm và hai hạn chế của định nghĩa này.
2. So sánh với quan điểm **rational agent** về AI và cho một ví dụ trong đó hành vi hợp lý không cần bắt chước hành vi con người.

### Đáp án

- Điểm mạnh: định nghĩa “act like humans” cho một tiêu chuẩn hành vi có thể quan sát và kiểm thử, gần với tinh thần của Turing Test.
- Hai hạn chế: con người không phải lúc nào cũng hành động tối ưu; việc bắt chước bề ngoài không chứng minh hệ thống hiểu hoặc suy luận đúng. Ngoài ra, định nghĩa khó xác định “human-like” nào là chuẩn và có thể đánh giá thấp các hệ thống vượt con người theo cách khác.
- **Rational-agent view:** agent chọn hành động làm cực đại giá trị kỳ vọng của performance measure dựa trên percept sequence, tri thức và tài nguyên hiện có; mục tiêu là làm điều hợp lý, không nhất thiết giống con người.
- Ví dụ: chương trình tìm đường chọn tuyến ngắn nhất sau khi tính hàng triệu khả năng, dù con người không thể suy xét theo cách đó.

**Rubric:** strength 0.3; hai limitations 0.5; đối chiếu rational agent 0.45; ví dụ 0.25.

## Câu 2 (1.0 điểm)

### Question (English)

The following Horn-clause knowledge base is given:

\[
A.\qquad B.\qquad C.\qquad A\land B\Rightarrow D.\qquad C\land D\Rightarrow E.
\]

Prove the query \(E\) by an SLD-style, goal-directed derivation. Show the selected goal, the rule or fact used, and the new goal list at each step.

### Câu hỏi (Tiếng Việt)

Cho cơ sở tri thức gồm các Horn clause sau:

\[
A.\qquad B.\qquad C.\qquad A\land B\Rightarrow D.\qquad C\land D\Rightarrow E.
\]

Chứng minh truy vấn \(E\) bằng phép suy diễn hướng mục tiêu theo kiểu SLD. Ở mỗi bước, trình bày mục tiêu được chọn, luật hoặc fact được dùng và danh sách mục tiêu mới.

### Đáp án

Viết goal list từ trái sang phải:

1. `[E]`. Dùng \(C\land D\Rightarrow E\) được `[C,D]`.
2. Chọn `C`; dùng fact \(C\), còn `[D]`.
3. Chọn `D`; dùng \(A\land B\Rightarrow D\), được `[A,B]`.
4. Chọn `A`; dùng fact \(A\), còn `[B]`.
5. Chọn `B`; dùng fact \(B\), còn `[]`.

Goal rỗng nghĩa là truy vấn thành công, do đó \(E\) được chứng minh. Thứ tự chọn `D` trước `C` cũng đúng nếu nhất quán.

**Rubric:** dùng đúng hai rule 0.4; goal lists và facts 0.4; kết luận success 0.2.

## Câu 3 (1.0 điểm)

### Question (English)

Find the most general unifier (MGU), if one exists, for

\[
Q(x,h(y),y)\quad\text{and}\quad Q(f(a),h(b),b).
\]

Show the equations solved and verify the final substitution by applying it to both atoms.

### Câu hỏi (Tiếng Việt)

Tìm bộ hợp nhất tổng quát nhất (MGU), nếu tồn tại, cho

\[
Q(x,h(y),y)\quad\text{và}\quad Q(f(a),h(b),b).
\]

Trình bày các phương trình được giải và kiểm tra phép thế cuối bằng cách áp dụng nó cho cả hai atom.

### Đáp án

Ghép các đối số tương ứng:

\[
x=f(a),\qquad h(y)=h(b),\qquad y=b.
\]

Từ phương trình thứ hai cũng thu được \(y=b\), nhất quán với phương trình thứ ba. Vì vậy

\[
\theta=\{x\mapsto f(a),\;y\mapsto b\}
\]

là MGU. Kiểm tra:

\[
Q(x,h(y),y)\theta=Q(f(a),h(b),b),
\]

bằng chính atom thứ hai sau khi áp dụng \(\theta\).

**Rubric:** equations 0.3; MGU 0.4; verification 0.3.

## Câu 4 (1.0 điểm)

### Question (English)

For each statement, choose the most suitable representation among **classical two-valued logic**, **probability**, and **fuzzy logic**, then justify your choice.

1. Classify and justify all three statements:
   - “A face-up card is observed to be a heart.”
   - “Tomorrow it will rain, based on incomplete weather information.”
   - “The room is warm,” where warmth has gradual degrees rather than a sharp boundary.

2. State the central difference between probabilistic uncertainty and fuzzy truth.

### Câu hỏi (Tiếng Việt)

Với mỗi phát biểu, hãy chọn cách biểu diễn phù hợp nhất trong số **logic hai trị cổ điển**, **xác suất** và **logic mờ**, rồi giải thích lựa chọn.

1. Phân loại và giải thích cả ba phát biểu:
   - “Quan sát thấy một lá bài đang ngửa là lá cơ.”
   - “Ngày mai trời sẽ mưa, dựa trên thông tin thời tiết chưa đầy đủ.”
   - “Căn phòng ấm,” trong đó mức độ ấm thay đổi liên tục thay vì có một ranh giới sắc nét.
2. Nêu khác biệt cốt lõi giữa sự bất định xác suất và chân trị mờ.

### Đáp án

1a. **Classical two-valued logic:** lá bài đang ngửa và đã quan sát nên mệnh đề “is a heart” có chân trị rõ ràng là true. Không cần biểu diễn uncertainty cho phát biểu này.

1b. **Probability:** mưa ngày mai là một biến cố rõ nghĩa nhưng ta không chắc nó xảy ra do thông tin không đầy đủ.

1c. **Fuzzy logic:** “warm” là khái niệm mơ hồ có mức độ thành viên/truth degree, ví dụ nhiệt độ có thể warm ở mức 0.7.

2. Probability mô tả mức tin cậy/không chắc chắn rằng một mệnh đề rõ nghĩa là đúng; fuzzy truth mô tả mức độ một đối tượng thỏa một khái niệm có ranh giới mờ.

**Rubric:** mỗi lựa chọn và lý do 0.2; phân biệt probability/fuzziness 0.4.

## Câu 5 (1.5 điểm)

### Question (English)

Write a PROLOG predicate `count_occurrences(+X, +List, -N)` that counts how many times `X` occurs in `List`. Assume `X` is ground and `List` is a finite proper list of ground terms. You may use `=`, `\=`, and arithmetic `is`, but no library counting predicate.

Then trace the recursive calls and returned values for:

```prolog
?- count_occurrences(a, [a,b,a,a], N).
```

### Câu hỏi (Tiếng Việt)

Viết predicate PROLOG `count_occurrences(+X, +List, -N)` để đếm số lần `X` xuất hiện trong `List`. Giả sử `X` là ground và `List` là một danh sách proper hữu hạn gồm các ground term. Có thể dùng `=`, `\=` và phép toán `is`, nhưng không được dùng predicate đếm có sẵn trong thư viện.

Sau đó truy vết các lời gọi đệ quy và giá trị trả về cho:

```prolog
?- count_occurrences(a, [a,b,a,a], N).
```

### Đáp án

Một lời giải hợp lệ:

```prolog
count_occurrences(_, [], 0).
count_occurrences(X, [H|T], N) :-
    X = H,
    count_occurrences(X, T, N0),
    N is N0 + 1.
count_occurrences(X, [H|T], N) :-
    X \= H,
    count_occurrences(X, T, N).
```

Trace theo chiều gọi xuống:

```text
count(a,[a,b,a,a],N)
 -> count(a,[b,a,a],N1), N=N1+1
 -> count(a,[a,a],N1)
 -> count(a,[a],N2), N1=N2+1
 -> count(a,[],N3), N2=N3+1
 -> N3=0
```

Khi trả kết quả lên: \(N2=1\), \(N1=2\), \(N=3\). Vậy `N = 3`.

Một phiên bản dùng `if-then-else` hoặc cut đúng mode cũng được chấp nhận.

**Rubric:** base case 0.25; hai trường hợp đệ quy đúng 0.65; trace 0.4; kết quả 0.2.

## Câu 6 (2.0 điểm)

### Question (English)

Consider this directed weighted graph. Every table entry denotes a directed edge from the left node to the right node.

| Edge | Cost | Edge | Cost |
|---|---:|---|---:|
| S-A | 2 | S-B | 2 |
| A-C | 2 | A-G | 7 |
| B-C | 1 | B-D | 3 |
| C-G | 3 | D-G | 2 |

The heuristic is

\[
h(S)=5,\;h(A)=4,\;h(B)=4,\;h(C)=2,\;h(D)=1,\;h(G)=0.
\]

Use A* graph search with \(f=g+h\). Generate successors alphabetically, break remaining ties by earlier insertion, update a state in OPEN when a cheaper path is found, and stop when the goal is removed from OPEN. When an OPEN entry is improved, remove its old entry and reinsert the improved entry at the end of its new \(f\)-priority group.

1. Show the OPEN list after each expansion, including \(g,h,f\), and give the returned path and total cost.
2. Is the heuristic admissible? Is it consistent? Prove each answer. What implementation precaution is needed for an admissible but inconsistent heuristic?

### Câu hỏi (Tiếng Việt)

Xét đồ thị có hướng và có trọng số sau. Mỗi mục trong bảng biểu diễn một cạnh có hướng từ nút bên trái sang nút bên phải.

| Cạnh | Chi phí | Cạnh | Chi phí |
|---|---:|---|---:|
| S-A | 2 | S-B | 2 |
| A-C | 2 | A-G | 7 |
| B-C | 1 | B-D | 3 |
| C-G | 3 | D-G | 2 |

Heuristic là

\[
h(S)=5,\;h(A)=4,\;h(B)=4,\;h(C)=2,\;h(D)=1,\;h(G)=0.
\]

Dùng tìm kiếm đồ thị A* với \(f=g+h\). Sinh successor theo thứ tự chữ cái, phá hòa còn lại theo thứ tự đưa vào sớm hơn, cập nhật một trạng thái trong OPEN nếu tìm thấy đường rẻ hơn và dừng khi goal được lấy ra khỏi OPEN. Khi một mục trong OPEN được cải thiện, xóa mục cũ và chèn lại mục mới vào cuối nhóm cùng độ ưu tiên \(f\).

1. Ghi danh sách OPEN sau mỗi lần mở rộng, gồm \(g,h,f\), và nêu đường đi cùng tổng chi phí trả về.
2. Heuristic có admissible không? Có consistent không? Chứng minh từng kết luận. Cần lưu ý gì khi cài đặt A* với heuristic admissible nhưng không consistent?

### Đáp án

Ghi mỗi phần tử là `node:g,h,f`:

1a. OPEN lists:
   - Ban đầu `[S:0,5,5]`.
   - Mở rộng \(S\): `[A:2,4,6; B:2,4,6]`.
   - Mở rộng \(A\): thêm \(C\) với \(g=4\) và \(G\) với \(g=9\): `[B:2,4,6; C:4,2,6; G:9,0,9]`.
   - Mở rộng \(B\): đường mới tới \(C\) có \(g=3\), nên update: `[C:3,2,5; D:5,1,6; G:9,0,9]`.
   - Mở rộng \(C\): update \(G\) thành \(g=6\): `[D:5,1,6; G:6,0,6]`.
   - Mở rộng \(D\): ứng viên \(G\) có \(g=7\), không cải thiện: `[G:6,0,6]`.
   - Lấy \(G\) và dừng.
1b. Path là \(S-B-C-G\), cost \(2+1+3=6\).

2. Khoảng cách thật: \(h^*(G)=0,h^*(D)=2,h^*(C)=3,h^*(B)=4,h^*(A)=5,h^*(S)=6\). Mọi heuristic không vượt khoảng cách thật nên **admissible**. Nhưng trên cạnh \(B\rightarrow C\), \(h(B)=4>1+h(C)=3\); heuristic **not consistent**. Với heuristic không nhất quán, graph-search A* phải cập nhật đường tốt hơn và có thể phải **reopen** một state đã CLOSED; nếu không, tính tối ưu có thể bị mất.

**Rubric:** OPEN/update đúng 0.9; path/cost 0.35; admissibility 0.3; inconsistency và reopen 0.45.

## Câu 7 (2.0 điểm)

### Question (English)

An email filter uses a Boolean feature \(K\): the email contains a suspicious keyword. Let \(S\) denote that the email is spam.

\[
P(S)=0.10,\qquad P(K\mid S)=0.80,\qquad P(K\mid\neg S)=0.20.
\]

1. Compute \(P(K)\), then compute \(P(S\mid K)\) using Bayes' theorem.
2. Compare the posterior with the prior and explain why a positive keyword does not imply that the email is certainly spam.

### Câu hỏi (Tiếng Việt)

Một bộ lọc email dùng đặc trưng Boolean \(K\): email chứa một từ khóa đáng ngờ. Gọi \(S\) là sự kiện email là spam.

\[
P(S)=0.10,\qquad P(K\mid S)=0.80,\qquad P(K\mid\neg S)=0.20.
\]

1. Tính \(P(K)\), sau đó tính \(P(S\mid K)\) bằng định lý Bayes.
2. So sánh xác suất hậu nghiệm với xác suất tiên nghiệm và giải thích vì sao có từ khóa đáng ngờ không có nghĩa email chắc chắn là spam.

### Đáp án

1a. Theo luật xác suất toàn phần:

\[
P(K)=P(K\mid S)P(S)+P(K\mid\neg S)P(\neg S)
=0.8(0.1)+0.2(0.9)=0.26.
\]

1b. Theo Bayes:

\[
P(S\mid K)=\frac{P(K\mid S)P(S)}{P(K)}
=\frac{0.8(0.1)}{0.26}=\frac{4}{13}\approx0.3077.
\]

2. Posterior tăng từ 0.10 lên khoảng 0.308, nên keyword là evidence ủng hộ spam. Tuy nhiên nhiều email không phải spam cũng chứa keyword: phần false positive là \(0.2\times0.9=0.18\), lớn hơn phần spam-and-keyword \(0.08\). Vì vậy một kết quả dương không đồng nghĩa chắc chắn là spam; cần xét base rate.

**Rubric:** \(P(K)\) 0.6; Bayes và kết quả 0.8; diễn giải posterior/base rate 0.6.

**Tổng: 10/10**
