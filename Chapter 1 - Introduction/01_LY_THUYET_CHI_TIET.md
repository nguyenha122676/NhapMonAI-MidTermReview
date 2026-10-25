# Chapter 1 – Giới Thiệu Về Trí Tuệ Nhân Tạo (Introduction to AI)
## Cẩm Nang Lý Thuyết Chuyên Sâu Ôn Thi A+

> **Môn học:** Nhập môn Trí tuệ Nhân tạo (Introduction to Artificial Intelligence - MAT1206E / MAT3508)  
> **Nguồn bài giảng:** Slide chính thức `Introduction.pdf` (51 trang) & `Introduction_InClass.pdf` của TS. Hoàng Anh Đức (ĐHKHTN - ĐHQGHN)  
> **Giáo trình tham chiếu:** Wolfgang Ertel (2025), *Introduction to Artificial Intelligence*, 3rd Edition, Springer (Chapter 1); Russell & Norvig (2021), *AIMA 4th Edition* (Chapters 1, 2)  
> **Ngày cập nhật:** 23/10/2026

---

## Mục Tiêu Học Tập (Learning Objectives)

Sau khi làm chủ chương này, bạn cần đạt được:
1. Nắm vững **4 góc nhìn định nghĩa AI** kinh điển (Thinking/Acting Humanly vs Thinking/Acting Rationally) và các định nghĩa lịch sử: John McCarthy (1955), Encyclopedia Britannica (1991), Elaine Rich (1983).
2. Hiểu bản chất nghịch lý từ **Xe Braitenberg (Braitenberg Vehicles)** và lý do tại sao định nghĩa của McCarthy chưa đủ chặt chẽ.
3. Làm chủ bài toán **Phép thử Turing (Turing Test - Alan Turing 1950)**, quy chuẩn thực nghiệm (ngưỡng 30% đánh lừa sau 5 phút), các chatbot lịch sử (ELIZA 1966 của Weizenbaum) và **5 lý do cốt tử khiến Turing Test không phù hợp làm định nghĩa kỹ thuật cho AI thực tiễn**.
4. Nắm chắc luận cứ triết học **Căn phòng tiếng Trung (Chinese Room Argument - John Searle 1980)**: Phân biệt tuyệt đối giữa **Cú pháp (Syntax)** và **Ngữ nghĩa (Semantics)**; hiểu khái niệm **AI mạnh (Strong AI)** vs **AI yếu (Weak AI)** và các luận điểm phản bác kinh điển (**Systems Reply**, **Robot Reply**).
5. Phân tích toán học cấu trúc **Tác nhân (Agent)**: Tác nhân phần mềm (Software agent) vs Tác nhân phần cứng (Hardware agent / Robot); **Tác nhân phản xạ (Reflex agent)** vs **Tác nhân có bộ nhớ / trạng thái (Agent with memory / state)** với mô hình hai phương trình cập nhật trạng thái $s_{t+1} = U(s_t, o_t)$ và chọn hành động $a_t = F(s_t, o_t)$.
6. So sánh toàn diện hai trường phái nền tảng: **Chủ nghĩa biểu tượng (Symbolicism / Symbolic AI)** và **Chủ nghĩa kết nối (Connectionism / Neural Networks)**, sự hội tụ trong **Neuro-Symbolic AI**.
7. Nắm vững tiến trình lịch sử AI: Hội thảo Dartmouth (1956), các thời kỳ mùa đông AI (AI Winters), sự bùng nổ của Deep Learning và tác động kinh tế - xã hội (việc làm, an toàn, thiên lệch dữ liệu).

---

## 1. Trí Tuệ Nhân Tạo Là Gì? (What is Artificial Intelligence?)

### 1.1. Bốn góc nhìn kinh điển về AI (Russell & Norvig)
Trí tuệ nhân tạo được nghiên cứu qua 2 chiều kích thước: **Mô phỏng con người (Human-like)** đối lập với **Tính duy lý tối ưu (Rationality)**; **Tiến trình suy nghĩ (Thinking)** đối lập với **Hành vi quan sát được (Acting)**.

