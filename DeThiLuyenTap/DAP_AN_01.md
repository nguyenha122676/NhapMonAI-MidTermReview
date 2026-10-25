# ĐÁP ÁN VÀ THANG ĐIỂM — ĐỀ 01

## Câu 1 (1.5 điểm)

### Question (English)

The Turing Test evaluates whether a machine can exhibit conversational behaviour that is difficult to distinguish from that of a human.

1. Briefly describe how the Turing Test works. (0.5 point)
2. Give two reasons why it is unsuitable as the only definition of artificial intelligence in practical applications. Use at least one concrete example. (1.0 point)

### Câu hỏi (Tiếng Việt)

Turing Test đánh giá liệu một cỗ máy có thể thể hiện hành vi hội thoại khó phân biệt với con người hay không.

1. Mô tả ngắn gọn cách Turing Test hoạt động. (0.5 điểm)
2. Nêu hai lý do vì sao phép thử này không phù hợp để làm định nghĩa duy nhất về trí tuệ nhân tạo trong các ứng dụng thực tế. Sử dụng ít nhất một ví dụ cụ thể. (1.0 điểm)

### Đáp án

1. Người đánh giá trao đổi qua giao diện văn bản với một người và một máy nhưng không biết bên nào là máy. Nếu người đánh giá không thể phân biệt đáng tin cậy, máy được xem là thể hiện hành vi hội thoại giống người. **0.5 điểm.**
2. Chấp nhận hai trong các ý sau, có giải thích: **mỗi ý 0.4 điểm**, ví dụ phù hợp **0.2 điểm**.
   - Đo hành vi bắt chước chứ không chứng minh sự hiểu biết (understanding).
   - Chỉ tập trung hội thoại, bỏ qua nhận thức, vận động, lập kế hoạch và hành động trong thế giới thật.
   - Có thể thắng bằng né tránh/đánh lạc hướng thay vì năng lực suy luận sâu.
   - Một hệ A* hoặc robot công nghiệp có thể giải nhiệm vụ thông minh nhưng không cần hội thoại giống người.

## Câu 2 (1.0 điểm)

### Question (English)

Consider the knowledge base

\[
KB=\{A\Rightarrow(B\lor C),\;B\Rightarrow D,\;C\Rightarrow D,\;A\}.
\]

Using resolution by refutation, prove that `KB` entails `D`. Convert all formulas to CNF, state the added negated goal, and show every resolution step.

### Câu hỏi (Tiếng Việt)

Cho cơ sở tri thức

\[
KB=\{A\Rightarrow(B\lor C),\;B\Rightarrow D,\;C\Rightarrow D,\;A\}.
\]

Dùng phương pháp phân giải bằng phản chứng (resolution by refutation) để chứng minh `KB` kéo theo `D`. Hãy chuyển mọi công thức sang CNF, nêu mục tiêu phủ định được thêm vào và trình bày từng bước phân giải.

### Đáp án

Chuyển CNF và thêm phủ định mục tiêu:

1. `¬A∨B∨C` từ `A⇒(B∨C)`.
2. `¬B∨D`.
3. `¬C∨D`.
4. `A`.
5. `¬D` — phủ định goal.

Resolution:

6. Res(2,5) theo `D`: `¬B`.
7. Res(3,5) theo `D`: `¬C`.
8. Res(1,6) theo `B`: `¬A∨C`.
9. Res(8,7) theo `C`: `¬A`.
10. Res(4,9) theo `A`: `□`.

Suy ra `KB∧¬D` không thỏa được, nên `KB⊨D`.

**Rubric:** CNF + negated goal 0.3; các resolvent hợp lệ 0.5; kết luận 0.2.

## Câu 3 (1.0 điểm)

### Question (English)

Convert the following first-order formula into clausal CNF. Show the elimination of implication, Skolemization, and distribution steps.

\[
\forall x\bigl(Researcher(x)\Rightarrow
\exists y(Paper(y)\land Reviews(x,y))\bigr).
\]

### Câu hỏi (Tiếng Việt)

