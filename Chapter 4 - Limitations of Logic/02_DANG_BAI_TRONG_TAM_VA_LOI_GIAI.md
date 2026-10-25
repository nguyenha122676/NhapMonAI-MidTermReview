# Chapter 4 – Dạng Bài Trọng Tâm Và Lời Giải Mẫu Chi Tiết
## Cẩm Nang Thực Chiến Tự Luận Đạt Điểm Tuyệt Đối (Chuẩn A+)

> **Môn học:** Nhập môn Trí tuệ Nhân tạo (Introduction to Artificial Intelligence - MAT1206E / MAT3508)  
> **Nguồn bài tập:** Toàn bộ Quiz và Exercises trong slide bài giảng của TS. Hoàng Anh Đức (`Limitations_of_Logic.pdf`, `Limitations_of_Logic_InClassDisscusion.pdf`), giáo trình *Wolfgang Ertel (2025, Chapter 4)*, và các tệp thực nghiệm TPTP (`tweety_kb1.p` đến `tweety_kb_inconsistent.p`).  
> **Ngày cập nhật:** 23/10/2026

---

## Bảng Ma Trận Các Dạng Bài Tự Luận – Chapter 4

| Dạng bài | Tên dạng bài toán | Mức độ ưu tiên | Trọng số điểm |
| :---: | :--- | :---: | :---: |
| **Dạng 1** | Phân tích bài toán Tweety, Tính đơn điệu & Nguyên lý bùng nổ | **Rất cao (95%)** | 1.5 – 2.0 điểm |
| **Dạng 2** | Giả định thế giới mở (OWA) vs Thế giới đóng (CWA) & Con quạ Abraxas | **Rất cao (90%)** | 1.5 điểm |
| **Dạng 3** | Bài toán khung (The Frame Problem) & Giải pháp Situation Calculus / STRIPS | **Cao (85%)** | 1.5 điểm |
| **Dạng 4** | Nghịch lý Bác thợ cạo & Định lý Bất toàn Gödel | **Cao (80%)** | 1.5 điểm |
| **Dạng 5** | Phân biệt toán học giữa Lý thuyết Xác suất và Logic Mờ (Fuzzy Logic) | **Cao (80%)** | 1.5 điểm |

---

## DẠNG 1: BÀI TOÁN CHIM CÁNH CỤT TWEETY, TÍNH ĐƠN ĐIỆU & NGUYÊN LÝ BÙNG NỔ

### 1.1. Khung lý thuyết và phương pháp phân tích
- **Cơ sở tri thức ban đầu $KB_1$:**
  1. $P_1: \text{penguin}(\text{tweety})$
  2. $P_2: \forall x (\text{penguin}(x) \Rightarrow \text{bird}(x))$
  3. $P_3: \forall x (\text{bird}(x) \Rightarrow \text{fly}(x))$
  $\implies KB_1 \models \text{fly}(\text{tweety})$.
- **Thêm sự thật thực tế $P_4: \forall x (\text{penguin}(x) \Rightarrow \neg \text{fly}(x))$ tạo thành $KB_2$:**
  - $KB_2 \models \text{fly}(\text{tweety})$ (qua nhánh $P_1, P_2, P_3$).
  - $KB_2 \models \neg \text{fly}(\text{tweety})$ (qua nhánh $P_1, P_4$).
  - $\implies KB_2 \models \text{fly}(\text{tweety}) \land \neg \text{fly}(\text{tweety})$ (Mâu thuẫn!).
- **Nguyên lý bùng nổ (Ex Falso Quodlibet):**
  Trong logic cổ điển, từ một mâu thuẫn ($A \land \neg A$), ta có thể chứng minh được bất kỳ câu $B$ nào:
  $$A \land \neg A \models B$$

---

### 1.2. Bài tập mẫu có lời giải chi tiết

#### Bài 1.1 (Chứng minh Nguyên lý bùng nổ bằng Hợp giải)
**Đề bài:** Cho cơ sở tri thức mâu thuẫn $KB = \{P, \neg P\}$. Sử dụng hệ hợp giải (Resolution calculus), hãy chứng minh rằng ta có thể suy ra một kết luận hoàn toàn vô lý $Q = \text{Mặt trời mọc ở hướng Tây}$.

**Lời giải mẫu:**
1. Áp dụng Định lý chứng minh phản chứng (Theorem 2): Để chứng minh $KB \models Q$, ta thêm phủ định của kết luận $\neg Q$ vào $KB$ và chứng minh tập mới dẫn xuất ra mệnh đề rỗng $\square$.
2. Danh sách các clause:
   - $(1) \ P$ (tiền đề của $KB$)
   - $(2) \ \neg P$ (tiền đề của $KB$)
   - $(3) \ \neg Q$ (phủ định của câu hỏi $Q$)
