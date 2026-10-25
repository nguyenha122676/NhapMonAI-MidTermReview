# Chapter 2 – Khái Niệm Bắt Buộc Học Thuộc & Từ Điển Song Ngữ
## Cẩm Nang Ghi Nhớ Nhanh Đạt Điểm A+ (Flashcards & Lexicon)

> **Môn học:** Nhập môn Trí tuệ Nhân tạo (Introduction to Artificial Intelligence - MAT1206E / MAT3508)  
> **Nguồn chuẩn hóa:** Slide bài giảng TS. Hoàng Anh Đức, giáo trình *Wolfgang Ertel (2025)*, *Russell & Norvig (2021)*.  
> **Quy chuẩn hiển thị:** 100% thuật ngữ quan trọng đều có định dạng song ngữ chuẩn `Tiếng Việt (English Term)` để phục vụ cả đề thi tiếng Việt và tiếng Anh.  
> **Ngày cập nhật:** 23/10/2026

---

## 1. Từ Điển Thuật Ngữ Cốt Lõi Song Ngữ (Comprehensive Bilingual Lexicon)

| STT | Thuật ngữ Tiếng Việt | Thuật ngữ Tiếng Anh | Định nghĩa / Ý nghĩa kỹ thuật |
| :---: | :--- | :--- | :--- |
| **1** | Mệnh đề nguyên tử | **Atomic proposition** | Đơn vị mệnh đề cơ bản nhất, không chứa liên từ logic nào (ví dụ biến $A, B$). |
| **2** | Biến mệnh đề | **Propositional variable** | Ký hiệu đại diện cho một sự kiện thực tế có thể nhận chân trị đúng hoặc sai. |
| **3** | Chữ ký logic | **Signature ($\Sigma$)** | Tập hợp tất cả các ký hiệu biến mệnh đề được phép sử dụng trong ngôn ngữ. |
| **4** | Hằng logic | **Logical constants** | Hai ký hiệu đặc biệt $\{t, f\}$ (hoặc $\{\top, \bot\}$) biểu thị chân trị cố định. |
| **5** | Phép gán chân trị | **Truth assignment** | Ánh xạ $I: \Sigma \to \{t, f\}$ gán chân trị cho từng biến mệnh đề. |
| **6** | Phép diễn giải | **Interpretation** | Đồng nghĩa với phép gán chân trị trong logic mệnh đề; xác định một thế giới khả dĩ. |
| **7** | Thế giới khả dĩ | **Possible world** | Một trạng thái cụ thể của thế giới được mô tả bởi một phép gán chân trị cho mọi biến. |
| **8** | Bảng chân trị | **Truth table** | Bảng liệt kê toàn bộ $2^n$ phép gán khả dĩ để tính chân trị của công thức. |
| **9** | Công thức hợp thức | **Well-formed formula (WFF)** | Chuỗi ký hiệu tuân thủ đúng quy tắc ngữ pháp cú pháp BNF của logic mệnh đề. |
| **10** | Mô hình | **Model** | Một phép gán chân trị làm cho toàn bộ công thức nhận giá trị đúng ($t$). |
| **11** | Tập mô hình | **Set of models ($\text{Mod}(\varphi)$)** | Tập hợp tất cả các phép gán chân trị thỏa mãn công thức $\varphi$. |
| **12** | Thỏa được | **Satisfiable** | Công thức đúng trong ít nhất một phép gán ($\text{Mod}(\varphi) \neq \emptyset$). |
| **13** | Hợp thức / Hằng đúng | **Logically valid / Tautology** | Công thức đúng trong mọi phép gán khả dĩ ($\models \varphi$). |
| **14** | Không thỏa được / Mâu thuẫn | **Unsatisfiable / Contradiction** | Công thức sai trong mọi phép gán khả dĩ ($\text{Mod}(\varphi) = \emptyset$). |
| **15** | Kéo theo logic | **Logical entailment ($\models$)** | Quan hệ ngữ nghĩa: Mọi mô hình của $KB$ đều là mô hình của $Q$. |
| **16** | Dẫn xuất cú pháp | **Syntactic derivation ($\vdash$)** | Việc biến đổi ký hiệu bằng các luật suy diễn để suy ra kết luận từ tiền đề. |
| **17** | Hệ suy diễn / Giải tích | **Inference system / Calculus** | Tập hợp các quy tắc thao tác cú pháp cho phép thực hiện suy luận hình thức. |
| **18** | Tính đúng đắn | **Soundness** | Hệ suy diễn "không bao giờ nói dối": $KB \vdash Q \implies KB \models Q$. |
| **19** | Tính đầy đủ | **Completeness** | Hệ suy diễn "tìm ra mọi chân lý": $KB \models Q \implies KB \vdash Q$. |
| **20** | Tính đầy đủ bác bỏ | **Refutation-completeness** | Khả năng luôn dẫn xuất được mệnh đề rỗng $()$ từ bất kỳ tập mâu thuẫn nào. |
| **21** | Literal | **Literal** | Một biến mệnh đề (positive literal) hoặc phủ định của nó (negative literal). |
| **22** | Mệnh đề tuyển | **Clause** | Một phép tuyển ($\lor$) của các literal, ví dụ $(A \lor \neg B \lor C)$. |
| **23** | Mệnh đề rỗng | **Empty clause ($()$ hoặc $\square$)** | Mệnh đề không còn literal nào; luôn nhận giá trị sai ($f$), biểu thị mâu thuẫn. |
| **24** | Cặp literal bù nhau | **Complementary pair** | Cặp gồm một literal dương và phủ định của nó, ví dụ $B$ và $\neg B$. |
| **25** | Mệnh đề hợp giải | **Resolvent** | Mệnh đề mới được sinh ra từ việc triệt tiêu cặp literal bù nhau của 2 clause. |
| **26** | Luật hợp giải | **Resolution rule** | Quy tắc suy diễn: $\frac{A \lor B, \quad \neg B \lor C}{A \lor C}$. |
| **27** | Phép thừa số hóa | **Factorization** | Quy tắc loại bỏ các literal trùng lặp trong cùng một clause: $A \lor A \lor B \to A \lor B$. |
| **28** | Dạng chuẩn hội | **Conjunctive Normal Form (CNF)** | Dạng chuẩn là hội ($\land$) của các mệnh đề tuyển (clause). |
| **29** | Dạng chuẩn tuyển | **Disjunctive Normal Form (DNF)** | Dạng chuẩn là tuyển ($\lor$) của các mệnh đề hội (conjunction). |
| **30** | Mệnh đề Horn | **Horn clause** | Mệnh đề tuyển có nhiều nhất một literal dương (at most one positive literal). |
| **31** | Mệnh đề xác định | **Definite clause** | Mệnh đề Horn có đúng một literal dương (dạng luật quy tắc $A_1 \land \dots \Rightarrow B$). |
| **32** | Sự thật | **Fact** | Mệnh đề Horn chỉ gồm đúng 1 literal dương duy nhất (ví dụ $B$ hay $t \Rightarrow B$). |
| **33** | Mệnh đề đích / Ràng buộc | **Goal clause / Integrity constraint** | Mệnh đề Horn không có literal dương nào (ví dụ $\neg A \lor \neg B$ hay $A \land B \Rightarrow f$). |
| **34** | Đầu mệnh đề | **Clause head** | Phần literal dương duy nhất trong một definite clause (kết luận). |
| **35** | Thân mệnh đề | **Clause body** | Phần liên kết hội các literal âm trước khi chuyển vế (tiền đề). |
| **36** | Suy diễn tiến | **Forward chaining** | Thuật toán hướng dữ liệu (data-driven): đi từ Facts suy ra Query. |
| **37** | Suy diễn lùi | **Backward chaining** | Thuật toán hướng mục tiêu (goal-driven): đi từ Query lùi về tìm Facts. |
| **38** | Hợp giải SLD | **SLD resolution** | Linear resolution theo luật chọn cho definite clauses; nền tảng của Prolog. |
| **39** | Bài toán SAT | **Boolean Satisfiability Problem** | Bài toán kiểm tra xem một công thức logic có thỏa được hay không. |
| **40** | Tính giải được | **Decidability** | Tính chất của một bài toán có thể giải quyết được bằng thuật toán trong thời gian hữu hạn. |

