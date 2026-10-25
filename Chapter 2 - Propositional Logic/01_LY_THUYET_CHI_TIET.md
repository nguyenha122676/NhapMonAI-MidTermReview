# Chapter 2 – Logic Mệnh Đề (Propositional Logic)
## Cẩm Nang Lý Thuyết Chuyên Sâu Ôn Thi A+

> **Môn học:** Nhập môn Trí tuệ Nhân tạo (Introduction to Artificial Intelligence - MAT1206E / MAT3508)  
> **Nguồn bài giảng:** Slide chính thức `Propositional_Logic.pdf` & `Propositional_Logic_InClass.pdf` (TS. Hoàng Anh Đức, ĐHKHTN - ĐHQGHN)  
> **Giáo trình tham chiếu:** Wolfgang Ertel (2025), *Introduction to Artificial Intelligence*, 3rd Edition, Springer (Chapter 2); Russell & Norvig (2021), *AIMA 4th Edition* (Chapter 7)  
> **Ngày cập nhật:** 23/10/2026

---

## Mục Tiêu Học Tập (Learning Objectives)

Sau khi làm chủ chương này, bạn cần đạt được:
1. Nắm vững **Khung hình thức $(L, S, R)$** của một hệ logic và cú pháp ngữ pháp **BNF (Backus-Naur Form)** của Logic mệnh đề (Propositional Logic - PL0).
2. Hiểu bản chất ngữ nghĩa: **Phép gán chân trị (Truth assignment / Interpretation)**, không gian $2^n$ phép gán, **Mô hình (Model)** và phân loại công thức: **Thỏa được (Satisfiable)**, **Hợp thức / Hằng đúng (Valid / Tautology)**, **Không thỏa được / Mâu thuẫn (Unsatisfiable / Contradiction)**.
3. Làm chủ quan hệ **Kéo theo logic (Logical entailment $\models$)**, hiểu bản chất bao hàm tập mô hình $\text{Mod}(KB) \subseteq \text{Mod}(Q)$ và chứng minh được **Định lý suy diễn (Deduction Theorem)**, **Định lý phản chứng (Proof by Contradiction)**.
4. Phân biệt chính xác tuyệt đối 4 ký hiệu cốt lõi: $\Rightarrow$ (phép kéo theo trong câu), $\models$ (hệ quả ngữ nghĩa), $\vdash$ (dẫn xuất cú pháp), $\equiv$ (tương đương ngữ nghĩa).
5. So sánh toàn diện **3 Hệ chứng minh (Proof Systems)**:
   - **Kiểm tra mô hình (Model checking / Truth table)**: Duyệt cạn, độ phức tạp $O(2^n)$.
   - **Hệ suy diễn giải tích / Hợp giải (Resolution Calculus)**: Luật Hợp giải (Resolution rule), Phép thừa số hóa (Factorization), **Tính đúng đắn (Soundness)** và **Tính đầy đủ bác bỏ (Refutation-completeness)**.
   - **Hệ suy luận trên Mệnh đề Horn (Horn Clauses)**: Mệnh đề xác định (Definite clauses), Sự thật (Facts), Ràng buộc (Integrity constraints); **Suy diễn tiến (Forward chaining)**, **Suy diễn lùi (Backward chaining)**, và **Hợp giải SLD (SLD Resolution)**.
6. Hiểu sâu **Tính toán và Độ phức tạp (Computability and Complexity)**: Định lý Cook-Levin (3-SAT là NP-complete) đối lập với tính khả toán trong thời gian tuyến tính $O(n)$ của Horn-SAT.

---

## 1. Khung Hình Thức Của Một Hệ Logic (Formal Framework of Logic)

Trong Trí tuệ Nhân tạo, một hệ logic hình thức chuẩn mực được định nghĩa như một bộ ba $(L, S, R)$:

$$\text{Logic} = (L, S, R)$$

Trong đó:
1. **$L$ - Ngôn ngữ hình thức (Language):** Là tập hợp các câu / công thức hợp thức (well-formed sentences / formulas) được xây dựng dựa trên các quy tắc cú pháp (syntax) nghiêm ngặt.
2. **$S$ - Ngữ nghĩa hình thức (Semantics):** Là quy định chuẩn hóa toán học về cách gán ý nghĩa (meaning) trong "thế giới thực" cho các phần tử cú pháp của $L$, xác định giá trị Đúng/Sai ($\text{true} / \text{false}$) của từng câu đối với mỗi thế giới khả dĩ.
3. **$R$ - Hệ suy diễn hình thức (Inference System / Proof System):** Là tập hợp các quy tắc dẫn xuất hình thức (formal derivation rules / inference rules) hoạt động thuần túy trên cấu trúc cú pháp của $L$ để suy ra tri thức mới từ các tiền đề đã biết.

---

## 2. Cú Pháp Của Logic Mệnh Đề (Syntax of Propositional Logic)

### 2.1. Các thành phần bảng chữ cái (Alphabet Components)
Hệ cú pháp của Logic mệnh đề (Propositional Logic - PL0) được cấu thành từ 3 tập hợp rời nhau từng đôi một (pairwise disjoint):
- **Tập biến mệnh đề (Propositional variables / Signature $\Sigma$):** Ký hiệu là các chữ cái in hoa biểu diễn các phát biểu nguyên tử, ví dụ: $\Sigma = \{A, B, C, P, Q, R, \dots\}$. Mỗi biến mệnh đề biểu thị một sự kiện trong thế giới thực có thể nhận giá trị đúng hoặc sai.
- **Tập hằng logic (Logical constants):** Gồm hai ký hiệu $\{t, f\}$ (trong đó $t$ biểu thị *true / hằng đúng*, $f$ biểu thị *false / hằng sai*; một số tài liệu dùng $\{\top, \bot\}$).
- **Tập toán tử logic (Set of logical operators $\text{Op}$):** Bao gồm $\text{Op} = \{\neg, \land, \lor, \Rightarrow, \Leftrightarrow, (, )\}$.

