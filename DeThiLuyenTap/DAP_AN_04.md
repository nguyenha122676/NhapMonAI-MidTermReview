# ĐÁP ÁN VÀ LỜI GIẢI CHI TIẾT CHUẨN A+ — ĐỀ 04
## Kèm Barem Điểm, Phân Tích Phương Pháp & Cạm Bẫy Phòng Thi

> **Môn học:** Nhập Môn Trí Tuệ Nhân Tạo (Introduction to Artificial Intelligence)  
> **Thời gian làm bài:** 90 phút $\bullet$ **Hình thức:** Tự luận chuẩn quốc tế  
> **Chuẩn mực:** Đáp án được trình bày chuẩn chỉ theo giáo trình *Wolfgang Ertel (2025)*, *Russell & Norvig (AIMA 2021)* và Slide bài giảng TS. Hoàng Anh Đức.

---

## Câu 1 (1.5 điểm) — Thí Nghiệm Tư Duy Căn Phòng Tiếng Trung (Chinese Room Argument)

### Question (English)
In Searle's Chinese Room thought experiment, a person who does not know Chinese follows a large rule book to transform Chinese input symbols into Chinese output symbols.
1. State the main conclusion of the Chinese Room argument. (0.5 point)
2. Evaluate the argument: explain one important objection and decide, with justification, whether it proves that no AI system can ever understand. (1.0 point)

### Câu hỏi (Tiếng Việt)
Trong thí nghiệm tư duy Chinese Room (Căn phòng tiếng Trung) của John Searle (1980), một người không biết một chữ tiếng Trung nào ngồi trong phòng kín và làm theo một cuốn sách luật quy tắc cú pháp khổng lồ để biến đổi các ký hiệu đầu vào tiếng Trung thành các ký hiệu đầu ra tiếng Trung.
1. Nêu kết luận chính của lập luận Chinese Room. (0.5 điểm)
2. Đánh giá lập luận: giải thích một phản biện quan trọng và đưa ra kết luận có lý giải về việc lập luận này có chứng minh rằng không một hệ thống AI nào có thể đạt được sự hiểu biết hay không. (1.0 điểm)

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Kết luận cốt lõi của lập luận Chinese Room (John Searle - 1980):
* **Luận điểm trung tâm:** **"Thao tác cú pháp thuần túy không đồng nhất với và không đủ để tạo ra ngữ nghĩa" (*Syntax is neither constitutive of nor sufficient for Semantics*)**.
* **Hệ quả đối với AI:** 
  * Căn phòng tiếng Trung có thể dễ dàng vượt qua Phép thử Turing (Turing Test) vì các câu trả lời đầu ra hoàn toàn tự nhiên như người bản xứ. Tuy nhiên, người đàn ông ngồi bên trong căn phòng hoàn toàn **không hiểu một chữ tiếng Trung nào**; anh ta chỉ đơn thuần thực thi các phép biến đổi ký hiệu cú pháp cơ học dựa theo sách luật (tương tự như CPU thực thi mã lệnh chương trình).
  * Do đó, Searle kết luận rằng **AI mạnh (Strong AI)** — quan niệm cho rằng một máy tính được lập trình phù hợp chỉ cần thực thi giải thuật thao tác ký hiệu là tự động sở hữu tâm trí, ý thức và sự hiểu biết thực sự — là một giả định **hoàn toàn sai lầm**.

#### 2. Đánh giá lập luận, phản biện và phân tích tính xác thực:

##### A. Phản biện tiêu biểu: Phản biện Toàn Hệ Thống (The Systems Reply — Newell, Simon, Berkeley):
* **Nội dung phản biện:**
  * Đồng ý rằng *cá nhân người đàn ông* bên trong phòng không hiểu tiếng Trung. Nhưng người đàn ông chỉ đóng vai trò là một bộ vi xử lý (ALU / CPU).
  * **Sự hiểu biết tiếng Trung thuộc về toàn bộ hệ thống (The Whole System)**, bao gồm: Người đàn ông + Cuốn sách luật tri thức khổng lồ + Giấy nháp bộ nhớ + Các ô chứa ký hiệu đầu vào và đầu ra. Toàn bộ hệ thống phức hợp này tương tác đồng bộ và thực sự sở hữu năng lực hiểu ngôn ngữ.
* *(Các phản biện hợp lệ khác có thể kể đến: **Robot Reply** — nếu đặt hệ thống vào một cơ thể robot có camera, cảm biến và tay chân để neo ký hiệu (symbol grounding) vào thế giới thực; hoặc **Brain Simulator Reply** — nếu mô phỏng chính xác từng khớp thần kinh sinh học của người bản xứ).*

##### B. Kết luận: Lập luận của Searle có chứng minh "Không hệ AI nào có thể hiểu" hay không?
* **Khẳng định chuẩn học thuật:** **KHÔNG! Lập luận của Searle KHÔNG chứng minh được rằng máy móc nhân tạo không bao giờ có thể hiểu biết.**
* **Lý giải nguyên nhân:**
  1. Searle chỉ bác bỏ **Mô hình AI Ký hiệu cổ điển (GOFAI / Classical Symbolic AI)** vốn cho rằng tâm trí chỉ là thao tác thao túng ký hiệu cú pháp vô hồn (*Turing Machine model*).
  2. Lập luận không áp đặt giới hạn lên các cách tiếp cận hiện đại:
     * **AI Nhúng (Embodied AI):** Nơi tác tử học ngữ nghĩa thông qua tương tác cảm biến - vận động thực tế với môi trường vật lý (giải quyết bài toán *Symbol Grounding Problem*).
     * **Mạng nơ-ron sâu & LLM hiện đại:** Biểu diễn tri thức bằng vector phân tán liên tục trong không gian nhiều chiều, cho phép khái quát hóa ngữ nghĩa dựa trên ngữ cảnh thay vì tra cứu luật cứng.
  3. Bản thân não bộ con người cũng cấu thành từ vật chất sinh học ($10^{11}$ nơ-ron). Về mặt nguyên lý vật lý, nếu tự nhiên tạo ra được trí tuệ từ vật chất, con người hoàn toàn có thể xây dựng các cấu trúc nhân tạo sở hữu năng lực nhận thức tương đương.

