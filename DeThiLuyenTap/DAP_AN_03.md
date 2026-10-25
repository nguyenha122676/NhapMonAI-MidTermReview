# ĐÁP ÁN VÀ LỜI GIẢI CHI TIẾT CHUẨN A+ — ĐỀ 03
## Kèm Barem Điểm, Phân Tích Phương Pháp & Cạm Bẫy Phòng Thi

> **Môn học:** Nhập Môn Trí Tuệ Nhân Tạo (Introduction to Artificial Intelligence)  
> **Thời gian làm bài:** 90 phút $\bullet$ **Hình thức:** Tự luận chuẩn quốc tế  
> **Chuẩn mực:** Đáp án được trình bày chuẩn chỉ theo giáo trình *Wolfgang Ertel (2025)*, *Russell & Norvig (AIMA 2021)* và Slide bài giảng TS. Hoàng Anh Đức.

---

## Câu 1 (1.5 điểm) — Hai Trường Phái AI: Chủ Nghĩa Ký Hiệu (Symbolicism) vs Kết Nối (Connectionism)

### Question (English)
Compare Symbolicism and Connectionism as approaches to artificial intelligence.
1. Describe how each approach represents or acquires knowledge. (1.0 point)
2. Give one representative system/technique for each approach and discuss one strength and one limitation of each. (0.5 point)

### Câu hỏi (Tiếng Việt)
So sánh Symbolicism (Chủ nghĩa ký hiệu) và Connectionism (Chủ nghĩa kết nối) như hai trường phái tiếp cận trí tuệ nhân tạo.
1. Mô tả cách mỗi trường phái biểu diễn hoặc thu nhận tri thức. (1.0 điểm)
2. Nêu một hệ thống/kỹ thuật tiêu biểu cho mỗi trường phái, đồng thời phân tích một ưu điểm và một hạn chế của mỗi trường phái. (0.5 điểm)

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Cơ chế biểu diễn và thu nhận tri thức của hai trường phái:

| Tiêu chí | Trường phái Ký hiệu (Symbolicism / GOFAI) | Trường phái Kết nối (Connectionism / Neural AI) |
|:---|:---|:---|
| **Cơ sở triết học & Giả thuyết nền tảng** | **Giả thuyết hệ thống ký hiệu vật lý (Physical Symbol System Hypothesis - Newell & Simon 1976):** Mọi hành vi thông minh đều có thể được mô hình hóa bằng việc thao tác trên các ký hiệu rời rạc tường minh. | **Mô hình phỏng sinh học mạng nơ-ron (Biologically Inspired):** Trí tuệ xuất hiện từ tương tác phức tạp của hàng triệu tế bào thần kinh liên kết song song. |
| **Cách biểu diễn tri thức (Knowledge Representation)** | **Tường minh và rời rạc (Explicit & Discrete):** Tri thức được mã hóa dưới dạng các sự kiện logic, mệnh đề, vị từ bậc nhất, cây bản thể luận (Ontology) hoặc tập luật suy diễn `IF ... THEN ...`. | **Phân tán và liên tục (Distributed & Continuous):** Tri thức được nhúng (embedded) ngầm định trong ma trận trọng số (weight matrices $W$) của mạng nơ-ron nhân tạo thông qua không gian vector nhiều chiều. |
| **Cách thu nhận tri thức (Knowledge Acquisition)** | **Từ trên xuống (Top-down) & Kỹ nghệ tri thức:** Chuyên gia con người (Knowledge Engineers) trực tiếp phân tích miền bài toán và viết tay các luật logic đưa vào hệ cơ sở tri thức (Knowledge Base). | **Từ dưới lên (Bottom-up) & Học máy:** Tự động tối ưu hóa và học từ dữ liệu lớn (Big Data) thông qua giải thuật Lan truyền ngược (Backpropagation) và Hạ gradient (Gradient Descent). |

#### 2. Hệ thống tiêu biểu, ưu điểm và hạn chế:

##### A. Trường phái Ký hiệu (Symbolicism):
* **Hệ thống / Kỹ thuật tiêu biểu:** Hệ chuyên gia chẩn đoán bệnh **MYCIN**, hệ thống tri thức thông thường **Cyc**, ngôn ngữ lập trình logic **PROLOG**, hoặc máy tự động chứng minh định lý **E Prover / Vampire**.
* **Ưu điểm cốt lõi:**
  * **Tính giải thích tường minh 100% (Explainability & Interpretability):** Mỗi bước suy diễn đều đi kèm chuỗi vết logic (Proof Tree / Deduction Chain), chỉ rõ lý do vì sao đi đến kết luận.
  * **Tính vững chắc toán học (Soundness & Verifiability):** Đảm bảo suy diễn đúng đắn tuyệt đối, không bị hiện tượng ảo giác (zero hallucination).
* **Hạn chế then chốt:**
  * **Nút thắt cổ chai thu nhận tri thức (Knowledge Acquisition Bottleneck):** Quá tốn kém và khó khăn khi chuyển giao tri thức trực giác của con người thành các luật cứng nhắc.
  * **Tính giòn (Brittleness) & Bùng nổ tổ hợp:** Hệ thống dễ sụp đổ khi gặp dữ liệu nhiễu hoặc các trường hợp ngoại lệ chưa được định nghĩa trước.

##### B. Trường phái Kết nối (Connectionism):
* **Hệ thống / Kỹ thuật tiêu biểu:** Mạng nơ-ron tích chập (CNN - ResNet) trong thị giác máy tính, hoặc Mạng Transformer (GPT-4, Gemini) trong xử lý ngôn ngữ tự nhiên.
* **Ưu điểm cốt lõi:**
  * **Khả năng khái quát hóa vượt trội từ dữ liệu nhiễu (Robustness & Generalization):** Nhận dạng mẫu xuất sắc trên dữ liệu phi cấu trúc (ảnh, giọng nói, văn bản tự nhiên).
  * **Tự động trích xuất đặc trưng (End-to-end Learning):** Không đòi hỏi con người phải thiết kế thủ công các đặc trưng phức tạp.