3. Tiến hành hợp giải:
   - Hợp giải trực tiếp clause (1) và clause (2):
     $$\text{Res}(1, 2) \implies () \quad (\text{Mệnh đề rỗng / } \square)$$
4. **Kết luận:**
   Ta đã sinh ra mệnh đề rỗng $\square$ ngay tại bước đầu tiên mà thậm chí **không cần quan tâm đến clause $(3)$ chứa $Q$ là gì**!  
   Điều này chứng minh rằng: Một khi $KB$ chứa mâu thuẫn, thì **MỌI CÂU $Q$ BẤT KỲ ĐỀU TRỞ THÀNH HỆ QUẢ LOGIC**. Cơ sở tri thức chính thức bị phá hủy hoàn toàn.

---

#### Bài 1.2 (Tính đơn điệu và cách khắc phục trong Non-monotonic Logic)
**Đề bài:** Hãy phát biểu định nghĩa toán học của Tính đơn điệu (Monotonicity) trong Logic cổ điển. Tại sao tính chất này khiến logic cổ điển bất lực trước bài toán chim cánh cụt Tweety? Nêu cơ chế giải quyết của Suy luận phi đơn điệu (Non-monotonic reasoning).

**Lời giải mẫu:**
1. **Định nghĩa toán học của Tính đơn điệu:**
   Một hệ suy diễn $\vdash$ (hoặc kéo theo $\models$) được gọi là đơn điệu nếu với hai cơ sở tri thức bất kỳ thỏa mãn $KB \subseteq KB'$, thì tập hợp tất cả các hệ quả của chúng cũng thỏa mãn quan hệ bao hàm tương ứng:
   $$\text{Nếu } KB \subseteq KB' \implies \text{Th}(KB) \subseteq \text{Th}(KB')$$
   *(Nói cách khác: Việc bổ sung thêm các sự thật mới vào cơ sở tri thức chỉ làm tăng thêm tập hệ quả, không bao giờ làm mất đi các kết luận đã được chứng minh trước đó).*

2. **Hạn chế đối với kịch bản Tweety:**
   - Khi biết Tweety là chim, hệ thống chứng minh ra $\text{fly}(\text{tweety})$.
   - Khi phát hiện Tweety là chim cánh cụt, do tính đơn điệu, kết luận $\text{fly}(\text{tweety})$ vẫn mãi mãi tồn tại trong tập hệ quả. Việc nạp thêm $\neg \text{fly}(\text{tweety})$ không thể "xóa" kết luận cũ mà chỉ dẫn đến mâu thuẫn phá hủy hệ thống.
   - Logic cổ điển thiếu khả năng "rút lại phán đoán" (belief revision) khi có thông tin mới mâu thuẫn với giả định ban đầu.

3. **Cơ chế của Suy luận phi đơn điệu (Non-monotonic Reasoning):**
   - Áp dụng các **Quy tắc mặc định (Default Rules)**: *"Nếu $x$ là chim, và KHÔNG CÓ BẰNG CHỨNG cho thấy $x$ không biết bay, thì ngầm định $x$ biết bay"*.
   - Khi chưa biết Tweety là cánh cụt, điều kiện kiểm tra thông qua $\implies$ chấp nhận Tweety bay được.
   - Khi nhận được dữ kiện mới $\text{penguin}(\text{tweety})$, điều kiện giả định bị vi phạm $\implies$ hệ thống **tự động rút lại (withdraw)** kết luận Tweety bay được mà không làm phát sinh mâu thuẫn!

---

## DẠNG 2: THẾ GIỚI MỞ (OWA) VS THẾ GIỚI ĐÓNG (CWA) & CON QUẠ ABRAXAS

#### Bài 2.1 (Phân tích kịch bản con quạ Abraxas trên Slide 16)
**Đề bài:** Cho cơ sở tri thức đã sửa đổi ngoại lệ:
$$KB = \{ \forall x (\text{bird}(x) \land \neg \text{penguin}(x) \Rightarrow \text{fly}(x)), \quad \text{raven}(\text{abraxas}), \quad \forall x (\text{raven}(x) \Rightarrow \text{bird}(x)) \}$$
1. Tại sao máy tính sử dụng Logic vị từ bậc nhất lại không thể trả lời câu hỏi: *"Abraxas có bay được không?"* ($\text{fly}(\text{abraxas})$)?
2. Phân tích nguyên nhân từ Giả định thế giới mở (Open World Assumption - OWA).
3. Nếu chuyển sang Giả định thế giới đóng (Closed World Assumption - CWA) trong Prolog, câu trả lời sẽ thay đổi như thế nào?