---

**Rubric Chấm Điểm:**
* Nêu đúng kết luận cốt lõi ("Cú pháp không tạo ra ngữ nghĩa", bác bỏ Strong AI): **0.5 điểm**.
* Trình bày sâu sắc 1 phản biện (như Systems Reply, Robot Reply hoặc Brain Simulator): **0.5 điểm**.
* Đánh giá khách quan, lập luận vững chắc vì sao Searle chưa chứng minh được AI vĩnh viễn không thể hiểu: **0.5 điểm**.

---

## Câu 2 (1.0 điểm) — Phân Giải Bác Bỏ Mệnh Đề Chuỗi Kéo Theo (Resolution Refutation)

### Question (English)
Let
$$KB = \{A \implies B,\; B \implies C,\; C \implies D,\; A\}.$$
Use resolution refutation to prove that $KB \models D$. Show the CNF clauses and every resolution step.

### Câu hỏi (Tiếng Việt)
Cho cơ sở tri thức:
$$KB = \{A \implies B,\; B \implies C,\; C \implies D,\; A\}.$$
Dùng phân giải bằng phản chứng để chứng minh $KB \models D$. Trình bày các clause CNF và mọi bước phân giải.

### Lời Giải Chi Tiết Chuẩn A+

#### Bước 1: Thiết lập giả thiết phản chứng
Để chứng minh $KB \models D$ bằng phương pháp phân giải bác bỏ (Resolution Refutation), ta thêm phủ định của kết luận vào cơ sở tri thức:
$$\text{Negated Goal:} \quad \mathbf{\neg D}$$
Mục tiêu là chứng minh tập hợp $KB \cup \{\neg D\}$ là mâu thuẫn (Unsatisfiable) bằng cách rút ra mệnh đề rỗng $\Box$.

#### Bước 2: Chuyển đổi toàn bộ tri thức sang Dạng Chuẩn Hội (CNF)
Áp dụng tương đương logic $P \implies Q \equiv \neg P \lor Q$:
1. $A \implies B \equiv \mathbf{\neg A \lor B}$ $\implies$ Mệnh đề $C_1: \neg A \lor B$
2. $B \implies C \equiv \mathbf{\neg B \lor C}$ $\implies$ Mệnh đề $C_2: \neg B \lor C$
3. $C \implies D \equiv \mathbf{\neg C \lor D}$ $\implies$ Mệnh đề $C_3: \neg C \lor D$
4. Sự thật tiên đề $A$ $\implies$ Mệnh đề $C_4: A$
5. Phủ định mục tiêu $\neg D$ $\implies$ Mệnh đề $C_5: \neg D$

Tập mệnh đề ban đầu: $S = \{C_1, C_2, C_3, C_4, C_5\}$.

#### Bước 3: Lập bảng thực hiện từng bước phân giải (Resolution Steps)

| Bước | Clause cha 1 | Clause cha 2 | Literal triệt tiêu | Resolvent mới sinh ra | Tên Clause |
|:---:|:---:|:---:|:---:|:---|:---:|
| **1** | $C_3: \neg C \lor D$ | $C_5: \neg D$ | $D$ và $\neg D$ | $\neg C$ | $C_6$ |
| **2** | $C_2: \neg B \lor C$ | $C_6: \neg C$ | $C$ và $\neg C$ | $\neg B$ | $C_7$ |
| **3** | $C_1: \neg A \lor B$ | $C_7: \neg B$ | $B$ và $\neg B$ | $\neg A$ | $C_8$ |
| **4** | $C_4: A$ | $C_8: \neg A$ | $A$ và $\neg A$ | $\mathbf{\Box}$ **(Mệnh đề rỗng / Mâu thuẫn)** | $C_9$ |

*(Ghi chú: Ta cũng có thể phân giải xuôi từ $C_4: A$ với $C_1 \to B$, rồi $B$ với $C_2 \to C$, rồi $C$ với $C_3 \to D$, cuối cùng $D$ với $C_5: \neg D \to \Box$. Cả hai hướng đều hợp lệ tuyệt đối).*

#### Bước 4: Kết luận
Do suy dẫn ra được mệnh đề rỗng $\Box$, tập mệnh đề $KB \cup \{\neg D\}$ là không thỏa được.  
Theo định lý bác bỏ, ta khẳng định:
$$KB \models D \quad \text{(Điều phải chứng minh)}$$

---

**Rubric Chấm Điểm:**
* Chuyển đúng 4 luật sang CNF và nêu đúng mục tiêu phủ định $\neg D$: **0.3 điểm**.
* Trình bày chính xác 4 bước phân giải (chỉ rõ 2 clause cha và biến triệt tiêu): **0.5 điểm**.
* Rút ra mệnh đề rỗng $\Box$ và kết luận chặt chẽ: **0.2 điểm**.

---

## Câu 3 (1.0 điểm) — Thuật Toán Hợp Nhất Robinson: Occurs-Check vs Function-Symbol Clash

### Question (English)
For each pair of atoms, determine whether they are unifiable. If they are not, identify the precise reason.
1. $P(x)$ and $P(f(x))$
2. $P(f(a))$ and $P(g(a))$
Briefly distinguish an **occurs-check failure** from a **function-symbol clash**.