* **Hạn chế then chốt:**
  * **Vấn đề Hộp đen (Black-box Nature):** Rất khó giải thích tường minh cơ chế ra quyết định bên trong hàng tỷ trọng số, khó kiểm định độ an toàn trong các ứng dụng sinh tử (y tế, pháp lý, lái xe tự động).
  * **Đói dữ liệu và tài nguyên tính toán:** Đòi hỏi hàng triệu mẫu dữ liệu được gán nhãn và cụm siêu máy tính GPU đắt đỏ để huấn luyện.

*(Nhận xét nâng cao: Xu thế AI hiện đại đang hội tụ về **Neuro-Symbolic AI** nhằm kết hợp năng lực học mẫu của mạng nơ-ron với tính suy luận logic chặt chẽ của hệ ký hiệu).*

---

**Rubric Chấm Điểm:**
* Nêu và so sánh đúng bản chất biểu diễn/thu nhận tri thức của hai trường phái: **1.0 điểm** (mỗi trường phái 0.5).
* Nêu tên hệ thống tiêu biểu, phân tích đúng 1 ưu điểm và 1 nhược điểm cho từng bên: **0.5 điểm** (mỗi bên 0.25).

---

## Câu 2 (1.0 điểm) — Chứng Minh Mâu Thuẫn Bằng Phân Giải Mệnh Đề (Propositional Resolution)

### Question (English)
Use resolution to show that the following propositional clause set is unsatisfiable:
$$\{P,\; \neg P \lor Q,\; \neg Q \lor \neg R \lor S,\; R,\; \neg S\}.$$
Number the clauses and show the parents of every resolvent.

### Câu hỏi (Tiếng Việt)
Dùng phép phân giải để chứng minh tập mệnh đề sau là không thỏa được (unsatisfiable):
$$\{P,\; \neg P \lor Q,\; \neg Q \lor \neg R \lor S,\; R,\; \neg S\}.$$
Đánh số các clause và chỉ rõ các clause cha của từng resolvent.

### Lời Giải Chi Tiết Chuẩn A+

#### Bước 1: Liệt kê và đánh số các mệnh đề tiên đề (Input Clauses)
Tập mệnh đề ban đầu gồm 5 mệnh đề (clauses):
1. $C_1: P$
2. $C_2: \neg P \lor Q$
3. $C_3: \neg Q \lor \neg R \lor S$
4. $C_4: R$
5. $C_5: \neg S$

#### Bước 2: Bảng phân giải từng bước dẫn tới Mệnh đề rỗng ($\Box$)

Áp dụng quy tắc phân giải: Từ hai mệnh đề $A \lor L$ và $B \lor \neg L$, triệt tiêu cặp biến ngang trái dấu $L$ và $\neg L$ để sinh ra resolvent $A \lor B$.

| Bước | Clause cha 1 | Clause cha 2 | Cặp Literal đối ngẫu | Mệnh đề mới sinh ra (Resolvent) | Ký hiệu Clause |
|:---:|:---:|:---:|:---:|:---|:---:|
| **1** | $C_1: P$ | $C_2: \neg P \lor Q$ | $P$ và $\neg P$ | $Q$ | $C_6$ |
| **2** | $C_3: \neg Q \lor \neg R \lor S$ | $C_5: \neg S$ | $S$ và $\neg S$ | $\neg Q \lor \neg R$ | $C_7$ |
| **3** | $C_6: Q$ | $C_7: \neg Q \lor \neg R$ | $Q$ và $\neg Q$ | $\neg R$ | $C_8$ |
| **4** | $C_4: R$ | $C_8: \neg R$ | $R$ và $\neg R$ | $\mathbf{\Box}$ **(Mệnh đề rỗng / $\bot$)** | $C_9$ |

#### Bước 3: Đồ thị cây phân giải (Resolution Refutation Tree)

```
        C1: P       C2: ¬P ∨ Q           C3: ¬Q ∨ ¬R ∨ S      C5: ¬S
          \           /                         \              /
            \       /                             \          /
             C6: Q                                C7: ¬Q ∨ ¬R
                \                                     /
                  \                                 /
                     -------   C8: ¬R   -------
                                 |
                                 | (với C4: R)
                                 v
                               □ (Mâu thuẫn!)
```

#### Bước 4: Kết luận
Vì suy dẫn ra được **mệnh đề rỗng $\Box$** sau 4 bước phân giải hợp lệ, tập mệnh đề ban đầu là **Không thể thỏa được (Unsatisfiable)** (Điều phải chứng minh).

---

**Rubric Chấm Điểm:**
* Đánh số thứ tự các clause tiên đề rõ ràng: **0.1 điểm**.
* Trình bày các bước phân giải chính xác (chỉ rõ 2 clause cha và literal triệt tiêu): **0.7 điểm**.
* Rút ra mệnh đề rỗng $\Box$ và khẳng định tính unsatisfiable: **0.2 điểm**.

---

## Câu 3 (1.0 điểm) — Biểu Diễn Tri Thức Trong Logic Bậc Nhất & Thứ Tự Lượng Từ

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

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Công thức hóa trong Logic vị từ bậc nhất (FOL):

* **Câu 1: "Mọi robot đều giải được ít nhất một nhiệm vụ."**
  * Với mọi đối tượng $x$, nếu $x$ là một robot thì phải tồn tại một đối tượng $y$ sao cho $y$ là nhiệm vụ và $x$ giải được $y$.
  $$\mathbf{\Phi_1: \quad \forall x \, \big( \text{Robot}(x) \implies \exists y \, (\text{Task}(y) \land \text{Solves}(x, y)) \big)}$$