### 2.2. Định nghĩa Công thức hợp thức (Well-Formed Formulas - WFF)
Một chuỗi ký hiệu là một công thức hợp thức (WFF) của logic mệnh đề nếu và chỉ nếu được xây dựng theo các quy tắc đệ quy sau:
1. Các hằng logic $t$ và $f$ là các công thức (nguyên tử - atomic formulas).
2. Mọi biến mệnh đề thuộc $\Sigma$ (ví dụ: $A, B$) đều là công thức (nguyên tử).
3. Nếu $A$ và $B$ là các công thức, thì các chuỗi sau cũng là công thức:
   - $\neg A$ (phủ định - negation: "not $A$")
   - $(A)$ (công thức trong ngoặc)
   - $A \land B$ (phép hội - conjunction: "$A$ and $B$")
   - $A \lor B$ (phép tuyển - disjunction: "$A$ or $B$")
   - $A \Rightarrow B$ (phép kéo theo - implication: "if $A$ then $B$")
   - $A \Leftrightarrow B$ (phép tương đương - equivalence: "$A$ if and only if $B$")

### 2.3. Ngữ pháp dạng Backus-Naur (Backus-Naur Form - BNF Grammar)
Ngữ pháp BNF (được phát triển bởi John Backus và Peter Naur năm 1960) mô tả hình thức cú pháp của Logic mệnh đề (Ertel 2025, Bài tập 2.1) như sau:

```bnf
<Formula> ::= <AtomicFormula> | <ComplexFormula>
<AtomicFormula> ::= "t" | "f" | <Variable>
<Variable> ::= "A" | "B" | "C" | ... | "Z"
<ComplexFormula> ::= "(" <Formula> ")"
                   | "¬" <Formula>
                   | <Formula> "∧" <Formula>
                   | <Formula> "∨" <Formula>
                   | <Formula> "⇒" <Formula>
                   | <Formula> "⇔" <Formula>
```

### 2.4. Thứ tự ưu tiên của các toán tử (Operator Priorities / Precedence)
Để giảm bớt số lượng dấu ngoặc đơn, các toán tử được quy ước mức độ ưu tiên từ cao xuống thấp như sau:

$$\neg \quad > \quad \land \quad > \quad \lor \quad > \quad \Rightarrow \quad > \quad \Leftrightarrow$$

*Ví dụ:* Biểu thức $\neg A \lor B \land C \Rightarrow D$ được hiểu chính xác theo thứ tự ngoặc là: $((\neg A) \lor (B \land C)) \Rightarrow D$.

---

## 3. Ngữ Nghĩa Của Logic Mệnh Đề (Semantics of Propositional Logic)

Ngữ nghĩa quy định cách xác định chân trị của một công thức đối với mỗi thế giới khả dĩ (possible world).

### 3.1. Phép gán chân trị / Phép diễn giải (Truth Assignment / Interpretation)
- Trong logic mệnh đề chuẩn, chỉ có 2 giá trị chân trị: $t$ ($\text{true}$) và $f$ ($\text{false}$).
- **Định nghĩa:** Một phép gán chân trị (truth assignment) hay phép diễn giải (interpretation) là một ánh xạ:
  $$I : \Sigma \to \{t, f\}$$
  gán một giá trị chân lý cho mỗi biến mệnh đề trong chữ ký $\Sigma$.
- Hằng logic luôn giữ nguyên giá trị: $I(t) = t$ và $I(f) = f$.
- **Không gian phép gán:** Nếu một công thức chứa $n$ biến mệnh đề khác nhau, sẽ có chính xác $2^n$ phép gán chân trị (thế giới khả dĩ) khác nhau.

### 3.2. Bảng chân trị (Truth Table)
Bảng chân trị định nghĩa ngữ nghĩa của các toán tử logic đối với mọi phép gán của các biến thành phần:

| $A$ | $B$ | $\neg A$ | $A \land B$ | $A \lor B$ | $A \Rightarrow B$ | $A \Leftrightarrow B$ |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| $t$ | $t$ | $f$ | $t$ | $t$ | $t$ | $t$ |
| $t$ | $f$ | $f$ | $f$ | $t$ | $f$ | $f$ |
| $f$ | $t$ | $t$ | $f$ | $t$ | $t$ | $f$ |
| $f$ | $f$ | $t$ | $f$ | $f$ | $t$ | $t$ |

> [!IMPORTANT]
> **Quy ước quan trọng trong slide:**
> 1. Phép kéo theo $A \Rightarrow B$ chỉ sai ($f$) khi và chỉ khi tiền đề $A$ đúng ($t$) mà kết luận $B$ sai ($f$). Khi tiền đề $A = f$, công thức $A \Rightarrow B$ luôn hiển nhiên đúng ($t$).
> 2. **Công thức rỗng (Empty formula $\emptyset$):** Công thức rỗng được quy ước là đúng ($t$) đối với mọi phép gán chân trị.