---

## 2. Flashcards Định Nghĩa Bắt Buộc Nhớ (Exam Flashcards)

### Flashcard 1: Thế nào là quan hệ Kéo theo logic (Logical Entailment)?
- **Trả lời:**  
  Cho cơ sở tri thức $KB$ và câu truy vấn $Q$. Ta nói $KB$ kéo theo logic $Q$, ký hiệu $KB \models Q$, khi và chỉ khi **mọi mô hình của $KB$ đều là mô hình của $Q$** (tức là trong mọi thế giới khả dĩ mà $KB$ đúng, thì $Q$ cũng bắt buộc phải đúng). Về mặt tập hợp: $\text{Mod}(KB) \subseteq \text{Mod}(Q)$.

### Flashcard 2: Phát biểu Định lý suy diễn (Deduction Theorem)
- **Trả lời:**  
  Với hai công thức $A$ và $B$ bất kỳ:
  $$A \models B \iff \ \models (A \Rightarrow B)$$
  *(Nói cách khác: $A$ kéo theo $B$ khi và chỉ khi công thức $A \Rightarrow B$ là một hằng đúng / tautology).*

### Flashcard 3: Phát biểu Định lý chứng minh phản chứng (Proof by Contradiction Theorem)
- **Trả lời:**  
  Với cơ sở tri thức $KB$ và câu truy vấn $Q$:
  $$KB \models Q \iff KB \land \neg Q \text{ là không thỏa được (unsatisfiable)}$$
  Đây là cơ sở lý thuyết để thuật toán Hợp giải (Resolution) chỉ cần tìm kiếm mâu thuẫn rỗng $\square$ từ $KB \land \neg Q$.