* **Câu 2: "Tồn tại một nhiệm vụ mà mọi robot đều giải được."**
  * Tồn tại một đối tượng $y$ sao cho $y$ là nhiệm vụ, và với mọi đối tượng $x$, hễ $x$ là robot thì $x$ đều giải được nhiệm vụ $y$ này.
  $$\mathbf{\Phi_2: \quad \exists y \, \big( \text{Task}(y) \land \forall x \, (\text{Robot}(x) \implies \text{Solves}(x, y)) \big)}$$

*(Cạm bẫy phòng thi: Trong câu 1, mệnh đề sau $\forall x$ phải dùng phép kéo theo $\implies$; bên trong $\exists y$ phải dùng phép hội $\land$. Dùng sai liên từ logic sẽ bị trừ điểm).*

#### 2. Phân tích ngữ nghĩa chuyên sâu qua Thứ tự lượng từ:

* **Bản chất của thứ tự $\forall x \exists y$ (trong Câu 1):**
  * Lượng từ tồn tại $\exists y$ nằm **bên trong phạm vi tác động (scope)** của lượng từ phổ dụng $\forall x$.
  * Điều này có nghĩa là nhiệm vụ $y$ có thể **phụ thuộc trực tiếp vào từng robot $x$ cụ thể**.
  * Dưới góc độ Skolem hóa: $y = f(x)$ là một hàm phụ thuộc vào $x$.
  * *Ý nghĩa thực tế:* Robot A có thể chỉ biết quét nhà ($y_1$), Robot B có thể chỉ biết nấu cơm ($y_2$), Robot C chỉ biết rửa bát ($y_3$). Cả ba robot đều thỏa mãn câu 1 dù không có nhiệm vụ chung nào giữa chúng.

* **Bản chất của thứ tự $\exists y \forall x$ (trong Câu 2):**
  * Lượng từ tồn tại $\exists y$ đứng **trước và bao trùm** toàn bộ câu.
  * Điều này khẳng định sự tồn tại của **một nhiệm vụ duy nhất mang tính toàn cầu (global/universal task)** mà *tất cả* mọi robot không phân biệt chủng loại đều phải giải được.
  * Dưới góc độ Skolem hóa: $y = c$ là một hằng số cố định (Skolem constant).
  * *Ý nghĩa thực tế:* Tồn tại một nhiệm vụ cơ bản chung cho toàn bộ cộng đồng robot (ví dụ: "Tự cắm sạc khi hết pin"), và bất kỳ robot nào được đưa vào hệ thống cũng bắt buộc phải giải được nhiệm vụ này.

* **Mối quan hệ kéo theo một chiều:**
  $$\Phi_2 \models \Phi_1 \quad \text{nhưng} \quad \Phi_1 \not\models \Phi_2$$
  Nếu tồn tại một nhiệm vụ chung mà mọi robot đều giải được thì hiển nhiên mỗi robot đều giải được ít nhất một nhiệm vụ. Tuy nhiên, chiều ngược lại không đúng!

---

**Rubric Chấm Điểm:**
* Viết đúng chuẩn công thức logic cho Câu 1: **0.35 điểm**.
* Viết đúng chuẩn công thức logic cho Câu 2: **0.35 điểm**.
* Giải thích chính xác sự phụ thuộc biến ($y = f(x)$ vs $y = c$) và liên hệ ngữ nghĩa thực tế: **0.3 điểm**.

---

## Câu 4 (1.0 điểm) — Nghịch Lý Chim Cánh Cụt Bay (Tweety Problem) & Logic Phi Đơn Điệu

### Question (English)
Explain the Flying Penguin (Tweety) problem. Why does the rule `Bird(x) ⇒ Flies(x)` conflict with the exception that penguins do not fly? What limitation of classical logic does this reveal, and what kind of reasoning is needed for everyday defaults?

### Câu hỏi (Tiếng Việt)
Giải thích bài toán Flying Penguin (Tweety). Vì sao luật `Bird(x) ⇒ Flies(x)` xung đột với ngoại lệ rằng chim cánh cụt không bay? Điều này cho thấy hạn chế nào của logic cổ điển, và cần kiểu suy luận nào để xử lý các mặc định trong đời thường?

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Mô tả bài toán Flying Penguin (Tweety) và Xung đột Logic:
* Xét cơ sở tri thức thông thường về thế giới loài chim:
  1. Luật mặc định thông thường: "Mọi loài chim đều bay được" $\implies \forall x \, (\text{Bird}(x) \implies \text{Flies}(x))$.
  2. Phân loại sinh học: "Chim cánh cụt là một loài chim" $\implies \forall x \, (\text{Penguin}(x) \implies \text{Bird}(x))$.
  3. Đặc tính ngoại lệ: "Chim cánh cụt không biết bay" $\implies \forall x \, (\text{Penguin}(x) \implies \neg\text{Flies}(x))$.
  4. Sự kiện cụ thể: "Tweety là một chú chim cánh cụt" $\implies \text{Penguin}(\text{Tweety})$.
* **Sự sụp đổ logic khi thực hiện suy diễn:**
  * Từ $\text{Penguin}(\text{Tweety})$ và luật (2) $\implies \text{Bird}(\text{Tweety})$.
  * Từ $\text{Bird}(\text{Tweety})$ và luật (1) $\implies \mathbf{\text{Flies}(\text{Tweety})}$.
  * Mặt khác, từ $\text{Penguin}(\text{Tweety})$ và luật (3) $\implies \mathbf{\neg\text{Flies}(\text{Tweety})}$.
  * Ta suy ra đồng thời cả hai kết luận trái ngược: $\text{Flies}(\text{Tweety}) \land \neg\text{Flies}(\text{Tweety}) \equiv \mathbf{\bot \text{ (Mâu thuẫn)}}$.