Chuyển công thức logic bậc nhất sau sang CNF dạng mệnh đề (clausal CNF). Trình bày các bước khử phép kéo theo, Skolem hóa và phân phối.

\[
\forall x\bigl(Researcher(x)\Rightarrow
\exists y(Paper(y)\land Reviews(x,y))\bigr).
\]

### Đáp án

\[
\forall x(\neg Researcher(x)\lor\exists y(Paper(y)\land Reviews(x,y))).
\]

Biến `y` phụ thuộc vào universal variable `x`, nên đặt Skolem function `f(x)`:

\[
\forall x(\neg Researcher(x)\lor(Paper(f(x))\land Reviews(x,f(x)))).
\]

Phân phối `∨` qua `∧`, rồi bỏ `∀` ngầm hiểu:

1. `¬Researcher(x)∨Paper(f(x))`.
2. `¬Researcher(x)∨Reviews(x,f(x))`.

**Rubric:** bỏ implication 0.25; Skolem đúng dependency 0.35; hai clauses đúng 0.4.

## Câu 4 (1.0 điểm)

### Question (English)

Explain what it means for first-order logic validity to be **semi-decidable**. Contrast this with propositional logic being **decidable**, and state one practical consequence for an automated theorem prover.

### Câu hỏi (Tiếng Việt)

Giải thích ý nghĩa của việc tính hợp lệ trong logic bậc nhất là **bán quyết định được (semi-decidable)**. So sánh với tính **quyết định được (decidable)** của logic mệnh đề và nêu một hệ quả thực tế đối với bộ chứng minh định lý tự động.

### Đáp án

- **Decidable:** có thuật toán luôn dừng và trả lời đúng cả yes/no. Propositional validity có thể quyết định bằng truth table hữu hạn. **0.35 điểm.**
- **Semi-decidable:** nếu công thức FOL valid, thủ tục chứng minh đầy đủ cuối cùng tìm được proof và dừng; nếu không valid, nó có thể chạy mãi. **0.4 điểm.**
- Hệ quả: timeout/không tìm thấy proof chưa cho phép kết luận công thức sai. **0.25 điểm.**

## Câu 5 (1.5 điểm)

### Question (English)

Consider the following Prolog program:

```prolog
sum_to(0, 0).
sum_to(N, S) :-
    N > 0,
    N1 is N - 1,
    sum_to(N1, S1),
    S is S1 + N.
```

1. What answer is returned for `?- sum_to(3, Result).`? (0.5 point)
2. Trace the recursive calls and the values produced while the recursion unwinds. (1.0 point)

### Câu hỏi (Tiếng Việt)

Cho chương trình Prolog sau:

```prolog
sum_to(0, 0).
sum_to(N, S) :-
    N > 0,
    N1 is N - 1,
    sum_to(N1, S1),
    S is S1 + N.
```

1. Truy vấn `?- sum_to(3, Result).` trả về đáp án nào? (0.5 điểm)
2. Truy vết các lời gọi đệ quy và các giá trị được tạo ra khi đệ quy quay lui. (1.0 điểm)

### Đáp án

Kết quả: `Result = 6`. **0.5 điểm.**

Truy vết:

```text
sum_to(3,S)
→ sum_to(2,S1)
  → sum_to(1,S2)
    → sum_to(0,S3)
    → S3=0
  → S2=0+1=1
→ S1=1+2=3
→ S=3+3=6
```

**Rubric:** đúng chuỗi lời gọi 0.5; đúng quá trình unwind 0.5.

## Câu 6 (2.0 điểm)

### Question (English)

Apply A* graph search to the following directed weighted graph:

- Edges: `S→A:1`, `S→B:4`, `A→C:2`, `A→G:7`, `B→C:1`, `B→G:5`, `C→G:3`.
- Heuristic values: `h(S)=5`, `h(A)=4`, `h(B)=3`, `h(C)=2`, `h(G)=0`.
- Break ties alphabetically. Reopen/update a node if a cheaper path is found.

Show `g(n)`, `h(n)`, and `f(n)` for every expanded node, and show the Open list after each expansion. Give the final path and cost. Is the heuristic admissible and consistent? Justify briefly.