### Flashcard 4: Phân biệt Tính đúng đắn (Soundness) và Tính đầy đủ (Completeness)
- **Trả lời:**  
  - **Tính đúng đắn (Soundness - "Không bao giờ nói dối"):** Nếu một khẳng định được dẫn xuất ra bằng cú pháp thì nó chắc chắn đúng theo ngữ nghĩa: $KB \vdash Q \implies KB \models Q$.
  - **Tính đầy đủ (Completeness - "Không bỏ sót chân lý"):** Nếu một khẳng định đúng theo ngữ nghĩa thì hệ suy diễn chắc chắn sẽ chứng minh được: $KB \models Q \implies KB \vdash Q$.

### Flashcard 5: Tại sao Hệ hợp giải cần thêm Phép thừa số hóa (Factorization)?
- **Trả lời:**  
  Luật hợp giải nhị phân (binary resolution) chỉ triệt tiêu 1 cặp literal bù nhau và ghép phần còn lại. Khi gặp tập mệnh đề như $\{A \lor A, \neg A \lor \neg A\}$, hợp giải đơn thuần chỉ sinh ra $A \lor \neg A$ và luôn giữ độ dài 2 literal, không bao giờ thu nhỏ được để sinh ra mệnh đề rỗng $()$.  
  **Phép thừa số hóa (Factorization)** cho phép rút gọn các literal trùng lặp trong cùng một clause ($A \lor A \to A$), giúp hệ hợp giải đạt **Tính đầy đủ bác bỏ (Refutation-completeness)**.

