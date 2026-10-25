# ĐÁP ÁN VÀ THANG ĐIỂM — ĐỀ 02

## Câu 1 (1.5 điểm)

### Question (English)

1. Define an agent, a software agent, and a hardware agent. (0.75 point)
2. Explain why an agent with memory is generally not a mathematical function from only the current input to the current output. Give a simple example in which the same current input leads to different actions. (0.75 point)

### Câu hỏi (Tiếng Việt)

1. Định nghĩa agent, software agent và hardware agent. (0.75 điểm)
2. Giải thích vì sao một agent có bộ nhớ nhìn chung không phải là một hàm toán học chỉ ánh xạ đầu vào hiện tại sang đầu ra hiện tại. Cho một ví dụ đơn giản trong đó cùng một đầu vào hiện tại dẫn tới các hành động khác nhau. (0.75 điểm)

### Đáp án

- Agent: hệ nhận thông tin từ môi trường và tạo hành động/đầu ra. Software agent hoạt động trong môi trường số; hardware agent cảm nhận và tác động thế giới vật lý. **0.75 điểm.**
- Agent có memory còn phụ thuộc internal state/history: `a_t=F(s_t,o_t)`. Ví dụ robot thấy cùng một cửa đóng nhưng nếu trước đó đã thử mở và thất bại thì chọn gọi trợ giúp; nếu chưa thử thì chọn mở cửa. **0.75 điểm.**

## Câu 2 (1.0 điểm)

### Question (English)

Use forward chaining to determine whether `Safe` follows from the Horn knowledge base:

- Facts: `Powered`, `SensorOK`, `DoorClosed`.
- Rules: `Powered∧SensorOK⇒Monitoring`; `Monitoring∧DoorClosed⇒Safe`; `Safe⇒Ready`.

Show the agenda/inferred facts after each rule fires.

### Câu hỏi (Tiếng Việt)

Dùng suy diễn tiến (forward chaining) để xác định liệu `Safe` có được suy ra từ cơ sở tri thức Horn sau hay không:

- Các sự kiện: `Powered`, `SensorOK`, `DoorClosed`.
- Các luật: `Powered∧SensorOK⇒Monitoring`; `Monitoring∧DoorClosed⇒Safe`; `Safe⇒Ready`.

Trình bày agenda/tập sự kiện suy ra sau mỗi lần một luật được kích hoạt.

### Đáp án

Agenda ban đầu: `{Powered,SensorOK,DoorClosed}`.

1. Có đủ `Powered,SensorOK`, kích hoạt rule 1, thêm `Monitoring`.
2. Có `Monitoring,DoorClosed`, kích hoạt rule 2, thêm `Safe`.
3. Query đã đạt; nếu tiếp tục, rule 3 thêm `Ready`.

Kết luận: `KB⊨Safe`.

**Rubric:** khởi tạo 0.2; hai lần kích hoạt đúng 0.5; kết luận 0.3.

## Câu 3 (1.0 điểm)

### Question (English)

Find the most general unifier (MGU), or show that none exists:

\[
P(f(x),y,g(y))\quad\text{and}\quad P(f(a),g(z),g(g(b))).
\]

Show the equation set, substitutions, composition, and verification.

### Câu hỏi (Tiếng Việt)

Tìm bộ hợp nhất tổng quát nhất (MGU), hoặc chứng minh rằng không tồn tại:

\[
P(f(x),y,g(y))\quad\text{và}\quad P(f(a),g(z),g(g(b))).
\]

Trình bày tập phương trình, các phép thế, phép hợp thành và bước kiểm tra kết quả.

### Đáp án

Equation set:

`f(x)=f(a)`, `y=g(z)`, `g(y)=g(g(b))`.

1. `f(x)=f(a)` cho `{x↦a}`.
2. `g(y)=g(g(b))` cho `{y↦g(b)}`.
3. Áp dụng vào `y=g(z)` được `g(b)=g(z)`, nên `{z↦b}`.

MGU: `{x↦a,y↦g(b),z↦b}`.

Hai atoms sau thế đều thành `P(f(a),g(b),g(g(b)))`.

**Rubric:** equations 0.2; substitutions 0.5; verify 0.3.

## Câu 4 (1.0 điểm)

### Question (English)

Explain combinatorial explosion in proof search. If every proof-search node produces 4 successors and a proof requires depth 11, how many nodes are there at the final level? Explain why a 100-times faster computer does not solve the underlying problem, and name one AI strategy that helps.

### Câu hỏi (Tiếng Việt)

Giải thích hiện tượng bùng nổ tổ hợp (combinatorial explosion) trong tìm kiếm chứng minh. Nếu mỗi nút tạo ra 4 nút kế tiếp và một chứng minh cần độ sâu 11, tầng cuối có bao nhiêu nút? Giải thích vì sao máy tính nhanh hơn 100 lần không giải quyết được vấn đề cốt lõi và nêu một chiến lược AI có thể hỗ trợ.

### Đáp án

Tầng cuối có `4^11=4,194,304` nodes. Không gian tăng theo hàm mũ `b^d`; máy nhanh hơn 100 lần chỉ giảm thời gian cho cùng khối lượng tìm kiếm 100 lần, tương đương tăng được khoảng `log_4(100)≈3.32` tầng trước khi lại gặp quy mô tương tự. Nó không loại bỏ tốc độ tăng theo hàm mũ. Heuristic rule/clause selection, pruning hoặc set-of-support có thể giảm branching/search.