### 3.3. Khái niệm Mô hình (Model)
- Nếu một công thức $\varphi$ nhận giá trị đúng ($t$) dưới phép gán chân trị $m$, ta nói $m$ **thỏa mãn (satisfies)** $\varphi$, hay $m$ là một **mô hình (model)** của $\varphi$.
- Ký hiệu tập hợp tất cả các mô hình của công thức $\varphi$ là:
  $$\text{Mod}(\varphi) = \{ m \mid m \models \varphi \}$$

### 3.4. Phân loại công thức logic (Classification of Formulas)
Một công thức $\varphi$ được phân loại thành:
1. **Thỏa được (Satisfiable):** Đúng trong ít nhất một phép gán ($\text{Mod}(\varphi) \neq \emptyset$).
2. **Hợp thức / Hằng đúng (Logically Valid / Tautology):** Đúng trong mọi phép gán khả dĩ ($\text{Mod}(\varphi)$ chứa toàn bộ $2^n$ phép gán). Khi đó ta viết $\models \varphi$.
3. **Không thỏa được / Mâu thuẫn (Unsatisfiable / Contradiction):** Không đúng trong bất kỳ phép gán nào ($\text{Mod}(\varphi) = \emptyset$).
4. **Thỏa được nhưng không hợp thức (Satisfiable but not valid):** Đúng trong một số phép gán và sai trong một số phép gán khác.

> [!NOTE]
> **Định lý về phép phủ định (Negation properties):**
> - Phủ định của một công thức hằng đúng là một công thức không thỏa được (mâu thuẫn): $\varphi \text{ valid} \iff \neg \varphi \text{ unsatisfiable}$.
> - Phủ định của một công thức thỏa được nhưng không hằng đúng vẫn là một công thức thỏa được.

---

## 4. Tương Đương Ngữ Nghĩa (Semantically Equivalent Formulas)

Hai công thức $F$ và $G$ được gọi là **tương đương ngữ nghĩa (semantically equivalent)**, ký hiệu $F \equiv G$, nếu chúng nhận cùng một giá trị chân trị trong mọi phép gán khả dĩ.

$$F \equiv G \iff \models (F \Leftrightarrow G)$$

### Định lý 1: Các phép tương đương cơ bản bắt buộc phải thuộc
Dưới đây là các tương đương logic nền tảng (Theorem 1 trong slide Ertel 2025):

1. **Khử phép kéo theo (Implication elimination):**
   $$A \Rightarrow B \equiv \neg A \lor B$$
2. **Luật phản đảo (Contraposition):**
   $$A \Rightarrow B \equiv \neg B \Rightarrow \neg A$$
3. **Khử phép tương đương (Equivalence elimination):**
   $$A \Leftrightarrow B \equiv (A \Rightarrow B) \land (B \Rightarrow A) \equiv (\neg A \lor B) \land (\neg B \lor A)$$
4. **Luật De Morgan:**
   $$\neg(A \land B) \equiv \neg A \lor \neg B$$
   $$\neg(A \lor B) \equiv \neg A \land \neg B$$
5. **Luật phân phối (Distributive laws):**
   $$A \lor (B \land C) \equiv (A \lor B) \land (A \lor C)$$
   $$A \land (B \lor C) \equiv (A \land B) \lor (A \land C)$$
6. **Luật bù / Phần tử bù (Complementarity / Tautology & Contradiction):**
   $$A \lor \neg A \equiv t \quad (\text{Hằng đúng / Tautology})$$
   $$A \land \neg A \equiv f \quad (\text{Mâu thuẫn / Contradiction})$$
7. **Luật nuốt và trung hòa (Identity and Annihilation laws):**
   $$A \lor f \equiv A, \qquad A \lor t \equiv t$$
   $$A \land f \equiv f, \qquad A \land t \equiv A$$
8. **Luật lũy đẳng (Idempotence) & Luật phủ định kép (Double negation):**
   $$A \lor A \equiv A, \qquad A \land A \equiv A, \qquad \neg(\neg A) \equiv A$$

---

## 5. Kéo Theo Logic Và Các Định Lý Nền Tảng (Logical Entailment & Fundamental Theorems)

### 5.1. Bản chất của Kéo theo logic (Logical Entailment)
Trong AI, mục tiêu trung tâm là trả lời câu hỏi: *Liệu một câu truy vấn (query) $Q$ có được suy ra từ Cơ sở tri thức (Knowledge Base - $KB$) hay không?*

- **Định nghĩa:** $KB$ kéo theo $Q$ (hay $Q$ là hệ quả logic của $KB$), ký hiệu là:
  $$KB \models Q$$
  nếu và chỉ nếu **mọi mô hình của $KB$ đều là mô hình của $Q$**.
- **Bản chất tập hợp:**
  $$KB \models Q \iff \text{Mod}(KB) \subseteq \text{Mod}(Q)$$
- **Ý nghĩa độ mạnh khẳng định:** Nếu $KB \models Q$, thì $KB$ là một khẳng định mạnh hơn $Q$ ($KB$ giới hạn số thế giới khả dĩ chặt chẽ hơn $Q$).
  *Ví dụ:* Câu "$x = 0$" kéo theo câu "$x \cdot y = 0$". Mọi phép gán làm cho $x = 0$ đúng đều làm cho $x \cdot y = 0$ đúng.

```
+-------------------------------------------------------+
|  Tất cả các phép gán chân trị khả dĩ (2^n thế giới)   |
|                                                       |
|        Mod(Q)                                         |
|    +------------------------------------------+       |
|    |                                          |       |
|    |          Mod(KB)                         |       |
|    |      +---------------------+             |       |
|    |      |  mọi thế giới làm   |             |       |
|    |      |  KB đúng            |             |       |
|    |      +---------------------+             |       |
|    |                                          |       |
|    +------------------------------------------+       |
|                                                       |
|   Quan hệ bao hàm: Mod(KB) ⊆ Mod(Q) ==> KB |= Q       |
+-------------------------------------------------------+
```

