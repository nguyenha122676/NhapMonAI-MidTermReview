# Chương 7 – Lý Thuyết Toàn Diện: Suy Luận Trong Điều Kiện Bất Định (Reasoning with Uncertainty)

> **Mục tiêu đạt điểm A+:** Nắm vững bản chất toán học của sự bất định trong AI; phân biệt rạch ròi Xác suất (Probability) và Logic Mờ (Fuzzy Logic); làm chủ các định lý xác suất nền tảng (Tiên đề Kolmogorov, Xác suất có điều kiện, Định lý Bayes, Ngụy biện tỷ lệ nền); hiểu sâu sắc Nguyên lý Cực đại Entropy (Maximum Entropy - MaxEnt) và hệ chuyên gia y tế LEXMED; khai thác triệt để cấu trúc đồ thị Mạng Bayes (DAG, CPT, Factorization), ba mô hình truyền tin và tiêu chuẩn d-separation, hiện tượng Explaining Away và Markov Blanket.

---

## 1. Cội Nguồn Bất Định & Sự Bế Tắc Của Logic Cổ Điển

### 1.1. Tại Sao Logic Cổ Điển (PL0, PL1) Bất Lực Trước Thế Giới Thực?
Trong các hệ logic hình thức cổ điển, mọi phát biểu đều mang tính nhị phân tuyệt đối: hoặc Đúng ($1$), hoặc Sai ($0$). Tuy nhiên, khi đối diện với các bài toán thế giới thực (chẩn đoán y tế, xe tự hành, kinh tế học, xử lý ngôn ngữ), logic cổ điển hoàn toàn tê liệt bởi 3 nguyên nhân cốt lõi:
1. **Sự lười biếng / Quá tải tri thức (Laziness / Incomplete Knowledge):** Để viết một luật tuyệt đối chính xác cho một chẩn đoán bệnh (như đau ruột thừa), ta phải liệt kê hàng ngàn điều kiện loại trừ ngoại lệ (không bị sỏi thận, không đau dạ dày, không xoắn ruột...). Kích thước tri thức quá khổng lồ khiến chuyên gia con người không thể hình thức hóa đầy đủ.
2. **Sự thiếu hiểu biết lý thuyết (Theoretical Ignorance):** Khoa học hiện đại chưa hiểu biết $100\%$ về các quy luật tự nhiên, chẳng hạn cơ chế phân tử phát sinh ung thư hay động lực học của một cơn bão nhiệt đới.
3. **Nhiễu cảm biến & Đo lường thực tế (Practical Ignorance / Sensor Noise):** Các cảm biến phần cứng (Camera, Lidar, Radar, Đo điện tim) luôn luôn bị méo mó và chứa sai số ngẫu nhiên do môi trường (mưa, sương mù, trượt lốp, rung chấn).

### 1.2. Phân Biệt Sống Còn: Xác Suất (Probability) vs Logic Mờ (Fuzzy Logic)

| Tiêu chí so sánh | Lý Thuyết Xác Suất (Probability Theory) | Logic Mờ (Fuzzy Logic) |
|---|---|---|
| **Bản chất phản ánh** | Đo lường **Mức độ tin tưởng (Degree of Belief)** về một sự kiện do **thiếu hụt thông tin** (*Epistemic Uncertainty*). | Đo lường **Mức độ chân lý (Degree of Truth)** của một khái niệm ngôn ngữ bản thân nó **không có ranh giới rạch ròi** (*Vagueness*). |
| **Bản chất thế giới** | Thế giới khách quan là nhị phân (đen/trắng): sự kiện thực tế đã xảy ra hoặc không xảy ra ($1$ hoặc $0$). | Thế giới mang tính liên tục: bản thân sự việc nằm lơ lửng giữa các ranh giới khái niệm. |
| **Ví dụ kinh điển** | Một lọ nước dán nhãn: $P(\text{Thuốc độc}) = 0.01$. Thực tế trong lọ là $100\%$ nước lọc tinh khiết hoặc $100\%$ xyanua cực độc, nhưng ta chưa làm xét nghiệm hóa học nên gán độ tin cậy $1\%$. | Một bát nước ngọt pha đường: Độ ngọt thuộc về tập mờ "Nước ngọt" với giá trị $\mu = 0.7$. Nước không hề chứa chất độc, nhưng vị ngọt nằm ở mức vừa phải giữa nhạt và ngọt gắt. |
| **Công cụ toán học** | Không gian xác suất Kolmogorov, Hàm mật độ, Mạng Bayes. | Tập mờ, Hàm thuộc liên thuộc $\mu_A(x) \in [0, 1]$, Các toán tử t-norm và t-conorm. |