### Câu hỏi (Tiếng Việt)
Với mỗi cặp atom, hãy xác định chúng có hợp nhất được hay không. Nếu không, nêu chính xác nguyên nhân.
1. $P(x)$ và $P(f(x))$
2. $P(f(a))$ và $P(g(a))$
Phân biệt ngắn gọn lỗi **occurs check** với xung đột **function symbol clash**.

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Xét cặp nguyên tử 1: $P(x)$ và $P(f(x))$
* **Thiết lập phương trình:** $x \stackrel{?}{=} f(x)$.
* **Phân tích:**
  * Vế trái là biến $x$. Vế phải là hạng thức phức hợp $f(x)$.
  * Thực hiện kiểm tra biến xuất hiện (*Occurs-Check*): Biến $x$ **nằm bên trong cấu trúc của hạng thức vế phải** ($x \in \text{Vars}(f(x))$).
  * Nếu cố tình thực hiện phép thế, ta sẽ nhận được một chuỗi thế vô hạn:
    $$x \mapsto f(x) \mapsto f(f(x)) \mapsto f(f(f(\dots)))$$
    dẫn tới một cấu trúc cây hạng thức vô hạn (infinite term), điều này bị nghiêm cấm trong ngữ pháp Logic Vị Từ Bậc Nhất chuẩn (Standard FOL).
* **Kết luận:** **KHÔNG THỂ HỢP NHẤT.**
* **Nguyên nhân chính xác:** **Thất bại trong phép kiểm tra xuất hiện (Occurs-Check Failure).**

#### 2. Xét cặp nguyên tử 2: $P(f(a))$ và $P(g(a))$
* **Thiết lập phương trình:** $f(a) \stackrel{?}{=} g(a)$.
* **Phân tích:**
  * Cả hai vế đều là các hạng thức phức hợp.
  * Ta so sánh ký hiệu hàm ngoài cùng (head function symbol): Vế trái có ký hiệu hàm là $f$, vế phải có ký hiệu hàm là $g$.
  * Vì $f \neq g$ (hai hàm khác nhau đại diện cho hai ánh xạ toán học độc lập), hai biểu thức này vĩnh viễn không thể làm cho trùng khớp bằng bất kỳ phép thế biến nào.
* **Kết luận:** **KHÔNG THỂ HỢP NHẤT.**
* **Nguyên nhân chính xác:** **Xung đột ký hiệu hàm (Function-Symbol Clash / Head Clash).**

#### 3. Phân biệt bản chất giữa Occurs-Check Failure và Function-Symbol Clash:

| Đặc tính so sánh | Thất bại kiểm tra biến (Occurs-Check Failure) | Xung đột ký hiệu hàm (Function-Symbol Clash) |
|:---|:---|:---|
| **Bản chất phép toán** | Xảy ra giữa **Một biến $x$** và **Một hạng thức phức hợp $t$**. | Xảy ra giữa **Hai cấu trúc hàm** (hoặc hằng số) có tên khác nhau. |
| **Cơ chế phát hiện** | Biến $x$ xuất hiện bên trong tập biến của $t$ ($x \in \text{Vars}(t)$ với $t \neq x$). | So sánh tên hàm ngoài cùng của hai biểu thức thấy khác biệt ($f \neq g$). |
| **Hệ quả nếu bỏ qua** | Tạo ra cấu trúc dữ liệu chu trình / hạng thức vô hạn (như trong Prolog mặc định không bật occurs-check). | Dù trong Prolog hay bất kỳ hệ logic nào cũng **ngay lập tức thất bại** vì không thể đồng nhất hai tên hàm khác nhau. |

---

**Rubric Chấm Điểm:**
* Xác định đúng cặp 1 không unifiable do lỗi Occurs-Check: **0.35 điểm**.
* Xác định đúng cặp 2 không unifiable do lỗi Function-Symbol Clash: **0.35 điểm**.
* So sánh phân biệt rành mạch, chính xác bản chất hai loại lỗi: **0.3 điểm**.

---

## Câu 4 (1.0 điểm) — Tính Đơn Điệu & Giả Định Thế Giới Mở (Open World Assumption - OWA)

### Question (English)
Answer briefly:
1. Define **monotonicity** in classical logic and the **Open World Assumption (OWA)**.
2. Under OWA, if neither $Bird(tweety)$ nor $\neg Bird(tweety)$ can be derived, may we conclude $\neg Bird(tweety)$? Why?

### Câu hỏi (Tiếng Việt)
Trả lời ngắn gọn:
1. Định nghĩa **tính đơn điệu (monotonicity)** trong logic cổ điển và **Giả định Thế giới Mở (Open World Assumption — OWA)**.
2. Theo OWA, nếu không suy ra được cả $Bird(tweety)$ lẫn $\neg Bird(tweety)$, ta có được phép kết luận $\neg Bird(tweety)$ không? Vì sao?

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Định nghĩa Tính đơn điệu và Giả định Thế giới Mở (OWA):

* **Tính đơn điệu trong Logic cổ điển (Monotonicity):**
  * Trong một hệ suy diễn logic cổ điển, nếu một tập tiền đề $KB$ kéo theo một kết luận $\alpha$ ($KB \models \alpha$), thì khi bổ sung thêm bất kỳ tri thức mới $\beta$ nào vào cơ sở tri thức, **kết luận $\alpha$ vẫn vĩnh viễn đúng**:
    $$\forall KB, \alpha, \beta: \quad KB \models \alpha \implies KB \cup \{\beta\} \models \alpha$$
  * Tập các định lý đã chứng minh chỉ có thể tăng lên theo thời gian mà không bao giờ bị thu hẹp hoặc rút lại khi có thêm thông tin mới.