#### 2. Hạn chế cốt tử của Logic cổ điển được bộc lộ:
1. **Tính đơn điệu (Monotonicity of Classical Logic):**
   * Trong logic toán học cổ điển, nếu tập giả thiết $KB$ suy ra được kết luận $\alpha$ ($KB \models \alpha$), thì khi bổ sung thêm bất kỳ sự kiện mới $\beta$ nào vào $KB$, kết luận $\alpha$ **vẫn vĩnh viễn đúng**:
     $$KB \models \alpha \implies KB \cup \{\beta\} \models \alpha$$
   * Logic cổ điển hoàn toàn không có cơ chế **rút lại (retract) một niềm tin/kết luận đã rút ra** khi nhận thêm thông tin về ngoại lệ.
2. **Nguyên lý nổ tung (Principle of Explosion / Ex Falso Quodlibet):**
   * Một khi mâu thuẫn $\bot$ xuất hiện trong cơ sở tri thức cổ điển, hệ thống sẽ chứng minh được *mọi* phát biểu ngẫu nhiên đều là đúng ($KB \models \text{Trăng làm bằng phô mai}$). Hệ thống suy diễn hoàn toàn tê liệt.

#### 3. Phương thức giải quyết trong AI: Suy luận phi đơn điệu (Non-Monotonic Reasoning):
* Để mô phỏng trí tuệ con người trong đời sống thực, AI cần sử dụng **Suy luận mặc định / Phi đơn điệu (Default / Non-Monotonic Reasoning)**:
  * Cho phép đưa ra các kết luận tạm thời dựa trên các quy tắc thông thường khi thiếu thông tin (Jump to plausible conclusions).
  * Khi phát hiện thông tin ngoại lệ cụ thể, hệ thống tự động vô hiệu hóa quy tắc chung và rút lại kết luận cũ mà không gây mâu thuẫn.
* **Các cơ chế AI triển khai:**
  * *Default Logic của Ray Reiter (1980):* Sử dụng quy tắc mặc định dạng $\frac{\text{Bird}(x) : \text{Flies}(x)}{\text{Flies}(x)}$ (Nếu $x$ là chim và giả thiết $x$ bay được không mâu thuẫn với KB, thì kết luận $x$ bay).
  * *Nguyên lý phủ định như thất bại (Negation as Failure - NAF / `\+`) trong PROLOG:* Nếu không thể chứng minh đối tượng là ngoại lệ, tạm thời coi như không phải ngoại lệ.
  * *Mạng niềm tin Bayes (Bayesian Networks):* Gán xác suất có điều kiện $P(\text{Flies} \mid \text{Bird}) = 0.95$, nhưng $P(\text{Flies} \mid \text{Bird}, \text{Penguin}) = 0.001$.

---

**Rubric Chấm Điểm:**
* Trình bày rõ nguồn gốc mâu thuẫn logic giữa luật chung và ngoại lệ cụ thể: **0.3 điểm**.
* Định nghĩa và phân tích sâu sắc tính Đơn điệu (Monotonicity) cùng nguyên lý nổ tung của logic cổ điển: **0.4 điểm**.
* Nêu đúng giải pháp Suy luận phi đơn điệu (Non-monotonic / Default logic / NAF): **0.3 điểm**.

---

## Câu 5 (1.5 điểm) — Cây Tìm Kiếm SLD Đầy Đủ Trong PROLOG

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

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Ký hiệu các sự kiện trong Cơ sở tri thức:
* Fact 1: `edge(a, b).`
* Fact 2: `edge(a, c).`
* Fact 3: `edge(b, d).`
* Fact 4: `edge(c, d).`

#### 2. Cây tìm kiếm SLD hoàn chỉnh (Complete SLD Search Tree):

Truy vấn gốc tại đỉnh cây:
$$\mathbf{G_0: \quad ?- \; \text{edge}(X, Y), \; \text{edge}(Y, Z).}$$

Prolog luôn chọn mục tiêu con ngoài cùng bên trái `edge(X, Y)` để giải quyết trước:

```
                           ?- edge(X, Y), edge(Y, Z).
         /                     |                     \                     \
     (Fact 1)               (Fact 2)               (Fact 3)               (Fact 4)
  {X=a, Y=b}             {X=a, Y=c}             {X=b, Y=d}             {X=c, Y=d}
      |                      |                      |                      |
?- edge(b, Z).         ?- edge(c, Z).         ?- edge(d, Z).         ?- edge(d, Z).
   |                      |                      |                      |
   +-- Fact 1: Fail       +-- Fact 1: Fail       +-- Fact 1..4: Fail    +-- Fact 1..4: Fail
   +-- Fact 2: Fail       +-- Fact 2: Fail           (Không có cạnh          (Không có cạnh
   +-- Fact 3: {Z=d}      +-- Fact 3: Fail            nào xuất phát           nào xuất phát
   |   --> THÀNH CÔNG!    +-- Fact 4: {Z=d}           từ đỉnh d)              từ đỉnh d)
   +-- Fact 4: Fail           --> THÀNH CÔNG!
```

#### 3. Mô tả chi tiết từng nhánh duyệt theo chiến lược DFS:

1. **Nhánh 1: Thử `edge(X, Y)` khớp với Fact 1 `edge(a, b)`**
   * Phép thế cục bộ: $\theta_1 = \{X \mapsto a,\, Y \mapsto b\}$.
   * Mục tiêu con còn lại: `?- edge(b, Z).`
   * Prolog tìm kiếm trong KB để giải `edge(b, Z)`:
     * So với Fact 1 `edge(a, b)`: Thất bại ($b \neq a$).
     * So với Fact 2 `edge(a, c)`: Thất bại ($b \neq a$).
     * So với Fact 3 `edge(b, d)`: **Thành công!** Hợp nhất với phép thế $\{Z \mapsto d\}$. Mục tiêu con trở thành rỗng $\Box$.
     * **XUẤT NGHIỆM 1:** $\mathbf{X = a,\; Y = b,\; Z = d}$.
     * So với Fact 4 `edge(c, d)`: Thất bại ($b \neq c$).
   * Nhánh 1 kết thúc, Prolog quay lui (*Backtrack*) về đỉnh $G_0$.