---

## 2. Nền Tảng Lý Thuyết Xác Suất Trong Trí Tuệ Nhân Tạo

### 2.1. Tiên Đề Xác Suất Kolmogorov (Axioms of Probability)
Cho không gian mẫu $\Omega$ đại diện cho tập hợp tất cả các thế giới khả dĩ (Possible Worlds):
1. Với mọi biến cố $A \subseteq \Omega$: $0 \le P(A) \le 1$.
2. $P(\Omega) = 1$ và $P(\emptyset) = 0$.
3. Nếu hai biến cố $A$ và $B$ xung khắc rời nhau ($A \cap B = \emptyset$):
   $$P(A \cup B) = P(A) + P(B)$$
- **Công thức bao hàm - loại trừ tổng quát:**
  $$P(A \cup B) = P(A) + P(B) - P(A \cap B)$$

### 2.2. Xác Suất Có Điều Kiện: Bản Chất Là "Thu Hẹp Không Gian Mẫu"
Xác suất của biến cố $B$ khi đã biết chắc chắn biến cố $A$ đã xảy ra được định nghĩa:
$$P(B \mid A) = \frac{P(A \cap B)}{P(A)} \quad (\text{với } P(A) > 0)$$

- **Bản chất hình học trực quan:** Ban đầu, xác suất của $B$ được đo bằng diện tích của miền $B$ chia cho toàn bộ diện tích không gian mẫu $\Omega$. Khi biết $A$ xảy ra, toàn bộ không gian mẫu bị **thu hẹp tức thì về đúng diện tích của miền $A$**. Mọi khả năng nằm ngoài $A$ bị triệt tiêu hoàn toàn. Khả năng để $B$ xảy ra lúc này chính là phần diện tích giao $A \cap B$ nằm bên trong vùng đất mới $A$.

### 2.3. Bẫy Chết Người: $P(B \mid A)$ Khác Hoàn Toàn $P(A \implies B)$
Trong logic mệnh đề, phép kéo theo vật chất được định nghĩa: $A \implies B \equiv \neg A \lor B$. Do đó:
$$P(A \implies B) = P(\neg A \lor B) = P(\neg A) + P(A \land B) = 1 - P(A) + P(A \land B)$$
- **Nghịch lý:** Nếu một biến cố $A$ cực kỳ hiếm khi xảy ra (chẳng hạn bão tuyết rơi ở Sài Gòn, $P(A) = 0.0001$), thì $P(\neg A) = 0.9999$.
- Khi đó $P(A \implies B) \ge 0.9999$ (Xác suất của luật kéo theo luôn xấp xỉ $100\%$ chỉ đơn thuần vì tiền đề $A$ hiếm gặp!).
- Nhưng điều này hoàn toàn không có nghĩa là nếu có tuyết rơi thì trường học sẽ đóng cửa ($P(B \mid A)$ có thể bằng $0$ nếu trường có hệ thống sưởi ngầm).
- **Quy tắc vàng của AI:** **Luôn luôn sử dụng Xác suất có điều kiện $P(B \mid A)$ để biểu diễn tri thức luật, tuyệt đối không dùng xác suất của phép kéo theo vật chất $P(A \implies B)$!**

### 2.4. Quy Tắc Nhân & Định Lý Xác Suất Toàn Phần (Marginalization)
1. **Quy tắc nhân (Product Rule):**
   $$P(A \land B) = P(A \mid B) P(B) = P(B \mid A) P(A)$$