* **Giả định Thế giới Mở (Open World Assumption - OWA):**
  * OWA thừa nhận rằng tri thức hiện tại của hệ thống **có thể chưa đầy đủ (incomplete)**.
  * Việc một phát biểu chưa được khẳng định là đúng trong cơ sở tri thức **KHÔNG đồng nghĩa với việc nó sai**. Phát biểu đó chỉ đơn giản mang giá trị chân lý là **Chưa biết (Unknown / Undetermined)**.
  * OWA là nền tảng cốt lõi của Web Ngữ Nghĩa (Semantic Web - OWL, RDF), nơi thế giới phân tán không thể giả định đã biết hết mọi sự thật.

#### 2. Xét trường hợp OWA với $Bird(tweety)$:
* **Câu hỏi:** Nếu hệ thống không suy ra được cả $Bird(tweety)$ lẫn $\neg Bird(tweety)$, ta có được phép kết luận $\neg Bird(tweety)$ không?
* **Trả lời:** **TUYỆT ĐỐI KHÔNG ĐƯỢC PHÉP!**
* **Giải thích nguyên nhân:**
  * Dưới giả định OWA: *"Sự vắng mặt của bằng chứng không phải là bằng chứng của sự vắng mặt"* (*Absence of evidence is NOT evidence of absence*).
  * Việc $KB \not\models Bird(tweety)$ chỉ phản ánh giới hạn thông tin hiện tại của hệ thống. Để kết luận hợp lệ rằng $\neg Bird(tweety)$ là đúng, hệ thống bắt buộc phải có chứng cứ logic hoặc luật suy diễn chứng minh tường minh điều đó ($KB \models \neg Bird(tweety)$).
  * Việc tự ý suy ra $\neg Bird(tweety)$ khi không chứng minh được $Bird(tweety)$ là quy tắc của **Giả định Thế giới Đóng (Closed World Assumption - CWA)** hoặc cơ chế **Phủ định như thất bại (Negation as Failure)**, hoàn toàn trái ngược với nguyên tắc của OWA.

---

**Rubric Chấm Điểm:**
* Định nghĩa chuẩn toán học tính Monotonicity: **0.35 điểm**.
* Định nghĩa chính xác bản chất tri thức chưa đầy đủ của OWA: **0.35 điểm**.
* Trả lời KHÔNG và giải thích bản chất phân biệt OWA vs CWA: **0.3 điểm**.

---

## Câu 5 (1.5 điểm) — Ngôn Ngữ PROLOG: Phân Tích Cắt Đỏ (Red Cut) & Lỗi Hợp Nhất Đầu Luật

### Question (English)
Consider the following PROLOG program:
```prolog
min_cut(X, Y, X) :- X =< Y, !.
min_cut(_, Y, Y).
```
1. Evaluate both queries: give all answers returned by `?- min_cut(2, 5, M).`, then determine whether `?- min_cut(2, 5, 5).` succeeds or fails and trace the relevant clause selection.
2. State the intended mode of `min_cut/3`. Explain why the cut is a **red cut** rather than a green cut.

### Câu hỏi (Tiếng Việt)
Cho chương trình PROLOG sau:
```prolog
min_cut(X, Y, X) :- X =< Y, !.
min_cut(_, Y, Y).
```
1. Đánh giá cả hai truy vấn: liệt kê mọi đáp án của `?- min_cut(2, 5, M).`, sau đó xác định `?- min_cut(2, 5, 5).` thành công hay thất bại và truy vết việc chọn clause liên quan.
2. Nêu mode dự kiến của `min_cut/3`. Giải thích vì sao cut này là **red cut** chứ không phải green cut.

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Đánh giá chi tiết hai truy vấn:

##### A. Truy vấn 1: `?- min_cut(2, 5, M).`
* **Bước 1 (Thử Clause 1):**
  * Hợp nhất đầu luật `min_cut(X, Y, X)` với `min_cut(2, 5, M)`:
    $$\{X \mapsto 2,\, Y \mapsto 5,\, M \mapsto X = 2\}$$
  * Kiểm tra thân luật: Thực thi `2 =< 5` $\implies$ **Đúng (True)**.
  * Gặp toán tử Cut `!`: Khóa toàn bộ các lựa chọn quay lui đối với mục tiêu `min_cut/3` và bỏ qua Clause 2.
* **Kết quả:** Truy vấn thành công với duy nhất một nghiệm:
  $$\mathbf{M = 2.}$$

##### B. Truy vấn 2: `?- min_cut(2, 5, 5).`
* **Bước 1 (Thử Clause 1):**
  * Cố gắng hợp nhất đầu luật `min_cut(X, Y, X)` với mục tiêu `min_cut(2, 5, 5)`:
    * Đối số 1: $X \mapsto 2$.
    * Đối số 2: $Y \mapsto 5$.
    * Đối số 3: Đầu luật yêu cầu giá trị đối số 3 phải là $X$ (tức là 2), nhưng mục tiêu lại truyền vào giá trị là 5!
    * Vì $2 \neq 5$, **phép hợp nhất đầu luật (Head Unification) THẤT BẠI NGAY LẬP TỨC!**
  * **Cạm bẫy cốt tử:** Vì hợp nhất đầu luật thất bại, Prolog **chưa từng bước vào thân luật** và do đó **toán tử Cut `!` chưa từng được kích hoạt**!
* **Bước 2 (Chuyển sang thử Clause 2):**
  * Do Clause 1 thất bại ở đầu luật, Prolog tự do thử tiếp Clause 2: `min_cut(_, Y, Y).`
  * Hợp nhất đầu luật Clause 2 với `min_cut(2, 5, 5)`:
    * Đối số 1: `_` khớp với 2.
    * Đối số 2 và 3: Biến $Y$ khớp với 5.
    * Phép hợp nhất thành công với $\{Y \mapsto 5\}$.
* **Kết quả:** Truy vấn **THÀNH CÔNG (SUCCEEDS / TRUE)**!
* **Nhận xét sai số nghiêm trọng:** Prolog đã khẳng định rằng *"Giá trị nhỏ nhất giữa 2 và 5 là 5"*! Đây là một lỗi sai logic toán học cực kỳ nghiêm trọng.

