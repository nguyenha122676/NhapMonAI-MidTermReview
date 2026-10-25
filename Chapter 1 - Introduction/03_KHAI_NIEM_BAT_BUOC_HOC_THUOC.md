# Chapter 1 – Khái Niệm Bắt Buộc Học Thuộc & Từ Điển Song Ngữ
## Cẩm Nang Ghi Nhớ Nhanh Đạt Điểm A+ (Flashcards & Lexicon)

> **Môn học:** Nhập môn Trí tuệ Nhân tạo (Introduction to Artificial Intelligence - MAT1206E / MAT3508)  
> **Nguồn chuẩn hóa:** Slide bài giảng TS. Hoàng Anh Đức, giáo trình *Wolfgang Ertel (2025)*, *Russell & Norvig (2021)*.  
> **Quy chuẩn hiển thị:** 100% thuật ngữ quan trọng đều có định dạng song ngữ chuẩn `Tiếng Việt (English Term)` để phục vụ cả đề thi tiếng Việt và tiếng Anh.  
> **Ngày cập nhật:** 23/10/2026

---

## 1. Từ Điển Thuật Ngữ Cốt Lõi Song Ngữ (Comprehensive Bilingual Lexicon)

| STT | Thuật ngữ Tiếng Việt | Thuật ngữ Tiếng Anh | Định nghĩa / Ý nghĩa kỹ thuật |
| :---: | :--- | :--- | :--- |
| **1** | Trí tuệ nhân tạo | **Artificial Intelligence (AI)** | Ngành khoa học nghiên cứu cách xây dựng các cỗ máy có khả năng hành động duy lý hoặc mô phỏng trí tuệ con người. |
| **2** | Tác nhân duy lý | **Rational agent** | Thực thể quan sát môi trường và luôn lựa chọn hành động tối đa hóa kỳ vọng đạt mục tiêu. |
| **3** | Phép thử Turing | **Turing test** | Bài kiểm tra hành vi năm 1950 của Alan Turing: Máy tính đánh lừa được $\ge 30\%$ giám khảo trong 5 phút chat văn bản. |
| **4** | Xe Braitenberg | **Braitenberg vehicles** | Mô hình xe robot đồ chơi cực kỳ đơn giản (2 bánh, 2 cảm biến quang) sinh ra hành vi dường như thông minh nhưng không có trí tuệ. |
| **5** | Hiệu ứng AI | **AI effect** | Hiện tượng tâm lý xã hội: Ngay khi máy tính giải quyết được một bài toán, con người không còn coi đó là "trí tuệ" nữa. |
| **6** | Căn phòng tiếng Trung | **Chinese room argument** | Luận cứ triết học năm 1980 của John Searle chứng minh rằng thao tác cú pháp không đồng nghĩa với hiểu biết ngữ nghĩa. |
| **7** | Cú pháp | **Syntax** | Cấu trúc hình thức, trật tự sắp xếp các ký hiệu thuần túy (ví dụ chuỗi bit 0 và 1) mà không mang ý nghĩa thực tế. |
| **8** | Ngữ nghĩa | **Semantics** | Ý nghĩa thực sự, sự nhận thức, ý niệm và mối liên hệ giữa ký hiệu với các thực thể trong thế giới thực. |
| **9** | AI mạnh | **Strong AI** | Quan điểm cho rằng cỗ máy tính được lập trình phù hợp sẽ thực sự sở hữu tâm trí, ý thức và sự hiểu biết như con người. |
| **10** | AI yếu / AI hẹp | **Weak AI / Narrow AI** | Quan điểm xem máy tính chỉ là công cụ hữu ích mô phỏng trí tuệ để giải quyết các bài toán cụ thể trong phạm vi hẹp. |
| **11** | Trí tuệ nhân tạo tổng quát | **Artificial General Intelligence (AGI)** | Hệ thống AI sở hữu năng lực học tập và suy luận linh hoạt ngang bằng hoặc vượt trội con người trong mọi lĩnh vực trí tuệ. |
| **12** | Phản biện hệ thống | **The systems reply** | Lập luận phản bác Searle: Cá nhân người trong phòng không hiểu tiếng Trung, nhưng toàn bộ hệ thống lớn thì thực sự hiểu. |
| **13** | Phản biện Robot | **The robot reply** | Lập luận cho rằng gắn hệ thống vào một thân thể robot có cảm biến tương tác vật lý sẽ giúp kết nối ký hiệu với ngữ nghĩa thực. |
| **14** | Tác nhân | **Agent** | Thực thể tiếp nhận thông tin từ môi trường qua Cảm biến (Sensors) và tác động lại môi trường qua Bộ chấp hành (Actuators). |
| **15** | Tác nhân phần mềm | **Software agent** | Tác nhân hoạt động trong môi trường số, nhận dữ liệu số và trả về lệnh điều khiển tệp tin, mạng. |
| **16** | Tác nhân phần cứng | **Hardware agent / Robot** | Tác nhân có thân thể vật lý cụ thể, hoạt động trong thế giới thực với động cơ và cảm biến cơ học. |
| **17** | Tác nhân phản xạ | **Reflex agent** | Tác nhân hoạt động thuần túy theo quy tắc Điều kiện - Hành động: $a_t = F(o_t)$, không lưu giữ lịch sử. |
| **18** | Tác nhân có bộ nhớ | **Agent with memory / state** | Tác nhân duy trì trạng thái nội bộ để đưa ra quyết định dựa trên lịch sử quan sát: $s_{t+1} = U(s_t, o_t), a_t = F(s_t, o_t)$. |
| **19** | Trạng thái nội bộ | **Internal state ($s_t$)** | Cấu trúc dữ liệu bên trong tác nhân lưu giữ bản tóm tắt lịch sử quá khứ của môi trường. |
| **20** | Hàm cập nhật trạng thái | **State update function ($U$)** | Hàm toán học cập nhật trạng thái mới dựa trên trạng thái cũ và quan sát hiện tại: $s_{t+1} = U(s_t, o_t)$. |
| **21** | Hàm lựa chọn hành động | **Action selection function ($F$)** | Hàm toán học quyết định hành động xuất ra dựa trên trạng thái nội bộ và quan sát: $a_t = F(s_t, o_t)$. |
| **22** | Tác nhân dựa trên mục tiêu | **Goal-based agent** | Tác nhân kết hợp thông tin trạng thái với mục tiêu cần đạt để tìm kiếm đường đi hoặc lập kế hoạch hành động. |
| **23** | Tác nhân học | **Learning agent** | Tác nhân có khả năng tự cải thiện hiệu suất hoạt động thông qua việc tiếp nhận phản hồi khen/phạt từ môi trường. |
| **24** | Tác nhân phân tán | **Distributed agents / Multi-agent** | Hệ thống gồm nhiều tác nhân tương tác, hợp tác hoặc cạnh tranh để giải quyết bài toán phức tạp. |
| **25** | Hệ thống dựa trên tri thức | **Knowledge-based system (KBS)** | Hệ thống AI lưu trữ tri thức chuyên gia tường minh dưới dạng luật hoặc logic và dùng động cơ suy diễn để trả lời. |
| **26** | Động cơ suy diễn | **Inference engine** | Thành phần phần mềm thực hiện các thuật toán suy luận độc lập với cơ sở tri thức trong một KBS. |
| **27** | Chủ nghĩa biểu tượng | **Symbolicism / Symbolic AI** | Trường phái tiếp cận AI dựa trên việc thao tác các ký hiệu logic tường minh và quy tắc suy luận hình thức. |
| **28** | Chủ nghĩa kết nối | **Connectionism** | Trường phái tiếp cận AI dựa trên mạng nơ-ron nhân tạo với tri thức phân tán ngầm định trong các trọng số. |
| **29** | Giả thuyết hệ thống ký hiệu vật lý | **Physical Symbol System Hypothesis** | Giả thuyết của Newell & Simon (1976): Một hệ thống ký hiệu vật lý có đủ điều kiện cần và đủ cho hành vi thông minh. |
| **30** | AI biểu tượng kết hợp nơ-ron | **Neuro-symbolic AI** | Hướng nghiên cứu kết hợp khả năng nhận dạng mẫu của mạng nơ-ron sâu với khả năng suy luận logic của Symbolic AI. |
| **31** | Hội thảo Dartmouth | **Dartmouth conference (1956)** | Hội thảo khoa học lịch sử khai sinh ra ngành Trí tuệ Nhân tạo và đặt tên chính thức cho lĩnh vực. |
| **32** | Mùa đông AI | **AI winter** | Các giai đoạn cắt giảm tài trợ và suy giảm kỳ vọng đối với AI (những năm 1970 và cuối những năm 1980). |
| **33** | Mô hình ngôn ngữ lớn | **Large Language Models (LLMs)** | Các mạng nơ-ron sâu khổng lồ được huấn luyện trên lượng văn bản khổng lồ (như GPT-4, Gemini). |
| **34** | Hiệu ứng dội ngược | **Rebound effect** | Hiện tượng công nghệ làm tăng hiệu quả nhưng lại kích thích nhu cầu sử dụng bùng nổ, dẫn đến tiêu thụ tài nguyên nhiều hơn. |

