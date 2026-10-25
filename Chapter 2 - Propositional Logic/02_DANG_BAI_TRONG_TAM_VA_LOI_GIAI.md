# Chapter 2 – Dạng Bài Trọng Tâm Và Lời Giải Mẫu Chi Tiết
## Cẩm Nang Thực Chiến Đạt Điểm Tuyệt Đối (Chuẩn A+)

> **Môn học:** Nhập môn Trí tuệ Nhân tạo (Introduction to Artificial Intelligence - MAT1206E / MAT3508)  
> **Nguồn bài tập:** Toàn bộ Quiz và Exercises trong slide bài giảng của TS. Hoàng Anh Đức (`Propositional_Logic.pdf`, `Propositional_Logic_InClass.pdf`), giáo trình *Wolfgang Ertel 2025 (Ch. 2)*, *Russell & Norvig 2021 (Ch. 7)* và 6 bộ đề thi lưu trữ.  
> **Ngày cập nhật:** 23/10/2026

---

## Bảng Ma Trận Các Dạng Bài Thi Giữa Kỳ

| Dạng bài | Tên dạng bài toán | Xác suất xuất hiện | Độ phức tạp |
| :---: | :--- | :---: | :---: |
| **Dạng 1** | Chuyển đổi công thức logic sang dạng chuẩn hội (CNF Transformation) | **Rất cao (90%)** | Cơ bản – Trung bình |
| **Dạng 2** | Chứng minh phản chứng bằng Hợp giải (Resolution Refutation) | **Rất cao (95%)** | Trung bình – Khó |
| **Dạng 3** | Suy diễn tiến trên Mệnh đề Horn (Forward Chaining on Horn Clauses) | **Cao (80%)** | Trung bình |
| **Dạng 4** | Suy diễn lùi & Hợp giải SLD trên Horn Clauses (Backward Chaining & SLD) | **Cao (75%)** | Trung bình – Khó |
| **Dạng 5** | Kiểm tra tính thỏa được / Hợp thức bằng Bảng chân trị (Model Checking) | **Bổ trợ (50%)** | Cơ bản |

---

## DẠNG 1: CHUYỂN ĐỔI CÔNG THỨC SANG DẠNG CHUẨN HỘI (CNF TRANSFORMATION)

### 1.1. Phương pháp giải chuẩn 4 bước
Mục tiêu là đưa công thức bất kỳ về dạng hội của các mệnh đề tuyển: $K_1 \land K_2 \land \dots \land K_m$.
- **Bước 1 (Khử các phép toán dẫn xuất $\Rightarrow, \Leftrightarrow$):**
  $$A \Rightarrow B \ \equiv \ \neg A \lor B$$
  $$A \Leftrightarrow B \ \equiv \ (\neg A \lor B) \land (\neg B \lor A)$$
- **Bước 2 (Đẩy phủ định $\neg$ vào sát các biến bằng De Morgan và phủ định kép):**
  $$\neg(A \land B) \ \equiv \ \neg A \lor \neg B$$
  $$\neg(A \lor B) \ \equiv \ \neg A \land \neg B$$
  $$\neg(\neg A) \ \equiv \ A$$
- **Bước 3 (Phân phối phép tuyển $\lor$ qua phép hội $\land$):**
  $$A \lor (B \land C) \ \equiv \ (A \lor B) \land (A \lor C)$$
  $$(A \land B) \lor C \ \equiv \ (A \lor C) \land (B \lor C)$$
- **Bước 4 (Chuẩn hóa danh sách các Clause):**
  - Tách các mệnh đề nối bởi dấu $\land$ thành các clause riêng biệt.
  - Loại bỏ các literal trùng nhau trong cùng một clause: $A \lor A \lor B \equiv A \lor B$.
  - Loại bỏ clause là hằng đúng (tautology): nếu clause chứa $A \lor \neg A$, clause đó luôn đúng và có thể bỏ qua.

---

### 1.2. Các bài tập mẫu có lời giải chi tiết

#### Bài 1.1 (Biến đổi cơ bản - Phép kéo theo có vế phải là hội)
**Đề bài:** Chuyển công thức sau sang dạng chuẩn hội CNF:
$$\varphi_1 = A \Rightarrow (B \land C)$$

**Lời giải:**
1. Khử phép kéo theo:
   $$\varphi_1 \equiv \neg A \lor (B \land C)$$
2. Áp dụng luật phân phối của $\lor$ đối với $\land$:
   $$\varphi_1 \equiv (\neg A \lor B) \land (\neg A \lor C)$$
