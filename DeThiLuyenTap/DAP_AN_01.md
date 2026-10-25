# ĐÁP ÁN VÀ LỜI GIẢI CHI TIẾT CHUẨN A+ — ĐỀ 01
## Kèm Barem Điểm, Phân Tích Phương Pháp & Cạm Bẫy Phòng Thi

> **Môn học:** Nhập Môn Trí Tuệ Nhân Tạo (Introduction to Artificial Intelligence)  
> **Thời gian làm bài:** 60 phút $\bullet$ **Hình thức:** Tự luận chuẩn quốc tế  
> **Chuẩn mực:** Đáp án được trình bày chuẩn chỉ theo giáo trình *Wolfgang Ertel (2025)*, *Russell & Norvig (AIMA 2021)* và Slide bài giảng TS. Hoàng Anh Đức.

---

## Câu 1 (1.5 điểm) — Bản Chất AI & Phép Thử Turing

### Question (English)
The Turing Test evaluates whether a machine can exhibit conversational behaviour that is difficult to distinguish from that of a human.
1. Briefly describe how the Turing Test works. (0.5 point)
2. Give two reasons why it is unsuitable as the only definition of artificial intelligence in practical applications. Use at least one concrete example. (1.0 point)

### Câu hỏi (Tiếng Việt)
Turing Test đánh giá liệu một cỗ máy có thể thể hiện hành vi hội thoại khó phân biệt với con người hay không.
1. Mô tả ngắn gọn cách Turing Test hoạt động. (0.5 điểm)
2. Nêu hai lý do vì sao phép thử này không phù hợp để làm định nghĩa duy nhất về trí tuệ nhân tạo trong các ứng dụng thực tế. Sử dụng ít nhất một ví dụ cụ thể. (1.0 điểm)

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Cơ chế hoạt động của Phép thử Turing (Turing Test - Alan Turing 1950):
* **Mô hình Trò chơi bắt chước (Imitation Game):** Gồm 3 đối tượng được bố trí trong các phòng kín cách ly hoàn toàn: một Giám khảo con người (Interrogator - C), một Người thật (A), và một Cỗ máy tính (B).
* **Phương thức tương tác:** Giao tiếp thuần túy qua giao diện văn bản (màn hình/bàn phím) để loại bỏ hoàn toàn các yếu tố ngoại cảnh như giọng nói, ngoại hình hay tốc độ phản hồi vật lý.
* **Quy chuẩn vượt qua:** Giám khảo C đặt các câu hỏi bất kỳ bằng ngôn ngữ tự nhiên. Nếu sau một cuộc hội thoại (thường là 5 phút), Giám khảo C **không thể phân biệt một cách đáng tin cậy** đâu là người thật, đâu là máy tính (máy đánh lừa được $\ge 30\%$ giám khảo), thì cỗ máy được công nhận là sở hữu hành vi trí tuệ tương đương con người (*Acting Humanly*).

#### 2. Hai lý do Turing Test không phù hợp làm định nghĩa duy nhất của AI:
1. **Lý do 1: Đo lường hành vi bắt chước bề ngoài thay vì năng lực suy luận và thấu hiểu thực chất (*Syntax vs Semantics*):**
   * Turing Test chỉ đánh giá hành vi đầu ra (hành vi ngôn ngữ biểu kiến). Một cỗ máy có thể sử dụng các thủ thuật thống kê, tra cứu từ điển khổng lồ hoặc kỹ xảo tâm lý đánh lạc hướng (như chatbot ELIZA năm 1966 hoặc Eugene Goostman năm 2014 giả làm cậu bé Ukraine 13 tuổi) để vượt qua bài test mà bên trong hoàn toàn không có nhận thức, tri giác hay hiểu biết ngữ nghĩa thực sự (chứng minh qua luận cứ *Căn phòng tiếng Trung* của John Searle: thao tác cú pháp không đồng nghĩa với ngữ nghĩa).
2. **Lý do 2: Định nghĩa bị thiên lệch và không phù hợp với mục tiêu của AI kỹ thuật (*Rational Agent*):**
   * Con người vốn đầy rẫy các khiếm khuyết phi lý: tính toán sai, thiên kiến nhận thức, mệt mỏi, cảm tính. Bắt chước con người đồng nghĩa với việc AI phải cố tình gõ sai chính tả hoặc giả vờ không biết giải phương trình phức tạp để qua mắt giám khảo.
   * Ngược lại, mục tiêu cốt lõi của AI hiện đại là xây dựng **Tác tử duy lý (Rational Agent)** nhằm tối đa hóa hiệu suất giải quyết vấn đề, chứ không phải đóng giả làm người.