### 5.2. Định lý 2: Định lý suy diễn (Deduction Theorem)
Định lý suy diễn (Theorem 2 trong slide) thiết lập cầu nối trực tiếp giữa quan hệ kéo theo ngữ nghĩa ($\models$) và phép kéo theo bên trong công thức ($\Rightarrow$):

$$A \models B \iff \ \models (A \Rightarrow B)$$

*(Nói cách khác: $A$ kéo theo $B$ khi và chỉ khi công thức $A \Rightarrow B$ là một hằng đúng / tautology).*

**Chứng minh chặt chẽ 2 chiều (Proof from Slides):**
1. **Chiều thuận ($\Rightarrow$):** Giả sử $A \models B$. Theo định nghĩa, trong bất kỳ phép gán nào làm cho $A$ đúng ($A \mapsto t$), thì $B$ cũng bắt buộc phải đúng ($B \mapsto t$). Do đó, không bao giờ xảy ra trường hợp $A \mapsto t$ và $B \mapsto f$. Theo bảng chân trị của phép kéo theo, $A \Rightarrow B$ luôn nhận giá trị $t$. Vậy $\models (A \Rightarrow B)$ là hằng đúng.
2. **Chiều đảo ($\Leftarrow$):** Giả sử $\models (A \Rightarrow B)$ là hằng đúng. Do $A \Rightarrow B$ luôn đúng trong mọi phép gán, trường hợp $A \mapsto t$ và $B \mapsto f$ không bao giờ xảy ra. Vì vậy, mọi phép gán làm $A$ đúng chắc chắn cũng làm $B$ đúng. Theo định nghĩa, $A \models B$. $\blacksquare$

### 5.3. Định lý 3: Chứng minh bằng phản chứng (Proof by Contradiction / Refutation Theorem)
Đây là cơ sở lý thuyết toán học tối quan trọng của thuật toán Hợp giải (Theorem 3 trong slide):

$$KB \models Q \iff KB \land \neg Q \text{ là không thỏa được (unsatisfiable)}$$

**Chứng minh chặt chẽ (Proof from Slides):**
1. **Chiều thuận ($\Rightarrow$):** Giả sử $KB \models Q$. Theo Định lý suy diễn (Định lý 2), công thức $KB \Rightarrow Q$ là một hằng đúng. Xét phủ định của nó:
   $$\neg(KB \Rightarrow Q) \equiv \neg(\neg KB \lor Q) \equiv KB \land \neg Q$$
   Vì phủ định của một hằng đúng là một công thức không thỏa được, nên $KB \land \neg Q$ là không thỏa được ($\text{unsatisfiable}$).
2. **Chiều đảo ($\Leftarrow$):** Giả sử $KB \land \neg Q$ là không thỏa được. Khi đó phủ định của nó:
   $$\neg(KB \land \neg Q) \equiv \neg KB \lor Q \equiv KB \Rightarrow Q$$
   phải là một hằng đúng. Theo Định lý 2, ta suy ra $KB \models Q$. $\blacksquare$

---

## 6. Phân Biệt Tuyệt Đối Bốn Ký Hiệu Dễ Nhầm Lẫn

Trong phòng thi, sinh viên thường xuyên nhầm lẫn giữa 4 ký hiệu sau:

| Ký hiệu | Bản chất | Vị trí xuất hiện | Ý nghĩa hình thức |
| :---: | :--- | :--- | :--- |
| $\Rightarrow$ | **Toán tử logic** (Connective) | Nằm **bên trong** một công thức | Phép kéo theo: "nếu... thì...". Nhận giá trị $t$ hoặc $f$ tùy phép gán. |
| $\models$ | **Quan hệ ngữ nghĩa** (Semantic Entailment) | Phát biểu **về** hai công thức | $KB \models Q$: Mọi mô hình của $KB$ đều là mô hình của $Q$ (chân trị). |
| $\vdash$ | **Quan hệ cú pháp** (Syntactic Derivation) | Phát biểu **về** hai công thức | $KB \vdash Q$: Từ $KB$ có thể suy ra $Q$ bằng chuỗi biến đổi quy tắc suy diễn thuần túy. |
| $\equiv$ | **Quan hệ đẳng trị** (Semantic Equivalence) | Phát biểu **về** hai công thức | $F \equiv G$: Hai công thức có cùng bảng chân trị ($F \Leftrightarrow G$ hằng đúng). |

> [!TIP]
> **Khẩu quyết ghi nhớ từ slide bài giảng:**  
> - $\Rightarrow$ sống *trong* công thức.  
> - $\models$ và $\vdash$ nói *về* quan hệ giữa các công thức ($\models$ bằng ý nghĩa chân trị, $\vdash$ bằng quy tắc thao tác ký hiệu).  
> - $\equiv$ biểu thị hai công thức thay thế được cho nhau trong mọi ngữ cảnh.

---

## 7. Ba Hệ Chứng Minh Trong Logic Mệnh Đề (The Three Proof Systems)

Mục tiêu chung của cả 3 hệ chứng minh là kiểm tra xem $KB \models Q$ có đúng hay không.