```
+---------------------------------------+---------------------------------------+
|        GÓC NHÌN CON NGƯỜI (HUMAN)     |         GÓC NHÌN DUY LÝ (RATIONAL)    |
+---------------------------------------+---------------------------------------+
| 1. Suy nghĩ như người                 | 2. Suy nghĩ duy lý                    |
|    (Thinking Humanly)                 |    (Thinking Rationally)              |
|    - Mô phỏng cơ chế não bộ con người |    - Tuân theo các quy luật logic     |
|    - Tiếp cận qua Khoa học nhận thức  |      hình thức bất biến (tam đoạn     |
|      (Cognitive Science).             |      luận Aristotle, "Laws of Thought").
+---------------------------------------+---------------------------------------+
| 3. Hành động như người                | 4. Hành động duy lý                   |
|    (Acting Humanly)                   |    (Acting Rationally)                |
|    - Hành xử sao cho người khác không |    - Chọn hành động tối ưu hóa        |
|      phân biệt được với người thật    |      kỳ vọng đạt mục tiêu dựa trên    |
|    - Tiêu biểu: Phép thử Turing       |      thông tin thu nhận được.         |
|      (Turing Test 1950).              |    - Tiêu biểu: Rational Agent.       |
+---------------------------------------+---------------------------------------+
```

> [!NOTE]
> **Tại sao hướng tiếp cận Rational Agent (Hành động duy lý) trở thành chuẩn mực hiện đại?**
> Con người không phải lúc nào cũng suy nghĩ và hành động tối ưu (con người hay thiên lệch nhận thức, cảm xúc, mệt mỏi và tính toán sai). Mục tiêu của kỹ thuật không phải là sao chép lại những nhược điểm của con người, mà là tạo ra hệ thống **hành động chính xác và hiệu quả nhất** để giải quyết vấn đề. Tương tự như ngành hàng không: Máy bay thành công nhờ ứng dụng khí động học chứ không phải nhờ bắt chước vẫy cánh như loài chim!

---

### 1.2. Phân tích các định nghĩa lịch sử trên Slide bài giảng

#### 1. Định nghĩa của John McCarthy (1955 - Cha đẻ của thuật ngữ AI):
> *"Mục tiêu của AI là phát triển những cỗ máy hành xử như thể chúng có trí tuệ (machines that behave as though they were intelligent)."*

- **Nghịch lý từ Xe Braitenberg (Braitenberg Vehicles - Slide 5-6):**
  - Nhà sinh học thần kinh Valentino Braitenberg chế tạo những chiếc xe robot đồ chơi cực kỳ đơn giản: Chỉ có 2 bánh xe, mỗi bánh nối trực tiếp với 1 động cơ điện nhỏ và 1 cảm biến quang (ánh sáng). Càng nhiều ánh sáng chiếu vào, bánh xe càng quay nhanh.
  - Khi thả 15 chiếc xe như vậy vào một sàn kín $4\text{m} \times 4\text{m}$: Có xe né tránh va chạm nhịp nhàng, có nhóm xe tụ tập lại như đang trò chuyện, có xe dường như đang "đi theo xe dẫn đầu".
  - Người quan sát bên ngoài nhìn vào tưởng rằng bầy robot có hành vi xã hội thông minh phức tạp. Nhưng thực chất cấu tạo bên trong chỉ là các vi mạch điện tử analog sơ cấp, hoàn toàn không có khả năng tư duy giải quyết vấn đề.
  - $\implies$ **Kết luận từ Slide:** Định nghĩa của McCarthy là chưa thỏa đáng, vì mục tiêu thực sự của AI là giải quyết các bài toán thực tiễn phức tạp (difficult practical problems), vượt xa năng lực của xe Braitenberg.

#### 2. Định nghĩa của Encyclopedia Britannica (1991):
> *"AI là khả năng của máy tính kỹ thuật số hoặc robot giải quyết các vấn đề thường gắn liền với năng lực xử lý trí tuệ bậc cao của con người..."*
- **Hạn chế:** Theo định nghĩa này, ngay cả một chiếc máy tính bỏ túi giải phương trình hay chương trình in chuỗi ký tự cũng trở thành hệ thống AI!