**Lời giải mẫu:**
1. **Lý do máy tính trả về "Unknown" trong PL1:**
   - Để suy ra $\text{fly}(\text{abraxas})$, quy tắc đòi hỏi phải chứng minh đồng thời 2 điều kiện:
     - Điều kiện 1: $\text{bird}(\text{abraxas})$ $\implies$ Đúng (vì Abraxas là quạ, và quạ là chim).
     - Điều kiện 2: $\neg \text{penguin}(\text{abraxas})$ $\implies$ **Bế tắc!**
   - Trong $KB$ không có bất kỳ khẳng định hay tiên đề nào tuyên bố rằng con quạ Abraxas không phải là chim cánh cụt!

2. **Bản chất của Giả định Thế giới Mở (OWA):**
   - OWA quy ước: Một phát biểu chưa được chứng minh là Đúng trong cơ sở tri thức thì **không có nghĩa là nó Sai**; nó có thể Đúng hoặc Sai trong các mô hình khác nhau.
   - Vì thế giới mở cho phép khả năng tồn tại một loài quạ cánh cụt chưa từng được biết đến, nên PL1 không thể tự suy diễn ra $\neg \text{penguin}(\text{abraxas})$.
   - Muốn chứng minh Abraxas bay được trong OWA, ta bắt buộc phải nạp thêm tiên đề: $\forall x (\text{raven}(x) \Rightarrow \neg \text{penguin}(x))$.

3. **Sự thay đổi dưới Giả định Thế giới Đóng (CWA) trong Prolog:**
   - CWA quy ước: Bất kỳ điều gì không chứng minh được từ cơ sở tri thức thì **ngầm định là SAI** (**Phủ định dưới dạng thất bại - Negation as Failure**).
   - Khi Prolog truy vấn mục tiêu `\+ penguin(abraxas)`: Hệ thống tìm kiếm trong cơ sở dữ liệu không thấy sự thật nào nói Abraxas là cánh cụt $\implies$ việc chứng minh `penguin(abraxas)` thất bại $\implies$ `\+ penguin(abraxas)` trả về **True**!
   - Kết quả: Dưới CWA, máy tính lập tức kết luận **Abraxas biết bay** mà không cần phải nạp hàng nghìn luật phủ định chéo vô ích!

---

## DẠNG 3: BÀI TOÁN KHUNG (THE FRAME PROBLEM) TRONG LẬP KẾ HOẠCH

#### Bài 3.1 (Hiện tượng sơn nhà và giải pháp Situation Calculus / STRIPS)
**Đề bài:** Hãy giải thích "Bài toán khung" (The Frame Problem) trong biểu diễn tri thức bằng logic hình thức. Lấy ví dụ minh họa hành động robot sơn nhà. Trình bày cách tiếp cận giải quyết bài toán này trong mô hình lập kế hoạch STRIPS/PDDL.

**Lời giải mẫu:**
1. **Bản chất của Bài toán khung (The Frame Problem):**
   - Khi một tác nhân thực hiện một hành động làm thay đổi một khía cạnh của thế giới, **hầu hết các khía cạnh và thuộc tính khác của thế giới vẫn giữ nguyên không đổi**.
   - Tuy nhiên, trong logic cổ điển, máy tính không tự nhận biết được điều gì được giữ nguyên. Để mô hình hóa, lập trình viên buộc phải viết ra một số lượng khổng lồ các **Tiên đề khung (Frame Axioms)** mô tả tất cả những thứ KHÔNG THAY ĐỔI sau mỗi hành động.
   - Số lượng tiên đề khung bùng nổ theo cấp số nhân:
     $$\text{Số tiên đề khung} \approx |\mathcal{A}| \times |\mathcal{F}|$$
     *(với $|\mathcal{A}|$ là số hành động và $|\mathcal{F}|$ là số thuộc tính trạng thái).*

2. **Ví dụ robot sơn nhà:**
   - Ban đầu: Ngôi nhà ở tọa độ $(10, 20)$, có 4 cửa sổ, thuộc sở hữu của ông John, và có màu xanh.
   - Hành động: Robot sơn nhà thành màu đỏ: $\text{paint}(\text{house}, \text{red})$.
   - Nếu chỉ có luật: $\text{paint}(x, y) \Rightarrow \text{color}(x, y)$, sau khi sơn:
     - Máy tính kết luận nhà **vừa đỏ vừa xanh** (vì màu xanh cũ chưa bị rút lại).
     - Máy tính không biết vị trí nhà có bị dời đi không, số cửa sổ có còn 4 không, chủ nhà có đổi không nếu không có các tiên đề khung phụ trợ!

