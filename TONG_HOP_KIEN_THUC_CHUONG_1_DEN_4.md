# TỔNG HỢP KIẾN THỨC NƯỚC RÚT: CHƯƠNG 1 ĐẾN CHƯƠNG 4
## Cẩm Nang Thực Chiến Ôn Thi Điểm A+ Môn Nhập Môn Trí Tuệ Nhân Tạo
### (Học phần: MAT1206E / MAT3508 – VNU-HUS)

> **Khoa Toán - Cơ - Tin học, Trường Đại học Khoa học Tự nhiên (ĐHQGHN)**  
> **Nguồn tài liệu đối chiếu:** Toàn bộ slide bài giảng TS. Hoàng Anh Đức, giáo trình *Wolfgang Ertel (2025)* và *Russell & Norvig (2021)*.  
> **Quy chuẩn hiển thị:** Sử dụng ký hiệu Unicode chuẩn xác (`∀`, `∃`, `¬`, `∨`, `∧`, `=>`, `⊨`, `⊢`, `≡`), hiển thị mượt mà trên mọi thiết bị và trình đọc Markdown.

---

## 🗺️ MỤC LỤC BẢN ĐỒ KIẾN THỨC
1. [Chương 1: Tổng Quan & Triết Học Trí Tuệ Nhân Tạo](#chương-1-tổng-quan--triết-học-trí-tuệ-nhân-tạo)
2. [Chương 2: Logic Mệnh Đề (Propositional Logic - PL0)](#chương-2-logic-mệnh-đề-propositional-logic---pl0)
3. [Chương 3: Logic Vị Từ Bậc Nhất (First-Order Logic - FOL / PL1)](#chương-3-logic-vị-từ-bậc-nhất-first-order-logic---fol--pl1)
4. [Chương 4: Các Giới Hạn Của Logic (Limitations of Logic)](#chương-4-các-giới-hạn-của-logic-limitations-of-logic)
5. [Cẩm Nang Công Thức "Cheat-Sheet" & Bẫy Thi Cử Chết Người](#cẩm-nang-công-thức-cheat-sheet--bẫy-thi-cử-chết-người)

---

# CHƯƠNG 1: TỔNG QUAN & TRIẾT HỌC TRÍ TUỆ NHÂN TẠO

### 1.1. Bốn trường phái định nghĩa AI (Russell & Norvig)
AI được chia thành 4 cách tiếp cận dựa trên 2 trục: **Con người vs Duy lý (Hợp lý)** và **Suy nghĩ vs Hành động**:
* **Suy nghĩ như con người (Thinking Humanly):** Mô phỏng nhận thức, mô hình hóa mạng nơ-ron não bộ (Khoa học nhận thức - Cognitive Science).
* **Hành động như con người (Acting Humanly):** Vượt qua Phép thử Turing (Turing Test 1950).
* **Suy nghĩ duy lý (Thinking Rationally):** Quy luật tư duy của Aristotle, các tam đoạn luận và hệ logic hình thức.
* **Hành động duy lý (Acting Rationally - Chuẩn mực AI hiện đại):** Xây dựng **Tác nhân duy lý (Rational Agent)** luôn hành động nhằm tối đa hóa hiệu quả kỳ vọng đạt mục tiêu dựa trên thông tin tri giác được.

### 1.2. Các khái niệm triết học kinh điển thường thi
1. **Phép thử Turing (Turing Test - 1950):**  
   * Thiết lập: Một giám khảo con người chat văn bản qua màn hình với 1 người và 1 máy tính trong 5 phút.  
   * Điều kiện vượt qua: Máy tính đánh lừa được $\ge 30\%$ giám khảo tin rằng nó là con người.
2. **Luận cứ Căn phòng tiếng Trung (Chinese Room Argument - John Searle, 1980):**  
   * Một người không biết tiếng Trung ngồi trong phòng, dùng sách tra cứu quy tắc cú pháp để nhận ký tự tiếng Trung vào và trả ký tự tiếng Trung ra hoàn hảo.  
   * **Bản chất triết học:** **Cú pháp (Syntax) không đồng nghĩa với Ngữ nghĩa (Semantics).** Thao tác xáo trộn ký hiệu hình thức không tạo ra sự thấu hiểu hay ý thức thực sự. Phản bác lại phái *AI mạnh (Strong AI)*.
3. **Xe Braitenberg (Braitenberg Vehicles - 1984):**  
   * Xe đồ chơi cực kỳ đơn giản (2 bánh, 2 cảm biến quang nối chéo hoặc nối thẳng). Khi gặp ánh sáng, xe có hành vi phức tạp giống như "sợ hãi", "hung hăng", "yêu mến".  
   * **Bài học:** Hành vi nhìn có vẻ thông minh phức tạp có thể nảy sinh từ một cấu trúc cơ học cực kỳ thô sơ mà không cần bất kỳ sự suy luận hay ý thức nào bên trong.
4. **Hiệu ứng AI (AI Effect):**  
   * Định luật Tesler: *"AI là bất cứ thứ gì máy tính chưa làm được"*. Ngay khi máy tính giải được một bài toán (như chơi cờ vua, nhận diện khuôn mặt), con người lập tức không coi đó là trí tuệ nữa mà coi là thuật toán tính toán thuần túy.

---

# CHƯƠNG 2: LOGIC MỆNH ĐỀ (PROPOSITIONAL LOGIC - PL0)

### 2.1. Phân biệt tuyệt đối 4 ký hiệu cốt tử
* **Dấu `=>` (Phép kéo theo - Implication):** Là toán tử nối câu bên trong. Bản thân câu `A => B` có thể Đúng hoặc Sai.
* **Dấu `≡` (Tương đương logic - Equivalence):** Hai biểu thức có bảng chân trị giống hệt nhau 100% ở mọi dòng.
* **Dấu `⊨` (Hệ quả ngữ nghĩa - Entailment):** `KB ⊨ Q` nghĩa là trong mọi trường hợp làm $KB$ đúng thì $Q$ bắt buộc phải đúng (Chân lý ngoài đời thực / `Mod(KB) ⊆ Mod(Q)`).
* **Dấu `⊢` (Dẫn xuất cú pháp - Derivation):** `KB ⊢ Q` nghĩa là máy tính dùng thuật toán hình thức (như Resolution, Forward Chaining) chạy ra được $Q$.

### 2.2. Dạng chuẩn hội (CNF) & Quy trình băm câu
* **CNF (Hội của các tuyển):** Dạng `(Clause 1) ∧ (Clause 2) ∧ ...` trong đó mỗi Clause chỉ toàn chứa dấu **HOẶC (`∨`)**.
* **Công thức phá dấu mũi tên:**
  * `A => B` tương đương `¬A ∨ B` (Phủ định vế trái, giữ nguyên vế phải).
  * `¬(A => B)` tương đương `A ∧ ¬B` (Giữ nguyên vế trái, phủ định vế phải).
  * `A <=> B` tương đương `(¬A ∨ B) ∧ (¬B ∨ A)`.
* **Luật De Morgan:** `¬(A ∧ B) ≡ ¬A ∨ ¬B` và `¬(A ∨ B) ≡ ¬A ∧ ¬B`.

### 2.3. Hợp giải phản chứng (Resolution Refutation)
* **Ý tưởng:** Muốn chứng minh $Q$ đúng $\to$ Giả sử phản chứng `¬Q`, băm mọi thứ thành các dòng CNF, triệt tiêu cho đến khi nổ ra **Mệnh đề rỗng `()`**.
* **Bẫy chết người:** Mỗi bước chỉ được triệt tiêu **ĐÚNG 1 CẶP** literal đối nhau. Tuyệt đối không triệt tiêu 2 cặp cùng lúc!
* **Thừa số hóa (Factorization):** Gặp các chữ cái giống nhau trong cùng 1 dòng thì gộp lại: `B ∨ B` rút gọn thành `B`.

### 2.4. Mệnh đề Horn & Hai thuật toán suy diễn
* **Mệnh đề Horn:** Mệnh đề chứa **TỐI ĐA 1 LITERAL DƯƠNG** (dạng: `A ∧ B ∧ ... => C`).
  * *Fact (Sự thật):* Chỉ có 1 chữ dương: `A`.
  * *Rule (Quy tắc):* `A ∧ B => C` (CNF: `¬A ∨ ¬B ∨ C`).
  * *Goal (Truy vấn):* Không có chữ dương nào: `¬A ∨ ¬B` (CNF: `A ∧ B => false`).
* **Suy diễn tiến (Forward Chaining):**
  * Hướng dữ liệu (Data-driven): Đi từ Facts ban đầu $\to$ gạch dần `count` của các Rule $\to$ `count = 0` thì kích hoạt Rule ném kết luận vào `agenda` $\to$ tiến đến khi chạm tới Query $Q$. Chạy trong thời gian tuyến tính $O(N)$.
* **Suy diễn lùi (Backward Chaining / SLD Resolution):**
  * Hướng mục tiêu (Goal-driven): Bắt đầu từ Query $Q$, tìm rule có Head là $Q$, bóc tách ngược về các mục tiêu con (Body), triệt tiêu bằng Facts cho đến khi hết sạch mục tiêu (ra rỗng `()`). Trái tim của ngôn ngữ Prolog.

---

# CHƯƠNG 3: LOGIC VỊ TỪ BẬC NHẤT (FIRST-ORDER LOGIC - FOL / PL1)

### 3.1. Hai quy tắc vàng khi dịch câu tiếng tự nhiên sang FOL
1. **Lượng từ Với mọi `∀` LUÔN ĐI VỚI kéo theo `=>`:**
   * *"Mọi sinh viên đều chăm chỉ"*: `∀x ( SinhVien(x) => ChamChi(x) )` (Dùng `∧` là sai hoàn toàn).
2. **Lượng từ Tồn tại `∃` LUÔN ĐI VỚI phép và `∧`:**
   * *"Có một sinh viên chăm chỉ"*: `∃x ( SinhVien(x) ∧ ChamChi(x) )` (Dùng `=>` là sai hoàn toàn).
3. **Bẫy đảo thứ tự lượng từ:**
   * `∀x ∃y ...`: Mỗi $x$ có một $y$ riêng biệt (môn $y$ phụ thuộc sinh viên $x$).
   * `∃y ∀x ...`: Có một $y$ duy nhất dùng chung cho toàn bộ $x$ (một môn học bắt buộc cho tất cả sinh viên).

### 3.2. Skolem hóa (Skolemization) — Tuyệt chiêu khử lượng từ `∃`
* Đứng tại vị trí chữ `∃`, nhìn về phía bên trái xem có bao nhiêu chữ `∀` đứng trước nó:
  * **Trước nó có 0 chữ `∀` (đứng đầu câu):** Thay biến bằng **HẰNG SỐ Skolem**: `c` hoặc `barber`.
  * **Trước nó có 1 chữ `∀x`:** Thay biến bằng **HÀM Skolem 1 biến**: `f(x)`.
  * **Trước nó có 2 chữ `∀x, ∀z`:** Thay biến bằng **HÀM Skolem 2 biến**: `g(x, z)`.
* Sau khi khử hết `∃`, ta **vứt bỏ toàn bộ ký hiệu `∀`** đi, đưa phần thân về CNF!

### 3.3. Thuật toán Hợp nhất Robinson (Unification - MGU)
* **Mục tiêu:** Tìm phép thế `{biến / giá trị}` để 2 biểu thức trở nên giống hệt nhau.
* **Quy trình:** Quét từ trái sang phải, tìm cặp khác nhau đầu tiên (Tập bất đồng). Nếu một bên là biến, một bên là đối tượng $\to$ gán biến cho đối tượng đó.
* **Bẫy Occurs-Check (Kiểm tra lặp):** Không bao giờ được gán biến cho một hàm chứa chính nó (ví dụ: gán `x = f(x)` là **THẤT BẠI NGAY LẬP TỨC** vì gây lặp vô tận).

### 3.4. Chuẩn hóa tên biến (Standardize Apart) & Hợp giải FOL
* **Quy tắc:** Mỗi dòng (Clause) phải sở hữu tên biến riêng biệt. Dòng 1 dùng `x` thì Dòng 2 phải đổi thành `y`.
* **Hợp giải FOL:** Áp dụng MGU để các vị từ khớp nhau $\to$ triệt tiêu ra rỗng `()`.
* **Nghịch lý Thợ cạo Russell:** `∃b ∀x ( Shaves(b, x) <=> ¬Shaves(x, x) )`. Skolem hóa $b$ thành hằng `barber`, băm ra 2 dòng, dùng Factorization `{x / barber}` và `{y / barber}` rút gọn thành `¬Shaves(barber, barber)` và `Shaves(barber, barber)` $\to$ triệt tiêu ra rỗng `()` $\implies$ Chứng minh không thể tồn tại người thợ cạo như vậy!

---

# CHƯƠNG 4: CÁC GIỚI HẠN CỦA LOGIC (LIMITATIONS OF LOGIC)

### 4.1. Bài toán Chim cánh cụt Tweety & Tính đơn điệu (Monotonicity)
* **Tính đơn điệu trong Logic cổ điển:** Nếu $KB \subseteq KB'$ thì tập hệ quả $Th(KB) \subseteq Th(KB')$. Tức là tri thức mới chỉ làm tăng thêm hệ quả, không bao giờ được rút lại kết luận cũ!
* **Hậu quả:** Biết Tweety là chim $\to$ kết luận Tweety bay được. Biết thêm Tweety là cánh cụt (không bay) $\to$ trong đầu máy tính có cả `bay` và `không bay` $\implies$ Mâu thuẫn!
* **Nguyên lý bùng nổ (Ex Falso Quodlibet):** $A \land \neg A \models B$. Từ một mâu thuẫn, máy tính có thể chứng minh được bất kỳ điều vô lý nào trên đời $\implies$ Hệ thống bị phá hủy.
* **Khắc phục:** Dùng **Suy luận phi đơn điệu (Non-monotonic reasoning)** với các luật mặc định (Default logic), cho phép rút lại kết luận khi gặp ngoại lệ.

### 4.2. Thế giới Mở (OWA) vs Thế giới Đóng (CWA) — Con quạ Abraxas
* **Luật:** Chim mà không phải cánh cụt thì bay được. Abraxas là quạ (quạ là chim). Hỏi Abraxas có bay được không?
* **Giả định Thế giới Mở (OWA - Logic vị từ):** Không trả lời được (Unknown). Vì trong $KB$ không có câu nào bảo "quạ không phải cánh cụt", nhỡ vũ trụ có loài quạ cánh cụt thì sao!
* **Giả định Thế giới Đóng (CWA - Ngôn ngữ Prolog):** Cái gì tìm không thấy trong cơ sở dữ liệu thì **coi là Sai (Negation as Failure - NAF)**. Không thấy ghi Abraxas là cánh cụt $\implies$ nó không phải cánh cụt $\implies$ **Abraxas biết bay**!

### 4.3. Nan đề khung (The Frame Problem) & Mô hình STRIPS
* **Bản chất:** Khi thực hiện một hành động làm thay đổi một thuộc tính của thế giới, hầu hết những thứ khác vẫn giữ nguyên. Nhưng logic cổ điển không tự biết điều này, bắt buộc phải viết hàng triệu **Tiên đề khung (Frame Axioms)** mô tả những thứ không thay đổi (gây bùng nổ tổ hợp).
* **Giải pháp STRIPS / PDDL:** Mỗi hành động gồm 3 danh sách:
  1. **Preconditions:** Điều kiện tiên quyết để hành động chạy được.
  2. **Delete List:** Những thứ bị xóa bỏ sau hành động.
  3. **Add List:** Những thứ mới sinh ra sau hành động.
  * *Quy ước STRIPS:* Những gì không nằm trong Delete List thì **tự động giữ nguyên vẹn qua trạng thái mới**!

### 4.4. Phân biệt Xác suất (Probability) và Logic Mờ (Fuzzy Logic) — Bài toán Hai ly nước
* **Khác biệt cốt lõi:**
  * **Xác suất:** Bất định do **thiếu thông tin** (thế giới thực chỉ có Đúng hoặc Sai).
  * **Logic mờ:** Bất định do **sự mơ hồ về ranh giới khái niệm** (mức độ thuộc về tập hợp nằm liên tục trong đoạn $[0, 1]$).
* **Bài toán Hai ly nước trên sa mạc:**
  * **Ly A (Logic mờ $\mu_{\text{Độc}} = 0.05$):** Con số $0.05$ là nồng độ tạp chất rất nhỏ, nước uống được an toàn 100%!
  * **Ly B (Xác suất $P(\text{Độc}) = 0.05$):** Cứ 100 ly có đúng 5 ly chứa kịch độc xyanua chết người 100%. Uống ly B là chơi trò cò quay Nga với 5% nguy cơ tử vong!
  * 👉 **Người duy lý chắc chắn chọn uống Ly A!**

### 4.5. Giới hạn toán học tối thượng (Gödel & Turing)
* **PL0 (Logic mệnh đề):** **Decidable (Quyết định được)** — máy tính luôn dừng và kiểm tra được Đúng/Sai bằng bảng chân trị.
* **PL1 / FOL (Logic vị từ):** Chỉ là **Semi-decidable (Bán quyết định được)** — nếu câu đúng, máy tìm ra; nếu câu sai, máy có thể chạy vô tận (Halting Problem của Turing).
* **Định lý Bất toàn Gödel (1931):** Trong bất kỳ hệ tiên đề toán học hình thức nào đủ mạnh, luôn tồn tại những chân lý Đúng nhưng vĩnh viễn không thể chứng minh được từ hệ tiên đề đó!

---

# CẨM NANG CÔNG THỨC "CHEAT-SHEET" & BẪY THI CỬ CHẾT NGƯỜI

```text
┌─────────────────────────────────────────────────────────────────────────────┐
│                       CHECKLIST VÀNG PHÒNG THI                              │
├─────────────────────────────────────────────────────────────────────────────┤
│ 1. Dịch câu: ∀ luôn đi với =>  |  ∃ luôn đi với ∧                           │
│ 2. Khử => : A => B  thành  ¬A ∨ B                                           │
│ 3. Phủ định => : ¬(A => B)  thành  A ∧ ¬B                                   │
│ 4. Hợp giải: Mỗi bước CHỈ gạch 1 cặp literal đối nhau                       │
│ 5. Thừa số hóa: C ∨ C  rút gọn thành  C                                      │
│ 6. Skolem hóa: Nhìn về bên trái đếm số chữ ∀ để chọn Hằng hay Hàm            │
│ 7. Unification: Biến x nằm trong f(x) -> DỪNG NGAY (Vi phạm Occurs-Check)   │
│ 8. Forward Chaining: Bắt đầu từ Facts, đếm count về 0 để nổ domino          │
│ 9. Backward Chaining (SLD): Bắt đầu từ Query, bóc củ hành lùi về Facts       │
│ 10. Đổi tên biến: Hai dòng khác nhau phải dùng biến khác nhau (x và y)       │
└─────────────────────────────────────────────────────────────────────────────┘
```