#### 3. Định nghĩa của Elaine Rich (1983) - "Ranh giới luôn dịch chuyển":
> *"Trí tuệ nhân tạo là ngành khoa học nghiên cứu cách làm cho máy tính thực hiện những công việc mà tại thời điểm hiện tại, con người vẫn đang làm tốt hơn máy tính."*
- **Ý nghĩa sâu sắc:** Định nghĩa này có tính "động". Ngay khi máy tính giải quyết hoàn hảo một bài toán (như tính toán ma trận, chơi cờ vua, nhận dạng chữ viết quang học OCR), con người lập tức không còn gọi đó là "trí tuệ" nữa mà xem đó là phép tính thông thường (*AI Effect*).

---

## 2. Phép Thử Turing Và Chatbot (The Turing Test & Chatterbots)

### 2.1. Thiết lập thực nghiệm của Phép thử Turing (Alan Turing 1950)
Alan Turing đề xuất "Trò chơi bắt chước" (Imitation Game) nhằm thay thế câu hỏi mơ hồ *"Máy tính có suy nghĩ được không?"* bằng một bài kiểm tra hành vi thực nghiệm quan sát được.

- **Quy chuẩn thực nghiệm trên Slide 11:**
  - Một giám khảo con người (Tester) ngồi trong phòng cách ly, giao tiếp qua bàn phím văn bản (teletype / chat) với 2 đối tượng ẩn danh ở phòng bên kia: một bên là người thật, một bên là máy tính.
  - Mỗi lượt thử kéo dài **5 phút**.
  - Giám khảo được phép hỏi bất kỳ chủ đề gì (toán học, làm thơ, tình cảm, triết học).
  - **Tiêu chí vượt qua (Pass criterion):** Máy tính được coi là vượt qua phép thử Turing nếu nó đánh lừa được **ít nhất 30% số giám khảo**, khiến họ nhầm tưởng nó là con người.

```
+-----------------------------------------------------------+
|                      PHÉP THỬ TURING                      |
|                                                           |
|                 +--------------------+                    |
|                 | Giám khảo (Người)  |                    |
|                 +--------------------+                    |
|                           | (Chat văn bản qua tường ngăn)  |
|             +-------------+-------------+                 |
|             |                           |                 |
|   +-------------------+       +-------------------+       |
|   |    Máy tính AI    |  vs   |    Người thật     |       |
|   +-------------------+       +-------------------+       |
|                                                           |
| Mục tiêu máy tính: Đánh lừa ≥ 30% giám khảo trong 5 phút  |
+-----------------------------------------------------------+
```

### 2.2. Các Chatbot lịch sử và LLMs hiện đại
- **ELIZA (Joseph Weizenbaum 1966 - MIT):** Chatbot đóng vai nhà tâm lý học trị liệu (Rogerian psychotherapist). ELIZA dùng các luật so khớp mẫu chuỗi (pattern matching) đơn giản để đảo câu của người dùng thành câu hỏi ngược lại (ví dụ: người nói *"Tôi buồn"*, ELIZA đáp *"Tại sao bạn lại buồn?"*). Thư ký của Weizenbaum thậm chí đã tin rằng ELIZA thực sự có cảm xúc và muốn ở riêng để nói chuyện!
- **Chatterbots hiện đại & Large Language Models (LLMs):** Các mô hình như GPT-4, Gemini có thể trò chuyện tự nhiên, giải toán, viết mã nguồn và dễ dàng vượt qua các bài kiểm tra kiểu Turing trong ngữ cảnh thông thường.