---

## 2. Flashcards Định Nghĩa Cốt Lõi (Exam Flashcards)

### Flashcard 1: Định nghĩa Tác nhân duy lý (Rational Agent) là gì?
- **Trả lời:**  
  Một tác nhân duy lý (Rational Agent) là một hệ thống tiếp nhận thông tin từ môi trường qua các cảm biến (Sensors) và hành động dựa trên các bộ phận chấp hành (Actuators), sao cho với mỗi chuỗi nhận thức khả dĩ, tác nhân **luôn lựa chọn hành động nhằm tối đa hóa độ đo hiệu suất (Performance Measure)** kỳ vọng của nó, dựa trên những bằng chứng nhận được và tri thức tích lũy sẵn có.

### Flashcard 2: Tại sao Elaine Rich định nghĩa AI là "ngành nghiên cứu những việc con người làm tốt hơn máy tính"?
- **Trả lời:**  
  Định nghĩa của Elaine Rich (1983) nhấn mạnh tính chất "ranh giới động" của AI. Khi máy tính đã giải quyết hoàn hảo một bài toán (như chơi cờ vua, tính toán đạo hàm, quét mã vạch), con người thường không còn coi đó là "trí tuệ" nữa (*AI Effect*). Do đó, trọng tâm của AI luôn dịch chuyển về phía những năng lực mà con người vẫn đang vượt trội máy tính (như nhận thức tri giác phức tạp, thích nghi, học với ít dữ liệu).