**Rubric:** giải thích 0.35; số đúng 0.25; lập luận tốc độ 0.2; chiến lược 0.2.

## Câu 5 (1.5 điểm)

### Question (English)

Consider:

```prolog
parent(alex, beth).
parent(alex, carl).
parent(beth, dana).
parent(carl, erin).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
```

List all answers returned by `?- ancestor(alex, Who).` in Prolog order. Explain which clause produces each answer and where backtracking occurs.

### Câu hỏi (Tiếng Việt)

Cho chương trình:

```prolog
parent(alex, beth).
parent(alex, carl).
parent(beth, dana).
parent(carl, erin).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
```

Liệt kê mọi đáp án của truy vấn `?- ancestor(alex, Who).` theo đúng thứ tự Prolog trả về. Giải thích clause nào tạo ra từng đáp án và việc backtracking xảy ra ở đâu.

### Đáp án

Thứ tự nghiệm:

1. `Who=beth` — clause trực tiếp với fact 1.
2. `Who=carl` — backtrack trong `parent(alex,Who)`, fact 2.
3. `Who=dana` — sau khi clause trực tiếp hết nghiệm, thử clause recursive; chọn `Z=beth`, rồi `ancestor(beth,dana)` thành công qua clause trực tiếp.
4. `Who=erin` — backtrack đến `parent(alex,Z)`, chọn `Z=carl`, rồi tìm `erin`.

Không còn fact con của `dana` hay `erin`, nên dừng.

**Rubric:** bốn nghiệm đúng thứ tự 0.8; clause/backtracking 0.7.

## Câu 6 (2.0 điểm)

### Question (English)

A game tree has a MAX root `A` with three MIN children `B`, `C`, and `D`. Their leaf values from left to right are:

- under `B`: `6, 4, 7`;
- under `C`: `5, 2, 8`;
- under `D`: `3, 9, 1`.

1. Compute the minimax value of every internal node and the best move for MAX. (1.0 point)
2. Apply alpha-beta pruning from left to right. State the values of `α` and `β` at every cutoff and list all pruned leaves. (1.0 point)

### Câu hỏi (Tiếng Việt)

Một cây trò chơi có nút gốc MAX `A` với ba nút con MIN là `B`, `C` và `D`. Giá trị các lá từ trái sang phải là:

- dưới `B`: `6, 4, 7`;
- dưới `C`: `5, 2, 8`;
- dưới `D`: `3, 9, 1`.

1. Tính giá trị minimax của mọi nút trong và nước đi tốt nhất cho MAX. (1.0 điểm)
2. Áp dụng cắt tỉa alpha-beta từ trái sang phải. Nêu giá trị `α` và `β` tại mỗi điểm cắt và liệt kê mọi lá bị cắt. (1.0 điểm)

### Đáp án

Minimax:

- `B=min(6,4,7)=4`.
- `C=min(5,2,8)=2`.
- `D=min(3,9,1)=1`.
- `A=max(4,2,1)=4`; MAX chọn `B`.

Alpha-beta trái sang phải:

- Duyệt đủ `B`, root cập nhật `α=4`.
- Tại `C`: xem `5` nên `β=5`; xem `2` nên `β=2`. Vì `β=2≤α=4`, cắt leaf `8`.
- Tại `D`: xem `3` nên `β=3≤α=4`, cắt leaves `9` và `1`.

**Rubric:** minimax 1.0; cập nhật bounds 0.5; nhánh cắt đúng 0.5.

## Câu 7 (2.0 điểm)

### Question (English)

A disease has prevalence `P(D)=0.02`. A test has sensitivity `P(+|D)=0.90` and specificity `P(-|¬D)=0.95`.

1. Compute `P(+)` using the law of total probability, then compute `P(D|+)` using Bayes' theorem. (1.6 points)
2. Explain briefly why the posterior is much lower than the sensitivity. (0.4 point)

### Câu hỏi (Tiếng Việt)

Một bệnh có tỷ lệ hiện mắc `P(D)=0.02`. Một xét nghiệm có độ nhạy `P(+|D)=0.90` và độ đặc hiệu `P(-|¬D)=0.95`.

1. Tính `P(+)` bằng luật xác suất toàn phần, sau đó tính `P(D|+)` bằng định lý Bayes. (1.6 điểm)
2. Giải thích ngắn gọn vì sao xác suất hậu nghiệm thấp hơn nhiều so với độ nhạy. (0.4 điểm)

### Đáp án

False-positive rate: `P(+|¬D)=1-0.95=0.05`.

\[
P(+)=0.90(0.02)+0.05(0.98)=0.018+0.049=0.067.
\]

\[
P(D|+)=\frac{0.90(0.02)}{0.067}=\frac{0.018}{0.067}\approx0.2687.
\]

Chỉ khoảng `26.87%`. Bệnh hiếm nên số người không bệnh rất lớn; dù tỷ lệ false positive nhỏ, nhóm này tạo nhiều kết quả dương tính. Đây là base-rate effect.

**Rubric:** false-positive + total probability 0.8; Bayes 0.8; giải thích 0.4.

## Tổng điểm

**Tổng: 10/10**