### 2.3. Năm lý do cốt tử khiến Turing Test KHÔNG PHÙ HỢP làm định nghĩa kỹ thuật cho AI
Trong bài thi tự luận, khi được hỏi: *"Vì sao Turing Test không phù hợp làm định nghĩa cho AI thực tiễn?"* (Exercise 1.2), bạn cần nêu rõ 5 luận điểm:
1. **Đo khả năng lừa dối / bắt chước, không đo lường trí tuệ thực chất:** Một cỗ máy thông minh có thể giải bài toán tích phân trong 0.001 giây, nhưng để giống người nó buộc phải giả vờ tính chậm hoặc giả vờ gõ sai chính tả.
2. **Thiên lệch ngôn ngữ hội thoại (Conversational Bias):** Đánh giá hoàn toàn qua văn bản, bỏ qua các dạng trí tuệ quan trọng khác như thị giác máy tính, vận động không gian, điều khiển cánh tay robot, định vị và lập kế hoạch.
3. **Phụ thuộc vào sự chủ quan của giám khảo:** Người giám khảo thiếu chuyên môn dễ dàng bị đánh lừa bởi những câu trả lời né tránh khéo léo hoặc hài hước (như ELIZA).
4. **Con người không phải là chuẩn mực tối ưu:** Con người thường xuyên mệt mỏi, đưa ra phán đoán sai lầm; một hệ thống AI xuất sắc trong chẩn đoán y tế hay lái xe tự hành cần hoạt động **tốt hơn con người**, chứ không phải bắt chước sai lầm của con người.
5. **Không mang tính định lượng kỹ thuật:** Không cung cấp hàm mục tiêu toán học để các kỹ sư tối ưu hóa thuật toán (như độ chính xác, chi phí thời gian, khoảng cách đích trong A*).

---

## 3. Luận Cứ Căn Phòng Tiếng Trung (The Chinese Room Argument)

### 3.1. Thiết lập thí nghiệm tưởng tượng của John Searle (1980)
Triết gia John Searle đưa ra luận cứ Căn phòng tiếng Trung nhằm phản bác luận điểm của **AI mạnh (Strong AI)**:

- **Bối cảnh:**
  - Một người đàn ông hoàn toàn không biết một chữ tiếng Trung Quốc nào bị nhốt trong một căn phòng kín.
  - Trong phòng có một cuốn sách quy tắc khổng lồ viết bằng tiếng Anh (chương trình máy tính): *"Nếu nhận được chuỗi ký hiệu hình vuông lồng hình tròn, hãy tìm chuỗi ký hiệu ba vạch ngang và gửi ra ngoài"*.
  - Người bên ngoài căn phòng (người Trung Quốc bản xứ) luồn các câu hỏi tiếng Trung qua khe cửa.
  - Người bên trong phòng chỉ việc tra sách quy tắc, thao tác các nét vẽ theo hướng dẫn cú pháp rồi gửi câu trả lời tiếng Trung hoàn hảo ra ngoài.
- **Quan sát:** Người bên ngoài tin chắc rằng bên trong phòng có một người cực kỳ thông thạo tiếng Trung Quốc!

```
+-----------------------------------------------------------+
|                   CĂN PHÒNG TIẾNG TRUNG                   |
|                                                           |
|             Người Trung Quốc bản xứ (Bên ngoài)           |
|                          |     ^                          |
|             Câu hỏi chữ Hán    Câu trả lời chữ Hán        |
|                          v     |                          |
|    +-------------------------------------------------+    |
|    | Căn phòng kín:                                  |    |
|    | - Người nói tiếng Anh (KHÔNG BIẾT TIẾNG TRUNG)  |    |
|    | - Cuốn sách luật thao tác cú pháp (Program)     |    |
|    | - Giỏ chứa các ký tự chữ Hán (Data)             |    |
|    +-------------------------------------------------+    |
|                                                           |
|   Kết luận của Searle: Syntax ≠ Semantics (Thao tác ≠ Hiểu)
+-----------------------------------------------------------+
```

### 3.2. Cốt lõi triết học: Cú pháp (Syntax) đối lập với Ngữ nghĩa (Semantics)
Từ thí nghiệm trên, Searle rút ra 3 tiền đề bất hủ:
1. **Các chương trình máy tính thuần túy là Cú pháp (Programs are formal / syntactic):** Máy tính chỉ thực hiện so khớp và hoán đổi các chuỗi bit `0` và `1` vô hồn theo quy tắc toán học.
2. **Tâm trí con người sở hữu Ngữ nghĩa (Human minds have semantics / intentionality):** Con người khi nói từ "nước" sẽ liên tưởng đến chất lỏng, cơn khát, màu sắc, cảm xúc – tức là gắn liền với ý niệm trong thế giới thực.
3. **Cú pháp tự nó không bao giờ tạo ra được Ngữ nghĩa (Syntax alone is neither constitutive of nor sufficient for semantics).**