2. **Nhánh 2: Thử `edge(X, Y)` khớp với Fact 2 `edge(a, c)`**
   * Phép thế cục bộ: $\theta_2 = \{X \mapsto a,\, Y \mapsto c\}$.
   * Mục tiêu con còn lại: `?- edge(c, Z).`
   * Prolog tìm kiếm trong KB để giải `edge(c, Z)`:
     * So với Fact 1 `edge(a, b)`: Thất bại ($c \neq a$).
     * So với Fact 2 `edge(a, c)`: Thất bại ($c \neq a$).
     * So với Fact 3 `edge(b, d)`: Thất bại ($c \neq b$).
     * So với Fact 4 `edge(c, d)`: **Thành công!** Hợp nhất với phép thế $\{Z \mapsto d\}$. Mục tiêu con rỗng $\Box$.
     * **XUẤT NGHIỆM 2:** $\mathbf{X = a,\; Y = c,\; Z = d}$.
   * Nhánh 2 kết thúc, Prolog quay lui về đỉnh $G_0$.

3. **Nhánh 3: Thử `edge(X, Y)` khớp với Fact 3 `edge(b, d)`**
   * Phép thế cục bộ: $\theta_3 = \{X \mapsto b,\, Y \mapsto d\}$.
   * Mục tiêu con còn lại: `?- edge(d, Z).`
   * Quét toàn bộ Fact 1 đến Fact 4: Không có bất kỳ cạnh nào có đỉnh đầu là $d$.
   * Nhánh này **Thất bại hoàn toàn (Fail)**. Prolog quay lui.

4. **Nhánh 4: Thử `edge(X, Y)` khớp với Fact 4 `edge(c, d)`**
   * Phép thế cục bộ: $\theta_4 = \{X \mapsto c,\, Y \mapsto d\}$.
   * Mục tiêu con còn lại: `?- edge(d, Z).`
   * Tương tự nhánh 3, không có cạnh nào xuất phát từ $d$.
   * Nhánh này **Thất bại hoàn toàn (Fail)**.

#### 4. Danh sách các đáp án trả về theo đúng thứ tự thời gian:

1. **Đáp án 1:** `X = a, Y = b, Z = d`
2. **Đáp án 2:** `X = a, Y = c, Z = d`
Sau đó hệ thống thông báo `false.` (kết thúc tìm kiếm).

---

**Rubric Chấm Điểm:**
* Vẽ đúng cấu trúc cây phân nhánh cấp 1 khớp với 4 facts: **0.4 điểm**.
* Trình bày đầy đủ phép thế, mục tiêu con và đánh dấu rõ ràng trạng thái Thành công / Thất bại trên các lá: **0.7 điểm**.
* Liệt kê đúng 2 bộ nghiệm theo chuẩn thứ tự Prolog: **0.4 điểm**.

---

## Câu 6 (2.0 điểm) — Thuật Toán Tìm Kiếm Đồ Thị $A^*$ Trên Trò Chơi 8-Puzzle

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
Use the sum of Manhattan distances, excluding the blank. Generate moves in the order `Up, Right, Down, Left`; break remaining ties by insertion order. Ignore a repeated state reached with a worse or equal `g`. Show expanded states with `g,h,f`, the Open list after each expansion, the optimal move sequence, and total cost.

### Câu hỏi (Tiếng Việt)
Dùng tìm kiếm đồ thị $A^*$ cho bài toán 8-puzzle.
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
Dùng tổng khoảng cách Manhattan, không tính ô trống. Sinh nước đi theo thứ tự `Up, Right, Down, Left`; nếu vẫn hòa thì ưu tiên theo thứ tự được đưa vào danh sách. Bỏ qua trạng thái lặp đạt được với $g$ lớn hơn hoặc bằng. Trình bày các trạng thái được mở rộng cùng $g,h,f$, danh sách Open sau mỗi bước, chuỗi nước đi tối ưu và tổng chi phí.

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Thiết lập hàm Heuristic khoảng cách Manhattan $h(n)$:
* Tọa độ mục tiêu của các ô số trong ma trận đích $3 \times 3$ (chỉ số dòng $r \in \{1,2,3\}$, cột $c \in \{1,2,3\}$):
  * Ô 1: $(1, 1)$, Ô 2: $(1, 2)$, Ô 3: $(1, 3)$
  * Ô 4: $(2, 1)$, Ô 5: $(2, 2)$, Ô 6: $(2, 3)$
  * Ô 7: $(3, 1)$, Ô 8: $(3, 2)$
* Khoảng cách Manhattan của một ô số $i$ từ vị trí hiện tại $(r_i, c_i)$ tới vị trí đích $(r_i^*, c_i^*)$ là:
  $$d_M(i) = |r_i - r_i^*| + |c_i - c_i^*|$$
* Hàm đánh giá của thuật toán $A^*$:
  $$f(n) = g(n) + h(n)$$
  trong đó $g(n)$ là số bước di chuyển từ trạng thái xuất phát, $h(n) = \sum_{i=1}^8 d_M(i)$ (không tính ô trống).