### 7.1. Hệ Chứng Minh 1: Kiểm Tra Mô Hình (Model Checking / Truth Table)
- **Phương pháp:** Lập bảng chân trị đầy đủ cho toàn bộ các biến xuất hiện trong $KB$ và $Q$. Kiểm tra tất cả các hàng (phép gán) mà $KB = t$. Nếu ở tất cả các hàng đó mà $Q$ cũng bằng $t$, kết luận $KB \models Q$.
- **Ưu điểm:** Cực kỳ trực quan, đơn giản, luôn tìm ra kết quả chính xác vì không gian biến là hữu hạn.
- **Nhược điểm (Bùng nổ tổ hợp):** Thời gian thực thi trong trường hợp xấu nhất là $O(2^n)$, với $n$ là số biến. Khi $n = 30$, bảng có hơn 1 tỷ dòng, máy tính không thể giải quyết trong thời gian thực.

---

### 7.2. Hệ Chứng Minh 2: Hệ Hợp Giải (Resolution Calculus)

Để tránh phải duyệt $2^n$ dòng của bảng chân trị, ta chuyển sang thao tác cú pháp $KB \vdash Q$ thông qua một hệ suy diễn (calculus).

#### 7.2.1. Tính đúng đắn và Tính đầy đủ (Soundness and Completeness)
Một hệ suy diễn được đánh giá bởi 2 phẩm chất toán học tối thượng:
- **Tính đúng đắn (Soundness - "Never lies"):** Hệ suy diễn chỉ sinh ra những khẳng định thực sự đúng theo ngữ nghĩa.
  $$KB \vdash Q \implies KB \models Q$$
- **Tính đầy đủ (Completeness - "Finds everything"):** Mọi hệ quả ngữ nghĩa đều có thể được chứng minh cú pháp bằng hệ suy diễn.
  $$KB \models Q \implies KB \vdash Q$$
- Khi một hệ suy diễn vừa đúng đắn vừa đầy đủ, quan hệ dẫn xuất cú pháp $\vdash$ và kéo theo ngữ nghĩa $\models$ hoàn toàn trùng khớp!

#### 7.2.2. Dạng chuẩn hội (Conjunctive Normal Form - CNF)
Hệ hợp giải yêu cầu công thức đầu vào phải ở dạng chuẩn hội (CNF):
- **Literal (Mệnh đề nguyên tử / đơn vị):** Là một biến mệnh đề (positive literal, ví dụ $A$) hoặc phủ định của một biến mệnh đề (negative literal, ví dụ $\neg A$).
- **Clause (Mệnh đề tuyển):** Là một phép tuyển ($\lor$) của các literal, ví dụ $(A \lor \neg B \lor C)$.
- **CNF:** Là một phép hội ($\land$) của các clause:
  $$K_1 \land K_2 \land \dots \land K_m$$
- **Định lý 4 (Theorem 4):** Mọi công thức logic mệnh đề đều có thể biến đổi tương đương về một dạng chuẩn hội CNF.

#### 7.2.3. Quy trình chuyển đổi công thức sang CNF (4 bước chuẩn)
1. **Bước 1 (Khử toán tử kéo theo và tương đương):**
   - Thay $A \Rightarrow B$ bằng $\neg A \lor B$.
   - Thay $A \Leftrightarrow B$ bằng $(\neg A \lor B) \land (\neg B \lor A)$.
2. **Bước 2 (Đẩy phủ định $\neg$ vào sát biến):**
   - Áp dụng De Morgan: $\neg(A \land B) \equiv \neg A \lor \neg B$; $\neg(A \lor B) \equiv \neg A \land \neg B$.
   - Triệt tiêu phủ định kép: $\neg(\neg A) \equiv A$.
3. **Bước 3 (Phân phối phép tuyển $\lor$ qua phép hội $\land$):**
   - Áp dụng: $A \lor (B \land C) \equiv (A \lor B) \land (A \lor C)$.
4. **Bước 4 (Chuẩn hóa tập Clause):**
   - Tách các clause thành tập hợp $\{K_1, K_2, \dots, K_m\}$.
   - Loại bỏ các literal trùng lặp trong từng clause ($A \lor A \equiv A$).

#### 7.2.4. Luật Modus Ponens (Luật khẳng định)
Luật Modus Ponens (loại bỏ phép kéo theo):

$$\frac{A, \quad A \Rightarrow B}{B} \quad \text{hoặc} \quad \{A, \neg A \lor B\} \vdash B$$

- **Đánh giá:** Modus Ponens là **sound (đúng đắn)** nhưng **không complete (không đầy đủ)**.
  *Ví dụ phản chứng trên slide:* Xét tập hợp $\{A \Rightarrow B, \neg B\}$. Rõ ràng $\{A \Rightarrow B, \neg B\} \models \neg A$ (Modus Tollens), nhưng nếu chỉ dùng duy nhất luật Modus Ponens thì không thể dẫn xuất ra $\neg A$.

#### 7.2.5. Luật Hợp Giải (Resolution Rule)
Để xây dựng hệ đầy đủ, ta dùng Luật Hợp giải (Robinson 1965):

$$\frac{A \lor B, \quad \neg B \lor C}{A \lor C}$$

- Công thức mới sinh ra $A \lor C$ được gọi là **Mệnh đề hợp giải (Resolvent)**.
- Hai literal $B$ và $\neg B$ được gọi là **Cặp literal bù nhau (Complementary pair)**.
- **Hợp giải là sự tổng quát hóa của Modus Ponens:** Đặt $A = f$ (hằng sai). Khi đó $f \lor B \equiv B$ và $\neg B \lor C \equiv B \Rightarrow C$. Mệnh đề hợp giải thu được là $f \lor C \equiv C$. Đúng là Modus Ponens!
- **Hợp giải theo nhiều cách sinh ra Hằng đúng (Tautology):** Nếu hai clause có từ 2 cặp literal bù nhau trở lên (ví dụ: $A_1 \lor \neg A_2 \lor A_3$ và $A_2 \lor \neg A_3 \lor A_4$), việc hợp giải theo bất kỳ cặp nào cũng sinh ra một resolvent chứa cả biến và phủ định của nó (ví dụ chứa $A_3 \lor \neg A_3 \equiv t$). Các resolvent này là hằng đúng và không mang thông tin mới.

