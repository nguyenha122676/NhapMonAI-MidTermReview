# Chương 7 – Bảng Khái Niệm Bắt Buộc Học Thuộc & Từ Điển Thuật Ngữ (Core Terminology & Memorization Guide)

> **Mục tiêu đạt điểm A+:** Làm chủ hệ thống thuật ngữ song ngữ Anh – Việt về Lý thuyết Xác suất trong AI, Nguyên lý Cực đại Entropy (MaxEnt), Mạng Bayes (Bayesian Networks), Tiêu chuẩn d-separation và Suy diễn thống kê; thuộc lòng các công thức xác suất nền tảng; nhận diện tức thì các bẫy ngụy biện và quy tắc mở/chặn của ba mô hình truyền tin đồ thị để đạt điểm tuyệt đối.

---

## 1. Bảng Đối Chiếu Thuật Ngữ Song Ngữ (Bilingual Terminology Lexicon)

| Thuật ngữ Tiếng Việt | English Term | Ký hiệu / Công thức | Bản chất kỹ thuật & Ngữ cảnh phòng thi |
|---|---|---|---|
| **Bất định tri thức** | Epistemic Uncertainty | $P(A) \in [0, 1]$ | Sự bất định phát sinh do chủ thể thiếu thông tin hoặc đo lường không hoàn hảo; giải quyết bằng Xác suất. |
| **Tính mơ hồ / Nhập nhằng** | Vagueness / Fuzzy Concept | $\mu_A(x) \in [0, 1]$ | Sự bất định xuất phát từ việc bản thân khái niệm ngôn ngữ không có ranh giới rạch ròi; giải quyết bằng Logic Mờ. |
| **Xác suất tiên nghiệm** | Prior Probability | $P(H)$ | Niềm tin ban đầu về giả thuyết $H$ trước khi thu thập bất kỳ bằng chứng thực nghiệm nào. |
| **Xác suất hậu nghiệm** | Posterior Probability | $P(H \mid E)$ | Niềm tin được cập nhật về giả thuyết $H$ sau khi đã quan sát thấy bằng chứng cụ thể $E$. |
| **Khả năng hợp lý** | Likelihood | $P(E \mid H)$ | Xác suất bằng chứng $E$ xuất hiện nếu giả thuyết $H$ thực sự là đúng (chiều nhân quả tự nhiên). |
| **Biên duyên hóa** | Marginalization | $P(A) = \sum_B P(A, B)$ | Phép cộng tổng xác suất trên một biến để loại bỏ (triệt tiêu) biến đó khỏi phân phối xác suất đồng thời. |
| **Ngụy biện tỷ lệ nền** | Base Rate Fallacy | Bỏ qua $P(H)$ quá nhỏ | Sai lầm đánh giá quá cao xác suất hậu nghiệm $P(H \mid +)$ khi xét nghiệm dương tính đối với một căn bệnh cực hiếm. |
| **Entropy Shannon** | Shannon Entropy | $H = -\sum p_i \ln p_i$ | Thước đo mức độ bất định, hỗn loạn và thiếu hụt thông tin của một phân phối xác suất. |
| **Cực đại Entropy** | Maximum Entropy (MaxEnt) | $\max H(p)$ s.t. constraints | Lựa chọn phân phối có Entropy lớn nhất thỏa mãn các dữ kiện đã biết; khách quan nhất, không tự bịa giả định. |
| **Nhân tử Lagrange** | Lagrange Multipliers | $\mathcal{L} = H + \sum \lambda_k g_k$ | Kỹ thuật giải tích tối ưu hóa tìm phân phối MaxEnt dưới các ràng buộc đẳng thức. |
| **Mạng Bayes** | Bayesian Network (BN) | $\text{DAG} + \text{CPTs}$ | Đồ thị có hướng không chu trình kết hợp bảng phân phối có điều kiện; biểu diễn phân phối xác suất đồng thời rút gọn. |
| **Bảng phân phối có điều kiện** | CPT | $P(X \mid \text{Parents}(X))$ | Bảng số lượng tham số $2^k$ xác định xác suất của một biến theo các tổ hợp giá trị của các nút cha. |
| **Phân rã chuỗi mạng Bayes** | Chain Rule Factorization | $P(X) = \prod P(X_i \mid \text{Pa}_i)$ | Công thức phân tích phân phối đồng thời thành tích các phân phối cục bộ, giảm số tham số từ $2^n$ xuống tuyến tính. |
| **Độc lập có điều kiện** | Conditional Independence | $P(X \mid Y, Z) = P(X \mid Z)$ | Biến $X$ và $Y$ độc lập với nhau khi đã biết giá trị của biến trung gian $Z$ (ký hiệu: $X \perp Y \mid Z$). |
| **Độc lập định hướng** | d-Separation | Directed Separation | Tiêu chuẩn hình học đồ thị xác định xem hai tập biến có độc lập có điều kiện cho trước tập bằng chứng $Z$ hay không. |
| **Chuỗi nhân quả** | Serial Chain / Cascade | $X \to M \to Y$ | Con đường truyền tin bị chặn (blocked) khi biến trung gian $M$ đã được quan sát ($M \in Z$). |
| **Cùng nguyên nhân** | Diverging / Fork | $X \leftarrow M \to Y$ | Con đường truyền tin bị chặn khi biến nguyên nhân chung $M$ đã được quan sát ($M \in Z$). |
| **Cùng kết quả / Hội tụ** | Converging / Collider / V-struct | $X \to M \leftarrow Y$ | Con đường BỊ CHẶN tự nhiên khi $M \notin Z$; con đường BỊ MỞ RA khi $M$ hoặc con cháu của $M$ được quan sát! |
| **Giải thích bỏ qua** | Explaining Away | Competitive causes | Hiện tượng khi một nguyên nhân được xác nhận thì làm giảm mạnh niềm tin vào các nguyên nhân cạnh tranh khác tại nút Collider. |
| **Vùng biên Markov** | Markov Blanket | $\text{MB}(X) = \text{Pa} \cup \text{Ch} \cup \text{CoPa}$ | Tập hợp gồm cha mẹ, con cái và các cha mẹ khác của con cái; nút $X$ độc lập với toàn bộ mạng khi biết $\text{MB}(X)$. |
| **Hằng số chuẩn hóa** | Normalization Constant | $\alpha = 1 / P(E)$ | Nghịch đảo của xác suất bằng chứng; dùng để đưa tổng các thành phần vector xác suất về đúng bằng 1. |