#### 2. Phân tích Mode và Bản chất Red Cut:
* **Mode dự kiến (Intended Mode):**
  $$\text{Mode: } \mathbf{min\_cut(+X,\, +Y,\, -M)}$$
  (Hai đối số đầu là biến vào đã được gán giá trị `+`, đối số thứ ba là biến ra chưa được gán `-`).
* **Vì sao đây là Red Cut (Cắt đỏ)?**
  * **Định nghĩa Green Cut:** Là toán tử cut chỉ mang tính tối ưu hóa hiệu năng thuần túy (loại bỏ nhánh dư thừa). Nếu xóa bỏ cut, tập nghiệm và ý nghĩa khai báo logic của chương trình không hề thay đổi.
  * **Định nghĩa Red Cut:** Là toán tử cut làm thay đổi trực tiếp ngữ nghĩa khai báo (declarative meaning) của chương trình.
  * Trong đoạn mã trên, tác giả đã cố tình "ăn gian" bằng cách **bỏ qua điều kiện bảo vệ `X > Y` ở Clause 2**, ỷ lại vào việc toán tử cut ở Clause 1 sẽ ngăn chặn không cho Prolog chạy xuống Clause 2 khi $X \le Y$.
  * Tuy nhiên, vì đặt biến kết quả $X$ ngay tại đầu luật (Head Unification), khi người dùng gọi truy vấn kiểm tra dạng `min_cut(+X, +Y, +M)`, cut bị vô hiệu hóa khiến Clause 2 kích hoạt sai trái sinh ra kết luận sai chân lý.
* **Cách sửa chữa thành Green Cut chuẩn mực (chuẩn phòng thi):**
  ```prolog
  % Cách 1: Tách phép gán đầu ra vào sau Cut
  min_green(X, Y, Min) :- X =< Y, !, Min = X.
  min_green(X, Y, Y).

  % Cách 2: Giữ nguyên vẹn điều kiện logic ở cả hai luật (Green Cut thuần túy)
  min_pure(X, Y, X) :- X =< Y, !.
  min_pure(X, Y, Y) :- X > Y.
  ```

---

**Rubric Chấm Điểm:**
* Đánh giá đúng nghiệm truy vấn 1 ($M=2$): **0.35 điểm**.
* Giải thích chính xác vì sao truy vấn 2 `succeeds` (do Head Unification thất bại trước khi tới Cut): **0.5 điểm**.
* Nêu đúng mode `min_cut(+X, +Y, -M)`: **0.2 điểm**.
* Phân tích rõ ràng bản chất Red Cut và sự phụ thuộc nguy hiểm vào cách gọi: **0.45 điểm**.

---

## Câu 6 (2.0 điểm) — So Sánh Tìm Kiếm Không Tri Thức (BFS, UCS) & Có Tri Thức ($A^*$)

### Question (English)
Consider the directed weighted graph below. Every table entry denotes a directed edge from the left node to the right node. Successors are generated alphabetically.

| Edge | Cost | Edge | Cost |
|---|---:|---|---:|
| S-A | 2 | S-B | 1 |
| A-G | 4 | B-C | 1 |
| C-G | 5 |  |  |

The heuristic values are:
$$h(S)=4,\; h(A)=3,\; h(B)=4,\; h(C)=3,\; h(G)=0.$$
For A*, use $f(n)=g(n)+h(n)$, break ties alphabetically, use graph search, and stop when the goal is removed from OPEN.
1. Compare the three searches: state the BFS solution and cost; show the UCS expansion order and solution; then show the OPEN list after each A* expansion and give its returned path and cost. (1.5 points)
2. Is the heuristic admissible? Is it consistent? Justify using the graph. (0.5 point)

### Câu hỏi (Tiếng Việt)
Xét đồ thị có hướng và có trọng số dưới đây. Mỗi mục trong bảng biểu diễn một cạnh có hướng từ nút bên trái sang nút bên phải. Các nút kế tiếp được sinh theo thứ tự chữ cái.

| Cạnh | Chi phí | Cạnh | Chi phí |
|---|---:|---|---:|
| S-A | 2 | S-B | 1 |
| A-G | 4 | B-C | 1 |
| C-G | 5 |  |  |

Các giá trị heuristic là:
$$h(S)=4,\; h(A)=3,\; h(B)=4,\; h(C)=3,\; h(G)=0.$$
Với $A^*$, dùng $f(n)=g(n)+h(n)$, khi hòa điểm thì ưu tiên theo thứ tự chữ cái, dùng tìm kiếm đồ thị (graph search) và dừng khi trạng thái đích được lấy ra khỏi OPEN.
1. So sánh ba thuật toán: nêu nghiệm và chi phí của BFS; trình bày thứ tự mở rộng và nghiệm của UCS; sau đó ghi danh sách OPEN sau mỗi lần mở rộng của $A^*$ và nêu đường đi cùng chi phí trả về. (1.5 điểm)
2. Heuristic có dẫn đường hợp lệ (admissible) không? Có nhất quán (consistent) không? Chứng minh bằng đồ thị. (0.5 điểm)

### Lời Giải Chi Tiết Chuẩn A+

#### 1. So sánh ba thuật toán tìm kiếm:

##### A. Tìm kiếm theo chiều rộng (BFS - Breadth-First Search):
* **Cơ chế:** BFS coi trọng số mọi cạnh là như nhau ($cost = 1$) và tìm đường đi có **số lượng cạnh ít nhất**.
* Không gian cây tìm kiếm:
  * Tầng 0: $S$
  * Tầng 1: $A, B$
  * Tầng 2: $G$ (sinh từ $A$ qua cạnh $A \to G$) và $C$ (sinh từ $B$ qua $B \to C$).