2. **Quy tắc chuỗi (Chain Rule):** Phân rã phân phối đồng thời của $n$ biến:
   $$P(X_1, X_2, \dots, X_n) = P(X_1) P(X_2 \mid X_1) P(X_3 \mid X_1, X_2) \dots P(X_n \mid X_1, \dots, X_{n-1})$$
3. **Định lý xác suất toàn phần (Marginalization / Law of Total Probability):** Cho $\{B_1, \dots, B_k\}$ là một phân hoạch của không gian mẫu $\Omega$:
   $$P(A) = \sum_{i=1}^k P(A \land B_i) = \sum_{i=1}^k P(A \mid B_i) P(B_i)$$

### 2.5. Định Lý Bayes: Cỗ Máy Cập Nhật Niềm Tin
Từ quy tắc nhân đối xứng $P(H \land E) = P(E \mid H) P(H) = P(H \mid E) P(E)$, ta suy ra Công thức Bayes (Thomas Bayes, 1763):
$$P(H \mid E) = \frac{P(E \mid H) \cdot P(H)}{P(E)} = \frac{P(E \mid H) \cdot P(H)}{\sum_{i} P(E \mid H_i) P(H_i)}$$

- **$P(H)$ (Prior Probability - Tiên nghiệm):** Mức độ tin tưởng ban đầu vào giả thuyết $H$ trước khi thu thập bằng chứng mới.
- **$P(E \mid H)$ (Likelihood - Khả năng hợp lý):** Xác suất bằng chứng $E$ xuất hiện nếu giả thuyết $H$ là đúng (chiều nhân quả tự nhiên).
- **$P(E)$ (Evidence / Marginal - Xác suất biên duyên):** Tổng xác suất xuất hiện của bằng chứng $E$ trên tất cả các kịch bản của thế giới.
- **$P(H \mid E)$ (Posterior Probability - Hậu nghiệm):** Niềm tin được cập nhật về giả thuyết $H$ sau khi đã tận mắt ghi nhận bằng chứng $E$.

### 2.6. Ngụy Biện Tỷ Lệ Nền (Base Rate Fallacy)
- Giả sử một căn bệnh hiếm gặp có tỷ lệ mắc trong cộng đồng là $P(\text{Bệnh}) = 0.001$ ($0.1\%$).
- Một xét nghiệm y tế có độ chính xác $99\%$:
  - $P(+ \mid \text{Bệnh}) = 0.99$ (Độ nhạy - Sensitivity).
  - $P(- \mid \text{Khỏe}) = 0.99 \implies P(+ \mid \text{Khỏe}) = 0.01$ (Dương tính giả - False Positive).
- **Câu hỏi:** Một người xét nghiệm cho kết quả DƯƠNG TÍNH ($+$). Hỏi xác suất thực sự mắc bệnh là bao nhiêu?
- **Tính toán theo Định lý Bayes:**
  $$P(\text{Bệnh} \mid +) = \frac{P(+ \mid \text{Bệnh}) P(\text{Bệnh})}{P(+ \mid \text{Bệnh}) P(\text{Bệnh}) + P(+ \mid \text{Khỏe}) P(\text{Khỏe})}$$
  $$P(\text{Bệnh} \mid +) = \frac{0.99 \times 0.001}{(0.99 \times 0.001) + (0.01 \times 0.999)} = \frac{0.00099}{0.00099 + 0.00999} = \frac{0.00099}{0.01098} \approx \mathbf{9.02\%}!$$
- **Bài học sâu sắc:** Dù xét nghiệm chính xác tới $99\%$, xác suất thực sự mắc bệnh chỉ khoảng **$9\%$**, vì tỷ lệ nền tiên nghiệm ($0.1\%$) quá nhỏ so với số lượng ca dương tính giả sinh ra từ quần thể người khỏe mạnh khổng lồ ($99.9\%$).

---

