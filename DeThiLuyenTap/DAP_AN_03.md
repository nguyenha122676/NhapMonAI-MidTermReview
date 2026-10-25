# ĐÁP ÁN VÀ THANG ĐIỂM — ĐỀ 03

## Câu 1 (1.5 điểm)

### Question (English)

Compare Symbolicism and Connectionism as approaches to artificial intelligence.

1. Describe how each approach represents or acquires knowledge. (1.0 point)
2. Give one representative system/technique for each approach and discuss one strength and one limitation of each. (0.5 point)

### Câu hỏi (Tiếng Việt)

So sánh Symbolicism và Connectionism như hai cách tiếp cận trí tuệ nhân tạo.

1. Mô tả cách mỗi cách tiếp cận biểu diễn hoặc thu nhận tri thức. (1.0 điểm)
2. Nêu một hệ thống/kỹ thuật tiêu biểu cho mỗi cách tiếp cận, đồng thời phân tích một ưu điểm và một hạn chế của mỗi cách. (0.5 điểm)

### Đáp án

- Symbolicism biểu diễn tri thức tường minh bằng symbols, rules, logic; ví dụ expert system/PROLOG/theorem prover. Dễ giải thích nhưng khó thu nhận và mở rộng tri thức, dễ gặp search explosion.
- Connectionism học biểu diễn phân tán trong weights của neural networks; ví dụ CNN. Học mẫu tốt từ dữ liệu nhưng khó giải thích và phụ thuộc dữ liệu/tính toán.

**Rubric:** mô tả mỗi trường phái 0.5; hai ví dụ 0.2; strengths/limitations 0.3.

## Câu 2 (1.0 điểm)

### Question (English)

Use resolution to show that the following propositional clause set is unsatisfiable:

\[
\{P,\;\neg P\lor Q,\;\neg Q\lor\neg R\lor S,\;R,\;\neg S\}.
\]

Number the clauses and show the parents of every resolvent.

### Câu hỏi (Tiếng Việt)

Dùng phép phân giải để chứng minh tập mệnh đề sau là không thỏa được (unsatisfiable):

\[
\{P,\;\neg P\lor Q,\;\neg Q\lor\neg R\lor S,\;R,\;\neg S\}.
\]

Đánh số các clause và chỉ rõ các clause cha của từng resolvent.

### Đáp án

1. `P`
2. `¬P∨Q`
3. `¬Q∨¬R∨S`
4. `R`
5. `¬S`
6. Res(1,2): `Q`.
7. Res(3,5) theo `S`: `¬Q∨¬R`.
8. Res(6,7) theo `Q`: `¬R`.
9. Res(4,8): `□`.

Tập clause unsatisfiable.

**Rubric:** resolvents 0.8; kết luận 0.2.

## Câu 3 (1.0 điểm)

### Question (English)

Formalize both sentences in first-order logic, using `Robot(x)`, `Task(y)`, and `Solves(x,y)`:

1. Every robot solves at least one task.
2. There is a task that every robot solves.

Explain precisely how the quantifier order changes the meaning.

### Câu hỏi (Tiếng Việt)

Biểu diễn hai câu sau bằng logic bậc nhất, sử dụng `Robot(x)`, `Task(y)` và `Solves(x,y)`:

1. Mọi robot đều giải được ít nhất một nhiệm vụ.
2. Tồn tại một nhiệm vụ mà mọi robot đều giải được.

Giải thích chính xác việc thay đổi thứ tự lượng từ làm thay đổi ý nghĩa như thế nào.

### Đáp án

1. `∀x(Robot(x)⇒∃y(Task(y)∧Solves(x,y)))`.
2. `∃y(Task(y)∧∀x(Robot(x)⇒Solves(x,y)))`.

Câu 1 cho phép mỗi robot có một task khác nhau (`y` phụ thuộc `x`). Câu 2 yêu cầu tồn tại một task chung được mọi robot giải.

**Rubric:** mỗi formula 0.35; giải thích dependency/order 0.3.

## Câu 4 (1.0 điểm)

### Question (English)