* Khi sinh ra các nút ở tầng 2, nút đích $G$ được phát hiện ngay tại độ sâu $d = 2$ thông qua nhánh $S \to A \to G$.
* **Đường đi tìm được:** $\mathbf{S \to A \to G}$
* **Tổng chi phí thực tế:** $\text{Cost} = c(S, A) + c(A, G) = 2 + 4 = \mathbf{6}$.

##### B. Tìm kiếm chi phí đồng nhất (UCS - Uniform Cost Search / Dijkstra):
* **Cơ chế:** Luôn chọn lấy nút có chi phí đường đi thực tế $g(n)$ nhỏ nhất từ hàng đợi ưu tiên. Hòa điểm ưu tiên theo thứ tự chữ cái.
* **Bảng theo dõi diễn tiến mở rộng của UCS:**
  1. Khởi tạo: $\text{OPEN} = [\, S(g=0) \,]$.
  2. Lấy $S(0)$ ra mở rộng. Sinh $B(g=1)$ và $A(g=2)$.  
     $\implies \text{OPEN} = [\, B(1),\, A(2) \,]$.
  3. Lấy $B(1)$ ra mở rộng. Sinh $C$ với $g = 1 + 1 = 2$.  
     $\implies \text{OPEN} = [\, A(2),\, C(2) \,]$ *(hòa điểm $g=2$, xét theo chữ cái $A$ trước $C$)*.
  4. Lấy $A(2)$ ra mở rộng. Sinh $G$ với $g = 2 + 4 = 6$.  
     $\implies \text{OPEN} = [\, C(2),\, G(6) \,]$.
  5. Lấy $C(2)$ ra mở rộng. Sinh ứng viên $G$ qua $C$ với $g = 2 + 5 = 7$. Vì $7 > 6$, ta loại bỏ đường đi kém hơn này.  
     $\implies \text{OPEN} = [\, G(6) \,]$.
  6. Lấy $G(6)$ ra khỏi OPEN. Vì $G$ là đích, thuật toán dừng.
* **Thứ tự mở rộng các nút của UCS:** $\mathbf{S \to B \to A \to C \to G}$.
* **Đường đi tối ưu trả về:** $\mathbf{S \to A \to G}$ với **Chi phí tối ưu: $6$**.

##### C. Tìm kiếm đồ thị $A^*$ ($f(n) = g(n) + h(n)$):
* **Bảng diễn tiến chi tiết của $A^*$:**

| Bước | Lấy nút ra mở rộng (Pop) | $g$ | $h$ | $f$ | Các nút con sinh ra | Danh sách OPEN sau khi mở rộng |
|:---:|:---|:---:|:---:|:---:|:---|:---|
| **0** | *(Khởi tạo)* | 0 | 4 | 4 | Đưa $S$ vào OPEN | $[\, S(0, 4, 4) \,]$ |
| **1** | **$S$** | 0 | 4 | 4 | • $A: g=2, h=3 \implies f=5$<br>• $B: g=1, h=4 \implies f=5$<br>*(Hòa $f=5$, xếp $A$ trước $B$)* | $[\, \mathbf{A(2,3,5)},\, B(1,4,5) \,]$ |
| **2** | **$A$** | 2 | 3 | 5 | • $G: g=2+4=6, h=0 \implies f=6$ | $[\, \mathbf{B(1,4,5)},\, G(6,0,6) \,]$ |
| **3** | **$B$** | 1 | 4 | 5 | • $C: g=1+1=2, h=3 \implies f=5$ | $[\, \mathbf{C(2,3,5)},\, G(6,0,6) \,]$ |
| **4** | **$C$** | 2 | 3 | 5 | • $G$ (qua $C$): $g=2+5=7, h=0 \implies f=7$.<br>*(Đã có $G(g=6)$ tốt hơn trên OPEN $\implies$ Bỏ qua)* | $[\, \mathbf{G(6,0,6)} \,]$ |
| **5** | **$G$** | 6 | 0 | 6 | **Lấy Đích ra khỏi OPEN $\implies$ DỪNG!** | *Thuật toán kết thúc* |

* **Đường đi tìm được:** $\mathbf{S \to A \to G}$ với **Tổng chi phí: $6$**.

#### 2. Phân tích tính hợp lệ (Admissibility) và tính nhất quán (Consistency):

* **Tính toán khoảng cách thực tế tối ưu tới đích $h^*(n)$:**
  * $h^*(G) = 0$
  * Từ $A$: chỉ có 1 đường duy nhất $A \to G$ chi phí là $4 \implies \mathbf{h^*(A) = 4}$.
  * Từ $C$: chỉ có 1 đường duy nhất $C \to G$ chi phí là $5 \implies \mathbf{h^*(C) = 5}$.
  * Từ $B$: chỉ có đường $B \to C \to G$ chi phí là $1 + 5 = 6 \implies \mathbf{h^*(B) = 6}$.
  * Từ $S$: có 2 đường:
    * Nhánh 1: $S \to A \to G$ có chi phí $2 + 4 = 6$.
    * Nhánh 2: $S \to B \to C \to G$ có chi phí $1 + 1 + 5 = 7$.
    * $\implies \mathbf{h^*(S) = \min(6, 7) = 6}$.

* **Kiểm tra tính Hợp lệ (Admissibility):**
  * Điều kiện: $0 \le h(n) \le h^*(n)$ với mọi nút $n$.
  * Đối chiếu từng nút:
    * $h(S) = 4 \le h^*(S) = 6$ (Thỏa mãn)
    * $h(A) = 3 \le h^*(A) = 4$ (Thỏa mãn)
    * $h(B) = 4 \le h^*(B) = 6$ (Thỏa mãn)
    * $h(C) = 3 \le h^*(C) = 5$ (Thỏa mãn)
    * $h(G) = 0 \le h^*(G) = 0$ (Thỏa mãn)
  * $\implies$ **Heuristic $h(n)$ là HỢP LỆ (ADMISSIBLE).**