$\implies$ **Kết luận của Searle:** Chạy đúng một chương trình máy tính (dù tinh vi đến đâu, dù vượt qua Turing Test) cũng **không bao giờ đồng nghĩa với việc cỗ máy đó thực sự có sự hiểu biết (Understanding) hay có ý thức**. Máy tính chỉ mô phỏng hành vi thông minh (Simulation), chứ không có trí tuệ thực thụ.

### 3.3. Các luận điểm phản biện kinh điển (Counter-arguments)
1. **Phản biện toàn hệ thống (The Systems Reply):**
   - *Luận điểm:* Đúng là cá nhân người ngồi trong phòng không hiểu tiếng Trung. Nhưng **toàn bộ hệ thống** (bao gồm người đó + cuốn sách quy tắc + kho ký tự + căn phòng) thì thực sự hiểu tiếng Trung!
   - *Searle đáp trả:* Giả sử người đó học thuộc toàn bộ cuốn sách luật trong đầu và đi lại tự do. Khi đó không còn căn phòng nữa, anh ta vẫn trả lời trôi chảy nhưng vẫn không hề hiểu ý nghĩa của các từ tiếng Trung mà mình phát ra.
2. **Phản biện Robot (The Robot Reply):**
   - *Luận điểm:* Nếu đặt hệ thống đó vào một thân thể robot có gắn camera, cảm biến và động cơ để trực tiếp tương tác với đồ vật ngoài đời thực, hệ thống sẽ kết nối ký hiệu với thế giới thực (Symbol Grounding) và sinh ra ngữ nghĩa.

---

## 4. Tác Nhân Và Cấu Trúc Trạng Thái (Agents and Memory)

### 4.1. Khái niệm Tác nhân (Agent)
**Tác nhân (Agent)** là một thực thể nhận biết môi trường xung quanh thông qua các **Cảm biến (Sensors)** và tác động trở lại môi trường thông qua các **Bộ phận chấp hành (Actuators)**.

- **Tác nhân phần mềm (Software Agent):** Hoạt động trong môi trường số (ví dụ: bộ lọc thư rác, bot giao dịch chứng khoán, công cụ tìm kiếm). Nhận input là gói tin, file, dữ liệu mạng; output là ghi log, gửi lệnh, hiển thị màn hình.
- **Tác nhân phần cứng (Hardware Agent / Robot):** Có thân thể vật lý, hoạt động trong thế giới thực (ví dụ: xe tự hành, robot hút bụi). Nhận input từ camera, lidar, siêu âm; output là dòng điện điều khiển động cơ bánh xe, cánh tay.

### 4.2. Phân loại cấu trúc Tác nhân (Slide 42)
1. **Tác nhân phản xạ đơn giản (Reflex Agents):**
   - Hoạt động thuần túy theo quy tắc Điều kiện - Hành động (Condition-Action rules).
   - Hành vi được mô hình hóa toán học bằng một hàm trực tiếp từ tập quan sát sang tập hành động:
     $$a_t = F(o_t)$$
   - Phù hợp với môi trường quan sát được toàn phần (fully observable) hoặc các bài toán thỏa mãn tính chất Markov.
2. **Tác nhân có bộ nhớ / trạng thái nội bộ (Agents with Memory / State):**
   - Không thể biểu diễn bằng một hàm đơn giản $F(o_t)$ vì **cùng một input hiện tại có thể sinh ra các hành động hoàn toàn khác nhau tùy thuộc vào lịch sử trong quá khứ**.
   - Cần duy trì một **Trạng thái nội bộ (Internal State $s_t$)** lưu giữ lịch sử.
   - **Mô hình toán học 2 phương trình (bắt buộc phải nhớ):**
     $$s_{t+1} = U(s_t, o_t) \qquad (\text{Hàm cập nhật trạng thái - State Update})$$
     $$a_t = F(s_t, o_t) \qquad (\text{Hàm chọn hành động - Action Selection})$$
     *Trong đó:* $o_t$ là quan sát tại thời điểm $t$, $s_t$ là trạng thái nội bộ, $a_t$ là hành động được chọn.