3. **Kết luận:** Dạng CNF gồm 2 clauses:
   - Clause 1: $\neg A \lor B$
   - Clause 2: $\neg A \lor C$

---

#### Bài 1.2 (Biến đổi kéo theo có vế trái là tuyển - Example 5 trên Slide)
**Đề bài:** Chuyển công thức sau sang dạng chuẩn hội CNF:
$$\varphi_2 = (A \lor B) \Rightarrow (C \land D)$$

**Lời giải:**
1. Khử phép kéo theo:
   $$\varphi_2 \equiv \neg(A \lor B) \lor (C \land D)$$
2. Đẩy dấu phủ định vào trong bằng luật De Morgan:
   $$\varphi_2 \equiv (\neg A \land \neg B) \lor (C \land D)$$
3. Phân phối phép tuyển qua phép hội lần thứ nhất:
   $$\varphi_2 \equiv [(\neg A \land \neg B) \lor C] \land [(\neg A \land \neg B) \lor D]$$
4. Phân phối phép tuyển qua phép hội lần thứ hai cho từng cụm ngoặc vuông:
   $$(\neg A \land \neg B) \lor C \equiv (\neg A \lor C) \land (\neg B \lor C)$$
   $$(\neg A \land \neg B) \lor D \equiv (\neg A \lor D) \land (\neg B \lor D)$$
5. Ghép lại bằng luật kết hợp:
   $$\varphi_2 \equiv (\neg A \lor C) \land (\neg B \lor C) \land (\neg A \lor D) \land (\neg B \lor D)$$
6. **Kết luận:** Tập CNF gồm 4 clauses:
   $$\{ \neg A \lor C, \quad \neg B \lor C, \quad \neg A \lor D, \quad \neg B \lor D \}$$

---

#### Bài 1.3 (Slide Exercise 2.9a - Biểu diễn cổng Logic XOR sang CNF)
**Đề bài:** Phát biểu hàm logic XOR (phép tuyển loại trừ) giữa hai biến $p$ và $q$: "$p \text{ XOR } q$ đúng khi và chỉ khi đúng một trong hai biến $p, q$ nhận giá trị đúng". Hãy lập công thức và đưa về dạng chuẩn hội CNF.

**Lời giải:**
1. Biểu diễn định nghĩa: $p \text{ XOR } q$ có nghĩa là $(p \lor q)$ đúng, đồng thời không thể cả hai cùng đúng $\neg(p \land q)$:
   $$\varphi_{\text{XOR}} = (p \lor q) \land \neg(p \land q)$$
2. Áp dụng luật De Morgan cho cụm thứ hai:
   $$\neg(p \land q) \equiv \neg p \lor \neg q$$
3. Thu được ngay công thức:
   $$\varphi_{\text{XOR}} \equiv (p \lor q) \land (\neg p \lor \neg q)$$
4. **Kết luận:** Đây đã là dạng chuẩn hội CNF hoàn chỉnh gồm 2 clauses:
   - Clause 1: $p \lor q$
   - Clause 2: $\neg p \lor \neg q$

---

#### Bài 1.4 (Slide Exercise 2.9b - Ít nhất 2 trong 3 biến đúng)
**Đề bài:** Thiết lập công thức logic cho phát biểu: *"Có ít nhất hai trong ba biến $A, B, C$ nhận giá trị đúng"*. Kiểm tra tính đúng đắn và biểu diễn dưới dạng CNF.

**Lời giải:**
1. **Thiết lập công thức tuyển ban đầu (DNF tự nhiên):**
   Có ít nhất 2 biến đúng nghĩa là: ($A$ và $B$ đúng) HOẶC ($B$ và $C$ đúng) HOẶC ($A$ và $C$ đúng):
   $$\varphi = (A \land B) \lor (B \land C) \lor (A \land C)$$
2. **Chuyển đổi sang CNF:**
   - Đặt $X = (A \land B) \lor (B \land C) = B \land (A \lor C)$.
   - Công thức trở thành: $\varphi = X \lor (A \land C)$.
   - Áp dụng phân phối: $\varphi \equiv (X \lor A) \land (X \lor C)$.
   - Khai triển $X \lor A$:
     $$X \lor A = [(A \land B) \lor (B \land C)] \lor A \equiv [A \lor (A \land B)] \lor (B \land C) \equiv A \lor (B \land C) \equiv (A \lor B) \land (A \lor C)$$
   - Tương tự với $X \lor C$:
     $$X \lor C \equiv (B \land (A \lor C)) \lor C \equiv (B \lor C) \land (A \lor C)$$
   - Ghép các thành phần và loại bỏ clause trùng lặp $(A \lor C)$:
     $$\varphi \equiv (A \lor B) \land (B \lor C) \land (A \lor C)$$