#### 7.2.6. Tại sao Resolution đơn độc chưa đủ? Vai trò của Phép Thừa Số Hóa (Factorization)
Xét tập mệnh đề:

$$\{A \lor A, \quad \neg A \lor \neg A\}$$

Tập này rõ ràng không thỏa được (unsatisfiable). Một calculus hoàn chỉnh bắt buộc phải suy ra được mâu thuẫn rỗng $\square$ hay $()$.
Tuy nhiên, nếu chỉ dùng luật hợp giải nhị phân (binary resolution), ta chỉ triệt tiêu 1 cặp literal bù nhau và giữ lại phần còn lại:
- Hợp giải $(A \lor A)$ và $(\neg A \lor \neg A)$ sẽ sinh ra $(A \lor \neg A)$.
- Hợp giải tiếp $(A \lor \neg A)$ với các mệnh đề cũ chỉ sinh ra các mệnh đề 2-literal: $A \lor A$, $\neg A \lor \neg A$, $A \lor \neg A$. Không bao giờ thu nhỏ được độ dài mệnh đề để về mệnh đề đơn (unit clause) hay mệnh đề rỗng!
- **Giải pháp - Phép thừa số hóa (Factorization):**
  Cho phép loại bỏ các literal giống nhau trong cùng một clause:
  $$\frac{A \lor A \lor B}{A \lor B}, \qquad \frac{A \lor A}{A}$$
  Nhờ có Factorization: $(A \lor A)$ rút gọn thành $(A)$; $(\neg A \lor \neg A)$ rút gọn thành $(\neg A)$. Hợp giải $(A)$ và $(\neg A)$ thu được ngay mệnh đề rỗng $()$.

#### 7.2.7. Tính Đầy Đủ Bác Bỏ (Refutation-Completeness) Của Hệ Hợp Giải
- Hệ hợp giải tổng quát $C = \{\text{Resolution}, \text{Factorization}\}$ **không đầy đủ theo nghĩa tổng quát** (ví dụ $\{A, B\} \models A \lor B$ nhưng không thể hợp giải trực tiếp $\{A\}$ và $\{B\}$ để ra $A \lor B$).
- Nhưng hệ đạt **Tính đầy đủ bác bỏ (Refutation-completeness)**: Đối với bất kỳ tập mệnh đề không thỏa được $F$ nào, hệ luôn dẫn xuất được mệnh đề rỗng: $F \vdash ()$.
- **Thuật toán chứng minh phản chứng bằng hợp giải (Resolution Refutation Algorithm):**
  1. Cần chứng minh $KB \models Q$.
  2. Lập phủ định của kết luận $\neg Q$. Đưa toàn bộ $KB \land \neg Q$ về dạng chuẩn hội CNF.
  3. Đánh số các clause ban đầu $(1), (2), \dots, (k)$.
  4. Lặp lại việc áp dụng Resolution và Factorization: Mỗi clause mới sinh ra nếu chưa có thì thêm vào tập tri thức.
  5. Nếu sinh ra **Mệnh đề rỗng (Empty clause $()$ hoặc $\square$)**, kết luận $KB \land \neg Q$ mâu thuẫn $\implies KB \models Q$.
  6. Nếu không thể sinh thêm clause mới nào mà vẫn chưa gặp $\square$, kết luận $KB \not\models Q$.

---

### 7.3. Hệ Chứng Minh 3: Mệnh Đề Horn Và Suy Luận Tuyến Tính (Horn Clauses)

Trong thực tế công nghiệp, dạng tổng quát của Resolution vẫn có thể tốn kém. Do đó, các hệ thống tri thức (như Prolog, cơ sở dữ liệu logic) sử dụng **Mệnh đề Horn (Horn clauses)** để đạt tốc độ suy luận cực nhanh.

#### 7.3.1. Định nghĩa Mệnh đề Horn
**Mệnh đề Horn (Horn clause)** là clause có **nhiều nhất một literal dương** (at most one positive literal).
Mệnh đề Horn gồm 3 dạng cụ thể:
1. **Mệnh đề xác định / Quy tắc (Definite clause / Rule):** Có đúng 1 literal dương và ít nhất 1 literal âm:
   $$\neg A_1 \lor \dots \lor \neg A_m \lor B \quad \equiv \quad A_1 \land \dots \land A_m \Rightarrow B$$
   Trong đó $B$ là **Đầu (Head)**, và $A_1 \land \dots \land A_m$ là **Thân (Body)**.
2. **Sự thật (Fact):** Có đúng 1 literal dương và không có literal âm:
   $$B \quad \equiv \quad t \Rightarrow B$$
3. **Mệnh đề đích / Ràng buộc toàn vẹn (Goal clause / Integrity constraint):** Không có literal dương nào (chỉ toàn literal âm):
   $$\neg A_1 \lor \dots \lor \neg A_m \quad \equiv \quad A_1 \land \dots \land A_m \Rightarrow f$$

> [!NOTE]
> **Tính đóng dưới phép hợp giải (Closure under resolution):** Hợp giải của hai Mệnh đề Horn luôn luôn là một Mệnh đề Horn.