### Câu hỏi (Tiếng Việt)

Áp dụng tìm kiếm đồ thị A* cho đồ thị có trọng số và có hướng sau:

- Các cạnh: `S→A:1`, `S→B:4`, `A→C:2`, `A→G:7`, `B→C:1`, `B→G:5`, `C→G:3`.
- Giá trị heuristic: `h(S)=5`, `h(A)=4`, `h(B)=3`, `h(C)=2`, `h(G)=0`.
- Khi hòa, ưu tiên theo thứ tự chữ cái. Mở lại/cập nhật một nút nếu tìm được đường đi rẻ hơn.

Trình bày `g(n)`, `h(n)` và `f(n)` cho mọi nút được mở rộng, đồng thời ghi danh sách Open sau mỗi bước. Cho biết đường đi cuối cùng và chi phí. Heuristic có admissible và consistent không? Giải thích ngắn gọn.

### Đáp án

Ban đầu: `S: g=0,h=5,f=5`.

| Bước | Mở rộng | Successors/updates | Open sau bước |
|---:|---|---|---|
| 1 | `S(0,5,5)` | `A(1,4,5)`, `B(4,3,7)` | `A:5, B:7` |
| 2 | `A(1,4,5)` | `C(3,2,5)`, `G(8,0,8)` | `C:5, B:7, G:8` |
| 3 | `C(3,2,5)` | cập nhật `G` thành `(6,0,6)` | `G:6, B:7` |
| 4 | `G(6,0,6)` | goal | dừng |

Đường đi: `S→A→C→G`, cost `1+2+3=6`.

Admissible: true costs-to-go là `h*(S)=6`, `h*(A)=5`, `h*(B)=4`, `h*(C)=3`, `h*(G)=0`; mọi `h≤h*`.

Consistent: kiểm tra từng cạnh, ví dụ `h(S)=5≤1+h(A)=5`, `h(A)=4≤2+h(C)=4`, `h(C)=2≤3+h(G)=3`; các cạnh còn lại cũng thỏa. Vậy heuristic consistent.

**Rubric:** `g,h,f` và Open đúng 1.0; path/cost 0.4; admissible 0.3; consistent 0.3.

## Câu 7 (2.0 điểm)

### Question (English)

A Bayesian Network has four binary variables:

- Course Difficulty `D` and Study Effort `S` are root nodes.
- `D→P` and `S→P`, where `P` means passing the course.
- `P→H`, where `H` means receiving a scholarship.

1. Factorize the joint distribution `P(D,S,P,H)` according to the network. (0.75 point)
2. Are `D` and `S` independent before observing `P`? Are they conditionally independent after observing `P`? Explain using d-separation and name the relevant phenomenon. (1.25 points)

### Câu hỏi (Tiếng Việt)

Một mạng Bayes có bốn biến nhị phân:

- Độ khó môn học `D` và Nỗ lực học tập `S` là các nút gốc.
- `D→P` và `S→P`, trong đó `P` biểu thị việc qua môn.
- `P→H`, trong đó `H` biểu thị việc nhận học bổng.

1. Phân rã phân phối đồng thời `P(D,S,P,H)` theo cấu trúc mạng. (0.75 điểm)
2. `D` và `S` có độc lập trước khi quan sát `P` không? Sau khi quan sát `P`, chúng có độc lập có điều kiện không? Giải thích bằng d-separation và nêu tên hiện tượng liên quan. (1.25 điểm)

### Đáp án

1. Factorization:

\[
P(D,S,P,H)=P(D)P(S)P(P\mid D,S)P(H\mid P).
\]

**0.75 điểm.**

2. Trước khi quan sát `P`, đường `D→P←S` là collider và bị chặn, nên cấu trúc suy ra `D⟂S`. Khi condition trên `P`, collider được mở; `D` và `S` không còn d-separated và có thể trở nên phụ thuộc. Biết môn khó làm thay đổi mức nỗ lực cần thiết để giải thích cùng một kết quả pass. Hiện tượng này là **explaining away**. **1.25 điểm.**

## Tổng điểm

**Tổng: 10/10**
