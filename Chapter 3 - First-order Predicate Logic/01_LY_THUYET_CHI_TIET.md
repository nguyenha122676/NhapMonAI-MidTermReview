# Chapter 3 – Logic Vị Từ Bậc Nhất (First-Order Predicate Logic - PL1 / FOL)
## Cẩm Nang Lý Thuyết Chuyên Sâu Ôn Thi A+

> **Môn học:** Nhập môn Trí tuệ Nhân tạo (Introduction to Artificial Intelligence - MAT1206E / MAT3508)  
> **Nguồn bài giảng:** Slide chính thức `First-order_Predicate_Logic.pdf` (89 trang) & `First-order_Predicate_Logic_InClass.pdf` (57 trang) của TS. Hoàng Anh Đức (ĐHKHTN - ĐHQGHN)  
> **Giáo trình tham chiếu:** Wolfgang Ertel (2025), *Introduction to Artificial Intelligence*, 3rd Edition, Springer (Chapter 3); Russell & Norvig (2021), *AIMA 4th Edition* (Chapters 8, 9)  
> **Ngày cập nhật:** 23/10/2026

---

## Mục Tiêu Học Tập (Learning Objectives)

Sau khi làm chủ chương này, bạn cần đạt được:
1. Hiểu sâu **Bối cảnh & Giới hạn cốt tử của Logic mệnh đề (PL0)** dẫn đến sự ra đời tất yếu của Logic vị từ bậc nhất (First-Order Predicate Logic - PL1 / FOL).
2. Nắm vững cú pháp hình thức: **Hạng thức (Terms)** đại diện cho đối tượng, **Công thức (Formulas / WFF)** đại diện cho chân trị, sự khác nhau giữa **Biến tự do (Free variables)** và **Biến ràng buộc (Bound variables)**, khái niệm **Câu đóng (Sentence / Closed formula)**.
3. Làm chủ ngữ nghĩa Tarski: **Cấu trúc ngữ nghĩa (Structure $\mathcal{M} = (\mathcal{U}, \mathcal{I})$)**, **Miền biện luận (Universe of discourse $\mathcal{U}$)**, **Phép gán biến (Variable assignment $\alpha$)**, khái niệm **Mô hình (Model)** và hai định lý kim chỉ nam: **Định lý suy diễn (Deduction Theorem)**, **Định lý phản chứng (Proof by Contradiction)**.
4. Nắm chắc kỹ thuật chuẩn hóa công thức: **Dạng chuẩn tiền tố (Prenex Normal Form - PNF)**, **Kỹ thuật Skolem hóa (Skolemization)** (phân biệt **Hằng Skolem** và **Hàm Skolem**), và bản chất **Bảo toàn tính thỏa được (Equisatisfiability)** thay vì tương đương logic.
5. Làm chủ các định lý nền tảng của logic học thế giới (Metalogic): **Định lý đầy đủ của Gödel (Gödel's Completeness Theorem 1930)** và tính chất **Nửa-quyết định được (Semi-decidability của Turing & Church 1936)**.
6. Thành thạo **Thuật toán Hợp nhất (Unification Algorithm)** tìm **Phép thế tổng quát nhất (Most General Unifier - MGU)**, vai trò sống còn của **Phép kiểm tra tự chứa (Occurs Check)**.
7. Hiểu rõ **Luật Hợp giải tổng quát (Generalized Resolution Rule)** kết hợp cùng **Luật thừa số hóa (Factorization Rule)** để đảm bảo **Tính đầy đủ bác bỏ (Refutation-completeness)** (phân tích qua Nghịch lý thợ cạo Russell).
8. Nắm được cách xử lý quan hệ đẳng thức ($=$) qua kỹ thuật **Viết lại hạng thức (Term Rewriting)**, **Demodulation**, **Paramodulation** và các bộ chứng minh tự động hiện đại (**Automated Theorem Provers - ATPs** như E Prover).

---

## 1. Bối Cảnh, Động Lực & Giới Hạn Của Logic Mệnh Đề (PL0)

### 1.1. Kỷ nguyên vàng của Symbolic AI và vị trí của Logic ngày nay
- **Giai đoạn 1950s – 1980s (Symbolic AI):** Logic hình thức là phương pháp thống trị tuyệt đối trong AI, dựa trên giả thuyết hệ thống ký hiệu vật lý (*Physical Symbol System Hypothesis* của Allen Newell và Herbert Simon).
- **Giai đoạn hiện nay (Machine Learning & Deep Learning bùng nổ):** Các mô hình học sâu chiếm ưu thế trong thị giác và ngôn ngữ, nhưng lại là "hộp đen" (black-box), thiếu khả năng giải thích và không đảm bảo an toàn tuyệt đối.
- **Tại sao Logic vẫn giữ vị trí sống còn trong AI hiện đại?**
  1. **Tính giải thích được (Explainability & Interpretability):** Cung cấp từng bước chứng minh minh bạch, truy xuất được nguồn gốc quyết định.
  2. **Tính kiểm chứng được (Verifiability & Safety):** Trong các hệ thống tối quan trọng (safety-critical systems) như xe tự hành, hàng không, y tế, quyết định phải được chứng minh toán học là không vi phạm các ràng buộc an toàn.
  3. **Lập kế hoạch hành động (Automated Planning):** Robot dịch vụ lập chuỗi hành động tối ưu trong không gian trạng thái phức tạp.
  4. **Neuro-Symbolic AI:** Kết hợp tri thức biểu tượng chính xác (Symbolic Knowledge) với dữ liệu cảm biến đa chiều từ mạng nơ-ron (Sub-symbolic Sensor Data).

### 1.2. Giới hạn "chết người" của Logic Mệnh Đề (PL0)
Trong PL0, đơn vị cơ bản nhỏ nhất là **Mệnh đề nguyên tử (Atomic Proposition)**. Mỗi mệnh đề chỉ có thể nhận giá trị True hoặc False, được coi như một "hộp đen" không thể nhìn thấu cấu trúc bên trong.

#### Ba điểm yếu cốt tử của PL0:
1. **Không có khái niệm Đối tượng (Objects):** Không thể biểu diễn riêng rẽ các thực thể độc lập như "An", "Bình", "Robot 1", "Con mèo Tom".
2. **Không có khái niệm Thuộc tính (Properties) và Mối quan hệ (Relations):** Không thể mô tả trực tiếp tính chất "Màu đỏ", "Lớn hơn", "Là mẹ của".
3. **Không có Lượng từ (Quantifiers):** Không có cách nào phát biểu trực tiếp các câu chứa *"Mọi..."* ($\forall$) hoặc *"Có một / Tồn tại..."* ($\exists$).

### 1.3. Phân tích bài toán chuẩn trên Slide: 100 Robot trên lưới $100 \times 100$ ô cờ
Để thấy sự bất lực của PL0, slide đưa ra kịch bản thực tế:
- Môi trường lưới gồm $100 \times 100 = 10,000$ ô tọa độ $(x, y)$ với $x, y \in \{1, \dots, 100\}$.
- Có $100$ con robot hoạt động, ký hiệu $R_1, R_2, \dots, R_{100}$.

**Nếu mô hình hóa bằng Logic Mệnh đề (PL0):**
- Mỗi phát biểu *"Robot $i$ đang ở ô $(x, y)$"* phải được gán cho một biến mệnh đề riêng: $\text{At}(i, x, y)$.
- Tổng số biến mệnh đề nguyên tử cần khai báo:
  $$100 \times 10,000 = \mathbf{1,000,000 \text{ biến mệnh đề (1 triệu biến!)semble}}$$
- Thử tưởng tượng ta muốn phát biểu quy tắc: *"Nếu Robot $u$ ở ô $(x_1, y_1)$ và Robot $v$ ở ô $(x_2, y_2)$ với $x_1 > x_2$ thì Robot $u$ nằm bên phải Robot $v$"*.  
  Trong PL0, ta phải tạo một công thức tuyển khổng lồ liên kết hàng chục triệu cặp toạ độ rời rạc:
  $$(\text{At}(R_1, 2, 1) \land \text{At}(R_2, 1, 1) \Rightarrow \text{Right}(R_1, R_2)) \land \dots$$
  Không một thuật toán SAT solver nào giải quyết nổi sự bùng nổ tổ hợp (combinatorial explosion) khủng khiếp này!

**Mô hình hóa bằng Logic Vị từ Bậc nhất (PL1):**
Trong PL1, ta tách biệt **Đối tượng** (Robot, Tọa độ) và **Quan hệ** (Vị trí, Quan hệ không gian). Ta chỉ cần viết duy nhất **MỘT dòng công thức duy nhất**:
$$\forall u \forall v \forall x_1 \forall y_1 \forall x_2 \forall y_2 \Big( \big(\text{at}(u, x_1, y_1) \land \text{at}(v, x_2, y_2) \land \text{gr}(x_1, x_2)\big) \implies \text{is\_right\_of}(u, v) \Big)$$
Công thức này có tính khái quát hóa vô hạn: Dù có 100 hay 1 triệu robot, công thức vẫn giữ nguyên độ dài vài chục ký tự!

---

## 2. Cú Pháp Của Logic Vị Từ Bậc Nhất (Syntax of PL1)

### 2.1. Bảng ký hiệu hình thức (Signature / Alphabet)
Ngôn ngữ PL1 được xây dựng từ 4 loại ký hiệu cơ sở (Signature) kết hợp cùng các ký hiệu logic chuẩn:

| Thành phần Cú pháp | Ký hiệu thường dùng | Bản chất Toán học | Vai trò trong Ngữ pháp | Ví dụ cụ thể |
| :--- | :--- | :--- | :--- | :--- |
| **Biến (Variables)** | $x, y, z, u, v, x_1, x_2, \dots$ | Ký hiệu đại diện chưa xác định, nhận giá trị trong miền $\mathcal{U}$ | Đại từ (ai đó, vật nào đó) | $x$ trong $\forall x$ |
| **Hằng (Constants)** | $a, b, c, c_1, \text{john}, \text{anna}, 0, 1$ | Ký hiệu chỉ định một đối tượng cụ thể duy nhất cố định | Danh từ riêng | $\text{eve}, \text{oscar}, 1945$ |
| **Ký hiệu Hàm (Functions)** | $f, g, h, \text{plus}, \text{father}, \text{mother}$ | Ánh xạ nhận $n$ đối tượng đầu vào, **trả về 1 đối tượng khác** | Cỗ máy sinh danh từ | $\text{plus}(x, y), \text{father}(\text{john})$ |
| **Ký hiệu Vị từ (Predicates)** | $P, Q, R, \text{gr}, \text{child}, \text{is\_red}, =$ | Quan hệ $n$ ngôi, nhận $n$ đối tượng đầu vào, **trả về chân trị True/False** | Động từ / Tính từ | $\text{child}(x, y, z), \text{gr}(a, b)$ |

Ngoài ra là các **Ký hiệu logic (Logical Symbols)** cố định:
- Các phép nối mệnh đề: Phủ định $\neg$, Hội $\land$, Tuyển $\lor$, Kéo theo $\Rightarrow$, Tương đương $\Leftrightarrow$.
- Các lượng từ: Lượng từ toàn thể $\forall$ (Universal Quantifier: "với mọi"), Lượng từ tồn tại $\exists$ (Existential Quantifier: "tồn tại / có ít nhất một").
- Dấu phân cách: Dấu ngoặc đơn $(, )$, dấu phẩy $,$.

---

### 2.2. Hạng Thức (Terms) - Đại Diện Cho Đối Tượng
> [!IMPORTANT]
> **Định nghĩa đệ quy của Hạng thức (Term):**
> 1. Mọi **Biến (Variable)** đều là một Term: $x, y, z \in \mathcal{T}$.
> 2. Mọi **Hằng (Constant)** đều là một Term: $c_1, c_2, a, b \in \mathcal{T}$.
> 3. Nếu $f$ là một ký hiệu hàm $n$-ngôi và $t_1, t_2, \dots, t_n$ là các Terms, thì $f(t_1, t_2, \dots, t_n)$ cũng là một Term (**Complex Term**).
> 4. Không có gì khác ngoài 3 quy tắc trên là một Term.

- **Atomic Term (Hạng thức nguyên tử):** Chỉ gồm hằng hoặc biến (ví dụ: $x, c_1$).
- **Complex Term (Hạng thức phức hợp):** Được tạo từ hàm bao bọc các hạng thức (ví dụ: $\text{plus}(c_1, x)$, $f(g(x), c_2)$).
- **Ground Term (Hạng thức đóng / không chứa biến):** Term hoàn toàn không chứa biến số nào (ví dụ: $\text{plus}(c_1, c_2)$, $\text{father}(\text{john})$).

> [!CAUTION]
> **Cạm bẫy kinh điển trong phòng thi:**
> - Ký hiệu hàm trong logic ($\text{plus}, \text{father}$) **KHÔNG PHẢI LÀ LỜI GỌI HÀM LẬP TRÌNH**.
> - $\text{plus}(c_1, c_3)$ không tự động cộng ra số 4! Nó chỉ là một **tên gọi phức hợp (a complicated kind of name)** đại diện cho một đối tượng.
> - **Hàm trả về ĐỐI TƯỢNG (Object), KHÔNG BAO GIỜ trả về True/False!**

---

### 2.3. Công Thức (Formulas) - Biểu Thức Mang Chân Trị True / False
> [!IMPORTANT]
> **Định nghĩa đệ quy của Công thức Hợp thức (Well-Formed Formula - WFF):**
> 1. **Công thức nguyên tử (Atomic Formula / Atom):** Nếu $P$ là một ký hiệu vị từ $n$-ngôi và $t_1, \dots, t_n$ là các Terms, thì $P(t_1, \dots, t_n)$ là một Công thức nguyên tử.  
>    *Ví dụ:* $\text{gr}(\text{plus}(c_1, c_3), c_2)$, $\text{child}(\text{eve}, \text{oscar}, \text{anne})$, $x = y$.
> 2. **Công thức phức hợp (Compound Formula):** Nếu $\varphi, \psi$ là các công thức thì:
>    $$\neg \varphi, \quad (\varphi \land \psi), \quad (\varphi \lor \psi), \quad (\varphi \Rightarrow \psi), \quad (\varphi \Leftrightarrow \psi)$$
>    đều là các công thức hợp lệ.
> 3. **Lượng từ hóa (Quantified Formula):** Nếu $\varphi$ là một công thức và $x$ là một biến, thì $\forall x \varphi$ và $\exists x \varphi$ đều là các công thức hợp lệ.

- **Literal (Mệnh đề đơn vị):** Là một công thức nguyên tử (Positive Literal, ví dụ $P(x)$) hoặc phủ định của một công thức nguyên tử (Negative Literal, ví dụ $\neg Q(a, f(y))$).

---

### 2.4. Biến Tự Do (Free Variables) vs Biến Ràng Buộc (Bound Variables)
Xét công thức có chứa lượng từ:

$$\forall x \big( P(x, y) \Rightarrow \exists z Q(x, z) \big)$$

- **Phạm vi của lượng từ (Scope of Quantifier):** Là phân vùng công thức con mà lượng từ đó có hiệu lực tác động. Trong ví dụ trên, phạm vi của $\forall x$ là toàn bộ khối $(P(x, y) \Rightarrow \exists z Q(x, z))$, còn phạm vi của $\exists z$ chỉ là $Q(x, z)$.
- **Biến ràng buộc (Bound Variable):** Biến $x$ bị ràng buộc nếu nó xuất hiện trong phạm vi của một lượng từ $\forall x$ hoặc $\exists x$.
- **Biến tự do (Free Variable):** Biến xuất hiện trong công thức nhưng không bị bất kỳ lượng từ nào cùng tên bao bọc. Trong ví dụ trên:
  - $x$ bị ràng buộc bởi $\forall x$.
  - $z$ bị ràng buộc bởi $\exists z$.
  - $y$ là **biến tự do (Free Variable)** vì không có lượng từ nào bao bọc nó!
- **Câu / Công thức đóng (Sentence / Closed Formula):** Là công thức **hoàn toàn không chứa biến tự do nào**. Chỉ có Sentence mới có thể đánh giá chân trị tuyệt đối True/False một khi đã xác định Cấu trúc ngữ nghĩa!
- **Công thức chuẩn hóa biến (Rectified Formula):** Công thức trong đó mỗi biến chỉ được lượng từ hóa đúng một lần và không có biến nào vừa xuất hiện tự do vừa xuất hiện ràng buộc.

---

## 3. Ngữ Nghĩa Của Logic Vị Từ Bậc Nhất (Semantics of PL1)

Một công thức cú pháp tự thân nó không có ý nghĩa đúng hay sai. Để gán ý nghĩa, ta cần một thế giới cụ thể gọi là **Cấu trúc Ngữ nghĩa (Structure)** $\mathcal{M} = (\mathcal{U}, \mathcal{I})$.

### 3.1. Cấu trúc Ngữ nghĩa và Miền biện luận (Universe of Discourse)
1. **Miền biện luận $\mathcal{U}$ (Domain / Universe of Discourse):** Một tập hợp khác rỗng các thực thể có thực trong thế giới đang xét (ví dụ: tập các số tự nhiên $\mathbb{N}$, tập con người, tập các robot).
2. **Hàm Giải thích $\mathcal{I}$ (Interpretation Function):**
   - Ánh xạ mỗi ký hiệu hằng $c$ thành một phần tử cụ thể: $\mathcal{I}(c) \in \mathcal{U}$.
   - Ánh xạ mỗi ký hiệu hàm $n$-ngôi $f$ thành một hàm toán học thực sự: $\mathcal{I}(f): \mathcal{U}^n \to \mathcal{U}$.
   - Ánh xạ mỗi ký hiệu vị từ $n$-ngôi $P$ thành một quan hệ thực sự: $\mathcal{I}(P) \subseteq \mathcal{U}^n$ (nghĩa là ánh xạ $\mathcal{U}^n \to \{\text{True}, \text{False}\}$).

### 3.2. Phép gán Biến (Variable Assignment $\alpha$)
Vì công thức có thể chứa các biến tự do chưa xác định, ta cần một **phép gán biến (variable assignment)** $\alpha: \mathcal{V} \to \mathcal{U}$, ánh xạ mỗi biến $x$ vào một đối tượng cụ thể $\alpha(x) \in \mathcal{U}$.
Giá trị của một hạng thức $t$ dưới cặp $(\mathcal{I}, \alpha)$, ký hiệu $\mathcal{I}_\alpha(t)$, được tính đệ quy:
$$\mathcal{I}_\alpha(t) = \begin{cases} \alpha(x) & \text{nếu } t \text{ là biến } x \\ \mathcal{I}(c) & \text{nếu } t \text{ là hằng } c \\ \mathcal{I}(f)\big(\mathcal{I}_\alpha(t_1), \dots, \mathcal{I}_\alpha(t_n)\big) & \text{nếu } t = f(t_1, \dots, t_n) \end{cases}$$

### 3.3. Định nghĩa Chân trị của Công thức theo Phong cách Tarski
Chân trị của công thức $\varphi$ dưới sự giải thích $\mathcal{I}$ và phép gán $\alpha$, ký hiệu $\mathcal{I}_\alpha(\varphi) \in \{\text{True}, \text{False}\}$:
1. **Vị từ nguyên tử:** $\mathcal{I}_\alpha(P(t_1, \dots, t_n)) = \text{True} \iff \big(\mathcal{I}_\alpha(t_1), \dots, \mathcal{I}_\alpha(t_n)\big) \in \mathcal{I}(P)$.
2. **Đẳng thức:** $\mathcal{I}_\alpha(t_1 = t_2) = \text{True} \iff \mathcal{I}_\alpha(t_1) = \mathcal{I}_\alpha(t_2)$ (cùng trỏ về một phần tử duy nhất trong $\mathcal{U}$).
3. **Phép nối mệnh đề:** Vận hành giống hệt PL0 ($\neg, \land, \lor, \Rightarrow, \Leftrightarrow$).
4. **Lượng từ toàn thể $\forall x \varphi$:**
   $$\mathcal{I}_\alpha(\forall x \varphi) = \text{True} \iff \text{với MỌI phần tử } d \in \mathcal{U}, \text{ ta đều có } \mathcal{I}_{\alpha[x \mapsto d]}(\varphi) = \text{True}$$
5. **Lượng từ tồn tại $\exists x \varphi$:**
   $$\mathcal{I}_\alpha(\exists x \varphi) = \text{True} \iff \text{TỒN TẠI ÍT NHẤT MỘT phần tử } d \in \mathcal{U} \text{ sao cho } \mathcal{I}_{\alpha[x \mapsto d]}(\varphi) = \text{True}$$
*(Ở đây, $\alpha[x \mapsto d]$ là phép gán biến mới giống hệt $\alpha$, chỉ riêng biến $x$ được gán giá trị $d$).*

### 3.4. Mô hình (Model), Tính Thỏa được & Tính Hằng đúng
- **Mô hình (Model):** Một cấu trúc $\mathcal{M} = (\mathcal{U}, \mathcal{I})$ được gọi là một **Mô hình** của công thức $\varphi$ (ký hiệu $\mathcal{M} \models \varphi$) nếu $\varphi$ đúng dưới mọi phép gán biến $\alpha$ trong $\mathcal{M}$.
- **Tính Thỏa được (Satisfiable):** Công thức $\varphi$ thỏa được nếu tồn tại ít nhất một cấu trúc $\mathcal{M}$ làm cho nó đúng.
- **Tính Hợp thức / Hằng đúng (Valid / Tautology):** Công thức $\varphi$ là hằng đúng (ký hiệu $\models \varphi$) nếu nó đúng trong **MỌI cấu trúc ngữ nghĩa có thể có** (với mọi miền $\mathcal{U}$ và mọi hàm diễn giải $\mathcal{I}$).
- **Tính Mâu thuẫn / Không thỏa được (Unsatisfiable / Contradiction):** Nếu không có bất kỳ cấu trúc nào làm cho nó đúng.

### 3.5. Hệ quả Logic (Logical Consequence / Entailment $\models$)
Cho tập công thức $\Gamma$ ($KB$) và công thức mục tiêu $\varphi$:
$$KB \models \varphi \iff \text{Mọi mô hình của } KB \text{ đều là mô hình của } \varphi$$
- **Định lý 1 (Deduction Theorem):** $KB \cup \{\varphi\} \models \psi \iff KB \models (\varphi \Rightarrow \psi)$.
- **Định lý 2 (Proof by Contradiction):** $KB \models \varphi \iff KB \cup \{\neg \varphi\} \text{ không thỏa được (unsatisfiable)}$.

### 3.6. Phép Thay thế Biến (Substitution) & Bắt Biến (Variable Capture)
Ký hiệu $\varphi[x / t]$ biểu thị công thức thu được khi thay thế mọi sự xuất hiện tự do của biến $x$ trong $\varphi$ bằng hạng thức $t$.
- **Ràng buộc an toàn:** Hạng thức $t$ không được chứa bất kỳ biến nào đang bị lượng từ hóa trong $\varphi$ tại vị trí được thay vào (hiện tượng **Bắt biến - Variable Capture**).
- *Ví dụ về Bắt biến nguy hiểm:* Xét $\varphi = \exists y (x < y)$ ("Với mọi $x$, luôn tồn tại số $y$ lớn hơn $x$" - luôn đúng trong $\mathbb{N}$).  
  Nếu ta thay $x$ bằng hạng thức $t = y + 1$ mà không đổi tên biến, ta sẽ được:
  $$\exists y (y + 1 < y)$$
  ("Tồn tại số $y$ mà $y+1 < y$" - câu này hoàn toàn SAI!).  
  👉 **Khắc phục:** Phải đổi tên biến ràng buộc $y$ thành một biến mới $z$: $\varphi \equiv \exists z (x < z)$, sau đó mới thay thế an toàn: $\exists z (y + 1 < z)$.

---

## 4. Dạng Chuẩn & Kỹ Thuật Skolem Hóa (Normal Forms & Skolemization)

Để máy tính và các thuật toán hợp giải xử lý tự động, công thức logic tổng quát phải được chuẩn hóa qua 3 tầng:

$$\text{Công thức tùy ý} \xrightarrow{\text{Bước 1}} \text{Prenex Normal Form (PNF)} \xrightarrow{\text{Bước 2}} \text{Skolemization} \xrightarrow{\text{Bước 3}} \text{Clausal Normal Form (CNF)}$$

### 4.1. Dạng Chuẩn Tiền Tố (Prenex Normal Form - PNF)
Một công thức ở **Dạng chuẩn Tiền tố (PNF)** nếu có cấu trúc:

$$Q_1 x_1 Q_2 x_2 \dots Q_n x_n \, \psi$$

- Khối $Q_1 x_1 \dots Q_n x_n$ (với $Q_i \in \{\forall, \exists\}$) gọi là **Tiền tố (Prefix)**.
- $\psi$ là công thức **hoàn toàn không chứa lượng từ**, gọi là **Phần thân (Matrix)**.
- **Định lý 3 (Prenex Normal Form Theorem):** Mọi công thức trong PL1 đều có thể biến đổi thành một công thức tương đương logic ở dạng PNF.

#### Hệ thống quy tắc đẩy lượng từ ra đầu câu:
Giả sử biến $x$ không xuất hiện trong công thức $A$:
1. $(\forall x B) \land A \equiv \forall x (B \land A)$ và $(\exists x B) \land A \equiv \exists x (B \land A)$
2. $(\forall x B) \lor A \equiv \forall x (B \lor A)$ và $(\exists x B) \lor A \equiv \exists x (B \lor A)$
3. **Cạm bẫy Phủ định (Đổi lượng từ):**
   $$\neg (\forall x B) \equiv \exists x (\neg B), \qquad \neg (\exists x B) \equiv \forall x (\neg B)$$
4. **Cạm bẫy Kéo theo ở Vế trái (ĐỔI LƯỢNG TỪ!):**
   $$(\forall x B) \Rightarrow A \equiv \exists x (B \Rightarrow A) \quad (\text{vì } \forall x B \Rightarrow A \equiv \neg(\forall x B) \lor A \equiv \exists x \neg B \lor A)$$
   $$(\exists x B) \Rightarrow A \equiv \forall x (B \Rightarrow A) \quad (\text{vì } \exists x B \Rightarrow A \equiv \neg(\exists x B) \lor A \equiv \forall x \neg B \lor A)$$
5. **Cạm bẫy Kéo theo ở Vế phải (GIỮ NGUYÊN LƯỢNG TỪ):**
   $$A \Rightarrow (\forall x B) \equiv \forall x (A \Rightarrow B), \qquad A \Rightarrow (\exists x B) \equiv \exists x (A \Rightarrow B)$$

---

### 4.2. Kỹ Thuật Skolem Hóa (Skolemization)
Sau khi đưa về dạng PNF, trong phần tiền tố vẫn còn cả lượng từ $\forall$ và $\exists$. Thuật toán Hợp giải đòi hỏi loại bỏ hoàn toàn $\exists$ để biến mọi biến còn lại thành biến toàn thể ngầm định ($\forall$). Kỹ thuật này do nhà toán học Thoralf Skolem phát minh năm 1920.

#### Bản chất Toán học của Skolemization:
- **Trường hợp 1: Lượng từ $\exists y$ không nằm trong phạm vi của bất kỳ $\forall$ nào:**
  - Ta thay biến $y$ bằng một **Hằng Skolem (Skolem Constant)** mới chưa từng xuất hiện trong ngôn ngữ: $c$.
  - *Ví dụ:* $\exists y \, \text{Dog}(y) \implies \text{Dog}(c)$ (với $c$ là một chú chó cụ thể nào đó).
- **Trường hợp 2: Lượng từ $\exists y$ nằm bên trong phạm vi của các lượng từ toàn thể $\forall x_1, \forall x_2, \dots, \forall x_k$:**
  - Giá trị của $y$ phụ thuộc vào việc người ta chọn $x_1, \dots, x_k$ là ai! Vì vậy, không thể thay bằng một hằng số cố định, mà phải thay $y$ bằng một **Hàm Skolem (Skolem Function)** $f(x_1, \dots, x_k)$.
  - *Ví dụ:* $\forall x \exists y \, \text{Mother}(y, x)$ ("Mọi người $x$ đều có một người mẹ $y$").  
    Ở đây mẹ của mỗi người là khác nhau, phụ thuộc vào $x$. Skolem hóa ta thay $y$ bằng hàm $m(x)$:
    $$\forall x \, \text{Mother}(m(x), x)$$

> [!WARNING]
> **ĐIỂM MẤU CHỐT SỐNG CÒN (Thầy rất hay hỏi thi):**
> **Công thức sau khi Skolem hóa KHÔNG TƯƠNG ĐƯƠNG LOGIC ($\not\equiv$) với công thức ban đầu!**
> *Tại sao?* Vì công thức mới chứa thêm ký hiệu hàm/hằng Skolem mới không hề có trong công thức gốc.
> **NHƯNG NÓ BẢO TOÀN TÍNH THỎA ĐƯỢC (Equisatisfiable):**
> $$F \text{ thỏa được} \iff F_{\text{skolem}} \text{ thỏa được}$$
> Vì các bộ chứng minh tự động dùng phương pháp phản chứng (tìm tính không thỏa được / mâu thuẫn $\square$), nên tính bảo toàn thỏa được là **hoàn toàn đủ** để chứng minh tính đúng đắn!

---

### 4.3. Dạng Chuẩn Mệnh Đề (Clausal Normal Form - CNF) trong PL1
Sau khi khử hết $\exists$, ta lược bỏ toàn bộ ký hiệu $\forall$ ở đầu câu (ngầm định mọi biến còn lại đều là biến toàn thể $\forall$). Sau đó dùng luật phân phối để đưa phần thân về dạng **Hội của các Tuyển**.
- Mỗi **Clause (Mệnh đề)** là một tuyển rời rạc của các literal: $C = L_1 \lor L_2 \lor \dots \lor L_k$.
- Cơ sở tri thức là tập hợp các mệnh đề: $KB = \{C_1, C_2, \dots, C_m\}$.
- **Mệnh đề Horn (Horn Clause):** Chứa tối đa 1 literal dương.

---

## 5. Hệ Suy Diễn Hình Thức & Các Định Lý Nền Tảng (Metalogic)

### 5.1. Khái niệm Hệ Suy Diễn (Proof Calculus)
Một hệ suy diễn hình thức $\mathcal{C}$ cung cấp các luật cơ học thao tác trên chuỗi ký tự cú pháp để từ tập giả thiết $KB$ suy ra kết luận $\varphi$, ký hiệu $KB \vdash_{\mathcal{C}} \varphi$.
- **Tính đúng đắn (Soundness):** $KB \vdash \varphi \implies KB \models \varphi$.
- **Tính đầy đủ (Completeness):** $KB \models \varphi \implies KB \vdash \varphi$.

### 5.2. Các Định Lý Đỉnh Cao của Logic Học Thế Giới (Metalogic)
1. **Định lý Đầy đủ của Gödel (Gödel's Completeness Theorem - 1930):**
   Kurt Gödel đã chứng minh được rằng First-order Predicate Logic là **ĐẦY ĐỦ (Complete)**. Tồn tại một hệ suy diễn hình thức mà mọi chân lý ngữ nghĩa ($KB \models \varphi$) đều có thể được chứng minh cú pháp ($KB \vdash \varphi$).
2. **Vấn đề Quyết định được (Decidability) - Alan Turing & Alonzo Church (1936):**
   - Logic Mệnh đề (PL0) là **Quyết định được (Decidable)**: Ta luôn có thể vẽ bảng chân trị hoặc dùng thuật toán DPLL để kết luận đúng hay sai trong thời gian hữu hạn.
   - Logic Vị từ Bậc nhất (PL1) là **NỬA-QUYẾT ĐỊNH ĐƯỢC (Semi-decidable)**:
     - Nếu câu $\varphi$ thực sự là hệ quả logic ($KB \models \varphi$), một thuật toán chứng minh đầy đủ chắc chắn sẽ tìm ra chứng minh sau một số bước hữu hạn!
     - **NHƯNG nếu câu $\varphi$ SAI (không phải hệ quả), thuật toán có thể chạy vô tận (lặp vô hạn) mà không bao giờ dừng lại!**
     - Do đó, không tồn tại bất kỳ thuật toán tổng quát nào có thể trả lời "Yes" hoặc "No" cho mọi bài toán trong PL1.

### 5.3. Cơ sở Herbrand & Sự bế tắc của các giải thuật thập niên 1950
- **Vũ trụ Herbrand $H$:** Tập mọi ground term tạo ra từ các hằng và hàm trong bài toán.
- Nếu bài toán chứa dù chỉ 1 ký hiệu hàm, Vũ trụ Herbrand sẽ vô hạn: $\{a, f(a), f(f(a)), \dots\}$.
- Các thuật toán sơ khai (như Gilmore 1960) cố gắng thay thế mù quáng các phần tử trong $H$ vào biến để đưa về PL0 rồi giải SAT. Vì không gian vô hạn, phương pháp này lập tức bị nổ tung bộ nhớ!

---

## 6. Hệ Suy Diễn Hợp Giải & Thuật Toán Hợp Nhất (Resolution & Unification)

Năm 1965, **John Alan Robinson** công bố bài báo lịch sử phát minh ra:
1. **Thuật toán Hợp nhất (Unification Algorithm):** Chỉ thay thế biến vào đúng những vị trí cần thiết để làm hai literal khớp nhau.
2. **Luật Hợp giải Tổng quát (Generalized Resolution Rule).**

---

### 6.1. Phép Thế (Substitution) & Hợp Nhất (Unification)
Một **Phép thế (Substitution)** $\sigma$ là một tập hữu hạn các cặp gán biến:
$$\sigma = \{x_1 / t_1, x_2 / t_2, \dots, x_n / t_n\}$$
nghĩa là thay thế biến $x_i$ bằng hạng thức $t_i$ ($x_i \neq t_i$, và các $x_i$ đôi một khác nhau).

- **Unifier (Phép làm khớp / Phép hợp nhất):** Cho tập các biểu thức $W = \{E_1, \dots, E_k\}$. Phép thế $\sigma$ là một *unifier* của $W$ nếu:
  $$\sigma(E_1) = \sigma(E_2) = \dots = \sigma(E_k)$$
- **Most General Unifier (MGU - Phép thế Tổng quát nhất):** Một unifier $\sigma$ là MGU nếu mọi unifier khác $\theta$ của $W$ đều có thể biểu diễn thành $\theta = \sigma \circ \lambda$ (với $\lambda$ là một phép thế nào đó). MGU là phép thế "lỏng tay nhất", áp đặt ít ràng buộc cụ thể nhất lên các biến.

---

### 6.2. Tập Bất Đồng (Disagreement Set) & Thuật Toán Hợp Nhất Robinson
1. **Tập bất đồng (Disagreement Set $D$):** Quét từ trái sang phải qua tất cả các biểu thức trong tập $W$, dừng lại ở ký tự đầu tiên mà tại đó các biểu thức không trùng nhau. Trích xuất các biểu thức con bắt đầu từ vị trí đó. Tập các biểu thức con này là $D$.
2. **Các bước của Thuật toán Unification:**
   - **Bước 0:** Khởi tạo $k = 0, W_0 = W, \sigma_0 = \epsilon$ (phép thế rỗng).
   - **Bước 1:** Nếu $W_k$ chỉ gồm một biểu thức duy nhất $\implies$ **DỪNG, $\sigma_k$ chính là MGU!**
   - **Bước 2:** Tìm tập bất đồng $D_k$ của $W_k$.
   - **Bước 3:** Kiểm tra xem trong $D_k$ có tồn tại một biến $v$ và một term $t$ sao cho **$v$ không xuất hiện trong $t$ (Occurs Check)** hay không:
     - Nếu có: Đặt $\sigma_{k+1} = \sigma_k \circ \{v / t\}$, $W_{k+1} = \{v / t\}(W_k)$, tăng $k = k+1$ và quay lại Bước 1.
     - Nếu không thể (ví dụ cả hai đều là hằng khác nhau $a$ và $b$, hoặc hai hàm khác nhau $f$ và $g$, hoặc $v$ nằm trong $t$): **DỪNG, kết luận KHÔNG THỂ HỢP NHẤT (Not Unifiable)!**

---

### 6.3. Phép Kiểm Tra Tự Chứa (Occurs Check)
> [!CAUTION]
> **Occurs Check là gì?**
> Khi cần hợp nhất biến $x$ với một hạng thức $t$, thuật toán bắt buộc phải kiểm tra xem $x$ có nằm bên trong $t$ hay không.
> *Ví dụ:* Thử hợp nhất $x$ với $f(x)$.
> Nếu cho phép gán $x / f(x)$, ta sẽ tạo ra một cấu trúc vô hạn tuần hoàn: $x = f(f(f(\dots)))$, dẫn đến vòng lặp vô tận và sai lệch toán học!

- **Độ phức tạp tính toán:**
  - Nếu biểu diễn cây thông thường và kiểm tra occurs-check ngây thơ, độ phức tạp thời gian có thể là $\mathcal{O}(2^n)$.
  - Nếu biểu diễn biểu thức dưới dạng **Đồ thị có hướng không chu trình (DAG)** với chia sẻ con trỏ (thuật toán Martelli-Montanari), độ phức tạp đạt tuyến tính hoặc gần tuyến tính $\mathcal{O}(n \cdot \alpha(n))$.

---

### 6.4. Luật Hợp Giải Tổng Quát (Generalized Resolution Rule)
Cho hai mệnh đề $C_1$ và $C_2$. Trước khi hợp giải, ta phải **đổi tên biến độc lập (Standardizing Apart)** để $\text{Var}(C_1) \cap \text{Var}(C_2) = \emptyset$.
Giả sử:
$$C_1 = A_1 \lor \dots \lor A_m \lor P_1$$
$$C_2 = B_1 \lor \dots \lor B_n \lor \neg Q_1$$
Nếu tồn tại MGU $\sigma$ hợp nhất $P_1$ và $Q_1$ (tức $\sigma(P_1) = \sigma(Q_1)$), thì Mệnh đề Hợp giải (Resolvent) là:
$$R(C_1, C_2) = \sigma(A_1 \lor \dots \lor A_m \lor B_1 \lor \dots \lor B_n)$$

---

### 6.5. Luật Thừa Số Hóa (Factorization Rule) - Cứu Nguy Tính Đầy Đủ
> [!IMPORTANT]
> **Định nghĩa Luật Thừa Số Hóa (Factorization):**
> Cho mệnh đề $C = A_1 \lor A_2 \lor \dots \lor A_n$.
> Nếu hai literal $A_1$ và $A_2$ có thể hợp nhất với nhau qua MGU $\sigma$ (tức là $\sigma(A_1) = \sigma(A_2)$), thì ta được phép dẫn xuất ra mệnh đề rút gọn (Factor):
> $$\sigma(A_2) \lor \sigma(A_3) \lor \dots \lor \sigma(A_n)$$

#### TẠI SAO PHẢI CÓ FACTORIZATION TRONG PL1?
Trong PL0, luật hấp thụ $P \lor P \equiv P$ diễn ra tự động. Nhưng trong PL1, hai literal có thể **không giống hệt nhau về mặt ký tự cú pháp** mà chỉ giống nhau **sau khi áp dụng một phép thế**!
Nếu **KHÔNG CÓ** luật Factorization, Hệ Hợp giải trong PL1 **KHÔNG ĐẦY ĐỦ BÁC BỎ (Refutation Incomplete)**!

#### Minh chứng kinh điển: Nghịch lý Thợ cạo Russell (Russell's Paradox)
*"Có một người thợ cạo cạo đầu cho tất cả những ai không tự cạo đầu."*
$$Q \equiv \forall x \, (\text{shaves}(\text{barber}, x) \Leftrightarrow \neg \text{shaves}(x, x))$$
Đưa về dạng CNF, ta thu được 2 mệnh đề:
- $C_1: \neg \text{shaves}(\text{barber}, x) \lor \neg \text{shaves}(x, x)$
- $C_2: \text{shaves}(\text{barber}, y) \lor \text{shaves}(y, y)$

**Kịch bản 1: Nếu CHỈ dùng Luật Hợp giải đơn thuần (Không dùng Factorization):**
- Hợp nhất $\text{shaves}(\text{barber}, x)$ với $\text{shaves}(\text{barber}, y) \implies \sigma = \{x / y\}$.
- Mệnh đề sinh ra:
  $$\neg \text{shaves}(y, y) \lor \text{shaves}(y, y)$$
  Đây là một mệnh đề hằng đúng (Tautology), hoàn toàn vô dụng!
- Mọi bước hợp giải tiếp theo đều sinh ra mệnh đề 2-literal. **Không bao giờ sinh ra được Mệnh đề Rỗng $\square$!** Hệ thống bị kẹt vĩnh viễn.

**Kịch bản 2: Khi SỬ DỤNG Luật Factorization:**
- Áp dụng Factorization lên $C_1$: Hợp nhất $\text{shaves}(\text{barber}, x)$ và $\text{shaves}(x, x)$ bằng phép thế $\sigma_1 = \{x / \text{barber}\}$. Mệnh đề $C_1$ co lại thành:
  $$C_3: \neg \text{shaves}(\text{barber}, \text{barber})$$
- Áp dụng Factorization lên $C_2$: Hợp nhất $\text{shaves}(\text{barber}, y)$ và $\text{shaves}(y, y)$ bằng phép thế $\sigma_2 = \{y / \text{barber}\}$. Mệnh đề $C_2$ co lại thành:
  $$C_4: \text{shaves}(\text{barber}, \text{barber})$$
- Hợp giải trực tiếp $C_3$ và $C_4$:
  Hai mệnh đề đối ngẫu trực tiếp triệt tiêu nhau hoàn toàn $\implies$ **Dẫn xuất ra Mệnh đề Rỗng $\square$ (Contradiction)!**
👉 **Kết luận:** Chỉ khi kết hợp **Resolution + Factorization**, hệ suy diễn trong PL1 mới đạt **Tính đầy đủ bác bỏ (Refutation-completeness)**!

---

### 6.6. Các Chiến Lược Thu Hẹp Không Gian Tìm Kiếm (Search Strategies)
1. **Unit Resolution:** Luôn ưu tiên hợp giải với một **Unit Clause** (mệnh đề chỉ có duy nhất 1 literal).
2. **Set of Support (SOS) Strategy:** Chia tập mệnh đề thành $KB$ (phi mâu thuẫn) và $SOS$ (chứa phủ định truy vấn $\neg Q$ và các resolvent mới). Quy tắc: Không bao giờ hợp giải 2 mệnh đề cùng thuộc $KB$ với nhau!
3. **Pure Literal Elimination Rule:** Nếu một vị từ chỉ xuất hiện dưới dạng dương (hoặc chỉ âm) trong toàn bộ cơ sở tri thức, loại bỏ toàn bộ các mệnh đề chứa nó.
4. **Subsumption (Bao hàm):** Nếu clause $C_1$ tổng quát hơn clause $C_2$ (tồn tại $\sigma$ để $\sigma(C_1) \subseteq C_2$), ta loại bỏ $C_2$ để tiết kiệm bộ nhớ.

---

## 7. Xử Lý Quan Hệ Đẳng Thức Trong Suy Diễn Tự Động (Equality Reasoning)

Nếu xử lý dấu bằng ($=$) bằng cách thêm **Hệ Tiên Đề Đẳng Thức** (Phản xạ, Đối xứng, Bắc cầu, Thay thế) vào cơ sở tri thức, số lượng mệnh đề hợp giải sẽ bùng nổ khủng khiếp.
Các bộ chứng minh hiện đại giải quyết bằng:
1. **Kỹ thuật Viết lại hạng thức (Term Rewriting):** Định hướng các đẳng thức thành quy tắc thay thế một chiều $s \to t$ nếu $s$ phức tạp hơn $t$.
2. **Demodulation:** Dùng một đẳng thức đóng (ground unit equality) $s = t$ để đơn giản hóa các hạng thức trong các clause khác.
3. **Paramodulation:** Luật suy diễn trực tiếp cho phép thay thế hạng thức bằng hạng thức bằng nó bên trong một vị từ mà không cần thêm tiên đề bắc cầu/thay thế.
4. **Các bộ chứng minh tự động hiện đại (Automated Theorem Provers - ATPs):** Như **E Prover** (Stephan Schulz), **Vampire** (Andrei Voronkov), sử dụng kiến trúc Superposition Calculus và chuẩn đầu vào **TPTP (Thousands of Problems for Theorem Provers)**.

---

## 8. Cạm Bẫy Phòng Thi & Tự Kiểm Tra Nhanh

### Cạm bẫy dễ mất điểm:
1. **Đổi thứ tự lượng từ làm đổi hoàn toàn nghĩa câu:** $\forall x \exists y \, \text{Loves}(x, y)$ ("Mọi người đều yêu ai đó") KHÁC HOÀN TOÀN $\exists y \forall x \, \text{Loves}(x, y)$ ("Có một người được tất cả mọi người yêu").
2. **Nhầm lẫn khi Skolem hóa:** Biến $\exists$ phụ thuộc vào TẤT CẢ các biến $\forall$ đứng trước nó trong prefix. Nếu đứng trước nó không có $\forall$ nào thì mới dùng Hằng Skolem.
3. **Quên kiểm tra Occurs Check:** Khi hợp nhất $x$ với $t$, nếu $x$ xuất hiện trong $t$, phép thế thất bại ngay lập tức.
4. **Quên đổi tên biến độc lập (Standardizing Apart):** Trước khi hợp giải 2 clause, phải đổi tên biến của chúng để không trùng tên, tránh ràng buộc sai lệch.

### Tự kiểm tra nhanh:
1. **Câu hỏi:** Formalize câu: *"Không có sinh viên nào thích mọi môn học"*.
   - *Đáp án:* $\neg \exists x (\text{Student}(x) \land \forall y (\text{Course}(y) \Rightarrow \text{Likes}(x, y)))$ hoặc $\forall x (\text{Student}(x) \Rightarrow \exists y (\text{Course}(y) \land \neg \text{Likes}(x, y)))$.
2. **Câu hỏi:** Tại sao phép thế $\{x / f(x)\}$ lại thất bại trong thuật toán Unification?
   - *Đáp án:* Vi phạm Occurs Check (biến $x$ xuất hiện bên trong hạng thức $f(x)$), tạo ra cấu trúc vô hạn tuần hoàn.
3. **Câu hỏi:** Skolem hóa công thức $\forall x \exists y \forall z \exists w \, P(x, y, z, w)$ cho kết quả gì?
   - *Đáp án:* $y$ phụ thuộc $x \to f(x)$; $w$ phụ thuộc $x$ và $z \to g(x, z)$. Kết quả: $\forall x \forall z \, P(x, f(x), z, g(x, z))$.
4. **Câu hỏi:** Tại sao logic vị từ bậc nhất (PL1) chỉ là nửa-quyết định được (semi-decidable)?
   - *Đáp án:* Nếu một câu là hệ quả logic, thuật toán chứng minh đầy đủ sẽ tìm ra chứng minh trong thời gian hữu hạn. Nhưng nếu câu đó sai, thuật toán có thể chạy lặp vô hạn mà không bao giờ dừng.