#### 2. Tính toán $h$ cho trạng thái xuất phát $S_0$:
* Ô 1 tại $(1,1) \to$ đích $(1,1) \implies d_M = 0$
* Ô 2 tại $(1,2) \to$ đích $(1,2) \implies d_M = 0$
* Ô 3 tại $(1,3) \to$ đích $(1,3) \implies d_M = 0$
* Ô 4 tại $(2,2) \to$ đích $(2,1) \implies d_M = |2-2| + |2-1| = 1$
* Ô 5 tại $(3,2) \to$ đích $(2,2) \implies d_M = |3-2| + |2-2| = 1$
* Ô 6 tại $(2,3) \to$ đích $(2,3) \implies d_M = 0$
* Ô 7 tại $(3,1) \to$ đích $(3,1) \implies d_M = 0$
* Ô 8 tại $(3,3) \to$ đích $(3,2) \implies d_M = |3-3| + |3-2| = 1$
$$\implies h(S_0) = 0 + 0 + 0 + 1 + 1 + 0 + 0 + 1 = \mathbf{3}$$
Do đó $g(S_0) = 0, h(S_0) = 3 \implies f(S_0) = 3$.

#### 3. Bảng diễn tiến thuật toán $A^*$ Graph Search qua từng bước:

| Bước | Lấy từ Open (Pop) | Trạng thái ma trận | $g$ | $h$ | $f$ | Các trạng thái con sinh ra (thứ tự: Up, Right, Down, Left) | Danh sách Open sau khi cập nhật |
|:---:|:---|:---|:---:|:---:|:---:|:---|:---|
| **0** | *(Khởi tạo)* | Ô trống tại $(2,1)$ | - | - | - | Đưa $S_0$ vào Open | $[\, S_0(0,3,3) \,]$ |
| **1** | **$S_0$** | `1 2 3`<br>`_ 4 6`<br>`7 5 8` | 0 | 3 | 3 | • **Up** (đẩy 1 xuống): $S_1$ = `_ 2 3 / 1 4 6 / 7 5 8` $\implies g=1, h=4, f=5$<br>• **Right** (đẩy 4 sang trái): $S_2$ = `1 2 3 / 4 _ 6 / 7 5 8` $\implies g=1, h=2, f=3$<br>• **Down** (đẩy 7 lên): $S_3$ = `1 2 3 / 7 4 6 / _ 5 8` $\implies g=1, h=4, f=5$<br>• **Left**: Không hợp lệ (ô trống ở mép trái) | $[\, \mathbf{S_2(1,2,3)},\, S_1(1,4,5),\, S_3(1,4,5) \,]$ |
| **2** | **$S_2$** | `1 2 3`<br>`4 _ 6`<br>`7 5 8` | 1 | 2 | 3 | • **Up** (đẩy 2 xuống): $S_4$ = `1 _ 3 / 4 2 6 / 7 5 8` $\implies g=2, h=3, f=5$<br>• **Right** (đẩy 6 sang trái): $S_5$ = `1 2 3 / 4 6 _ / 7 5 8` $\implies g=2, h=3, f=5$<br>• **Down** (đẩy 5 lên): $S_6$ = `1 2 3 / 4 5 6 / 7 _ 8` $\implies g=2, h=1, f=3$<br>• **Left** (đẩy 4 sang phải): Trùng lại trạng thái $S_0$ với $g=2 \ge 0 \implies$ **Bỏ qua** | $[\, \mathbf{S_6(2,1,3)},\, S_1(1,4,5),\, S_3(1,4,5),\, S_4(2,3,5),\, S_5(2,3,5) \,]$ |
| **3** | **$S_6$** | `1 2 3`<br>`4 5 6`<br>`7 _ 8` | 2 | 1 | 3 | • **Up** (đẩy 5 xuống): Trùng $S_2$ với $g=3 \ge 1 \implies$ **Bỏ qua**<br>• **Right** (đẩy 8 sang trái): $S_7$ = `1 2 3 / 4 5 6 / 7 8 _` $\implies g=3, h=0, f=3$ **(Trạng thái Đích!)**<br>• **Down**: Không hợp lệ (mép dưới)<br>• **Left** (đẩy 7 sang phải): $S_8$ = `1 2 3 / 4 5 6 / _ 7 8` $\implies g=3, h=2, f=5$ | $[\, \mathbf{S_7(3,0,3)},\, S_1(1,4,5),\, S_3(1,4,5),\, S_4(2,3,5),\, S_5(2,3,5),\, S_8(3,2,5) \,]$ |
| **4** | **$S_7$** | `1 2 3`<br>`4 5 6`<br>`7 8 _` | 3 | 0 | 3 | **Đạt mục tiêu (Goal State)!** Thuật toán $A^*$ kết thúc thành công. | *Dừng tìm kiếm* |

#### 4. Kết luận chuỗi đường đi và chi phí:
* **Chuỗi chuyển động của ô trống:**
  $$\text{Start} \xrightarrow{\mathbf{Right}} S_2 \xrightarrow{\mathbf{Down}} S_6 \xrightarrow{\mathbf{Right}} \text{Goal}$$
* **Chuỗi tác động lên các quân cờ tương ứng:**
  * Bước 1: Đẩy quân cờ số 4 sang bên trái.
  * Bước 2: Đẩy quân cờ số 5 lên trên.
  * Bước 3: Đẩy quân cờ số 8 sang bên trái.
* **Tổng chi phí tối ưu (Optimal Cost):**
  $$g^* = \mathbf{3} \text{ bước di chuyển}$$

---

**Rubric Chấm Điểm:**
* Tính đúng $h$ cho các trạng thái theo khoảng cách Manhattan: **0.6 điểm**.
* Lập bảng tường minh quá trình Pop, mở rộng theo đúng quy tắc ưu tiên và cập nhật Open/Closed: **0.8 điểm**.
* Nêu đúng chuỗi nước đi tối ưu (`Right` $\to$ `Down` $\to$ `Right`) và tổng chi phí $g=3$: **0.6 điểm**.

---