3. **Tác nhân dựa trên mục tiêu (Goal-based Agents):** Kết hợp thông tin trạng thái với thông tin mục tiêu để lập kế hoạch hành động.
4. **Tác nhân dựa trên độ thỏa dụng (Utility-based Agents):** Đánh giá mức độ hài lòng/chất lượng của từng trạng thái đích bằng một hàm thỏa dụng $U(s)$.
5. **Tác nhân học (Learning Agents):** Có khả năng tự thay đổi các tham số nội bộ thông qua phản hồi khen/phạt để nâng cao hiệu suất hoạt động theo thời gian.
6. **Tác nhân phân tán (Distributed / Multi-Agent Systems):** Trí tuệ không nằm cục bộ ở một cá thể mà nảy sinh từ sự tương tác, phối hợp của một đàn tác nhân (ví dụ: bầy robot đá bóng RoboCup).

---

## 5. Chủ Nghĩa Biểu Tượng Đối Lập Chủ Nghĩa Kết Nối (Symbolicism vs Connectionism)

Lịch sử phát triển của AI là sự luân phiên và cạnh tranh giữa hai trường phái tư tưởng lớn:

| Tiêu chí so sánh | Chủ nghĩa Biểu tượng (Symbolicism / Symbolic AI) | Chủ nghĩa Kết nối (Connectionism / Neural Networks) |
| :--- | :--- | :--- |
| **Bản chất tri thức** | Biểu diễn tri thức **tường minh (explicit)** bằng các ký hiệu, luật logic và cây cú pháp. | Tri thức biểu diễn **phân tán ngầm định (implicit/distributed)** dưới dạng trọng số ($\mathbf{w}$). |
| **Cơ chế suy luận** | Suy diễn hình thức dựa trên các luật logic bất biến (Modus Ponens, Resolution). | Tương tác tính toán song song giữa hàng triệu nơ-ron đơn giản, lan truyền tiến và ngược. |
| **Học từ dữ liệu** | Khó học tự động; đòi hỏi chuyên gia con người nạp tri thức thủ công. | Học rất tốt từ dữ liệu lớn (Big Data) thông qua giải thuật tối ưu hóa (Gradient Descent). |
| **Khả năng giải thích** | **Rất cao (White-box):** Từng bước suy luận minh bạch, chứng minh được tính đúng đắn. | **Rất thấp (Black-box):** Cực kỳ khó giải thích tại sao mạng lại đưa ra quyết định như vậy. |
| **Độ bền trước nhiễu** | Kém; dễ vỡ (brittle) khi dữ liệu đầu vào bị thiếu sót hoặc có nhiễu. | Rất tốt; có khả năng chịu lỗi và khái quát hóa trên dữ liệu mờ, hình ảnh, âm thanh. |
| **Ứng dụng tiêu biểu** | Chứng minh định lý, hệ chuyên gia quy tắc, lập kế hoạch, cơ sở tri thức Prolog. | Thị giác máy tính, nhận dạng giọng nói, xử lý ngôn ngữ tự nhiên, tạo sinh (GAN, LLMs). |

> [!IMPORTANT]
> **Xu hướng tương lai - Neuro-Symbolic AI:**
> Hệ thống thông minh tối thượng không thể chỉ dựa vào một trường phái. Neuro-Symbolic AI kết hợp khả năng nhận dạng mẫu xuất sắc từ mạng nơ-ron sâu (System 1 - phản xạ nhanh, trực giác) với năng lực suy luận logic chính xác, có thể kiểm chứng của Symbolic AI (System 2 - suy nghĩ chậm, logic).

---