Explain the Flying Penguin (Tweety) problem. Why does the rule `Bird(x)⇒Flies(x)` conflict with the exception that penguins do not fly? What limitation of classical logic does this reveal, and what kind of reasoning is needed for everyday defaults?

### Câu hỏi (Tiếng Việt)

Giải thích bài toán Flying Penguin (Tweety). Vì sao luật `Bird(x)⇒Flies(x)` xung đột với ngoại lệ rằng chim cánh cụt không bay? Điều này cho thấy hạn chế nào của logic cổ điển, và cần kiểu suy luận nào để xử lý các mặc định trong đời thường?

### Đáp án

Rule tuyệt đối `Bird(x)⇒Flies(x)` cùng `Penguin(x)⇒Bird(x)` và `Penguin(x)⇒¬Flies(x)` làm một cá thể penguin suy ra cả `Flies` lẫn `¬Flies`. Classical logic là monotonic: thêm fact mới không rút được kết luận cũ; contradiction còn gây principle of explosion. Tri thức đời thường cần default/non-monotonic reasoning để tạm kết luận chim thường bay và rút lại khi biết ngoại lệ.

**Rubric:** tình huống 0.3; monotonicity/inconsistency 0.4; hướng khắc phục 0.3.

## Câu 5 (1.5 điểm)

### Question (English)

Consider:

```prolog
edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
```

For the query `?- edge(X,Y), edge(Y,Z).`, draw the complete Prolog search tree. For every branch, show the selected fact, substitution, remaining goal, and success or failure. List answers in returned order.

### Câu hỏi (Tiếng Việt)

Cho chương trình:

```prolog
edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
```

Với truy vấn `?- edge(X,Y), edge(Y,Z).`, hãy vẽ cây tìm kiếm Prolog đầy đủ. Với mỗi nhánh, nêu fact được chọn, phép thế, mục tiêu còn lại và trạng thái thành công hay thất bại. Liệt kê các đáp án theo thứ tự trả về.

### Đáp án

```text
G0: ← edge(X,Y), edge(Y,Z)
├─ f1 {X=a,Y=b}; ← edge(b,Z)
│  ├─ f1 fail (b≠a)
│  ├─ f2 fail (b≠a)
│  ├─ f3 {Z=d} → success: (a,b,d)
│  └─ f4 fail (b≠c)
├─ f2 {X=a,Y=c}; ← edge(c,Z)
│  ├─ f1 fail
│  ├─ f2 fail
│  ├─ f3 fail (c≠b)
│  └─ f4 {Z=d} → success: (a,c,d)
├─ f3 {X=b,Y=d}; ← edge(d,Z)
│  └─ f1..f4 fail: no outgoing edge from d
└─ f4 {X=c,Y=d}; ← edge(d,Z)
   └─ f1..f4 fail
```

Thứ tự answers: `(X,Y,Z)=(a,b,d)`, rồi `(a,c,d)`.

**Rubric:** nhánh cấp một 0.4; mọi success/fail 0.7; thứ tự nghiệm 0.4.

## Câu 6 (2.0 điểm)

### Question (English)

Use A* graph search for the 8-puzzle.

Start:

```text
1 2 3
_ 4 6
7 5 8
```

Goal:

```text
1 2 3
4 5 6
7 8 _
```

Use the sum of Manhattan distances, excluding the blank. Generate moves in the order `Up, Right, Down, Left`; break remaining ties by insertion order. Ignore a repeated state reached with a worse or equal `g`.

Show expanded states with `g,h,f`, the Open list after each expansion, the optimal move sequence, and total cost.

### Câu hỏi (Tiếng Việt)

Dùng tìm kiếm đồ thị A* cho bài toán 8-puzzle.

Trạng thái đầu:

```text
1 2 3
_ 4 6
7 5 8
```

Trạng thái đích:

```text
1 2 3
4 5 6
7 8 _
```

Dùng tổng khoảng cách Manhattan, không tính ô trống. Sinh nước đi theo thứ tự `Up, Right, Down, Left`; nếu vẫn hòa thì ưu tiên theo thứ tự được đưa vào. Bỏ qua trạng thái lặp đạt được với `g` lớn hơn hoặc bằng.