3. **Giải pháp giải cứu trong mô hình lập kế hoạch STRIPS / PDDL:**
   - STRIPS (Stanford Research Institute Problem Solver) từ bỏ cách tiếp cận logic hình thức ngây thơ, mô hình hóa mỗi hành động $A$ thành 3 danh sách tường minh:
     1. **Preconditions (Điều kiện tiên quyết):** Những sự thật bắt buộc phải đúng để hành động thực thi được (ví dụ: Robot phải có sơn đỏ và đang ở cạnh nhà).
     2. **Delete List (Danh sách xóa):** Những sự thật **bị hủy bỏ / không còn đúng** sau hành động (ví dụ: Xóa $\text{color}(\text{house}, \text{blue})$).
     3. **Add List (Danh sách thêm):** Những sự thật **mới sinh ra** sau hành động (ví dụ: Thêm $\text{color}(\text{house}, \text{red})$).
   - **Quy ước ngầm định (STRIPS Assumption):** Mọi sự thật khác không nằm trong Delete List đều **tự động giữ nguyên vẹn** qua trạng thái mới mà không cần viết bất kỳ tiên đề khung nào!

---

## DẠNG 4: PHÂN BIỆT XÁC SUẤT VÀ LOGIC MỜ (FUZZY LOGIC)

#### Bài 4.1 (Bài toán hai ly nước kinh điển)
**Đề bài:** Hãy giải thích sự khác biệt bản chất giữa Lý thuyết Xác suất (Probability Theory) và Logic Mờ (Fuzzy Logic). Minh họa sự khác biệt này thông qua ví dụ: Bạn đang khát nước trên sa mạc và gặp 2 ly nước được dán nhãn:
- Ly nước A: Độ thuộc độc tính theo Logic mờ $\mu_{\text{Độc}}(\text{Ly A}) = 0.05$.
- Ly nước B: Xác suất có chất độc gây chết người $P(\text{Độc}(\text{Ly B})) = 0.05$.
Bạn sẽ chọn uống ly nước nào để bảo đảm an toàn tính mạng? Tại sao?

**Lời giải mẫu:**

| Tiêu chí | Lý thuyết Xác suất (Probability Theory) | Logic Mờ (Fuzzy Logic) |
| :--- | :--- | :--- |
| **Nguồn gốc bất định** | Do **thiếu thông tin** (Lack of information / Epistemic uncertainty). Sự kiện trong thực tế chỉ có 2 trạng thái khách quan: Đúng hoặc Sai. | Do **sự mơ hồ về ranh giới khái niệm** trong ngôn ngữ (Vagueness / Ambiguity). |
| **Bản chất con số** | Tần suất xuất hiện hoặc mức độ tin tưởng vào một biến cố nhị phân. | **Mức độ thuộc về một tập hợp mờ** (Degree of truth / Membership value) trong đoạn $[0, 1]$. |
| **Sau khi quan sát** | Biến cố ngã ngũ, xác suất trở về $1$ hoặc $0$ (Ví dụ lật đồng xu ra ngửa). | Độ thuộc vẫn giữ nguyên giá trị liên tục (Người cao 1m75 mãi mãi có độ thuộc "Cao" là 0.7). |

**Phân tích bài toán hai ly nước:**
1. **Ly nước A ($\mu_{\text{Độc}} = 0.05$ - Logic mờ):**
   - Con số $0.05$ thể hiện mức độ độc tính thực sự có trong ly nước. Nghĩa là ly nước này chứa một lượng tạp chất cực kỳ nhỏ (tương đương với nước máy có nồng độ khoáng nhẹ hoặc nước giếng khoan lọc thô). Nước hoàn toàn uống được mà không gây nguy hại đến tính mạng!
2. **Ly nước B ($P(\text{Độc}) = 0.05$ - Xác suất):**
   - Con số $0.05$ nghĩa là: Cứ trong 100 ly nước loại này, có **chính xác 5 ly chứa chất độc cực mạnh chết người 100%** (như thạch tín, xyanua), và 95 ly là nước tinh khiết.
   - Khi uống ly nước B, bạn đang tham gia trò chơi "Cò quay Nga" (Russian Roulette) với 5% xác suất tử vong ngay lập tức!
3. **Kết luận:** Người duy lý chắc chắn sẽ chọn **uống Ly nước A (Logic mờ)** để an toàn tuyệt đối!