---

## 2. Bộ Flashcards Khái Niệm Cốt Lõi (High-Yield Flashcards)

### Flashcard 1: Phân Biệt $P(B \mid A)$ vs $P(A \implies B)$
- **Mặt trước:** Tại sao trong Trí tuệ Nhân tạo không bao giờ được dùng xác suất của phép kéo theo vật chất $P(A \implies B)$ để biểu diễn tri thức luật?
- **Mặt sau:**
  - Trong logic học, $A \implies B \equiv \neg A \lor B$. Vì vậy:
    $$P(A \implies B) = P(\neg A) + P(A \land B) = 1 - P(A) + P(A \land B)$$
  - Nếu tiền đề $A$ là một sự kiện hiếm gặp ($P(A) = 0.001$), thì $P(\neg A) = 0.999 \implies P(A \implies B) \ge 0.999$ (gần như bằng 1).
  - Nhưng điều này hoàn toàn không có nghĩa là khi $A$ xảy ra thì $B$ sẽ xảy ra! Nếu $A$ xảy ra mà $B$ không bao giờ xảy ra thì xác suất có điều kiện thực tế là $P(B \mid A) = 0$.
  - Do đó, **Xác suất có điều kiện $P(B \mid A) = \frac{P(A \land B)}{P(A)}$** là công cụ duy nhất phản ánh chính xác mối quan hệ nhân quả và điều kiện trong AI.

### Flashcard 2: Bản Chất Triết Học Của Nguyên Lý MaxEnt
- **Mặt trước:** Nguyên lý Cực đại hóa Entropy (MaxEnt) của E.T. Jaynes phát biểu điều gì và tại sao nó lại được coi là phương pháp khách quan nhất?
- **Mặt sau:**
  - **Phát biểu:** Trong số tất cả các phân phối xác suất thỏa mãn các ràng buộc tri thức đã biết, hãy chọn phân phối có **Entropy Shannon lớn nhất**: $\max H(p) = -\sum p_i \ln p_i$.
  - **Bản chất triết học:** Cực đại hóa Entropy đồng nghĩa với việc tối đa hóa độ bất định còn lại $\implies$ điều này bảo đảm ta **không tự ý bịa đặt thêm bất kỳ giả định ngầm định nào** ngoài những gì dữ liệu đã nói.
  - Đây là mô hình trung thực nhất, vô thiên vị nhất. Khi không có thêm thông tin tương quan giữa $A$ và $B$, MaxEnt tự động chứng minh: $P(A, B) = P(A) \cdot P(B)$ (tự động coi là độc lập thống kê).