Trình bày các trạng thái được mở rộng cùng `g,h,f`, danh sách Open sau mỗi bước, chuỗi nước đi tối ưu và tổng chi phí.

### Đáp án

Ký hiệu state theo row-major.

| Bước | Pop `(g,h,f)` | Successors mới | Open sau expansion |
|---:|---|---|---|
| 1 | `S=[1,2,3,0,4,6,7,5,8] (0,3,3)` | `A=[0,2,3,1,4,6,7,5,8](1,4,5)`; `C=[1,2,3,4,0,6,7,5,8](1,2,3)`; `B=[1,2,3,7,4,6,0,5,8](1,4,5)` | `C:3,A:5,B:5` |
| 2 | `C (1,2,3)` | `U=[1,0,3,4,2,6,7,5,8](2,3,5)`; `F=[1,2,3,4,6,0,7,5,8](2,3,5)`; `G=[1,2,3,4,5,6,7,0,8](2,1,3)`; quay lại `S` bỏ | `G:3,A:5,B:5,U:5,F:5` |
| 3 | `G (2,1,3)` | `I=goal (3,0,3)`; `H=[1,2,3,4,5,6,0,7,8](3,2,5)`; quay lại `C` bỏ | `I:3,A:5,B:5,U:5,F:5,H:5` |
| 4 | `I (3,0,3)` | goal | dừng |

Moves: `Right, Down, Right`; cost `3`.

**Rubric:** heuristic/successors 0.7; Open/Closed logic 0.7; path/cost 0.6.

## Câu 7 (2.0 điểm)

### Question (English)

Let `A` and `B` be binary events. The only known constraints are `P(A)=0.4` and `P(B)=0.3`.

1. Define the four atomic probabilities and formulate the Maximum Entropy problem. (0.6 point)
2. Derive the MaxEnt joint distribution and verify normalization and both marginals. Use Lagrange multipliers or an entropy inequality, and justify why your candidate maximizes entropy. (1.4 points)

### Câu hỏi (Tiếng Việt)

Cho `A` và `B` là hai biến cố nhị phân. Các ràng buộc duy nhất đã biết là `P(A)=0.4` và `P(B)=0.3`.

1. Định nghĩa bốn xác suất nguyên tử và thiết lập bài toán Entropy Cực đại (Maximum Entropy). (0.6 điểm)
2. Suy ra phân phối đồng thời MaxEnt và kiểm tra điều kiện chuẩn hóa cùng hai phân phối biên. Dùng nhân tử Lagrange hoặc một bất đẳng thức entropy, đồng thời giải thích vì sao nghiệm đề xuất làm entropy đạt cực đại. (1.4 điểm)

### Đáp án

Đặt:

- `p1=P(A,B)`, `p2=P(A,¬B)`, `p3=P(¬A,B)`, `p4=P(¬A,¬B)`.
- Constraints: `p1+p2=0.4`, `p1+p3=0.3`, `Σp_i=1`, `p_i≥0`.
- Maximize `H=-Σp_i ln p_i`.

Vì hai marginals đã cố định nên `H(A)` và `H(B)` là hằng số. Với mọi joint distribution thỏa ràng buộc:

\[
H(A,B)=H(A)+H(B)-I(A;B)\le H(A)+H(B),
\]

do mutual information \(I(A;B)\ge0\). Dấu bằng — tức entropy lớn nhất — xảy ra khi và chỉ khi \(I(A;B)=0\), hay `A` và `B` độc lập. Tương đương, điều kiện tối ưu từ Lagrange multipliers là `p1p4=p2p3`.

`p1=0.4·0.3=0.12`; `p2=0.4·0.7=0.28`; `p3=0.6·0.3=0.18`; `p4=0.6·0.7=0.42`.

Check: sum `=1`; `p1+p2=0.40`; `p1+p3=0.30`.

**Rubric:** variables/constraints 0.6; derivation 1.0; checks 0.4.

## Tổng điểm

**Tổng: 10/10**