### Flashcard 3: Cốt lõi của luận cứ Căn phòng tiếng Trung (Chinese Room Argument) là gì?
- **Trả lời:**  
  Cốt lõi luận cứ của John Searle là chứng minh rằng **Cú pháp tự nó không đồng nghĩa và không đủ để tạo ra Ngữ nghĩa ($Syntax \not\implies Semantics$)**. Việc một cỗ máy tính thao tác các chuỗi ký hiệu nhịp nhàng theo sách luật chỉ là bắt chước hành vi (Simulation), cỗ máy không bao giờ thực sự có sự thấu hiểu (Understanding) hay ý thức chủ quan về những gì nó đang xử lý.

### Flashcard 4: Viết và giải thích mô hình hai phương trình cho tác nhân có trạng thái nội bộ
- **Trả lời:**  
  $$s_{t+1} = U(s_t, o_t) \qquad (\text{Cập nhật trạng thái})$$
  $$a_t = F(s_t, o_t) \qquad (\text{Lựa chọn hành động})$$
  - $s_t$: Trạng thái nội bộ tại thời điểm $t$ (bộ nhớ lưu giữ tóm tắt lịch sử).
  - $o_t$: Quan sát đầu vào từ cảm biến tại thời điểm $t$.
  - $U$: Hàm cập nhật trạng thái mới $s_{t+1}$ từ trạng thái cũ và quan sát mới.
  - $F$: Hàm quyết định hành động xuất ra $a_t$.  
  *Ý nghĩa:* Giúp tác nhân phân biệt được các tình huống có cùng quan sát đầu vào nhưng ngữ cảnh lịch sử khác nhau, tránh rơi vào vòng lặp vô tận.