3. **Ý nghĩa trực giác:** Để có ít nhất 2 trong 3 biến đúng, thì trong mọi cặp 2 biến bất kỳ được chọn ra, luôn phải có ít nhất 1 biến nhận giá trị đúng.
4. **Kết luận:** Tập CNF gồm 3 clauses:
   $$\{ A \lor B, \quad B \lor C, \quad C \lor A \}$$

---

## DẠNG 2: CHỨNG MINH PHẢN CHỨNG BẰNG HỢP GIẢI (RESOLUTION REFUTATION)

### 2.1. Quy chuẩn trình bày bài thi tự luận đạt điểm tối đa
Khi làm bài thi tự luận yêu cầu chứng minh $KB \models Q$ bằng Resolution, sinh viên cần tuân thủ cấu trúc 4 phần sau:
1. **Phủ định câu hỏi (Negate the query):** Viết rõ: *"Giả sử phản chứng $\neg Q$"*.
2. **Liệt kê và đánh số các clause ban đầu:** Chuyển toàn bộ $KB \land \neg Q$ sang CNF, đánh số các clause rõ ràng: $(1), (2), (3), \dots$.
3. **Trình bày từng bước hợp giải:**
   - Ký hiệu chuẩn mực từ slide của thầy: $\text{Res}(m, n) : (\text{mệnh đề mới})_k$.
   - Ghi rõ cặp literal đối ngẫu nào đã bị triệt tiêu.
4. **Kết thúc chứng minh:** Khi hợp giải hai literal đối nhau sinh ra mệnh đề rỗng, ký hiệu là $()$ hoặc $\square$. Viết kết luận: *"Đã dẫn xuất được mệnh đề rỗng (), chứng tỏ giả thiết phản chứng sai. Vậy $KB \models Q$ (đpcm)"*.

---

### 2.2. Các bài toán kinh điển trên Slide và Đề thi

#### Bài 2.1 (Bài toán suy luận bắc cầu cơ bản)
**Đề bài:** Cho cơ sở tri thức $KB = \{A \Rightarrow B, \ B \Rightarrow C, \ A\}$. Sử dụng hệ hợp giải (Resolution calculus) chứng minh rằng $KB \models C$.

**Lời giải:**
1. **Phủ định kết luận:** Thêm $\neg C$ vào cơ sở tri thức.
2. **Chuyển sang CNF và đánh số các clause:**
   - $(1) \ \neg A \lor B$ (từ $A \Rightarrow B$)
   - $(2) \ \neg B \lor C$ (từ $B \Rightarrow C$)
   - $(3) \ A$ (sự thật ban đầu)
   - $(4) \ \neg C$ (phủ định kết luận)
3. **Các bước hợp giải (Resolution steps):**
   - $\text{Res}(2, 4)$ triệt tiêu $C$ và $\neg C$: sinh ra clause $(5) \ \neg B$.
   - $\text{Res}(1, 5)$ triệt tiêu $B$ và $\neg B$: sinh ra clause $(6) \ \neg A$.
   - $\text{Res}(3, 6)$ triệt tiêu $A$ và $\neg A$: sinh ra clause $(7) \ ()$ (mệnh đề rỗng / $\square$).
4. **Kết luận:** Đã dẫn xuất được mệnh đề rỗng $()$, chứng tỏ tập $KB \land \neg C$ không thỏa được. Vậy $KB \models C$.

---

#### Bài 2.2 (Slide Exercise 2.11a - Chứng minh công thức Hằng đúng)
**Đề bài:** Chứng minh bằng phương pháp hợp giải rằng công thức sau là một hằng đúng (tautology):
$$\Phi = ((A \lor B) \land (\neg B \lor C)) \Rightarrow (A \lor C)$$

**Lời giải:**
1. Theo Định lý 3 (Chứng minh bằng phản chứng), một công thức $\Phi$ là hằng đúng khi và chỉ khi phủ định của nó $\neg \Phi$ là không thỏa được ($\text{unsatisfiable}$).
2. **Lấy phủ định của công thức:**
   $$\neg \Phi = \neg [((A \lor B) \land (\neg B \lor C)) \Rightarrow (A \lor C)]$$
   Áp dụng tính chất $\neg(X \Rightarrow Y) \equiv X \land \neg Y$:
   $$\neg \Phi \equiv (A \lor B) \land (\neg B \lor C) \land \neg(A \lor C)$$
   Áp dụng De Morgan cho $\neg(A \lor C) \equiv \neg A \land \neg C$:
   $$\neg \Phi \equiv (A \lor B) \land (\neg B \lor C) \land \neg A \land \neg C$$