### Flashcard 3: Quy Tắc Mở / Chặn Của Nút Collider (V-Structure)
- **Mặt trước:** Cấu trúc Collider ($X \to M \leftarrow Y$) hoạt động khác biệt hoàn toàn như thế nào so với Chain và Fork trong tiêu chuẩn d-separation?
- **Mặt sau:**
  - Đối với Chain ($X \to M \to Y$) và Fork ($X \leftarrow M \to Y$):
    - Khi **chưa biết $M$**: Con đường **MỞ** (thông tin truyền được).
    - Khi **đã biết $M$**: Con đường **BỊ CHẶN** (độc lập có điều kiện).
  - Đối với Collider ($X \to M \leftarrow Y$): **NGƯỢC LẠI HOÀN TOÀN!**
    - Khi **chưa biết $M$ (và chưa biết con cháu của $M$)**: Con đường **TỰ ĐỘNG BỊ CHẶN** ($X$ và $Y$ độc lập biên).
    - Khi **đã biết $M$ (HOẶC bất kỳ con cháu nào của $M$ được quan sát)**: Con đường **LẬP TỨC BỊ MỞ RA** ($X$ và $Y$ trở nên phụ thuộc lẫn nhau do hiện tượng Explaining Away!).

### Flashcard 4: Định Lý Vùng Biên Markov (Markov Blanket)
- **Mặt trước:** Vùng biên Markov $\text{MB}(X)$ của một nút $X$ gồm những thành phần nào và nó có tính chất bảo vệ thông tin gì?
- **Mặt sau:**
  - $\text{MB}(X)$ gồm 3 nhóm nút:
    1. **Các nút cha trực tiếp** của $X$ ($\text{Parents}(X)$).
    2. **Các nút con trực tiếp** của $X$ ($\text{Children}(X)$).
    3. **Các nút cha khác của các con của $X$** ($\text{Spouses} / \text{Other parents of } X\text{'s children}$).
  - **Tính chất bảo vệ tuyệt đối:** Khi đã biết giá trị của tất cả các biến trong $\text{MB}(X)$, nút $X$ **hoàn toàn độc lập có điều kiện với toàn bộ các biến còn lại trong mạng Bayes**:
    $$P(X \mid \text{MB}(X), \text{Rest}) = P(X \mid \text{MB}(X))$$

### Flashcard 5: Ngụy Biện Tỷ Lệ Nền (Base Rate Fallacy)
- **Mặt trước:** Ngụy biện tỷ lệ nền là gì? Nêu ví dụ thực tế trong y khoa.
- **Mặt sau:**
  - Là sai lầm tâm lý khi con người chỉ chú ý vào độ chính xác của xét nghiệm ($P(+ \mid D) = 99\%$) mà quên mất xác suất mắc bệnh trong cộng đồng là cực kỳ nhỏ ($P(D) = 0.1\%$).
  - Khi tỷ lệ nền quá thấp, số lượng ca dương tính giả sinh ra từ quần thể người khỏe mạnh khổng lồ ($99.9\% \times 1\% = 0.999\%$) sẽ áp đảo số lượng ca dương tính thật ($0.1\% \times 99\% = 0.099\%$).
  - Kết quả là một người nhận kết quả dương tính chỉ có khoảng $9\%$ nguy cơ thực sự mắc bệnh, chứ không phải $99\%$!

---

## 3. Các Bảng So Sánh Đa Chiều Nền Tảng (Comprehensive Comparison Tables)

### Bảng 1: So Sánh Ba Cấu Trúc Truyền Tin Cơ Bản Trong Mạng Bayes

| Mô hình topo | Sơ đồ hình học | Trạng thái khi $M$ CHƯA được quan sát ($M \notin Z$) | Trạng thái khi $M$ ĐÃ được quan sát ($M \in Z$) | Hiện tượng triết học |
|---|:---:|:---:|:---:|---|
| **Chuỗi nhân quả (Serial Chain)** | $X \longrightarrow M \longrightarrow Y$ | **MỞ** (Active path: $X$ và $Y$ phụ thuộc) | **BỊ CHẶN** (Blocked: $X \perp Y \mid M$) | Chặn thông tin gián tiếp qua biến trung gian. |
| **Cùng nguyên nhân (Fork / Diverging)** | $X \longleftarrow M \longrightarrow Y$ | **MỞ** (Active path: $X$ và $Y$ phụ thuộc) | **BỊ CHẶN** (Blocked: $X \perp Y \mid M$) | Khi biết nguyên nhân chung, hai hệ quả độc lập. |
| **Cùng kết quả (Collider / V-structure)** | $X \longrightarrow M \longleftarrow Y$ | **BỊ CHẶN** (Blocked: $X \perp Y \mid \emptyset$) | **BỊ MỞ RA** (Active: $X \not\perp Y \mid M$) | **Explaining Away**: Hai nguyên nhân phụ thuộc nhau. |

---

### Bảng 2: So Sánh Độc Lập Biên vs Độc Lập Có Điều Kiện

| Tiêu chí | Độc Lập Biên (Marginal Independence) | Độc Lập Có Điều Kiện (Conditional Independence) |
|---|---|---|
| **Định nghĩa toán học** | $P(A, B) = P(A) \cdot P(B)$ hoặc $P(A \mid B) = P(A)$. | $P(A, B \mid C) = P(A \mid C) \cdot P(B \mid C)$ hoặc $P(A \mid B, C) = P(A \mid C)$. |
| **Ý nghĩa bản chất** | Biết thông tin về $B$ hoàn toàn không làm thay đổi niềm tin về $A$ trong trạng thái bình thường. | Biết thông tin về $B$ không cung cấp thêm bất kỳ giá trị mới nào về $A$ một khi **đã biết thông tin $C$**. |
| **Mối quan hệ qua lại** | Độc lập biên **KHÔNG suy ra** độc lập có điều kiện. *(Ví dụ: Đột nhập và Động đất độc lập biên, nhưng khi biết Chuông reo thì phụ thuộc)*. | Độc lập có điều kiện **KHÔNG suy ra** độc lập biên. *(Ví dụ: Sốt và Phát ban phụ thuộc biên qua Bệnh sởi, nhưng độc lập có điều kiện khi biết có bệnh)*. |

---

### Bảng 3: So Sánh Suy Luận Chẩn Đoán vs Suy Luận Nhân Quả

| Tiêu chí | Suy Luận Nhân Quả (Causal / Top-down) | Suy Luận Chẩn Đoán (Diagnostic / Bottom-up) |
|---|---|---|
| **Chiều suy diễn** | Từ **Nguyên nhân $\longrightarrow$ Triệu chứng / Kết quả**. | Từ **Triệu chứng / Bằng chứng $\longrightarrow$ Nguyên nhân**. |
| **Dạng xác suất** | $P(\text{Triệu chứng} \mid \text{Bệnh})$ (Likelihood). | $P(\text{Bệnh} \mid \text{Triệu chứng})$ (Posterior). |
| **Tính sẵn có của dữ liệu**| Rất dễ thu thập và ổn định vật lý qua các thí nghiệm y khoa/kỹ thuật. | Phụ thuộc chặt chẽ vào tỷ lệ nền dịch tễ học ($P(\text{Bệnh})$) thay đổi theo từng vùng. |
| **Công cụ chuyển đổi** | Đi thẳng từ cấu trúc CPT của Mạng Bayes. | **Bắt buộc dùng Định lý Bayes** để lật ngược chiều suy diễn: $P(H \mid E) = \frac{P(E \mid H) P(H)}{P(E)}$. |

---

## 4. Bẫy Thi Cử & Những Sai Lầm Chết Người (Deadly Exam Traps)

1. **Bẫy 1: Quên con cháu của nút Collider khi kiểm tra d-separation.**
   - *Sai lầm:* Thấy nút Collider $M \notin Z$ là vội vàng kết luận con đường bị chặn, mà không để ý rằng **một nút con $D$ của $M$ nằm trong $Z$ ($D \in Z$)**.
   - *Sự thật chuẩn A+:* Theo định nghĩa d-separation, con đường qua Collider bị mở ra nếu $M \in Z$ **HOẶC bất kỳ con cháu nào của $M$ thuộc $Z$**!
2. **Bẫy 2: Cho rằng hai biến không có cạnh nối trực tiếp là độc lập biên.**
   - *Sai lầm:* Thấy giữa nút $X$ và $Y$ không có mũi tên là kết luận $P(X, Y) = P(X) P(Y)$.
   - *Sự thật chuẩn A+:* Thiếu cạnh nối chỉ có nghĩa là không phụ thuộc trực tiếp. Hai nút vẫn có thể phụ thuộc biên mạnh mẽ thông qua một chuỗi trung gian ($X \to M \to Y$) hoặc một nguyên nhân chung ($X \leftarrow M \to Y$)!
3. **Bẫy 3: Quên hằng số chuẩn hóa $\alpha$ khi tính truy vấn Mạng Bayes.**
   - *Sai lầm:* Tính tổng tử số của $P(B = t, e)$ rồi ghi kết quả đó là $P(B = t \mid e)$.
   - *Sự thật chuẩn A+:* Tổng các phân phối đồng thời chỉ là tỷ lệ chưa chuẩn hóa. Bắt buộc phải tính cả hai trường hợp ($B = t$ và $B = f$), sau đó chia cho tổng của chúng để đưa tổng xác suất về đúng $1.0$!
4. **Bẫy 4: Vi phạm thứ tự biến khi phân rã chuỗi Mạng Bayes.**
   - *Sai lầm:* Viết $P(X_1, \dots, X_n) = \prod P(X_i \mid \text{Children}(X_i))$.
   - *Sự thật chuẩn A+:* Công thức phân rã mạng Bayes luôn là điều kiện theo **NÚT CHA (Parents)**: $P(X_1, \dots, X_n) = \prod_{i=1}^n P(X_i \mid \text{Parents}(X_i))$.

---

## 5. Động Từ Chỉ Lệnh Phòng Thi & Chiến Thuật Trả Lời (Action Verbs Guide)

| Động từ đề thi | Yêu cầu hành động chuẩn A+ | Cấu trúc câu trả lời tối ưu |
|---|---|---|
| **Factorize the joint distribution...** | Viết biểu thức tích của các xác suất có điều kiện dựa trên các cung cha $\to$ con của mạng Bayes. | $P(X_1, \dots, X_n) = \prod_{i=1}^n P(X_i \mid \text{Parents}(X_i)) = P(\text{Root}_1) \dots P(\text{Node}_k \mid \text{Pa}_k)$. |
| **Check whether $X \perp Y \mid Z$...** | Trình bày đầy đủ quy trình 4 bước kiểm tra d-separation. | 1. Liệt kê các đường vô hướng $\rightarrow$ 2. Xác định dạng nút (Chain/Fork/Collider) $\rightarrow$ 3. Kiểm tra mở/chặn từng đường $\rightarrow$ 4. Kết luận $X \perp Y \mid Z$ hoặc $X \not\perp Y \mid Z$. |
| **Compute the posterior probability...** | Áp dụng công thức Bayes hoặc tính toán biên duyên hóa với hằng số chuẩn hóa $\alpha$. | 1. Viết công thức Bayes $\rightarrow$ 2. Thay số vào tử số và mẫu số toàn phần $\rightarrow$ 3. Rút gọn phân số và đổi sang số thập phân kèm $\%$. |
| **Maximize entropy subject to constraints...** | Lập hàm Lagrange, lấy đạo hàm riêng và giải nghiệm. | 1. Lập hàm $L(p, \lambda) \rightarrow$ 2. Đạo hàm $\frac{\partial L}{\partial p_i} = 0 \rightarrow$ 3. Suy ra hệ thức logarit $\rightarrow$ 4. Giải nghiệm $p_i$ theo tham số ràng buộc. |

---

## 6. Bảng Kiểm Năng Lực Trước Giờ Thi (Pre-Exam Competency Checklist)

- [ ] Tôi phân biệt rạch ròi bản chất giữa Xác suất (Epistemic Uncertainty) và Logic Mờ (Degree of Truth).
- [ ] Tôi giải thích được tại sao $P(B \mid A)$ khác hoàn toàn xác suất của phép kéo theo vật chất $P(A \implies B)$.
- [ ] Tôi tính đúng xác suất hậu nghiệm Bayes và giải thích được hiện tượng Ngụy biện tỷ lệ nền (Base Rate Fallacy).
- [ ] Tôi thuộc công thức tính Entropy Shannon $H = -\sum p_i \ln p_i$ và giải được bài toán MaxEnt bằng nhân tử Lagrange.
- [ ] Tôi viết đúng công thức phân rã phân phối đồng thời (Factorization) cho một mạng Bayes bất kỳ.
- [ ] Tôi thực hiện thành thạo quy trình 4 bước kiểm tra d-separation trên cả 3 mô hình (Chain, Fork, Collider).
- [ ] Tôi giải thích được hiện tượng Explaining Away tại nút Collider và chỉ ra được các thành phần của Vùng biên Markov (Markov Blanket).