### Flashcard 6: Mệnh đề Horn (Horn Clause) là gì và tại sao nó lại đặc biệt quan trọng?
- **Trả lời:**  
  Mệnh đề Horn là mệnh đề tuyển có **nhiều nhất một literal dương** ($\le 1$ positive literal).  
  **Tầm quan trọng:** Trong khi bài toán SAT tổng quát là NP-complete (Định lý Cook-Levin), bài toán Horn-SAT có thể giải được trong **thời gian tuyến tính $O(n)$** bằng thuật toán Modus Ponens tổng quát (Forward Chaining / Backward Chaining), giúp hệ thống chuyên gia và Prolog đạt hiệu năng cực cao.

---

## 3. Bảng Phân Biệt Sâu Các Cặp Khái Niệm Dễ Nhầm Lẫn

### 3.1. Phân biệt Bốn ký hiệu logic trung tâm

```
                     +---------------------------------------+
                     |  BỐN KÝ HIỆU CỐT LÕI CỦA LOGIC        |
                     +---------------------------------------+
                                    |
          +-------------------------+-------------------------+
          |                                                   |
[ Bên TRONG công thức ]                             [ BÊN NGOÀI công thức ]
          |                                                   |
   Toán tử liên kết                               Quan hệ giữa các câu
          |                                                   |
    A ⇒ B  (Kéo theo)                    +--------------------+--------------------+
   "Nếu A thì B"                         |                    |                    |
   (Có chân trị t hoặc f)          KB ⊨ Q (Ngữ nghĩa)   KB ⊢ Q (Cú pháp)     F ≡ G (Đẳng trị)
                                   "Mọi model của KB    "Dẫn xuất ra Q       "Cùng bảng
                                    cũng là model Q"     bằng luật suy diễn"  chân trị"
```

| Tiêu chí | Ký hiệu $\Rightarrow$ | Ký hiệu $\models$ | Ký hiệu $\vdash$ | Ký hiệu $\equiv$ |
| :--- | :--- | :--- | :--- | :--- |
| **Tên gọi** | Phép kéo theo (Implication) | Kéo theo logic (Entailment) | Dẫn xuất (Derivation) | Tương đương (Equivalence) |
| **Vị trí** | **Bên trong** công thức | **Bên ngoài** (Meta-level) | **Bên ngoài** (Meta-level) | **Bên ngoài** (Meta-level) |
| **Bản chất** | Toán tử logic nhị phân | Quan hệ ngữ nghĩa chân trị | Quan hệ cú pháp quy tắc | Quan hệ đẳng trị bảng chân trị |
| **Giá trị** | Nhận giá trị $t$ hoặc $f$ | Mệnh đề đúng/sai về mô hình | Mệnh đề đúng/sai về chứng minh | Nhận xét về sự đồng nhất chân trị |

---

### 3.2. Phân biệt Valid vs Satisfiable vs Unsatisfiable

| Khái niệm | Số lượng mô hình ($\text{Mod}$) | Giá trị dưới các phép gán | Phủ định của nó | Ví dụ điển hình |
| :--- | :--- | :--- | :--- | :--- |
| **Hợp thức / Hằng đúng (Valid / Tautology)** | Đúng với **mọi** $2^n$ phép gán | Luôn luôn $t$ | Là một công thức **Mâu thuẫn** | $A \lor \neg A$ |
| **Thỏa được (Satisfiable)** | Có **ít nhất 1** phép gán làm đúng | Có thể là $t$ ở một số hàng | Vẫn có thể là thỏa được | $A \land B$ |
| **Không thỏa được / Mâu thuẫn (Unsatisfiable)** | Không có phép gán nào ($\text{Mod} = \emptyset$) | Luôn luôn $f$ | Là một công thức **Hợp thức** | $A \land \neg A$ |

---

### 3.3. Phân biệt Ba dạng Mệnh đề Horn

| Dạng Mệnh đề Horn | Số literal dương | Số literal âm | Biểu diễn dưới dạng phép kéo theo | Tên gọi chuyên ngành |
| :--- | :---: | :---: | :--- | :--- |
| **Definite Clause** | Đúng $1$ | $\ge 1$ | $A_1 \land A_2 \land \dots \land A_m \Rightarrow B$ | Mệnh đề quy tắc (Rule) |
| **Fact** | Đúng $1$ | $0$ | $t \Rightarrow B$ hay đơn giản là $B$ | Mệnh đề sự thật (Fact) |
| **Goal Clause / Constraint** | Đúng $0$ | $\ge 1$ | $A_1 \land A_2 \land \dots \land A_m \Rightarrow f$ | Mệnh đề đích / Ràng buộc |