## 3. Nguyên Lý Cực Đại Entropy (Maximum Entropy - MaxEnt)

### 3.1. Nghịch Lý Bùng Nổ Tham Số Của Bảng Phân Phối Đồng Thời
Để mô hình hóa đầy đủ $n$ biến nhị phân ngẫu nhiên, ta cần một bảng phân phối xác suất đồng thời (Joint Probability Distribution) gồm $2^n$ ô trạng thái:
- Với $n = 30$ biến, bảng cần $2^{30} \approx 1.07 \times 10^9$ giá trị xác suất (hơn 1 tỷ tham số!).
- Thực tế, các chuyên gia y tế chỉ cung cấp cho ta một số ràng buộc thống kê rời rạc (ví dụ: $P(\text{Sốt}) = 0.2$, $P(\text{Đau bụng} \mid \text{Viêm ruột thừa}) = 0.8$).
- Với hàng triệu ô trạng thái còn trống trong bảng, ta phải điền giá trị nào vào mà không tự ý đưa vào các định kiến chủ quan sai lầm?

### 3.2. Entropy Thông Tin Shannon (Shannon Entropy)
Năm 1948, Claude Shannon định nghĩa thước đo định lượng mức độ bất định (hỗn loạn / thiếu thông tin) của một phân phối xác suất rời rạc:
$$H(p_1, p_2, \dots, p_N) = -\sum_{i=1}^N p_i \ln p_i = -\sum_{i=1}^N p_i \log_2 p_i \quad (\text{Quy ước } 0 \ln 0 = 0)$$

- Nếu một biến cố chắc chắn $100\%$ xảy ra ($p_1 = 1, p_{i>1} = 0$), thì $H = 0$ (hoàn toàn không có bất ngờ hay bất định).
- Entropy đạt cực đại khi và chỉ khi phân phối là **Phân phối Đều (Uniform Distribution)**: $p_1 = p_2 = \dots = p_N = \frac{1}{N} \implies H_{\max} = \ln N$.

### 3.3. Triết Lý MaxEnt Của E.T. Jaynes (1957)
> *"Khi lựa chọn một phân phối xác suất phù hợp với các tri thức hiện có, hãy chọn phân phối có Entropy LỚN NHẤT!"*

- **Bản chất khoa học:** Tối đa hóa Entropy đồng nghĩa với việc tối đa hóa độ bất định còn lại, đảm bảo ta **thành thật tuyệt đối với sự thiếu hiểu biết của mình**, không tự ý bịa đặt thêm bất kỳ ràng buộc ngầm định nào ngoài các dữ kiện thực tế đã được cung cấp.
- **Phương pháp Giải tích Nhân tử Lagrange:**
  $$L(p_1, \dots, p_N, \vec{\lambda}) = -\sum_{i=1}^N p_i \ln p_i + \lambda_0 \left(1 - \sum_{i=1}^N p_i\right) + \sum_{k} \lambda_k \left(c_k - \sum_{i=1}^N p_i f_k(i)\right)$$
  Giải hệ phương trình $\frac{\partial L}{\partial p_i} = 0$ ta tìm ra phân phối MaxEnt duy nhất.
- **Hệ quả kỳ diệu:** Nếu chỉ biết xác suất biên $P(A) = \alpha$ và $P(B) = \beta$ mà không có ràng buộc tương quan, MaxEnt tự động chứng minh: $P(A \land B) = \alpha \cdot \beta$ (tự động suy ra hai biến là **Độc lập thống kê** mà không cần chuyên gia phải giả định trước).

### 3.4. Hệ Chuyên Gia Y Tế LEXMED & Ma Trận Chi Phí (Cost-Sensitive Decision)
Giáo sư Wolfgang Ertel đã ứng dụng MaxEnt xây dựng hệ chuyên gia y tế chẩn đoán viêm ruột thừa cấp **LEXMED**:
- **Nguyên lý Ma trận Chi phí Rủi ro (Cost Matrix):**
  Trong y tế, ta không thể quyết định hành động chỉ dựa vào xác suất lớn nhất!
  - Mổ nhầm một người không viêm ruột thừa: Tổn hại $C_{\text{FP}} = 1$ (vết mổ nhỏ, nằm viện vài ngày).
  - Bỏ sót một ca viêm ruột thừa để ruột vỡ gây viêm phúc mạc: Tổn hại $C_{\text{FN}} = 100$ (nguy cơ tử vong).