---

## 3. Bảng Phân Biệt Sâu Các Cặp Khái Niệm Dễ Nhầm Lẫn

### 3.1. Phân biệt Bốn góc nhìn tiếp cận AI

| Góc nhìn | Tiêu chí đánh giá | Cơ sở lý thuyết | Điểm yếu / Nhận xét |
| :--- | :--- | :--- | :--- |
| **Thinking Humanly** | Cơ chế suy nghĩ bên trong giống con người | Khoa học nhận thức, quét não fMRI | Rất khó nhìn thấu và mô hình hóa chính xác bộ não con người |
| **Acting Humanly** | Hành vi bên ngoài đánh lừa được con người | Phép thử Turing (Turing Test) | Đo lường sự bắt chước, thiên lệch hội thoại, bỏ qua tính tối ưu |
| **Thinking Rationally** | Suy nghĩ tuân thủ quy luật logic hoàn hảo | Logic hình thức, tam đoạn luận Aristotle | Khó biểu diễn tri thức không chắc chắn; dễ bùng nổ tổ hợp |
| **Acting Rationally** | Hành động tối đa hóa mục tiêu trong môi trường | Khái niệm Tác nhân duy lý (Rational Agent) | **Chuẩn mực hiện đại:** Không cần giống người, tập trung đạt kết quả tốt nhất |

---

### 3.2. Phân biệt Tác nhân phản xạ vs Tác nhân có bộ nhớ

| Tiêu chí | Tác nhân phản xạ đơn giản (Reflex Agent) | Tác nhân có bộ nhớ (Agent with Memory / State) |
| :--- | :--- | :--- |
| **Mô hình toán** | $a_t = F(o_t)$ | $s_{t+1} = U(s_t, o_t)$ và $a_t = F(s_t, o_t)$ |
| **Phụ thuộc quá khứ** | Hoàn toàn không; chỉ quan tâm hiện tại. | Rất lớn; tích lũy lịch sử vào trạng thái $s_t$. |
| **Nguy cơ lỗi** | Dễ rơi vào vòng lặp vô hạn nếu môi trường không đầy đủ. | Tránh được lặp vô hạn nhờ nhận biết trạng thái đã đi qua. |
| **Ví dụ** | Rơ-le nhiệt tự ngắt khi nóng; xe Braitenberg. | Robot hút bụi tự vẽ bản đồ; xe tự hành nhớ đường đi. |

---

## 4. Checklist Tự Đánh Giá Năng Lực Đạt Điểm A+ – Chapter 1

- [ ] Tôi trình bày được 4 góc nhìn định nghĩa AI và giải thích được vì sao Rational Agent là chuẩn mực kỹ thuật hiện đại.
- [ ] Tôi giải thích được nghịch lý xe Braitenberg và lý do định nghĩa của McCarthy chưa hoàn hảo.
- [ ] Tôi nêu được quy chuẩn thực nghiệm của Turing Test (5 phút, ngưỡng 30%) và 5 lý do vì sao nó không phù hợp làm định nghĩa cho AI thực tiễn.
- [ ] Tôi phân tích được sự khác biệt giữa Syntax và Semantics trong luận cứ Căn phòng tiếng Trung của John Searle.
- [ ] Tôi viết đúng 2 phương trình mô hình hóa tác nhân có bộ nhớ ($U$ và $F$) và giải thích được ý nghĩa từng biến.
- [ ] Tôi so sánh được ưu / nhược điểm của Symbolicism (Symbolic AI) và Connectionism (Deep Learning).
- [ ] Tôi hiểu bản chất và lý do Neuro-Symbolic AI là xu hướng tất yếu cho các hệ thống tối quan trọng.
- [ ] Tôi nhớ được các mốc lịch sử cốt lõi: Hội thảo Dartmouth (1956), LISP (1958), Resolution (1965), PROLOG (1972), Mùa đông AI, Deep Learning và AlphaGo (2016).