## 6. Các Mốc Lịch Sử Nền Tảng Cần Nhớ (AI History Timeline)

- **1930 – 1937:** Kurt Gödel công bố Định lý đầy đủ cho PL1; Alan Turing chỉ ra giới hạn của máy tính qua Bài toán dừng (Halting Problem).
- **1943:** McCulloch & Pitts công bố mô hình toán học đầu tiên của nơ-ron nhân tạo kết nối với logic mệnh đề.
- **1950:** Alan Turing đề xuất phép thử Turing và bài báo kinh điển *"Computing Machinery and Intelligence"*.
- **1956:** **Hội thảo Dartmouth (Dartmouth Conference):** Do John McCarthy, Marvin Minsky, Nathaniel Rochester và Claude Shannon tổ chức. Thuật ngữ **"Artificial Intelligence"** chính thức ra đời. Newell & Simon giới thiệu chương trình *Logic Theorist*.
- **1958:** McCarthy phát minh ra ngôn ngữ **LISP** dành riêng cho xử lý ký hiệu biểu tượng.
- **1965:** J. Alan Robinson phát minh ra **Nguyên lý Hợp giải (Resolution Principle)** cho logic vị từ, đặt nền móng cho chứng minh tự động.
- **1966:** Weizenbaum phát triển chatbot **ELIZA**.
- **1972:** Alain Colmerauer phát minh ra ngôn ngữ lập trình logic **PROLOG**.
- **1969 – 1980 (Mùa đông AI thứ nhất):** Minsky & Papert chứng minh Perceptron đơn tầng không giải được hàm XOR; hạn chế phần cứng dẫn đến cắt giảm ngân sách.
- **1980s (Bùng nổ Hệ chuyên gia & Mùa đông AI thứ hai):** Hệ thống R1/XCON tiết kiệm hàng chục triệu USD; dự án máy tính thế hệ 5 của Nhật Bản thất bại do bùng nổ tổ hợp và nút thắt thu nhận tri thức.
- **1986:** Sự hồi sinh của Connectionism nhờ thuật toán **Lan truyền ngược (Backpropagation)** (Rumelhart, Hinton, Williams).
- **1997:** Máy tính cờ vua **Deep Blue** của IBM đánh bại nhà vô địch thế giới Garry Kasparov.
- **2012 – 2016:** Cách mạng Deep Learning (AlexNet 2012); **AlphaGo** (DeepMind 2016) đánh bại Lee Sedol 4–1 môn cờ vây nhờ kết hợp Deep Learning, Học tăng cường (RL) và Tìm kiếm cây Monte Carlo (MCTS).
- **2020 – nay:** Kỷ nguyên các mô hình ngôn ngữ lớn (LLMs: GPT-3, GPT-4, Gemini) và AI tạo sinh.

---

## 7. AI Và Xã Hội: Đạo Đức, Việc Làm & Tương Lai (AI & Society)

Slide bài giảng nhấn mạnh 4 vấn đề lớn:
1. **Tác động đến việc làm (Job displacement):** Tự động hóa thay thế các công việc lặp đi lặp lại và nguy hiểm. Vấn đề không chỉ là mất việc mà là sự phân phối công bằng thành quả kinh tế giữa chủ sở hữu công nghệ và người lao động.
2. **Hiệu ứng dội ngược (Rebound Effect trong giao thông tự hành):** Khi việc di chuyển bằng xe tự hành trở nên quá rẻ và tiện nghi, nhu cầu đi lại sẽ bùng nổ mạnh mẽ hơn, làm gia tăng tiêu thụ năng lượng nếu không được quy hoạch tốt.
3. **An ninh và An toàn (Security & Safety):** Xe tự hành và robot có thể bị tin tặc tấn công thông qua lỗ hổng giao thức mạng; robot hình người có thể bị lạm dụng cho mục đích quân sự.
4. **Thiên lệch dữ liệu (Algorithmic Bias) & Riêng tư (Privacy):** Các mô hình học từ dữ liệu lịch sử có thể tái tạo và khuếch đại các định kiến phân biệt đối xử của xã hội.