3. **Đánh số các clause:**
   - $(1) \ A \lor B$
   - $(2) \ \neg B \lor C$
   - $(3) \ \neg A$
   - $(4) \ \neg C$
4. **Tiến hành hợp giải:**
   - $\text{Res}(1, 3)$ theo cặp $A, \neg A$: thu được $(5) \ B$.
   - $\text{Res}(2, 5)$ theo cặp $B, \neg B$: thu được $(6) \ C$.
   - $\text{Res}(4, 6)$ theo cặp $C, \neg C$: thu được $(7) \ ()$ (mệnh đề rỗng).
5. **Kết luận:** $\neg \Phi \vdash ()$ nên $\neg \Phi$ mâu thuẫn. Do đó, $\Phi$ là một hằng đúng.

---

#### Bài 2.3 (Câu đố kinh điển Slide 34-35 - Gia đình người Anh "A Charming English Family")
**Đề bài:** Một người đi đường gặp ba người trong một gia đình người Anh (người cha, người mẹ, cô con gái). Họ nói các câu sau (mỗi người có 2 cách hiểu):
- Người cha: *"Chúng tôi đi Tây Ban Nha (hoặc chúng tôi đến từ Newcastle)"*.
- Người mẹ: *"Chúng tôi không đi Tây Ban Nha và đến từ Newcastle (hoặc chúng tôi đã dừng ở Paris và không đi Tây Ban Nha)"*.
- Cô con gái: *"Chúng tôi không đến từ Newcastle (hoặc chúng tôi đã dừng ở Paris)"*.
Hỏi gia đình này thực sự có đặc điểm gì? Hãy dùng logic mệnh đề và hệ hợp giải để giải quyết.

**Lời giải:**
1. **Bước 1: Hình thức hóa (Formalization):**
   Đặt các biến mệnh đề:
   - $S$: "Gia đình đi Tây Ban Nha" (Going to Spain).
   - $N$: "Gia đình đến từ Newcastle" (From Newcastle).
   - $P$: "Gia đình dừng ở Paris" (Stopped in Paris).
   
   Phát biểu của 3 người được dịch thành công thức:
   - Người cha: $S \lor N$.
   - Người mẹ: $(\neg S \land N) \lor (P \land \neg S) \equiv \neg S \land (N \lor P)$.
   - Con gái: $\neg N \lor P$.
   
   Cơ sở tri thức ban đầu:
   $$KB = (S \lor N) \land \neg S \land (N \lor P) \land (\neg N \lor P)$$

2. **Bước 2: Chuyển sang tập CNF và đánh số các clause:**
   - $(1) \ S \lor N$
   - $(2) \ \neg S$
   - $(3) \ P \lor N$
   - $(4) \ \neg N \lor P$

3. **Bước 3: Dẫn xuất bằng hợp giải:**
   - $\text{Res}(1, 2)$ triệt tiêu $S, \neg S$: thu được $(5) \ N$.
   - $\text{Res}(4, 5)$ triệt tiêu $N, \neg N$: thu được $(6) \ P$.
   - Kiểm tra lại clause $(2)$: Bản thân clause $(2)$ đã khẳng định $\neg S$.
   
4. **Chứng minh phản chứng tính đúng đắn của từng biến:**
   - Để khẳng định $\neg S$ đúng: Giả sử thêm câu hỏi $S$ là $(7)$, hợp giải $\text{Res}(2, 7) \implies ()$. Vậy $\neg S$ đúng.
   - Để khẳng định $N$ đúng: Giả sử thêm $\neg N$ là $(8)$, hợp giải $\text{Res}(5, 8) \implies ()$. Vậy $N$ đúng.
   - Để khẳng định $P$ đúng: Giả sử thêm $\neg P$ là $(9)$, hợp giải $\text{Res}(6, 9) \implies ()$. Vậy $P$ đúng.

5. **Kết luận:**
   Kết quả suy luận logic là: $\neg S \land N \land P$.  
   *Ý nghĩa:* Gia đình này **đến từ Newcastle ($N$)**, **đã dừng ở Paris ($P$)**, nhưng **không đi Tây Ban Nha ($\neg S$)**.

---