- **Quyết định tối ưu Bayes:**
  Hệ thống chỉ định mổ ngay khi tổn thất kỳ vọng của việc mổ nhỏ hơn việc không mổ:
  $$C_{\text{FP}} \cdot (1 - p) < C_{\text{FN}} \cdot p \iff 1(1 - p) < 100p \iff 101p > 1 \iff p > \frac{1}{101} \approx \mathbf{0.99\%}!$$
  Chỉ cần xác suất viêm ruột thừa vượt qua mức $1\%$, hệ thống đã ra lệnh mổ cấp cứu để bảo toàn tính mạng bệnh nhân.

---

## 4. Mạng Bayes (Bayesian Networks - BN)

### 4.1. Định Nghĩa Hình Thức
Một **Mạng Bayes (Bayesian Network)** là một cấu trúc dữ liệu biểu diễn phân phối xác suất đồng thời gồm:
1. **Một Đồ thị Có hướng Không chu trình (DAG - Directed Acyclic Graph):**
   - Mỗi nút (Node) đại diện cho một biến ngẫu nhiên (Rời rạc hoặc Liên tục).
   - Mỗi cung có hướng $X \to Y$ biểu diễn sự phụ thuộc trực tiếp hoặc quan hệ nhân quả từ nguyên nhân $X$ đến kết quả $Y$.
2. **Một tập các Bảng Xác Suất Có Điều Kiện (CPT - Conditional Probability Table):**
   - Mỗi nút $X_i$ gắn liền với một bảng phân phối xác suất $P(X_i \mid \text{Parents}(X_i))$ mô tả định lượng ảnh hưởng của các nút cha lên nút đó.

### 4.2. Công Thức Phân Rã Toàn Cục (Chain Rule for Bayesian Networks)
Nhờ tính chất độc lập có điều kiện, bảng phân phối xác suất đồng thời đầy đủ của toàn bộ $n$ biến trong mạng được phân rã thành tích của các phân phối cục bộ:
$$P(X_1, X_2, \dots, X_n) = \prod_{i=1}^n P(X_i \mid \text{Parents}(X_i))$$

- **Sức mạnh cắt giảm tham số:**
  Nếu mỗi nút có tối đa $k$ cha, số tham số của bảng CPT cho mỗi biến nhị phân chỉ là $2^k$.
  Tổng số tham số của toàn bộ mạng là $n \cdot 2^k$, tăng **tuyến tính theo số biến $n$** thay vì tăng cấp số nhân $2^n$!
  *(Ví dụ: Với $n = 30, k = 3$: thay vì hơn 1 tỷ tham số, mạng Bayes chỉ cần $30 \times 2^3 = 240$ tham số, giảm chi phí lưu trữ hơn 4 triệu lần!)*.

---

## 5. Độc Lập Có Điều Kiện & Tiêu Chuẩn d-Separation

### 5.1. Ba Mô Hình Truyền Tin Cơ Bản Trong Mạng Bayes