* **Kiểm tra tính Nhất quán / Đơn điệu (Consistency / Monotonicity):**
  * Điều kiện (Bất đẳng thức tam giác): Với mọi cạnh có hướng $(u, v)$ có chi phí $c(u, v)$, ta phải có:
    $$h(u) \le c(u, v) + h(v)$$
  * Kiểm tra toàn bộ 5 cạnh trên đồ thị:
    1. Cạnh $S \to A$: $h(S) = 4 \le c(S, A) + h(A) = 2 + 3 = 5$ $\implies 4 \le 5$ (ĐÚNG)
    2. Cạnh $S \to B$: $h(S) = 4 \le c(S, B) + h(B) = 1 + 4 = 5$ $\implies 4 \le 5$ (ĐÚNG)
    3. Cạnh $A \to G$: $h(A) = 3 \le c(A, G) + h(G) = 4 + 0 = 4$ $\implies 3 \le 4$ (ĐÚNG)
    4. Cạnh $B \to C$: $h(B) = 4 \le c(B, C) + h(C) = 1 + 3 = 4$ $\implies 4 \le 4$ (ĐÚNG)
    5. Cạnh $C \to G$: $h(C) = 3 \le c(C, G) + h(G) = 5 + 0 = 5$ $\implies 3 \le 5$ (ĐÚNG)
  * $\implies$ **Heuristic $h(n)$ là NHẤT QUÁN (CONSISTENT).**

---

**Rubric Chấm Điểm:**
* Nêu đúng kết quả của BFS (đường đi $S-A-G$, chi phí 6): **0.3 điểm**.
* Trình bày đúng thứ tự mở rộng của UCS ($S, B, A, C, G$) và đường đi tối ưu: **0.45 điểm**.
* Lập bảng A* chi tiết, ghi đúng trạng thái OPEN qua từng bước: **0.75 điểm**.
* Tính đúng $h^*(n)$ và chứng minh đầy đủ tính Admissible + Consistent: **0.5 điểm**.

---

## Câu 7 (2.0 điểm) — Mạng Bayes: Phân Rã Xác Suất, d-Separation & Explaining Away

### Question (English)
A Bayesian network has four Boolean variables with edges
$$B \to A \leftarrow E, \qquad A \to C,$$
where $B$ = Burglary, $E$ = Earthquake, $A$ = Alarm, and $C$ = Call.
1. Write the factorization of $P(B,E,A,C)$. (0.5 point)
2. Analyze the network using d-separation: determine whether $B$ and $E$ are marginally independent, determine whether $B$ and $C$ are conditionally independent given $A$, and explain how evidence $E=true$ can affect belief in $B=true$ after observing $A=true$. Name the final effect. (1.5 points)

### Câu hỏi (Tiếng Việt)
Một mạng Bayes có bốn biến Boolean với các cạnh
$$B \to A \leftarrow E, \qquad A \to C,$$
trong đó $B$ = Trộm (Burglary), $E$ = Động đất (Earthquake), $A$ = Chuông báo động (Alarm), và $C$ = Cuộc gọi báo (Call).
1. Viết công thức phân rã xác suất đồng thời $P(B,E,A,C)$. (0.5 điểm)
2. Phân tích mạng bằng thuật toán d-separation: xác định $B$ và $E$ có độc lập biên không; xác định $B$ và $C$ có độc lập có điều kiện khi biết $A$ không; và giải thích bằng chứng $E=true$ có thể ảnh hưởng thế nào tới niềm tin vào $B=true$ sau khi đã quan sát $A=true$. Nêu tên hiện tượng cuối cùng này. (1.5 điểm)

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Công thức phân rã xác suất đồng thời (Factorization):
Theo **Tiên đề phân rã chuỗi của Mạng Bayes (Bayesian Network Chain Rule)**, xác suất đồng thời của mọi biến trong mạng bằng tích các xác suất có điều kiện của từng nút đối với tập cha mẹ trực tiếp của nó:
$$P(X_1, X_2, \dots, X_n) = \prod_{i=1}^n P(X_i \mid \text{Parents}(X_i))$$

Áp dụng cho đồ thị đã cho:
* $\text{Parents}(B) = \emptyset \implies P(B)$
* $\text{Parents}(E) = \emptyset \implies P(E)$
* $\text{Parents}(A) = \{B, E\} \implies P(A \mid B, E)$
* $\text{Parents}(C) = \{A\} \implies P(C \mid A)$

Do đó, công thức phân rã là:
$$\mathbf{P(B, E, A, C) = P(B) \cdot P(E) \cdot P(A \mid B, E) \cdot P(C \mid A)}$$

#### 2. Phân tích tính độc lập bằng thuật toán d-separation:

```
        (B: Trộm)             (E: Động đất)
            \                     /
             \                   /
              v                 v
                 (A: Báo động)  <--- Collider / V-structure
                       |
                       v
                 (C: Cuộc gọi)
```

##### A. Phân tích tính độc lập biên giữa $B$ và $E$ ($B \stackrel{?}{\perp} E \mid \emptyset$):
* Xét đường truyền duy nhất nối giữa $B$ và $E$:
  > Đường đi: $B \to A \leftarrow E$
* **Nhận diện cấu trúc nút:** Nút $A$ là một **Nút hội tụ (Collider / V-structure)** vì cả hai mũi tên đều đâm vào $A$ ($B \to A$ và $E \to A$).
* **Áp dụng luật d-separation cho Collider:**
  * Một nút collider sẽ **BỊ CHẶN (BLOCKED)** nếu bản thân nó VÀ toàn bộ các nút con cháu của nó KHÔNG nằm trong tập bằng chứng đã quan sát $Z$.
  * Ở đây tập bằng chứng là rỗng ($Z = \emptyset$). Do đó nút $A \notin Z$ và hậu duệ $C \notin Z$.
  * Vì đường đi bị chặn tại collider $A$, không có dòng thông tin nào lưu thông được giữa $B$ và $E$.