#### Bài 2.4 (Câu đố kinh điển Slide 36-37 - Cuộc thi nhảy cao "The High Jump")
**Đề bài:** Ba cô gái $A, B, C$ tham gia thi nhảy cao vượt mức xà $1.20\text{m}$.
- Bạn thứ nhất nói với bạn thứ hai: *"Tớ sẽ nhảy qua nếu và chỉ nếu cậu không qua"*.
- Bạn thứ hai nói câu tương tự với bạn thứ ba: *"Tớ sẽ nhảy qua nếu và chỉ nếu cậu không qua"*.
- Bạn thứ ba lại nói câu tương tự với bạn thứ nhất: *"Tớ sẽ nhảy qua nếu và chỉ nếu cậu không qua"*.
Hỏi có thể xảy ra trường hợp cả 3 bạn cùng thắng vụ cá cược này hay không? Chứng minh bằng phương pháp hợp giải.

**Lời giải:**
1. **Bước 1: Hình thức hóa (Formalization):**
   Gọi các biến mệnh đề:
   - $A$: "Bạn thứ nhất nhảy thành công".
   - $B$: "Bạn thứ hai nhảy thành công".
   - $C$: "Bạn thứ ba nhảy thành công".
   
   Phát biểu cược của 3 bạn:
   - Cược 1: $A \Leftrightarrow \neg B$
   - Cược 2: $B \Leftrightarrow \neg C$
   - Cược 3: $C \Leftrightarrow \neg A$
   
   Ta cần chứng minh rằng không thể cả 3 bạn cùng thắng cuộc, tức là chứng minh công thức sau là hằng đúng:
   $$Q = \neg \Big( (A \Leftrightarrow \neg B) \land (B \Leftrightarrow \neg C) \land (C \Leftrightarrow \neg A) \Big)$$
   Áp dụng phản chứng, ta cần chứng minh rằng $\neg Q$ là không thỏa được ($\neg Q \vdash ()$).

2. **Bước 2: Biến đổi $\neg Q$ sang dạng chuẩn hội CNF:**
   $$\neg Q = (A \Leftrightarrow \neg B) \land (B \Leftrightarrow \neg C) \land (C \Leftrightarrow \neg A)$$
   Biến đổi từng tương đương:
   - $A \Leftrightarrow \neg B \equiv (A \Rightarrow \neg B) \land (\neg B \Rightarrow A) \equiv (\neg A \lor \neg B) \land (B \lor A)$.
   - $B \Leftrightarrow \neg C \equiv (\neg B \lor \neg C) \land (C \lor B)$.
   - $C \Leftrightarrow \neg A \equiv (\neg C \lor \neg A) \land (A \lor C)$.
   
   Tập CNF gồm đúng 6 clauses:
   - $(1) \ \neg A \lor \neg B$
   - $(2) \ A \lor B$
   - $(3) \ \neg B \lor \neg C$
   - $(4) \ B \lor C$
   - $(5) \ \neg C \lor \neg A$
   - $(6) \ C \lor A$

3. **Bước 3: Thực hiện Hợp giải triệt tiêu:**
   - $\text{Res}(1, 6)$ triệt tiêu $A, \neg A$: thu được $(7) \ \neg B \lor C$.
   - $\text{Res}(4, 7)$ triệt tiêu $B, \neg B$: thu được $(8) \ C \lor C \equiv (C)$ (nhờ phép Factorization).
   - $\text{Res}(2, 5)$ triệt tiêu $A, \neg A$: thu được $(9) \ B \lor \neg C$.
   - $\text{Res}(3, 9)$ triệt tiêu $B, \neg B$: thu được $(10) \ \neg C \lor \neg C \equiv (\neg C)$ (nhờ phép Factorization).
   - $\text{Res}(8, 10)$ triệt tiêu $C, \neg C$: thu được $(11) \ ()$ (mệnh đề rỗng / mâu thuẫn).

4. **Kết luận:**  
   Từ $\neg Q$ đã suy ra mệnh đề rỗng $()$, chứng tỏ $\neg Q$ không thỏa được. Do đó, **không thể có chuyện cả 3 bạn cùng thắng cược**!

---

#### Bài 2.5 (Slide Exercise 2.10 - Bài toán vụ án hình sự "The Criminal Case")
**Đề bài:** Một thám tử điều tra một vụ án và thu thập được các manh mối sau:
1. *"Nếu tên tội phạm có đồng phạm, thì hắn đã tẩu thoát bằng ô tô"*.
2. *"Tên tội phạm không có đồng phạm và không có chìa khóa, HOẶC hắn có chìa khóa và có đồng phạm"*.
3. *"Tên tội phạm có chìa khóa"*.
Hỏi: Tên tội phạm có tẩu thoát bằng ô tô hay không? Hãy chứng minh bằng hệ hợp giải.