```
1. CHUỖI NHÂN QUẢ (SERIAL CHAIN / CASCADE)
   (X) ────────► (Z) ────────► (Y)
   - Nếu KHÔNG BIẾT Z: Thông tin truyền thông suốt giữa X và Y (X và Y phụ thuộc nhau).
   - Nếu ĐÃ BIẾT Z: Con đường BỊ CHẶN! X và Y độc lập có điều kiện: P(Y | X, Z) = P(Y | Z).

2. CÙNG NGUYÊN NHÂN (DIVERGING / FORK / COMMON CAUSE)
            (Z)
           /   \
          ▼     ▼
        (X)     (Y)
   - Nếu KHÔNG BIẾT Z: X và Y phụ thuộc nhau (cùng chịu ảnh hưởng từ nguyên nhân Z).
   - Nếu ĐÃ BIẾT Z: Con đường BỊ CHẶN! X và Y trở nên độc lập có điều kiện.

3. CÙNG KẾT QUẢ (CONVERGING / COLLIDER / V-STRUCTURE / COMMON EFFECT)
        (X)     (Y)
          \     /
           ▼   ▼
            (Z)
   - Nếu KHÔNG BIẾT Z (và không biết con cháu của Z): X và Y HOÀN TOÀN ĐỘC LẬP! Con đường BỊ CHẶN tự nhiên.
   - Nếu ĐÃ BIẾT Z (hoặc con cháu của Z được quan sát): Con đường BỊ MỞ RA! X và Y TRỞ NÊN PHỤ THUỘC LẪN NHAU!
```

### 5.2. Hiện Tượng "Explaining Away" (Giải Thích Bỏ Qua)
Mô hình thứ 3 (Collider) phản ánh một cơ chế tư duy trực giác đỉnh cao của con người:
- Xét cấu trúc: $\text{Trộm} \to \text{Chuông} \leftarrow \text{Động đất}$.
- Khi chưa biết chuông reo: Việc có trộm và có động đất hoàn toàn độc lập với nhau.
- Khi **tiếng chuông báo động reo vang** (nút $Z$ được quan sát):
  - Người chủ nhà rất lo sợ có trộm đột nhập ($P(\text{Trộm} \mid \text{Chuông}) \approx 44\%$).
  - Bỗng nhiên, bản tin thời sự báo: *"Vừa xảy ra một trận động đất làm rung chuyển khu phố!"*.
  - Ngay lập tức, người chủ nhà thở phào nhẹ nhõm: *"À, chuông kêu là do động đất rung lắc cảm biến, không phải do trộm!"*.
  - Bằng chứng động đất đã **"bào chữa / giải thích bỏ qua" (Explained away)** nguyên nhân trộm, khiến xác suất có trộm giảm thẳng đứng từ $44\%$ xuống còn $0.16\%$.

### 5.3. Định Nghĩa Hình Thức Tiêu Chuẩn d-Separation (Directed Separation)
Hai nút $X$ và $Y$ được gọi là **d-separated (độc lập định hướng)** bởi một tập bằng chứng $Z$ nếu **mọi con đường vô hướng** (Undirected paths) nối giữa $X$ và $Y$ đều bị chặn.
Một con đường bị chặn bởi tập $Z$ khi và chỉ khi trên con đường đó tồn tại ít nhất một nút $W$ thỏa mãn một trong hai điều kiện:
1. $W$ thuộc dạng **Chuỗi nhân quả (Chain)** hoặc **Cùng nguyên nhân (Fork)** VÀ $W \in Z$ (đã được quan sát).
2. $W$ thuộc dạng **Cùng kết quả (Collider / V-structure)** VÀ cả $W$ lẫn mọi con cháu của $W$ đều **KHÔNG thuộc $Z$** (chưa được quan sát).

### 5.4. Vùng Biên Markov (Markov Blanket)
Vùng biên Markov của một nút $X$ trong mạng Bayes ký hiệu là $\text{MB}(X)$, bao gồm:
1. **Các nút cha trực tiếp** của $X$ ($\text{Parents}(X)$).
2. **Các nút con trực tiếp** của $X$ ($\text{Children}(X)$).
3. **Các nút cha khác của các nút con của $X$** (Other parents of $X$'s children - các "vợ/chồng" cùng sinh con với $X$).

> [!IMPORTANT]
> **Định lý Markov Blanket:** Khi đã biết giá trị của tất cả các biến trong Vùng biên Markov $\text{MB}(X)$, nút $X$ **độc lập có điều kiện với toàn bộ các biến còn lại trên toàn bộ mạng Bayes**:
> $$P(X \mid \text{MB}(X), \text{Rest}) = P(X \mid \text{MB}(X))$$