## Câu 7 (2.0 điểm) — Nguyên Lý Entropy Cực Đại (Maximum Entropy Principle)

### Question (English)
Let $A$ and $B$ be binary events. The only known constraints are $P(A)=0.4$ and $P(B)=0.3$.
1. Define the four atomic probabilities and formulate the Maximum Entropy problem. (0.6 point)
2. Derive the MaxEnt joint distribution and verify normalization and both marginals. Use Lagrange multipliers or an entropy inequality, and justify why your candidate maximizes entropy. (1.4 points)

### Câu hỏi (Tiếng Việt)
Cho $A$ và $B$ là hai biến cố nhị phân. Các ràng buộc duy nhất đã biết là $P(A)=0.4$ và $P(B)=0.3$.
1. Định nghĩa bốn xác suất nguyên tử và thiết lập bài toán Entropy Cực đại (Maximum Entropy). (0.6 điểm)
2. Suy ra phân phối đồng thời MaxEnt và kiểm tra điều kiện chuẩn hóa cùng hai phân phối biên. Dùng nhân tử Lagrange hoặc một bất đẳng thức entropy, đồng thời giải thích vì sao nghiệm đề xuất làm entropy đạt cực đại. (1.4 điểm)

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Định nghĩa 4 xác suất nguyên tử và Thiết lập bài toán tối ưu:
Không gian mẫu gồm 4 biến cố cơ bản (nguyên tử) tương ứng với bảng phân phối đồng thời của hai biến ngẫu nhiên nhị phân $A, B \in \{0, 1\}$:
* $p_1 = P(A \land B)$
* $p_2 = P(A \land \neg B)$
* $p_3 = P(\neg A \land B)$
* $p_4 = P(\neg A \land \neg B)$

**Các ràng buộc đã biết (Constraints):**
1. Ràng buộc xác suất biên của $A$:
   $$P(A) = p_1 + p_2 = 0.4 \implies P(\neg A) = p_3 + p_4 = 0.6$$
2. Ràng buộc xác suất biên của $B$:
   $$P(B) = p_1 + p_3 = 0.3 \implies P(\neg B) = p_2 + p_4 = 0.7$$
3. Điều kiện chuẩn hóa xác suất:
   $$\sum_{i=1}^4 p_i = p_1 + p_2 + p_3 + p_4 = 1.0$$
4. Điều kiện không âm: $p_i \ge 0, \; \forall i \in \{1, 2, 3, 4\}$.

**Hàm mục tiêu theo Nguyên lý Entropy cực đại (Jaynes / Shannon):**
Tìm vector phân phối xác suất $\mathbf{p} = (p_1, p_2, p_3, p_4)$ nhằm tối đa hóa hàm Entropy thông tin:
$$\max_{\mathbf{p}} \; H(A, B) = -\sum_{i=1}^4 p_i \ln p_i$$
thỏa mãn đồng thời các ràng buộc trên.

#### 2. Suy dẫn phân phối đồng thời MaxEnt:

Ta có thể giải bài toán bằng hai phương pháp toán học chuẩn chỉ:

##### Cách 1: Sử dụng Bất đẳng thức Thông tin tương hỗ (Information Theoretic Inequality — Ngắn gọn & Sâu sắc)
* Theo định lý cơ bản của Lý thuyết thông tin, Entropy đồng thời của hai biến ngẫu nhiên $A$ và $B$ liên hệ với các Entropy biên thông qua **Thông tin tương hỗ (Mutual Information $I(A; B)$)**:
  $$H(A, B) = H(A) + H(B) - I(A; B)$$
* Vì phân phối biên của $A$ và $B$ đã bị cố định bởi các ràng buộc $P(A) = 0.4$ và $P(B) = 0.3$, nên các entropy biên là những **hằng số cố định**:
  $$H(A) = - (0.4 \ln 0.4 + 0.6 \ln 0.6)$$
  $$H(B) = - (0.3 \ln 0.3 + 0.7 \ln 0.7)$$
* Do độ đo thông tin tương hỗ luôn không âm với mọi phân phối xác suất:
  $$I(A; B) \ge 0$$
* Do đó ta luôn có bất đẳng thức:
  $$H(A, B) \le H(A) + H(B)$$
* Dấu bằng xảy ra (tức là $H(A, B)$ đạt giá trị cực đại toàn cục) **khi và chỉ khi**:
  $$I(A; B) = 0 \iff A \text{ và } B \text{ độc lập thống kê với nhau!}$$
* Điều này hoàn toàn trùng khớp với bản chất triết học của Nguyên lý MaxEnt: *"Không đưa thêm bất kỳ giả định hay mối tương quan nào ngoài những thông tin ràng buộc đã biết."*

##### Cách 2: Phương pháp Nhân tử Lagrange (Lagrange Multipliers)
Hàm Lagrange mở rộng:
$$\mathcal{L}(p_1, p_2, p_3, p_4, \lambda_0, \lambda_1, \lambda_2) = -\sum_{i=1}^4 p_i \ln p_i - \lambda_0 \left(\sum_{i=1}^4 p_i - 1\right) - \lambda_1 (p_1 + p_2 - 0.4) - \lambda_2 (p_1 + p_3 - 0.3)$$
Lấy đạo hàm riêng theo từng $p_i$ và cho triệt tiêu bằng 0:
* $\frac{\partial \mathcal{L}}{\partial p_1} = -\ln p_1 - 1 - \lambda_0 - \lambda_1 - \lambda_2 = 0 \implies p_1 = e^{-(1 + \lambda_0 + \lambda_1 + \lambda_2)}$
* $\frac{\partial \mathcal{L}}{\partial p_2} = -\ln p_2 - 1 - \lambda_0 - \lambda_1 = 0 \implies p_2 = e^{-(1 + \lambda_0 + \lambda_1)}$
* $\frac{\partial \mathcal{L}}{\partial p_3} = -\ln p_3 - 1 - \lambda_0 - \lambda_2 = 0 \implies p_3 = e^{-(1 + \lambda_0 + \lambda_2)}$
* $\frac{\partial \mathcal{L}}{\partial p_4} = -\ln p_4 - 1 - \lambda_0 = 0 \implies p_4 = e^{-(1 + \lambda_0)}$