**Lời giải:**
1. **Bước 1: Hình thức hóa:**
   Đặt các biến mệnh đề:
   - $A$: "Tội phạm có đồng phạm" (Accomplice).
   - $C$: "Tội phạm đi bằng ô tô" (Car).
   - $K$: "Tội phạm có chìa khóa" (Key).
   
   Cơ sở tri thức $KB$:
   - Manh mối 1: $A \Rightarrow C \equiv \neg A \lor C$.
   - Manh mối 2: $(\neg A \land \neg K) \lor (K \land A)$.
   - Manh mối 3: $K$.
   
   Câu hỏi: Tội phạm có đi ô tô không? Truy vấn: $Q = C$.

2. **Bước 2: Chuyển đổi Manh mối 2 sang CNF:**
   $$(\neg A \land \neg K) \lor (K \land A) \equiv [(\neg A \land \neg K) \lor K] \land [(\neg A \land \neg K) \lor A]$$
   - Cụm 1: $(\neg A \land \neg K) \lor K \equiv (\neg A \lor K) \land (\neg K \lor K) \equiv \neg A \lor K$ (vì $\neg K \lor K \equiv t$).
   - Cụm 2: $(\neg A \land \neg K) \lor A \equiv (\neg A \lor A) \land (\neg K \lor A) \equiv \neg K \lor A$ (vì $\neg A \lor A \equiv t$).
   Vậy Manh mối 2 trở thành: $(\neg A \lor K) \land (\neg K \lor A)$.

3. **Bước 3: Lập danh sách các Clause (kèm phủ định truy vấn $\neg C$):**
   - $(1) \ \neg A \lor C$ (Manh mối 1)
   - $(2) \ \neg A \lor K$ (Manh mối 2)
   - $(3) \ \neg K \lor A$ (Manh mối 2)
   - $(4) \ K$ (Manh mối 3)
   - $(5) \ \neg C$ (Phủ định truy vấn)

4. **Bước 4: Tiến hành hợp giải:**
   - $\text{Res}(3, 4)$ triệt tiêu $K, \neg K$: sinh ra $(6) \ A$.
   - $\text{Res}(1, 6)$ triệt tiêu $A, \neg A$: sinh ra $(7) \ C$.
   - $\text{Res}(5, 7)$ triệt tiêu $C, \neg C$: sinh ra $(8) \ ()$ (mệnh đề rỗng).

5. **Kết luận:**
   Ta thu được mệnh đề rỗng $()$, vậy truy vấn $C$ là đúng. Tên tội phạm **chắc chắn đã tẩu thoát bằng xe hơi**.

---

## DẠNG 3: SUY DIỄN TIẾN TRÊN MỆNH ĐỀ HORN (FORWARD CHAINING)

### 3.1. Thuật toán Forward Chaining chuẩn (Russell & Norvig / Ertel)
Thuật toán suy diễn tiến là giải thuật hướng dữ liệu (data-driven):
- **Cấu trúc dữ liệu:**
  - `count[rule]`: Mảng lưu số lượng tiền đề trong Body của rule chưa được thỏa mãn.
  - `inferred[atom]`: Bảng băm/mảng đánh dấu biến nào đã được suy ra (tránh lặp vô hạn).
  - `agenda`: Hàng đợi lưu các sự thật (Facts) mới phát hiện đang chờ lan truyền.
- **Vòng lặp chính:**
  1. Lấy $p$ từ `agenda`.
  2. Với mỗi quy tắc mà $p$ xuất hiện trong Body:
     - Giảm `count[rule]` đi 1 đơn vị.
     - Nếu `count[rule] == 0` (mọi điều kiện tiên quyết đã đủ):
       - Lấy kết luận $q$ ở Head của quy tắc.
       - Nếu $q == Q$ (đích đến): Dừng lại và trả về **Thành công (True)**.
       - Nếu $q$ chưa nằm trong `inferred`, đánh dấu `inferred[q] = true` và đẩy $q$ vào `agenda`.
  3. Nếu `agenda` rỗng mà chưa gặp $Q$, trả về **Thất bại (False)**.

---

### 3.2. Bài tập mẫu chi tiết (AND-OR Graph - Russell & Norvig Fig. 7.16 trên Slide In-Class)

**Đề bài:** Cho cơ sở tri thức gồm các Mệnh đề Horn sau:
- Facts:
  - $(1) \ A$
  - $(2) \ B$
- Rules:
  - $(3) \ A \land B \Rightarrow L$
  - $(4) \ A \land P \Rightarrow L$
  - $(5) \ B \land L \Rightarrow M$
  - $(6) \ L \land M \Rightarrow P$
  - $(7) \ P \Rightarrow Q$