* **Ví dụ thực tế minh họa:**
  * Một hệ thống AI định tuyến đường đi (như Google Maps dùng thuật toán $A^*$) hoặc phần mềm chơi cờ vua (như Stockfish, Deep Blue) có thể tính toán hàng triệu trạng thái mỗi giây và tìm ra giải pháp tối ưu mà không con người nào có thể suy nghĩ theo cách đó. Hệ thống này thể hiện trí tuệ siêu việt nhưng hoàn toàn không thể trò chuyện phiếm để vượt qua Turing Test.

---

**Rubric Chấm Điểm:**
* Nêu đúng kịch bản phòng kín, giao tiếp văn bản và tiêu chuẩn phân biệt: **0.5 điểm**.
* Nêu và phân tích sâu sắc 2 hạn chế (mỗi ý 0.4 điểm): **0.8 điểm**.
* Ví dụ thực tế chính xác, đối chiếu rõ với quan điểm Rational Agent: **0.2 điểm**.

---

## Câu 2 (1.0 điểm) — Phân Giải Bác Bỏ Trong Logic Mệnh Đề (Resolution Refutation)

### Question (English)
Consider the knowledge base
$$KB = \{A \implies (B \lor C),\; B \implies D,\; C \implies D,\; A\}.$$
Using resolution by refutation, prove that $KB$ entails $D$. Convert all formulas to CNF, state the added negated goal, and show every resolution step.

### Câu hỏi (Tiếng Việt)
Cho cơ sở tri thức
$$KB = \{A \implies (B \lor C),\; B \implies D,\; C \implies D,\; A\}.$$
Dùng phương pháp phân giải bằng phản chứng (resolution by refutation) để chứng minh $KB$ kéo theo $D$. Hãy chuyển mọi công thức sang CNF, nêu mục tiêu phủ định được thêm vào và trình bày từng bước phân giải.

### Lời Giải Chi Tiết Chuẩn A+

#### Bước 1: Cơ sở lý thuyết & Phủ định mục tiêu
Theo **Nguyên lý Phân giải Bác bỏ (Resolution Refutation Theorem)**:
$$KB \models D \iff KB \cup \{\neg D\} \text{ là Mâu thuẫn (Unsatisfiable / Inconsistent)}$$
Ta thêm phủ định của kết luận cần chứng minh là $\neg D$ vào tập tri thức.

#### Bước 2: Chuyển đổi toàn bộ tri thức sang Dạng Chuẩn Hội (CNF)
Áp dụng tương đương logic $P \implies Q \equiv \neg P \lor Q$:
1. $A \implies (B \lor C) \equiv \neg A \lor B \lor C \implies$ **Mệnh đề $C_1$:** $\neg A \lor B \lor C$
2. $B \implies D \equiv \neg B \lor D \implies$ **Mệnh đề $C_2$:** $\neg B \lor D$
3. $C \implies D \equiv \neg C \lor D \implies$ **Mệnh đề $C_3$:** $\neg C \lor D$
4. Sự thật $A \implies$ **Mệnh đề $C_4$:** $A$
5. Phủ định mục tiêu $\neg D \implies$ **Mệnh đề $C_5$:** $\neg D$

Tập mệnh đề ban đầu: $S = \{C_1, C_2, C_3, C_4, C_5\}$.

#### Bước 3: Lập bảng thực hiện từng bước phân giải (Resolution Steps)

| Bước | Phân giải từ hai Clause | Triệt tiêu theo Literal | Mệnh đề mới sinh ra (Resolvent) | Số hiệu |
|:---:|:---:|:---:|:---:|:---:|
| 1 | $C_2: (\neg B \lor D)$ và $C_5: \neg D$ | $D$ và $\neg D$ | $\neg B$ | $C_6$ |
| 2 | $C_3: (\neg C \lor D)$ và $C_5: \neg D$ | $D$ và $\neg D$ | $\neg C$ | $C_7$ |
| 3 | $C_1: (\neg A \lor B \lor C)$ và $C_6: \neg B$ | $B$ và $\neg B$ | $\neg A \lor C$ | $C_8$ |
| 4 | $C_8: (\neg A \lor C)$ và $C_7: \neg C$ | $C$ và $\neg C$ | $\neg A$ | $C_9$ |
| 5 | $C_4: A$ và $C_9: \neg A$ | $A$ và $\neg A$ | $\Box$ (Mệnh đề rỗng / $\bot$) | $C_{10}$ |