* **Kết luận:** **$B$ và $E$ ĐỘC LẬP BIÊN VỚI NHAU:**
  $$B \perp E \mid \emptyset \quad \implies P(B, E) = P(B) \cdot P(E)$$

##### B. Phân tích tính độc lập có điều kiện giữa $B$ và $C$ khi biết $A$ ($B \stackrel{?}{\perp} C \mid A$):
* Xét đường truyền nối giữa $B$ và $C$:
  > Đường đi: $B \to A \to C$
* **Nhận diện cấu trúc nút:** Nút $A$ là một **Nút chuỗi nhân quả (Causal Chain / Non-collider)** ($B \to A \to C$).
* **Áp dụng luật d-separation cho Chain:**
  * Một nút non-collider sẽ **BỊ CHẶN (BLOCKED)** nếu nó ĐƯỢC QUAN SÁT (nằm trong tập điều kiện $Z$).
  * Ở đây tập bằng chứng là $Z = \{A\}$. Nút $A$ đã được quan sát.
  * Việc quan sát trạng thái của chuông báo động $A$ đã ngắt đứt hoàn toàn ảnh hưởng nhân quả từ $B$ truyền tới cuộc gọi $C$ (biết chuông kêu hay không là đủ để dự đoán cuộc gọi, biết thêm có trộm hay không không đem lại thông tin mới).
* **Kết luận:** **$B$ và $C$ ĐỘC LẬP CÓ ĐIỀU KIỆN KHI BIẾT $A$:**
  $$B \perp C \mid A$$

##### C. Phân tích hiện tượng Explaining Away khi quan sát thêm $E = true$ sau khi đã có $A = true$:
* **Trạng thái ban đầu khi mới chỉ biết $A = true$:**
  * Khi chuông báo động reo ($A = true$), nút collider $A$ **BỊ MỞ RA (UNBLOCKED)**, tạo ra một luồng liên kết thông tin giữa hai nguyên nhân độc lập ban đầu là $B$ và $E$.
  * Xác suất tin rằng có trộm tăng vọt: $P(B = true \mid A = true) \gg P(B = true)$.
* **Sự biến đổi khi nhận thêm chứng cứ $E = true$ (Xác nhận vừa có động đất lớn):**
  * Vì động đất $E = true$ là một nguyên nhân hoàn toàn thỏa đáng và đủ mạnh để giải thích tại sao chuông báo động kêu ($A = true$).
  * Sự xuất hiện của lời giải thích "động đất" đã làm triệt tiêu bớt nhu cầu phải viện dẫn giả thuyết "có trộm đột nhập".
  * Về mặt toán học xác suất:
    $$P(B = true \mid A = true,\, E = true) < P(B = true \mid A = true)$$
* **Tên gọi chuẩn của hiện tượng:**
  * Tiếng Anh: **Explaining Away** (hoặc *Discounting Effect*).
  * Tiếng Việt: **Hiện tượng Giải tỏa nguyên nhân** (hoặc *Giảm trừ giả thuyết cạnh tranh*).

---

**Rubric Chấm Điểm:**
* Viết đúng công thức phân rã mạng Bayes: **0.5 điểm**.
* Phân tích đúng d-separation cho $B \perp E$ (Collider chưa mở): **0.5 điểm**.
* Phân tích đúng d-separation cho $B \perp C \mid A$ (Causal Chain bị chặn): **0.5 điểm**.
* Giải thích cơ chế sụt giảm xác suất và gọi đúng tên hiện tượng "Explaining Away": **0.5 điểm**.

---

## BẢNG TỔNG KẾT ĐIỂM TOÀN BÀI — ĐỀ 04

| Câu hỏi | Chủ đề kiến thức | Điểm tối đa | Chuẩn đầu ra (Target Competency) |
|:---:|:---|:---:|:---|
| **Câu 1** | Chương 1: Căn phòng tiếng Trung & Strong AI | **1.5** | Phân biệt Cú pháp vs Ngữ nghĩa, Systems Reply, đánh giá giới hạn AI |
| **Câu 2** | Chương 2: Phân giải bác bỏ chuỗi kéo theo | **1.0** | Lập luận phản chứng, CNF và 4 bước phân giải rút ra mệnh đề rỗng $\Box$ |
| **Câu 3** | Chương 3: Hợp nhất Robinson (Occurs-Check vs Clash) | **1.0** | Phân biệt chính xác thất bại do lặp biến và do xung đột tên hàm |
| **Câu 4** | Chương 4: Tính đơn điệu & Thế giới mở (OWA) | **1.0** | Định nghĩa Monotonicity, nguyên tắc OWA ("chưa biết không có nghĩa là sai") |
| **Câu 5** | Chương 5: Toán tử Cut, Red Cut & Head Unification | **1.5** | Phân tích cơ chế cạm bẫy Head Unification bypass Cut, giải thích Red Cut |
| **Câu 6** | Chương 6: So sánh BFS, UCS và $A^*$ Graph Search | **2.0** | Mô phỏng 3 thuật toán, kiểm tra chứng minh Admissibility & Consistency |
| **Câu 7** | Chương 7: Mạng Bayes, d-Separation & Explaining Away | **2.0** | Quy tắc phân rã, phân tích 3 mô hình d-separation và giải tỏa nguyên nhân |
| **TỔNG** | **Toàn bộ 7 Chương học phần AI** | **10.0** | **Đạt chuẩn điểm 10/10 (Xuất sắc - Chuẩn chỉ)** |

## Tổng điểm

**Tổng: 10/10**