Query cần kiểm tra: $Q$. Hãy mô phỏng chi tiết từng bước hoạt động của thuật toán Forward Chaining.

**Lời giải:**

**1. Khởi tạo trạng thái ban đầu:**
- `agenda` = $[A, B]$
- `inferred` = $\{A: \text{true}, \ B: \text{true}, \ L: \text{false}, \ M: \text{false}, \ P: \text{false}, \ Q: \text{false}\}$
- Khởi tạo mảng `count`:
  - `count[Rule 3]` = 2 (cần $A, B$)
  - `count[Rule 4]` = 2 (cần $A, P$)
  - `count[Rule 5]` = 2 (cần $B, L$)
  - `count[Rule 6]` = 2 (cần $L, M$)
  - `count[Rule 7]` = 1 (cần $P$)

**2. Bảng truy vết từng bước (Execution Trace):**

| Bước | Lấy từ Agenda | Xử lý các quy tắc chứa biến | Cập nhật Count | Trạng thái kích hoạt (Count == 0) | Biến mới đẩy vào Agenda |
| :---: | :---: | :--- | :--- | :---: | :---: |
| **0** | Khởi tạo | - | - | - | $[A, B]$ |
| **1** | Lấy $A$ | Rule 3 có $A$<br>Rule 4 có $A$ | `count[3]` giảm $2 \to 1$<br>`count[4]` giảm $2 \to 1$ | Chưa có rule nào về 0 | $[B]$ |
| **2** | Lấy $B$ | Rule 3 có $B$<br>Rule 5 có $B$ | `count[3]` giảm $1 \to 0$<br>`count[5]` giảm $2 \to 1$ | **Rule 3 kích hoạt!**<br>Sinh kết luận $L$ | $[L]$ |
| **3** | Lấy $L$ | Rule 5 có $L$<br>Rule 6 có $L$ | `count[5]` giảm $1 \to 0$<br>`count[6]` giảm $2 \to 1$ | **Rule 5 kích hoạt!**<br>Sinh kết luận $M$ | $[M]$ |
| **4** | Lấy $M$ | Rule 6 có $M$ | `count[6]` giảm $1 \to 0$ | **Rule 6 kích hoạt!**<br>Sinh kết luận $P$ | $[P]$ |
| **5** | Lấy $P$ | Rule 4 có $P$<br>Rule 7 có $P$ | `count[4]` giảm $1 \to 0$<br>`count[7]` giảm $1 \to 0$ | **Rule 7 kích hoạt!**<br>Sinh kết luận $Q$ | $[Q]$ |
| **6** | Gặp $Q$ | - | - | **Trùng với Query $Q$!** | **DỪNG VÀ KẾT LUẬN THÀNH CÔNG** |

**Kết luận:** $KB \models Q$. Chuỗi quy tắc được kích hoạt là: $\text{Rule } 3 \to \text{Rule } 5 \to \text{Rule } 6 \to \text{Rule } 7$.

---

## DẠNG 4: SUY DIỄN LÙI VÀ HỢP GIẢI SLD (BACKWARD CHAINING & SLD RESOLUTION)

### 4.1. Cơ chế hoạt động của Hợp giải SLD
- Bắt đầu từ phủ định truy vấn: đặt câu hỏi dạng mục tiêu $Q \Rightarrow f$ (hay clause $\neg Q$).
- Tìm một rule có Head khớp với mục tiêu đầu tiên trong danh sách mục tiêu.
- Thay thế mục tiêu đó bằng các điều kiện tiên quyết (Body) của rule.
- Tiếp tục cho đến khi gặp các Facts để triệt tiêu dần các mục tiêu con.
- Nếu danh sách mục tiêu con trở thành rỗng (Empty stack), kết luận chứng minh thành công ($()$).

---

### 4.2. Bài tập mẫu chi tiết (Slide Exercise 2.16 - Bài tập 47 trên Slide)

**Đề bài:** Cho tập Mệnh đề Horn sau:
- $(1) \ A$
- $(2) \ B$
- $(3) \ C$
- $(4) \ D$
- $(5) \ E$
- $(6) \ A \land B \land C \Rightarrow F$
- $(7) \ A \land D \Rightarrow G$
- $(8) \ C \land F \land E \Rightarrow H$
- $(9) \ H \Rightarrow f$ (đích cần bác bỏ: mục tiêu $H$)

Hãy dùng Hợp giải SLD (SLD Resolution) chứng minh tập mệnh đề trên là không thỏa được (unsatisfiable).