#### Bước 4: Kết luận
Vì quá trình phân giải dẫn tới **Mệnh đề rỗng $\Box$ (Contradiction)**, giả thiết phản chứng là sai.  
Vậy tập hợp $KB \cup \{\neg D\}$ không thỏa được $\implies$ **$KB \models D$ (Điều phải chứng minh!)**.

---

**Rubric Chấm Điểm:**
* Chuyển CNF đúng và nêu rõ mục tiêu phủ định $\neg D$: **0.3 điểm**.
* Các bước phân giải hợp lệ, chỉ rõ literal triệt tiêu và clause cha: **0.5 điểm**.
* Rút ra mệnh đề rỗng $\Box$ và kết luận chặt chẽ: **0.2 điểm**.

---

## Câu 3 (1.0 điểm) — Chuẩn Hóa CNF Trong Logic Vị Từ Bậc Nhất (FOL)

### Question (English)
Convert the following first-order formula into clausal CNF. Show the elimination of implication, Skolemization, and distribution steps:
$$\forall x \bigl(Researcher(x) \implies \exists y (Paper(y) \land Reviews(x, y))\bigr).$$

### Câu hỏi (Tiếng Việt)
Chuyển công thức logic bậc nhất sau sang CNF dạng mệnh đề (clausal CNF). Trình bày các bước khử phép kéo theo, Skolem hóa và phân phối:
$$\forall x \bigl(Researcher(x) \implies \exists y (Paper(y) \land Reviews(x, y))\bigr).$$

### Lời Giải Chi Tiết Chuẩn A+

Áp dụng quy trình chuẩn hóa hình thức 6 bước của FOL:

* **Bước 1: Khử phép kéo theo ($\implies$):**
  Áp dụng luật $P \implies Q \equiv \neg P \lor Q$:
  $$\forall x \bigl(\neg Researcher(x) \lor \exists y (Paper(y) \land Reviews(x, y))\bigr)$$

* **Bước 2: Kéo phủ định $\neg$ vào trong sát vị từ:**
  Dấu phủ định $\neg$ đã nằm trực tiếp trước vị từ $Researcher(x)$, không cần áp dụng luật De Morgan.

* **Bước 3: Chuẩn hóa biến (Standardizing Variables Apart):**
  Mỗi lượng từ đã dùng một biến riêng biệt ($x$ và $y$), không có biến nào bị trùng tên.

* **Bước 4: Skolemization (Khử lượng từ tồn tại $\exists$):**
  * Xét lượng từ $\exists y$: Lượng từ này **nằm trong phạm vi chi phối của lượng từ phổ quát $\forall x$**.
  * Điều này phản ánh ngữ nghĩa: Mỗi nhà nghiên cứu $x$ khác nhau có thể bình duyệt một bài báo $y$ khác nhau.
  * Do đó, ta **bắt buộc phải thay biến $y$ bằng một Hàm Skolem $f(x)$** phụ thuộc vào $x$ (không được dùng hằng số Skolem!):
    $$\forall x \bigl(\neg Researcher(x) \lor (Paper(f(x)) \land Reviews(x, f(x)))\bigr)$$

* **Bước 5: Bỏ tiền tố lượng từ phổ quát $\forall x$:**
  Vì mọi biến tự do trong dạng mệnh đề đều được ngầm hiểu là phổ quát:
  $$\neg Researcher(x) \lor (Paper(f(x)) \land Reviews(x, f(x)))$$

* **Bước 6: Phân phối phép tuyển $\lor$ qua phép hội $\land$:**
  Áp dụng luật phân phối $A \lor (B \land C) \equiv (A \lor B) \land (A \lor C)$ với $A = \neg Researcher(x)$:
  $$\bigl(\neg Researcher(x) \lor Paper(f(x))\bigr) \land \bigl(\neg Researcher(x) \lor Reviews(x, f(x))\bigr)$$