---

### 3.4. Phân biệt Forward Chaining vs Backward Chaining

| Tiêu chí so sánh | Suy diễn tiến (Forward Chaining) | Suy diễn lùi (Backward Chaining) |
| :--- | :--- | :--- |
| **Hướng suy luận** | Hướng dữ liệu (**Data-driven**): Từ tiền đề tới kết luận. | Hướng mục tiêu (**Goal-driven**): Từ truy vấn lùi về tiền đề. |
| **Điểm xuất phát** | Bắt đầu từ tập các sự thật đã biết (**Facts**). | Bắt đầu từ câu truy vấn đích (**Query $Q$**). |
| **Phương thức hoạt động** | Kích hoạt các luật khi đủ Body, thêm Head vào Facts mới. | Tìm luật có Head khớp mục tiêu, phân rã thành các mục tiêu con. |
| **Ưu điểm** | Tự động cập nhật mọi tri thức mới từ dữ liệu quan sát. | Rất tập trung, chỉ tìm các sự thật phục vụ việc trả lời câu hỏi. |
| **Nhược điểm** | Dễ sinh ra nhiều tri thức dư thừa không liên quan đến câu hỏi. | Có thể rơi vào nhánh tìm kiếm vô tận nếu có đệ quy vòng. |
| **Ứng dụng tiêu biểu** | Hệ thống giám sát, tổng hợp dữ liệu cảm biến thời gian thực. | Bộ thông dịch Prolog, lập trình logic, hệ chẩn đoán hỏi đáp. |

---

## 4. Bảng Công Thức Tương Đương Bắt Buộc Nhớ (Cheat-Sheet)

Dưới đây là các tương đương bắt buộc phải viết chính xác trong bài thi:

1. **Khử phép kéo theo:**  
   $$A \Rightarrow B \ \equiv \ \neg A \lor B$$
2. **Khử phép tương đương:**  
   $$A \Leftrightarrow B \ \equiv \ (\neg A \lor B) \land (\neg B \lor A)$$
3. **Luật De Morgan:**  
   $$\neg(A \land B) \ \equiv \ \neg A \lor \neg B$$  
   $$\neg(A \lor B) \ \equiv \ \neg A \land \neg B$$
4. **Luật phân phối:**  
   $$A \lor (B \land C) \ \equiv \ (A \lor B) \land (A \lor C)$$  
   $$A \land (B \lor C) \ \equiv \ (A \land B) \lor (A \land C)$$
5. **Luật bù trừ (Complementarity):**  
   $$A \lor \neg A \ \equiv \ t \qquad (\text{Hằng đúng})$$  
   $$A \land \neg A \ \equiv \ f \qquad (\text{Mâu thuẫn})$$
6. **Luật nuốt và trung hòa:**  
   $$A \lor t \ \equiv \ t, \qquad A \lor f \ \equiv \ A$$  
   $$A \land f \ \equiv \ f, \qquad A \land t \ \equiv \ A$$
7. **Đẳng trị Mệnh đề Horn:**  
   $$\neg A_1 \lor \dots \lor \neg A_m \lor B \ \equiv \ A_1 \land \dots \land A_m \Rightarrow B$$  
   $$\neg A_1 \lor \dots \lor \neg A_m \ \equiv \ A_1 \land \dots \land A_m \Rightarrow f$$

---

## 5. Động Từ Chỉ Lệnh Thường Gặp Trong Đề Thi (Exam Action Verbs)

Khi đọc đề thi (đặc biệt là các đề thi viết hoàn toàn bằng tiếng Anh), cần hiểu đúng chính xác yêu cầu của từng động từ chỉ lệnh:

| Động từ chỉ lệnh | Ý nghĩa tiếng Việt | Hành động bắt buộc phải thực hiện trong bài làm |
| :--- | :--- | :--- |
| **Convert / Transform to CNF** | Chuyển đổi sang dạng chuẩn hội | Thực hiện 4 bước biến đổi tương đương, đưa về dạng hội của các tuyển, loại bỏ literal lặp. |
| **Resolve** | Hợp giải | Chọn 2 clause có chứa cặp literal bù nhau, triệt tiêu chúng và viết ra resolvent mới. |
| **Derive** | Dẫn xuất cú pháp | Viết ra chuỗi các bước biến đổi ký hiệu bằng các luật suy diễn hình thức từ tiền đề. |
| **Refute / Prove by refutation** | Chứng minh phản chứng | Thêm phủ định của câu hỏi $\neg Q$ vào $KB$, áp dụng hợp giải cho đến khi sinh ra mệnh đề rỗng $()$. |
| **Show unsatisfiable** | Chứng minh không thỏa được | Đưa tập clause vào hợp giải và tìm ra mệnh đề rỗng $\square$. |
| **Entail ($\models$)** | Kéo theo logic | Kiểm tra xem mọi phép gán làm $KB$ đúng có làm $Q$ đúng không (qua bảng chân trị hoặc refutation). |
| **Apply Forward Chaining** | Áp dụng suy diễn tiến | Lập bảng truy vết các bước cập nhật `count`, duyệt `agenda` và kích hoạt các luật từ Facts. |
| **Trace SLD Resolution** | Truy vết hợp giải SLD | Bắt đầu từ phủ định truy vấn, thay thế mục tiêu con bằng thân luật cho đến khi đạt $()$. |
| **Formalize** | Hình thức hóa | Đặt các ký hiệu biến mệnh đề cho phát biểu tự nhiên, chuyển các câu thành công thức logic. |

---

## 6. Checklist Tự Đánh Giá Năng Lực Đạt Điểm A+

Hãy tự kiểm tra xem bạn đã sẵn sàng đạt điểm tuyệt đối cho phần Logic mệnh đề chưa:

- [ ] Tôi có thể viết chuẩn xác định nghĩa bộ ba $(L, S, R)$ của một hệ logic hình thức.
- [ ] Tôi thuộc toàn bộ ngữ pháp BNF và thứ tự ưu tiên của 5 toán tử logic: $\neg > \land > \lor > \Rightarrow > \Leftrightarrow$.
- [ ] Tôi phân biệt được tuyệt đối sự khác nhau về bản chất giữa $\Rightarrow$, $\models$, $\vdash$ và $\equiv$.
- [ ] Tôi tự chứng minh được Định lý suy diễn (Deduction Theorem) và Định lý phản chứng (Proof by Contradiction).
- [ ] Tôi có thể chuyển đổi thành thạo mọi công thức logic phức tạp sang CNF trong dưới 3 phút.
- [ ] Tôi biết cách lập luận và vẽ cây hợp giải (Resolution tree), không bao giờ mắc lỗi triệt tiêu 2 cặp literal cùng lúc.
- [ ] Tôi hiểu rõ vai trò sống còn của Phép thừa số hóa (Factorization) khi hợp giải gặp literal lặp.
- [ ] Tôi giải quyết thành thạo 3 câu đố logic kinh điển từ slide: Gia đình người Anh, Cuộc thi nhảy cao, Vụ án hình sự.
- [ ] Tôi mô phỏng chính xác từng bước hoạt động của Forward Chaining với mảng `count` và hàng đợi `agenda`.
- [ ] Tôi truy vết được từng bước của Hợp giải SLD trên tập Horn clauses để đưa về mệnh đề rỗng.
- [ ] Tôi giải thích được tại sao 3-SAT là NP-complete (Định lý Cook-Levin) nhưng Horn-SAT lại giải được trong thời gian tuyến tính $O(n)$.