#### 7.3.2. Luật Modus Ponens Tổng Quát (Generalized Modus Ponens)
Khi $KB$ gồm các definite clauses, chỉ cần dùng Generalized Modus Ponens là đạt một calculus vừa sound vừa complete:

$$\frac{A_1, \quad A_2, \quad \dots, \quad A_m, \quad A_1 \land A_2 \land \dots \land A_m \Rightarrow B}{B}$$

#### 7.3.3. Hai thuật toán dẫn xuất trên Horn Clauses
1. **Suy diễn tiến (Forward Chaining - Data-driven reasoning):**
   - Bắt đầu từ tập các sự thật đã biết (**Facts**).
   - Khi tất cả các tiền đề trong thân của một quy tắc đều đã xuất hiện trong tập sự thật, quy tắc được kích hoạt (fire) và thêm phần đầu (Head) của nó vào tập sự thật mới.
   - Tiếp tục lặp lại cho đến khi câu truy vấn $Q$ được sinh ra hoặc không còn quy tắc nào kích hoạt được nữa.
   - **Đặc điểm:** Tự nhiên, dễ hình dung; nhưng nếu $KB$ lớn có thể suy ra nhiều sự thật dư thừa không phục vụ câu hỏi.
2. **Suy diễn lùi (Backward Chaining - Goal-driven reasoning):**
   - Bắt đầu từ câu truy vấn $Q$ (coi $Q$ là mục tiêu cần chứng minh).
   - Tìm quy tắc có Head khớp với $Q$, biến các điều kiện trong Body thành các mục tiêu con (**subgoals**).
   - Tiếp tục truy ngược đệ quy cho đến khi mọi mục tiêu con đều chạm tới các Facts đã biết.
   - **Đặc điểm:** Trọng tâm, tránh sinh tri thức thừa; là nền tảng của ngôn ngữ lập trình logic Prolog.

#### 7.3.4. Hợp Giải SLD (SLD Resolution)
Trong suy diễn lùi cho definite clauses, ta sử dụng **SLD Resolution**:
- **SLD** viết tắt của: **S**election rule driven **L**inear resolution for **D**efinite clauses.
  - *Linear (Tuyến tính):* Mỗi bước hợp giải tiếp theo luôn được thực hiện trực tiếp trên mệnh đề vừa mới sinh ra ở bước trước.
  - *Selection rule driven:* Các literal trong mệnh đề hiện tại được chọn xử lý theo một thứ tự cố định (ví dụ từ trái sang phải).
- Quy tắc suy diễn hình thức của SLD:
  $$\frac{A_1 \land \dots \land A_m \Rightarrow B_1, \qquad B_1 \land B_2 \land \dots \land B_n \Rightarrow f}{A_1 \land \dots \land A_m \land B_2 \land \dots \land B_n \Rightarrow f}$$
- Bắt đầu từ phủ định truy vấn $(Q \Rightarrow f)$, liên tục thay thế mục tiêu con bằng thân của luật có đầu khớp, triệt tiêu với các Facts cho đến khi đạt mệnh đề rỗng $()$.

---

## 8. Tính Toán Và Độ Phức Tạp (Computability & Complexity)

1. **Tính giải được (Decidability):** Logic mệnh đề là hoàn toàn **giải được (decidable)**. Bằng phương pháp bảng chân trị, ta luôn xác định được tính thỏa được, hợp thức hay mâu thuẫn của bất kỳ công thức nào trong thời gian hữu hạn.
2. **Độ phức tạp trường hợp xấu nhất (Worst-case complexity):** Duyệt bảng chân trị đòi hỏi thời gian $O(2^n)$.
3. **Định lý Cook-Levin (Cook 1971; Levin 1973):**
   - Bài toán **3-SAT** (kiểm tra tính thỏa được của công thức CNF mà mỗi clause có 3 literal) là bài toán **NP-complete**.
   - Điều này chỉ ra rằng: Khả năng cao không tồn tại thuật toán đa thức (polynomial time algorithm) tổng quát để giải bài toán SAT trên logic mệnh đề (trừ khi $P = NP$).
   - *Lý giải chữ "probably" (có lẽ) trong sách của Ertel (Exercise 2.14):* Tác giả dùng chữ "probably" vì giả thuyết $P \neq NP$ đến nay vẫn là một bài toán mở toán học thiên niên kỷ chưa được chứng minh tuyệt đối.
4. **Sức mạnh đặc biệt của Mệnh đề Horn (Linear Time Horn-SAT):**
   - Ngược lại với bài toán SAT tổng quát, bài toán thỏa được trên tập **Mệnh đề Horn** có thể giải quyết được bằng thuật toán có thời gian tính tăng **tuyến tính** $O(N)$ theo kích thước công thức! Đây là lý do Mệnh đề Horn là xương sống của các hệ thống cơ sở tri thức thời gian thực.

---

## 9. Ứng Dụng Thực Tiễn Trong Trí Tuệ Nhân Tạo (Applications in AI)

1. **Xác minh mạch số (Verification of digital circuits):** Chứng minh tính đúng đắn của thiết kế phần cứng vi mạch, bảo đảm không có lỗi logic trước khi sản xuất hàng loạt.
2. **Sinh mẫu kiểm thử vi xử lý (Test pattern generation):** Tạo tự động các bộ kiểm thử phát hiện lỗi vật lý trên chip bán dẫn.
3. **Biểu đồ quyết định nhị phân (Binary Decision Diagrams - BDD):** Cấu trúc dữ liệu nén biểu diễn hàm Boolean và xử lý suy luận mệnh đề hiệu năng cao.
4. **Hệ chuyên gia đơn giản (Simple Rule-based Expert Systems):** Vận hành với biến rời rạc, hỗ trợ chẩn đoán và tư vấn dựa trên luật Horn.
5. **Logic xác suất (Probabilistic Logic):** Kết hợp logic mệnh đề với tính toán xác suất để mô hình hóa sự không chắc chắn (sẽ học sâu tại Chapter 7).