**Lời giải (Vết thực thi SLD chuẩn):**

Theo quy tắc SLD: Luôn lấy clause dẫn xuất hiện tại hợp giải với một definite clause có Head khớp với mục tiêu con:

1. **Bắt đầu từ mục tiêu:**
   $$(9) \ H \Rightarrow f$$
2. **Bước 1: Hợp giải với Rule 8 (có Head là $H$):**
   $$\text{Res}(9, 8): \quad C \land F \land E \Rightarrow f \qquad (10)$$
3. **Bước 2: Triệt tiêu mục tiêu con $C$ bằng Fact 3:**
   $$\text{Res}(10, 3): \quad F \land E \Rightarrow f \qquad (11)$$
4. **Bước 3: Hợp giải mục tiêu con $F$ với Rule 6 (có Head là $F$):**
   $$\text{Res}(11, 6): \quad A \land B \land C \land E \Rightarrow f \qquad (12)$$
5. **Bước 4: Triệt tiêu mục tiêu con $A$ bằng Fact 1:**
   $$\text{Res}(12, 1): \quad B \land C \land E \Rightarrow f \qquad (13)$$
6. **Bước 5: Triệt tiêu mục tiêu con $B$ bằng Fact 2:**
   $$\text{Res}(13, 2): \quad C \land E \Rightarrow f \qquad (14)$$
7. **Bước 6: Triệt tiêu mục tiêu con $C$ bằng Fact 3:**
   $$\text{Res}(14, 3): \quad E \Rightarrow f \qquad (15)$$
8. **Bước 7: Triệt tiêu mục tiêu con $E$ bằng Fact 5:**
   $$\text{Res}(15, 5): \quad () \qquad (\text{Mệnh đề rỗng / } \square)$$

**Kết luận:** Đã dẫn xuất được mệnh đề rỗng $()$, chứng tỏ tập Horn clause trên là không thỏa được ($\text{unsatisfiable}$).

---

## DẠNG 5: KIỂM TRA MÔ HÌNH BẰNG BẢNG CHÂN TRỊ (MODEL CHECKING)

### Bài tập mẫu (Slide In-Class 21)
**Đề bài:** Cho cơ sở tri thức $KB = \{\text{Study} \Rightarrow \text{Pass}, \ \text{Pass} \Rightarrow \text{Happy}, \ \text{Study}\}$ và câu truy vấn $Q = \text{Happy}$. Lập bảng chân trị đầy đủ để kiểm tra xem $KB \models Q$ có đúng hay không.

**Lời giải:**
Đặt các biến viết tắt: $St$ = Study, $Pa$ = Pass, $Ha$ = Happy. Có 3 biến nên có $2^3 = 8$ phép gán chân trị.
$KB = (St \Rightarrow Pa) \land (Pa \Rightarrow Ha) \land St$.

| $St$ | $Pa$ | $Ha$ | $St \Rightarrow Pa$ | $Pa \Rightarrow Ha$ | $St$ | $KB$ | $Q \ (Ha)$ | Đánh giá |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| $f$ | $f$ | $f$ | $t$ | $t$ | $f$ | $f$ | $f$ | Bỏ qua (KB sai) |
| $f$ | $f$ | $t$ | $t$ | $t$ | $f$ | $f$ | $t$ | Bỏ qua (KB sai) |
| $f$ | $t$ | $f$ | $t$ | $f$ | $f$ | $f$ | $f$ | Bỏ qua (KB sai) |
| $f$ | $t$ | $t$ | $t$ | $t$ | $f$ | $f$ | $t$ | Bỏ qua (KB sai) |
| $t$ | $f$ | $f$ | $f$ | $t$ | $t$ | $f$ | $f$ | Bỏ qua (KB sai) |
| $t$ | $f$ | $t$ | $f$ | $t$ | $t$ | $f$ | $t$ | Bỏ qua (KB sai) |
| $t$ | $t$ | $f$ | $t$ | $f$ | $t$ | $f$ | $f$ | Bỏ qua (KB sai) |
| **$t$** | **$t$** | **$t$** | **$t$** | **$t$** | **$t$** | **$t$** | **$t$** | **Mô hình duy nhất của KB! Tại đây Q = t.** |

**Kết luận:**
- Chỉ có đúng 1 phép gán (dòng cuối cùng) làm cho $KB = t$ (tức $\text{Mod}(KB) = \{(t, t, t)\}$).
- Tại dòng này, $Q$ cũng nhận giá trị $t$.
- Do đó $\text{Mod}(KB) \subseteq \text{Mod}(Q)$, chứng minh được $KB \models Q$.