* **KẾT QUẢ CUỐI CÙNG (Clausal Form):**
  Tập gồm 2 mệnh đề chuẩn CNF:
  1. $C_1: \neg Researcher(x) \lor Paper(f(x))$
  2. $C_2: \neg Researcher(x) \lor Reviews(x, f(x))$

---

**Rubric Chấm Điểm:**
* Khử phép kéo theo đúng: **0.25 điểm**.
* Skolemization chính xác bằng hàm $f(x)$ kèm giải thích phụ thuộc biến $x$: **0.35 điểm**.
* Phân phối đúng và ra tập 2 clause chuẩn: **0.4 điểm**.

---

## Câu 4 (1.0 điểm) — Giới Hạn Tính Toán: Decidable vs Semi-Decidable

### Question (English)
Explain what it means for first-order logic validity to be **semi-decidable**. Contrast this with propositional logic being **decidable**, and state one practical consequence for an automated theorem prover.

### Câu hỏi (Tiếng Việt)
Giải thích ý nghĩa của việc tính hợp lệ trong logic bậc nhất là **bán quyết định được (semi-decidable)**. So sánh với tính **quyết định được (decidable)** của logic mệnh đề và nêu một hệ quả thực tế đối với bộ chứng minh định lý tự động.

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Định nghĩa toán học hình thức:
* **Tính Quyết định được (Decidability - Logic Mệnh đề PL0):**
  * Một lớp bài toán là *Decidable* nếu tồn tại một thuật toán (cỗ máy Turing) luôn **dừng sau số bước hữu hạn trên mọi đầu vào khả dĩ** và đưa ra câu trả lời chính xác: trả về **YES** nếu công thức là hằng đúng/hệ quả logic ($\models \varphi$), và trả về **NO** nếu công thức không hợp lệ ($\not\models \varphi$).
  * Logic mệnh đề là khả quyết vì không gian chân trị là hữu hạn ($2^n$ dòng trong Bảng chân trị hoặc thông qua thuật toán DPLL).