Nhận xét hệ thức liên hệ trực tiếp giữa 4 biến:
$$p_1 \cdot p_4 = e^{-(1+\lambda_0+\lambda_1+\lambda_2)} \cdot e^{-(1+\lambda_0)} = e^{-(2+2\lambda_0+\lambda_1+\lambda_2)}$$
$$p_2 \cdot p_3 = e^{-(1+\lambda_0+\lambda_1)} \cdot e^{-(1+\lambda_0+\lambda_2)} = e^{-(2+2\lambda_0+\lambda_1+\lambda_2)}$$
$$\implies \mathbf{p_1 \cdot p_4 = p_2 \cdot p_3}$$
Hệ thức $p_1 p_4 = p_2 p_3$ chính là điều kiện tương đương đại số cần và đủ để hai biến cố $A$ và $B$ độc lập!

#### 3. Tính toán giá trị bằng số cụ thể:
Vì $A \perp B$, xác suất của mỗi biến cố nguyên tử bằng tích các xác suất biên tương ứng:
* $p_1 = P(A \land B) = P(A) \cdot P(B) = 0.4 \times 0.3 = \mathbf{0.12}$
* $p_2 = P(A \land \neg B) = P(A) \cdot P(\neg B) = 0.4 \times (1 - 0.3) = 0.4 \times 0.7 = \mathbf{0.28}$
* $p_3 = P(\neg A \land B) = P(\neg A) \cdot P(B) = (1 - 0.4) \times 0.3 = 0.6 \times 0.3 = \mathbf{0.18}$
* $p_4 = P(\neg A \land \neg B) = P(\neg A) \cdot P(\neg B) = 0.6 \times 0.7 = \mathbf{0.42}$

#### 4. Kiểm tra lại toàn diện (Verification):
1. **Kiểm tra điều kiện chuẩn hóa:**
   $$\sum_{i=1}^4 p_i = 0.12 + 0.28 + 0.18 + 0.42 = 1.00 \quad \text{(Thỏa mãn!)}$$
2. **Kiểm tra phân phối biên của $A$:**
   $$P(A) = p_1 + p_2 = 0.12 + 0.28 = 0.40 \quad \text{(Thỏa mãn!)}$$
3. **Kiểm tra phân phối biên của $B$:**
   $$P(B) = p_1 + p_3 = 0.12 + 0.18 = 0.30 \quad \text{(Thỏa mãn!)}$$
4. **Kiểm tra tính độc lập:**
   $$p_1 p_4 = 0.12 \times 0.42 = 0.0504$$
   $$p_2 p_3 = 0.28 \times 0.18 = 0.0504$$
   Hai tích bằng nhau tuyệt đối. Nghiệm phân phối MaxEnt duy nhất là $\mathbf{p = (0.12, 0.28, 0.18, 0.42)}$.

---

**Rubric Chấm Điểm:**
* Định nghĩa đúng 4 xác suất nguyên tử và thiết lập hàm mục tiêu cùng các ràng buộc: **0.6 điểm**.
* Chứng minh chặt chẽ tính chất độc lập dẫn tới cực đại Entropy (qua $I(A;B)=0$ hoặc Lagrange $p_1p_4=p_2p_3$): **0.8 điểm**.
* Tính đúng 4 giá trị số ($0.12, 0.28, 0.18, 0.42$) và kiểm tra đầy đủ điều kiện biên: **0.6 điểm**.

---

## BẢNG TỔNG KẾT ĐIỂM TOÀN BÀI — ĐỀ 03

| Câu hỏi | Chủ đề kiến thức | Điểm tối đa | Chuẩn đầu ra (Target Competency) |
|:---:|:---|:---:|:---|
| **Câu 1** | Chương 1: Symbolicism vs Connectionism | **1.5** | Hiểu sâu 2 trường phái lớn, bản chất biểu diễn tường minh vs phân tán |
| **Câu 2** | Chương 2: Phân giải mệnh đề chứng minh mâu thuẫn | **1.0** | Thực hiện phân giải 4 bước triệt tiêu literal sinh mệnh đề rỗng $\Box$ |
| **Câu 3** | Chương 3: Lượng từ trong FOL ($\forall \exists$ vs $\exists \forall$) | **1.0** | Biểu diễn chính xác FOL và phân tích Skolem dependency $y=f(x)$ vs $y=c$ |
| **Câu 4** | Chương 4: Nghịch lý Tweety & Logic phi đơn điệu | **1.0** | Nắm vững hạn chế Monotonicity, Principle of Explosion và giải pháp NAF/Default |
| **Câu 5** | Chương 5: Cây tìm kiếm SLD trong Prolog | **1.5** | Lập vết cây tìm kiếm đầy đủ, theo dõi phép thế và thứ tự nghiệm |
| **Câu 6** | Chương 6: Thuật toán $A^*$ trên 8-Puzzle | **2.0** | Tính Manhattan heuristic, bảng Open/Closed, tìm đường đi tối ưu $g^*=3$ |
| **Câu 7** | Chương 7: Nguyên lý Entropy cực đại (MaxEnt) | **2.0** | Thiết lập bài toán tối ưu, giải bằng Mutual Information/Lagrange |
| **TỔNG** | **Toàn bộ 7 Chương học phần AI** | **10.0** | **Đạt chuẩn điểm 10/10 (Xuất sắc - Chuẩn chỉ)** |

## Tổng điểm

**Tổng: 10/10**