---

## 10. Những Cạm Bẫy Dễ Mất Điểm Trong Phòng Thi (Exam Pitfalls)

1. **Nhầm lẫn giữa $\models$ và $\vdash$:** $\models$ là quan hệ mô hình ngữ nghĩa (chân trị); $\vdash$ là việc viết ra được các bước biến đổi bằng ký hiệu.
2. **Quên thêm phủ định $\neg Q$ khi chứng minh phản chứng:** Để chứng minh $KB \models Q$, ta phải đưa $KB \land \neg Q$ vào hợp giải để tìm $\square$. Nếu đưa nguyên $Q$ vào thì hoàn toàn sai phương pháp.
3. **Hợp giải đồng thời nhiều hơn một cặp literal bù nhau:**  
   *Sai lầm kinh điển:* Từ $(A \lor B)$ và $(\neg A \lor \neg B)$, gạch bỏ cả 2 cặp và kết luận sinh ra $\square$!  
   *Đúng:* Luật hợp giải chỉ được phép triệt tiêu duy nhất 1 cặp literal bù nhau trong mỗi bước. Hợp giải theo $A$ cho $(B \lor \neg B) \equiv t$; hợp giải theo $B$ cho $(A \lor \neg A) \equiv t$.
4. **Nhầm lẫn giữa Mệnh đề rỗng và Tập rỗng:**  
   Mệnh đề rỗng (Empty clause $\square$ hoặc $()$) biểu diễn điều mâu thuẫn (hằng sai $f$). Còn tập mệnh đề rỗng biểu diễn không có ràng buộc nào (hằng đúng $t$).
5. **Không dùng Factorization khi bị kẹt:** Khi các clause chứa literal lặp (như $A \lor A$), phải dùng Factorization để thu gọn thành $A$ trước khi hợp giải tiếp.

---

## 11. Tự Kiểm Tra Nhanh (Quick Self-Check)

1. **Câu hỏi:** Phân biệt sự khác nhau bản chất giữa một công thức *Valid* và một công thức *Satisfiable*. Cho ví dụ.
   - *Đáp án:* Công thức Valid (hằng đúng) phải đúng trong **mọi** mô hình khả dĩ (ví dụ: $A \lor \neg A$). Công thức Satisfiable chỉ cần đúng trong **ít nhất một** mô hình (ví dụ: $A \land B$, đúng khi $A = t, B = t$).
2. **Câu hỏi:** Phát biểu Định lý suy diễn (Deduction Theorem) và Định lý phản chứng (Proof by Contradiction).
   - *Đáp án:* 
     - Suy diễn: $A \models B \iff \ \models (A \Rightarrow B)$.
     - Phản chứng: $KB \models Q \iff KB \land \neg Q \text{ không thỏa được}$.
3. **Câu hỏi:** Tại sao luật Modus Ponens lại không đầy đủ (incomplete) cho logic mệnh đề tổng quát?
   - *Đáp án:* Vì Modus Ponens chỉ áp dụng cho dạng tiền đề $A$ và $A \Rightarrow B$. Nó bất lực trước các suy luận hợp thức khác như Modus Tollens: $\{A \Rightarrow B, \neg B\} \models \neg A$.
4. **Câu hỏi:** Tại sao một mệnh đề Horn chỉ có nhiều nhất một literal dương? Nêu 3 biến thể của nó.
   - *Đáp án:* Giới hạn $\le 1$ literal dương giúp cấu trúc logic tương đương với phép kéo theo đơn mục tiêu ($A_1 \land \dots \land A_m \Rightarrow B$). Ba biến thể gồm: Rule (1 dương, $\ge 1$ âm), Fact (1 dương, 0 âm), Goal/Constraint (0 dương, $\ge 1$ âm).
5. **Câu hỏi:** Định lý Cook-Levin phát biểu điều gì và vì sao tác giả Ertel lại dùng từ "có lẽ" (probably) khi nói về thuật toán đa thức cho 3-SAT?
   - *Đáp án:* Định lý Cook-Levin chứng minh 3-SAT là NP-complete. Dùng từ "probably" vì mệnh đề "không có thuật toán đa thức cho NP-complete" dựa trên giả thuyết chưa được chứng minh tuyệt đối là $P \neq NP$.

---

## Nguồn Tham Chiếu Đã Sử Dụng (References)

- `SlidePreparation/Propositional Logic/Propositional_Logic.pdf` (51 slides, TS. Hoàng Anh Đức).
- `SlidePreparation/Propositional Logic/Propositional_Logic_InClass.pdf` (39 slides thảo luận trên lớp).
- Wolfgang Ertel (2025), *Introduction to Artificial Intelligence*, 3rd ed., Springer, Chapter 2: "Propositional Logic", pp. 17–42.
- Stuart Russell and Peter Norvig (2021), *Artificial Intelligence: A Modern Approach*, 4th ed., Pearson, Chapter 7: "Logical Agents".
- Đề thi giữa kỳ các năm: `MAT1206E_1_Ans.pdf`, `MAT1206E_2_Ans.pdf`, `MAT3508-1.pdf`, `MAT3508-2.pdf`, `MAT3508-3.pdf`.