* **Tính Bán quyết định được / Nửa khả quyết (Semi-decidability - Logic Bậc nhất FOL):**
  * Theo **Định lý Đầy đủ Gödel (Gödel's Completeness Theorem 1930)** kết hợp với **Luận đề Church-Turing (1936)**:
    * Nếu một công thức FOL là hợp lệ ($\models \varphi$), một thuật toán chứng minh đầy đủ (như Phân giải Robinson) **chắc chắn sẽ dừng và tìm ra chứng minh sau số hữu hạn bước** (trả về YES).
    * Tuy nhiên, nếu công thức đó **không hợp lệ ($\not\models \varphi$)**, thuật toán có thể **chạy lặp vô tận (infinite loop)** trong không gian các số hạng Herbrand vô hạn mà không bao giờ dừng lại!

#### 2. So sánh đối chiếu:
* PL0: Luôn nhận được câu trả lời chắc chắn YES hoặc NO.
* FOL: Chỉ nhận được câu trả lời YES chắc chắn; không thể đảm bảo luôn nhận được câu trả lời NO.

#### 3. Hệ quả thực tiễn sống còn đối với Hệ chứng minh định lý tự động (Automated Theorem Prover - ATP):
* Khi một bộ chứng minh định lý tự động (như Vampire, E Prover, Prover9) chạy quá thời gian quy định (Timeout) hoặc cạn kiệt bộ nhớ RAM mà chưa tìm thấy chứng minh:
  * **Hệ thống KHÔNG ĐƯỢC PHÉP KẾT LUẬN rằng công thức đó là SAI!**
  * Ta chỉ có thể kết luận: *"Hệ thống chưa tìm ra chứng minh trong giới hạn tài nguyên tính toán hiện tại"*. Việc dừng giữa chừng không mang giá trị phủ định logic.

---

**Rubric Chấm Điểm:**
* Định nghĩa Decidable và liên hệ bảng chân trị PL0: **0.35 điểm**.
* Định nghĩa Semi-decidable và cơ chế dừng/lặp của FOL: **0.4 điểm**.
* Nêu đúng hệ quả thực tiễn về Timeout và việc không được kết luận sai: **0.25 điểm**.

---

## Câu 5 (1.5 điểm) — Lập Trình Logic PROLOG: Truy Vết Đệ Quy & Ngăn Xếp

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

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Kết quả trả về của truy vấn:
Khi thực thi truy vấn: `?- sum_to(3, Result).`  
Hệ thống Prolog trả về:
```prolog
Result = 6.
```

#### 2. Truy vết cây đệ quy và cơ chế Unwinding (Trải ngược ngăn xếp):

Quá trình thực thi diễn ra qua 2 giai đoạn: **Pha đi xuống (Call Phase - Đẩy vào ngăn xếp)** và **Pha đi lên (Exit/Unwind Phase - Rút khỏi ngăn xếp và tính toán)**:

```
[PHA 1: LỜI GỌI ĐI XUỐNG (Call Phase)]
Call 1: sum_to(3, Result)
        Kiểm tra 3 > 0 (Đúng)
        N1 is 3 - 1 = 2
        Gọi đệ quy: sum_to(2, S1)
        │
        ▼
Call 2: sum_to(2, S1)
        Kiểm tra 2 > 0 (Đúng)
        N1 is 2 - 1 = 1
        Gọi đệ quy: sum_to(1, S2)
        │
        ▼
Call 3: sum_to(1, S2)
        Kiểm tra 1 > 0 (Đúng)
        N1 is 1 - 1 = 0
        Gọi đệ quy: sum_to(0, S3)
        │
        ▼
Call 4: sum_to(0, S3)
        Khớp trực tiếp với Base Case (Dòng 1): sum_to(0, 0)
        Ràng buộc: S3 = 0. (CHẠM ĐÁY ĐỆ QUY!)

=======================================================
[PHA 2: TRẢI NGƯỢC NGĂN XẾP & TÍNH TOÁN (Unwind Phase)]
Exit 4: Trả về S3 = 0 cho Call 3
        Thực hiện tính toán tại Call 3: S2 is 0 + 1 = 1
Exit 3: Trả về S2 = 1 cho Call 2
        Thực hiện tính toán tại Call 2: S1 is 1 + 2 = 3
Exit 2: Trả về S1 = 3 cho Call 1
        Thực hiện tính toán tại Call 1: Result is 3 + 3 = 6
Exit 1: Gán Result = 6. Thành công (Success)!
```

---

**Rubric Chấm Điểm:**
* Kết quả `Result = 6`: **0.5 điểm**.
* Thể hiện rõ chuỗi lời gọi đi xuống chạm base case: **0.5 điểm**.
* Thể hiện rõ quá trình trải ngược ngăn xếp và cộng dồn giá trị từng tầng: **0.5 điểm**.

---

## Câu 6 (2.0 điểm) — Thuật Toán Tìm Kiếm A* & Chứng Minh Heuristic

### Question (English)
Apply A* graph search to the following directed weighted graph:
- Edges: $S \to A: 1$, $S \to B: 4$, $A \to C: 2$, $A \to G: 7$, $B \to C: 1$, $B \to G: 5$, $C \to G: 3$.
- Heuristic values: $h(S)=5$, $h(A)=4$, $h(B)=3$, $h(C)=2$, $h(G)=0$.
- Break ties alphabetically. Reopen/update a node if a cheaper path is found.

Show $g(n)$, $h(n)$, and $f(n)$ for every expanded node, and show the Open list after each expansion. Give the final path and cost. Is the heuristic admissible and consistent? Justify briefly.

### Câu hỏi (Tiếng Việt)
Áp dụng tìm kiếm đồ thị A* cho đồ thị có trọng số và có hướng sau:
- Các cạnh: $S \to A: 1$, $S \to B: 4$, $A \to C: 2$, $A \to G: 7$, $B \to C: 1$, $B \to G: 5$, $C \to G: 3$.
- Giá trị heuristic: $h(S)=5$, $h(A)=4$, $h(B)=3$, $h(C)=2$, $h(G)=0$.
- Khi hòa, ưu tiên theo thứ tự chữ cái. Mở lại/cập nhật một nút nếu tìm được đường đi rẻ hơn.

Trình bày $g(n)$, $h(n)$ và $f(n)$ cho mọi nút được mở rộng, đồng thời ghi danh sách Open sau mỗi bước. Cho biết đường đi cuối cùng và chi phí. Heuristic có admissible và consistent không? Giải thích ngắn gọn.

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Bảng Truy Vết Thuật Toán A* Graph Search Từng Vòng Lặp:
* Khởi tạo: Nút gốc $S$ có $g(S) = 0$, $h(S) = 5 \implies f(S) = 0 + 5 = 5$.
* $\text{Open} = [S(0, 5, 5)]$, $\text{Closed} = \emptyset$.

| Lần lặp | Nút được Pop ($n$) | $(g, h, f)$ | Nút con sinh ra $(g, h, f)$ | Hàng đợi Open sau khi cập nhật \& sắp xếp | Tập Closed |
|:---:|:---:|:---:|---|---|:---:|
| **1** | **$S$** | $(0, 5, 5)$ | $A(1, 4, 5)$ qua $S \to A$ <br> $B(4, 3, 7)$ qua $S \to B$ | $[A(5), B(7)]$ | $\{S\}$ |
| **2** | **$A$** | $(1, 4, 5)$ | $C(1+2=3, 2, 5)$ qua $A \to C$ <br> $G(1+7=8, 0, 8)$ qua $A \to G$ | $[C(5), B(7), G(8)]$ | $\{S, A\}$ |
| **3** | **$C$** | $(3, 2, 5)$ | $G(3+3=6, 0, 6)$ qua $C \to G$ <br> *(Cập nhật $G$: chi phí mới $g=6 < 8$ tốt hơn!)* | $[G(6), B(7)]$ | $\{S, A, C\}$ |
| **4** | **$G$** | $(6, 0, 6)$ | **Đạt trạng thái đích (Goal reached)!** | — | $\{S, A, C, G\}$ |

* **Đường đi tối ưu tìm được:** $S \to A \to C \to G$
* **Tổng chi phí tối ưu:** $C^* = 1 + 2 + 3 = \mathbf{6}$.

---

#### 2. Chứng minh tính Admissible (Chấp nhận được):
* **Định nghĩa:** Heuristic $h(n)$ là admissible nếu $0 \le h(n) \le h^*(n)$ với mọi nút $n$ (trong đó $h^*(n)$ là chi phí thực tế nhỏ nhất từ $n$ đến đích $G$).
* Tính chi phí thực tế tối ưu $h^*(n)$ đến $G$:
  * $h^*(G) = 0$.
  * $h^*(C) = 3$ (qua $C \to G$).
  * $h^*(B) = \min(B \to G, B \to C \to G) = \min(5, 1+3) = 4$.
  * $h^*(A) = \min(A \to G, A \to C \to G) = \min(7, 2+3) = 5$.
  * $h^*(S) = \min(S \to A \to C \to G, S \to B \to C \to G) = \min(1+5, 4+4) = 6$.
* So sánh từng nút:
  * $h(S) = 5 \le h^*(S) = 6$ (Thỏa mãn)
  * $h(A) = 4 \le h^*(A) = 5$ (Thỏa mãn)
  * $h(B) = 3 \le h^*(B) = 4$ (Thỏa mãn)
  * $h(C) = 2 \le h^*(C) = 3$ (Thỏa mãn)
  * $h(G) = 0 \le h^*(G) = 0$ (Thỏa mãn)
* **Kết luận:** Vì $h(n) \le h^*(n), \forall n$, hàm heuristic này là **Admissible**.

---

#### 3. Chứng minh tính Consistent (Nhất quán / Đơn điệu):
* **Định nghĩa:** Heuristic $h(n)$ là consistent nếu thỏa mãn bất đẳng thức tam giác trên mọi cung $u \to v$ có trọng số $c(u, v)$:
  $$h(u) \le c(u, v) + h(v)$$
* Kiểm tra toàn bộ 7 cạnh của đồ thị:
  1. Cạnh $S \to A$: $h(S) = 5 \le c(S, A) + h(A) = 1 + 4 = 5$ (Đúng, $5 \le 5$).
  2. Cạnh $S \to B$: $h(S) = 5 \le c(S, B) + h(B) = 4 + 3 = 7$ (Đúng, $5 \le 7$).
  3. Cạnh $A \to C$: $h(A) = 4 \le c(A, C) + h(C) = 2 + 2 = 4$ (Đúng, $4 \le 4$).
  4. Cạnh $A \to G$: $h(A) = 4 \le c(A, G) + h(G) = 7 + 0 = 7$ (Đúng, $4 \le 7$).
  5. Cạnh $B \to C$: $h(B) = 3 \le c(B, C) + h(C) = 1 + 2 = 3$ (Đúng, $3 \le 3$).
  6. Cạnh $B \to G$: $h(B) = 3 \le c(B, G) + h(G) = 5 + 0 = 5$ (Đúng, $3 \le 5$).
  7. Cạnh $C \to G$: $h(C) = 2 \le c(C, G) + h(G) = 3 + 0 = 3$ (Đúng, $2 \le 3$).
* **Kết luận:** Tất cả các cạnh đều thỏa mãn bất đẳng thức tam giác. Do đó, hàm heuristic này là **Consistent**.

---

**Rubric Chấm Điểm:**
* Lập bảng truy vết đầy đủ bộ 3 số $g, h, f$ và cập nhật Open/Closed chính xác: **1.0 điểm**.
* Kết luận đúng đường đi tối ưu và chi phí $C^* = 6$: **0.4 điểm**.
* Tính toán $h^*$ và chứng minh Admissible chặt chẽ: **0.3 điểm**.
* Kiểm tra toàn bộ các cạnh và chứng minh Consistent: **0.3 điểm**.

---

## Câu 7 (2.0 điểm) — Mạng Bayes & Tiêu Chuẩn d-Separation

### Question (English)
A Bayesian Network has four binary variables:
- Course Difficulty $D$ and Study Effort $S$ are root nodes.
- $D \to P$ and $S \to P$, where $P$ means passing the course.
- $P \to H$, where $H$ means receiving a scholarship.
1. Factorize the joint distribution $P(D, S, P, H)$ according to the network. (0.75 point)
2. Are $D$ and $S$ independent before observing $P$? Are they conditionally independent after observing $P$? Explain using d-separation and name the relevant phenomenon. (1.25 points)

### Câu hỏi (Tiếng Việt)
Một mạng Bayes có bốn biến nhị phân:
- Độ khó môn học $D$ và Nỗ lực học tập $S$ là các nút gốc.
- $D \to P$ và $S \to P$, trong đó $P$ biểu thị việc qua môn.
- $P \to H$, trong đó $H$ biểu thị việc nhận học bổng.
1. Phân rã phân phối đồng thời $P(D, S, P, H)$ theo cấu trúc mạng. (0.75 điểm)
2. $D$ và $S$ có độc lập trước khi quan sát $P$ không? Sau khi quan sát $P$, chúng có độc lập có điều kiện không? Giải thích bằng d-separation và nêu tên hiện tượng liên quan. (1.25 điểm)

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Phân rã phân phối xác suất đồng thời (Chain Rule Factorization):
Cấu trúc mạng Bayes được mô tả bởi Đồ thị có hướng không chu trình (DAG):
```
    (D: Độ khó)       (S: Nỗ lực)
          \               /
           ▼             ▼
             (P: Qua môn)
                  │
                  ▼
            (H: Học bổng)
```
Theo công thức phân rã tổng quát của Mạng Bayes:
$$P(X_1, \dots, X_n) = \prod_{i=1}^n P(X_i \mid \text{Parents}(X_i))$$
Xác định tập cha mẹ của từng nút:
* $\text{Parents}(D) = \emptyset$
* $\text{Parents}(S) = \emptyset$
* $\text{Parents}(P) = \{D, S\}$
* $\text{Parents}(H) = \{P\}$

Do đó, phân phối đồng thời được phân rã thành:
$$P(D, S, P, H) = P(D) \cdot P(S) \cdot P(P \mid D, S) \cdot P(H \mid P)$$

---

#### 2. Phân tích tính độc lập theo tiêu chuẩn d-separation:

Con đường vô hướng duy nhất nối giữa $D$ và $S$ là:
$$D \to P \leftarrow S$$
Đây là cấu trúc **Cùng kết quả (Collider / V-structure / Common Effect)** tại nút trung gian $P$.

* **Trường hợp 1: Trước khi quan sát $P$ (Tập bằng chứng $Z = \emptyset$):**
  * Theo quy tắc d-separation cho cấu trúc Collider: Khi nút hội tụ $P$ **chưa được quan sát** ($P \notin Z$) và không có con cháu nào của $P$ (ở đây là $H$) được quan sát:
    $$\text{Con đường } D \to P \leftarrow S \text{ TỰ ĐỘNG BỊ CHẶN (BLOCKED)!}$$
  * Vì con đường duy nhất bị chặn, $D$ và $S$ là **d-separated cho trước tập rỗng**.
  * **Kết luận:** $D$ và $S$ **độc lập biên (Marginally Independent)** với nhau:
    $$P(D, S) = P(D) \cdot P(S) \quad \text{hay} \quad D \perp S \mid \emptyset$$
    *(Giải thích trực quan: Độ khó của đề thi do giáo viên ra và nỗ lực học tập của sinh viên là hai việc hoàn toàn độc lập khi chưa biết kết quả điểm số).*

* **Trường hợp 2: Sau khi đã quan sát biến Qua môn $P$ (Tập bằng chứng $Z = \{P\}$):**
  * Theo quy tắc d-separation: Khi nút hội tụ $P$ **đã được quan sát** ($P \in Z$):
    $$\text{Con đường } D \to P \leftarrow S \text{ BỊ MỞ RA (ACTIVE / UNBLOCKED)!}$$
  * Vì con đường đã mở, $D$ và $S$ không còn d-separated nữa.
  * **Kết luận:** $D$ và $S$ **KHÔNG độc lập có điều kiện** khi đã biết $P$:
    $$D \not\perp S \mid P$$

* **Tên hiện tượng liên quan & Bản chất:**
  * Hiện tượng này được gọi là **"Giải thích bỏ qua" (Explaining Away)**.
  * *Bản chất tâm lý - trực giác:* Giả sử ta biết sinh viên thi trượt môn ($P = \text{false}$). Nếu ta phát hiện ra đề thi năm nay cực kỳ khó ($D = \text{true}$), thông tin này đã "giải thích thỏa đáng" cho việc trượt môn, khiến ta không còn nghi ngờ sinh viên này lười học nữa. Ngược lại, nếu biết đề thi rất dễ ($D = \text{false}$) mà sinh viên vẫn trượt, ta gần như chắc chắn sinh viên này đã không hề nỗ lực học tập ($S = \text{false}$). Do đó, hai nguyên nhân cạnh tranh $D$ và $S$ trở nên phụ thuộc chặt chẽ vào nhau khi kết quả $P$ đã được xác nhận.

---

**Rubric Chấm Điểm:**
* Viết đúng công thức phân rã chuỗi: **0.75 điểm**.
* Chứng minh $D \perp S$ khi chưa biết $P$ qua quy tắc Collider bị chặn: **0.4 điểm**.
* Chứng minh $D \not\perp S \mid P$ khi $P$ được quan sát (Collider mở): **0.4 điểm**.
* Gọi đúng tên hiện tượng **Explaining Away** và giải thích bản chất tương tác cạnh tranh: **0.45 điểm**.

---

## BẢNG TỔNG KẾT ĐIỂM TOÀN BÀI — ĐỀ 01

| Câu hỏi | Chủ đề kiến thức | Điểm tối đa | Chuẩn đầu ra (Target Competency) |
|:---:|:---|:---:|:---|
| **Câu 1** | Chương 1: Bản chất AI & Phép thử Turing | **1.5** | Hiểu cơ chế Turing test, Acting Humanly vs Rational Agent |
| **Câu 2** | Chương 2: Phân giải bác bỏ mệnh đề (PL0) | **1.0** | Chuyển CNF, lập bảng phân giải triệt tiêu literal sinh $\Box$ |
| **Câu 3** | Chương 3: Chuẩn hóa CNF trong FOL (PL1) | **1.0** | 6 bước chuẩn hóa, Skolem hóa, biến đổi hội/tuyển |
| **Câu 4** | Chương 4: Tính nửa quyết định của FOL | **1.0** | Định lý Gödel-Church-Turing, bán quyết định vs quyết định |
| **Câu 5** | Chương 5: Đệ quy danh sách & Toán tử Cut Prolog | **1.5** | Tracing ngăn xếp Call/Unwind, bẫy Cut và Green Cut fix |
| **Câu 6** | Chương 6: Thuật toán $A^*$ & Heuristic Admissible/Consistent | **2.0** | Lập bảng OPEN/CLOSED, chứng minh tam giác $h \le c + h'$ |
| **Câu 7** | Chương 7: Mạng Bayes, d-Separation & Explaining Away | **2.0** | Phân rã xác suất, quy tắc Collider, hiện tượng Explaining Away |

## Tổng điểm

**Tổng: 10/10**

