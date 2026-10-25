# Chương 7 – Các Dạng Bài Tập Trọng Tâm & Lời Giải Chi Tiết (Key Exam Problems & Step-by-Step Solutions)

> **Mục tiêu đạt điểm A+:** Rèn luyện thuần thục kỹ năng giải toàn bộ các bài toán thi tự luận và tính toán định lượng: Tính xác suất hậu nghiệm Bayes tránh ngụy biện tỷ lệ nền (Base Rate Fallacy); Tính xác suất toàn phần từ bảng CPT; Phân rã mạng Bayes và kiểm tra d-separation trên đồ thị qua quy trình 4 bước; Giải bài toán Cực đại Entropy (MaxEnt) bằng phương pháp nhân tử Lagrange; Suy diễn chuẩn xác bằng phép liệt kê (Inference by Enumeration) với hằng số chuẩn hóa $\alpha$; và Phân tích ma trận chi phí rủi ro trong hệ chuyên gia y tế LEXMED.

---

## Dạng 1: Xác Suất Hậu Nghiệm Bayes & Khắc Phục Ngụy Biện Tỷ Lệ Nền

### Bài toán 1.1: Chẩn Đoán Y Tế Với Bệnh Hiếm Gặp
Một bệnh viện triển khai một xét nghiệm tầm soát căn bệnh hiểm nghèo $D$ (Disease). Các dữ liệu dịch tễ học và độ chính xác kỹ thuật được ghi nhận như sau:
- Tỷ lệ mắc bệnh trong cộng đồng: $P(D) = 0.001$ ($0.1\%$).
- Độ nhạy của xét nghiệm (Sensitivity - Tỷ lệ dương tính nếu thực sự có bệnh):
  $$P(+ \mid D) = 0.99$$
- Tỷ lệ dương tính giả (False Positive - Tỷ lệ xét nghiệm báo nhầm người khỏe thành có bệnh):
  $$P(+ \mid \neg D) = 0.01$$
Một bệnh nhân ngẫu nhiên đi xét nghiệm và nhận được kết quả **DƯƠNG TÍNH ($+$)**.
1. Hãy tính xác suất thực sự mắc bệnh của người này: $P(D \mid +)$.
2. Trình bày lại lời giải bằng phương pháp **Tần suất tự nhiên (Natural Frequencies)** trên một quần thể giả định $100,000$ người để giải thích trực quan tại sao xác suất này lại thấp hơn trực giác thông thường.

#### Lời giải chi tiết:

1. **Tính toán theo Định lý Bayes chính tắc:**
   - Áp dụng công thức Bayes kết hợp công thức xác suất toàn phần ở mẫu số:
     $$P(D \mid +) = \frac{P(+ \mid D) \cdot P(D)}{P(+)} = \frac{P(+ \mid D) \cdot P(D)}{P(+ \mid D) \cdot P(D) + P(+ \mid \neg D) \cdot P(\neg D)}$$
   - Ta có:
     - $P(D) = 0.001 \implies P(\neg D) = 1 - 0.001 = 0.999$.
     - Tử số (Xác suất có bệnh VÀ dương tính):
       $$P(+ \land D) = 0.99 \times 0.001 = 0.00099$$
     - Mẫu số (Tổng xác suất nhận kết quả dương tính $P(+)$):
       $$P(+) = (0.99 \times 0.001) + (0.01 \times 0.999) = 0.00099 + 0.00999 = 0.01098$$
     - Xác suất hậu nghiệm:
       $$P(D \mid +) = \frac{0.00099}{0.01098} = \frac{99}{1098} \approx \mathbf{0.09016} \quad (\approx \mathbf{9.02\%})$$
   - **Kết luận:** Người này chỉ có khoảng **$9.02\%$** nguy cơ thực sự mắc bệnh, dù xét nghiệm có độ chính xác kỹ thuật lên tới $99\%$.

2. **Giải thích bằng Phương pháp Tần suất Tự nhiên (Natural Frequencies):**
   Xét một quần thể gồm $N = 100,000$ người:
   - **Số người thực sự có bệnh:** $100,000 \times 0.001 = 100$ người.
     - Trong 100 người này, xét nghiệm phát hiện đúng $99\%$: $100 \times 0.99 = \mathbf{99}$ người dương tính thật.
     - Có $1$ người có bệnh bị báo âm tính giả.
   - **Số người hoàn toàn khỏe mạnh:** $100,000 - 100 = 99,900$ người.
     - Trong $99,900$ người này, tỷ lệ dương tính giả là $1\%$:
       $$99,900 \times 0.01 = \mathbf{999} \text{ người dương tính giả}$$
   - **Tổng số người cầm trên tay kết quả Dương tính:**
     $$99 + 999 = 1,098 \text{ người}$$
   - Trong số 1,098 người dương tính đó, chỉ có đúng 99 người thực sự có bệnh:
     $$P(D \mid +) = \frac{99}{1098} \approx \mathbf{9.02\%}$$
   - *Bản chất ngụy biện:* Mọi người thường nhầm lẫn giữa $P(+ \mid D) = 99\%$ (khả năng máy báo đúng khi đã có bệnh) với $P(D \mid +)$ (khả năng có bệnh khi cầm tờ xét nghiệm). Vì tỷ lệ nền của bệnh quá hiếm ($0.1\%$), số ca dương tính giả từ nhóm người khỏe ($999$ người) áp đảo hoàn toàn số ca dương tính thật ($99$ người)!

---

## Dạng 2: Phân Rã Mạng Bayes & Tính Xác Suất Bằng Biên Duyên Hóa

### Bài toán 2.1: Tính Xác Suất Toàn Phần Của Chuông Báo Động (Alarm)
Xét mạng Bayes kinh điển với hai nguyên nhân độc lập: Đột nhập ($B$ - Burglary) và Động đất ($E$ - Earthquake) cùng kích hoạt Chuông báo động ($A$ - Alarm):
- Tiên nghiệm: $P(B = \text{true}) = 0.001$, $P(E = \text{true}) = 0.002$.
- $B$ và $E$ độc lập thống kê: $P(B, E) = P(B) P(E)$.
- Bảng CPT của nút $A$ ($P(A = \text{true} \mid B, E)$):

| $B$ | $E$ | $P(A = \text{true} \mid B, E)$ |
|:---:|:---:|:---:|
| true | true | $0.95$ |
| true | false | $0.94$ |
| false | true | $0.29$ |
| false | false | $0.001$ |

Hãy tính xác suất toàn phần tiếng chuông báo động reo vang: $P(A = \text{true})$.

#### Lời giải chi tiết:
Áp dụng định lý xác suất toàn phần (Marginalization) bằng cách lấy tổng trên tất cả các tổ hợp giá trị của hai biến cha $B$ và $E$:
$$P(A = \text{true}) = \sum_{b \in \{t, f\}} \sum_{e \in \{t, f\}} P(A = \text{true} \mid B = b, E = e) \cdot P(B = b) \cdot P(E = e)$$

Khai triển chi tiết 4 trường hợp:
1. **Trường hợp 1 ($B = t, E = t$):**
   $$P_1 = 0.95 \times P(B=t) \times P(E=t) = 0.95 \times 0.001 \times 0.002 = 0.95 \times 0.000002 = \mathbf{0.00000190}$$
2. **Trường hợp 2 ($B = t, E = f$):**
   $$P_2 = 0.94 \times P(B=t) \times P(E=f) = 0.94 \times 0.001 \times (1 - 0.002) = 0.94 \times 0.001 \times 0.998 = \mathbf{0.00093812}$$
3. **Trường hợp 3 ($B = f, E = t$):**
   $$P_3 = 0.29 \times P(B=f) \times P(E=t) = 0.29 \times (1 - 0.001) \times 0.002 = 0.29 \times 0.999 \times 0.002 = \mathbf{0.00057942}$$
4. **Trường hợp 4 ($B = f, E = f$):**
   $$P_4 = 0.001 \times P(B=f) \times P(E=f) = 0.001 \times 0.999 \times 0.998 = \mathbf{0.000997002}$$

Cộng tổng 4 thành phần:
$$P(A = \text{true}) = P_1 + P_2 + P_3 + P_4$$
$$P(A = \text{true}) = 0.00000190 + 0.00093812 + 0.00057942 + 0.000997002 = \mathbf{0.002516442} \quad (\approx \mathbf{0.25\%})$$

---

## Dạng 3: Kiểm Tra Độc Lập Có Điều Kiện & Tiêu Chuẩn d-Separation

### Quy trình 4 bước chuẩn A+ kiểm tra d-separation giữa $X$ và $Y$ cho trước tập bằng chứng $Z$:
- **Bước 1:** Bỏ qua hướng mũi tên, liệt kê **tất cả các con đường vô hướng** (Undirected Paths) nối giữa $X$ và $Y$.
- **Bước 2:** Trên mỗi con đường, phân loại cấu trúc của từng nút trung gian thành 1 trong 3 dạng:
  1. **Chain (Chuỗi):** $\to W \to$ hoặc $\leftarrow W \leftarrow$.
  2. **Fork (Chẽ nhánh / Cùng cha):** $\leftarrow W \to$.
  3. **Collider / V-structure (Hội tụ / Cùng con):** $\to W \leftarrow$.
- **Bước 3:** Kiểm tra điều kiện chặn:
  - Nút Chain hoặc Fork: **Bị chặn nếu $W \in Z$** (đã biết).
  - Nút Collider: **Bị chặn nếu $W \notin Z$ VÀ mọi con cháu của $W$ đều không thuộc $Z$** (chưa biết gì).
- **Bước 4:** Kết luận: Nếu **mọi con đường** nối $X$ và $Y$ đều bị chặn thì $X$ và $Y$ **d-separated cho trước $Z$** ($X \perp Y \mid Z$). Nếu tồn tại dù chỉ một con đường mở thì không thể kết luận độc lập có điều kiện.

---

### Bài toán 3.1: Kiểm Tra d-Separation Trên Mạng Sprinkler
Cho mạng Bayes Sprinkler (Tưới cỏ) với 4 biến:
- $C$: Trời nhiều mây (Cloudy)
- $S$: Máy phun nước bật (Sprinkler), có cha là $C$
- $R$: Trời mưa (Rain), có cha là $C$
- $W$: Cỏ ướt (WetGrass), có hai cha là $S$ và $R$

```
          (C: Cloudy)
           /       \
          ▼         ▼
     (S: Sprinkler) (R: Rain)
          \         /
           ▼       ▼
        (W: WetGrass)
```

Hãy xác định các khẳng định sau là ĐÚNG hay SAI và giải thích chi tiết:
1. $S \perp R \mid \emptyset$ (Máy phun nước và Trời mưa độc lập biên với nhau).
2. $S \perp R \mid C$ (Khi đã biết trời nhiều mây hay không, Máy phun nước và Mưa độc lập có điều kiện).
3. $S \perp R \mid \{C, W\}$ (Khi đã biết cả trời nhiều mây và cỏ bị ướt, Máy phun nước và Mưa có độc lập không?).

#### Lời giải chi tiết:

Có đúng 2 con đường nối giữa $S$ và $R$:
- **Đường 1 (Qua $C$):** $S \leftarrow C \to R$ (Cấu trúc Fork / Cùng nguyên nhân $C$).
- **Đường 2 (Qua $W$):** $S \to W \leftarrow R$ (Cấu trúc Collider / Cùng kết quả $W$).

1. **Khẳng định 1 ($S \perp R \mid \emptyset$): SAI.**
   - Xét tập bằng chứng rỗng $Z = \emptyset$:
     - Trên Đường 1: Nút $C$ là Fork chưa được quan sát ($C \notin Z$) $\implies$ **Đường 1 MỞ**.
     - Trên Đường 2: Nút $W$ là Collider chưa được quan sát ($W \notin Z$) $\implies$ Đường 2 BỊ CHẶN.
   - Vì tồn tại Đường 1 mở nên thông tin truyền được giữa $S$ và $R$ qua nguyên nhân chung $C$. Do đó $S$ và $R$ **phụ thuộc biên** ($S \not\perp R \mid \emptyset$).

2. **Khẳng định 2 ($S \perp R \mid C$): ĐÚNG.**
   - Xét tập bằng chứng $Z = \{C\}$:
     - Trên Đường 1: Nút $C$ là Fork đã được quan sát ($C \in Z$) $\implies$ **Đường 1 BỊ CHẶN**.
     - Trên Đường 2: Nút $W$ là Collider chưa được quan sát ($W \notin Z$) $\implies$ **Đường 2 BỊ CHẶN**.
   - Cả hai con đường đều bị chặn hoàn toàn! Do đó, $S$ và $R$ độc lập có điều kiện cho trước $C$: **$S \perp R \mid C$**.

3. **Khẳng định 3 ($S \perp R \mid \{C, W\}$): SAI.**
   - Xét tập bằng chứng $Z = \{C, W\}$:
     - Trên Đường 1: Nút $C$ là Fork đã biết $\implies$ Đường 1 BỊ CHẶN.
     - Trên Đường 2: Nút $W$ là Collider **ĐÃ ĐƯỢC QUAN SÁT ($W \in Z$)!**
     - Theo quy tắc Collider, khi nút hội tụ $W$ được quan sát, **con đường bị MỞ RA!**
   - Đây chính là hiện tượng **Explaining Away (Giải thích bỏ qua)**: Khi biết cỏ ướt ($W=true$), việc biết máy phun nước bật làm giảm mạnh xác suất trời mưa. Hai nguyên nhân vốn độc lập nay trở nên phụ thuộc chặt chẽ vào nhau. Do đó, **$S \not\perp R \mid \{C, W\}$**.

---

## Dạng 4: Tối Ưu Hóa Cực Đại Entropy (MaxEnt) Bằng Nhân Tử Lagrange

### Bài toán 4.1: Chứng Minh Tính Độc Lập Bằng MaxEnt
Xét hai biến ngẫu nhiên nhị phân $A$ và $B$. Không gian xác suất đồng thời gồm 4 trạng thái:
- $p_1 = P(A = t, B = t)$
- $p_2 = P(A = t, B = f)$
- $p_3 = P(A = f, B = t)$
- $p_4 = P(A = f, B = f)$

Biết các xác suất tiên nghiệm biên:
$$P(A = t) = p_1 + p_2 = \alpha$$
$$P(B = t) = p_1 + p_3 = \gamma$$
Và điều kiện chuẩn hóa xác suất: $\sum_{i=1}^4 p_i = p_1 + p_2 + p_3 + p_4 = 1$. Ngoài ra không có thêm bất kỳ thông tin nào khác về mối tương quan giữa $A$ và $B$.

1. Thiết lập hàm Lagrange để tìm phân phối xác suất cực đại hóa Entropy Shannon:
   $$H(p) = -\sum_{i=1}^4 p_i \ln p_i$$
2. Giải hệ phương trình đạo hàm riêng và chứng minh rằng nghiệm MaxEnt thỏa mãn điều kiện độc lập thống kê:
   $$p_1 p_4 = p_2 p_3$$
3. Rút ra nghiệm tường minh của $p_1, p_2, p_3, p_4$ theo $\alpha$ và $\gamma$.

#### Lời giải chi tiết:

1. **Thiết lập hàm Lagrange:**
   Áp dụng phương pháp nhân tử Lagrange với 3 ràng buộc đẳng thức:
   $$L(p_1, p_2, p_3, p_4, \lambda_1, \lambda_2, \lambda_3) = -\sum_{i=1}^4 p_i \ln p_i + \lambda_1 (\alpha - p_1 - p_2) + \lambda_2 (\gamma - p_1 - p_3) + \lambda_3 \left(1 - \sum_{i=1}^4 p_i\right)$$

2. **Lấy đạo hàm riêng và tìm điều kiện dừng:**
   Lấy đạo hàm riêng của $L$ theo từng biến $p_i$ và cho bằng $0$ (chú ý $\frac{d}{dp}(p \ln p) = \ln p + 1$):
   $$\frac{\partial L}{\partial p_1} = -(\ln p_1 + 1) - \lambda_1 - \lambda_2 - \lambda_3 = 0 \implies \ln p_1 = -(1 + \lambda_1 + \lambda_2 + \lambda_3)$$
   $$\frac{\partial L}{\partial p_2} = -(\ln p_2 + 1) - \lambda_1 - \lambda_3 = 0 \implies \ln p_2 = -(1 + \lambda_1 + \lambda_3)$$
   $$\frac{\partial L}{\partial p_3} = -(\ln p_3 + 1) - \lambda_2 - \lambda_3 = 0 \implies \ln p_3 = -(1 + \lambda_2 + \lambda_3)$$
   $$\frac{\partial L}{\partial p_4} = -(\ln p_4 + 1) - \lambda_3 = 0 \implies \ln p_4 = -(1 + \lambda_3)$$

   Cộng các biểu thức logarit:
   $$\ln p_1 + \ln p_4 = -(1 + \lambda_1 + \lambda_2 + \lambda_3) - (1 + \lambda_3) = -(2 + \lambda_1 + \lambda_2 + 2\lambda_3)$$
   $$\ln p_2 + \ln p_3 = -(1 + \lambda_1 + \lambda_3) - (1 + \lambda_2 + \lambda_3) = -(2 + \lambda_1 + \lambda_2 + 2\lambda_3)$$

   Ta nhận thấy hai vế phải hoàn toàn bằng nhau:
   $$\ln p_1 + \ln p_4 = \ln p_2 + \ln p_3 \iff \ln(p_1 p_4) = \ln(p_2 p_3)$$
   Lấy hàm mũ hai vế:
   $$p_1 p_4 = p_2 p_3 \quad \text{(đpcm)}$$

3. **Tìm nghiệm tường minh:**
   Từ các ràng buộc biên:
   - $p_2 = \alpha - p_1$
   - $p_3 = \gamma - p_1$
   - $p_4 = 1 - (p_1 + p_2 + p_3) = 1 - (\alpha + \gamma - p_1) = 1 - \alpha - \gamma + p_1$

   Thay vào đẳng thức $p_1 p_4 = p_2 p_3$:
   $$p_1 (1 - \alpha - \gamma + p_1) = (\alpha - p_1)(\gamma - p_1)$$
   $$p_1 - \alpha p_1 - \gamma p_1 + p_1^2 = \alpha \gamma - \alpha p_1 - \gamma p_1 + p_1^2$$
   Triệt tiêu các số hạng giống nhau ở cả hai vế:
   $$p_1 = \alpha \cdot \gamma$$

   Thay ngược lại để tìm các xác suất còn lại:
   - $p_1 = \alpha \gamma$
   - $p_2 = \alpha - \alpha \gamma = \alpha(1 - \gamma)$
   - $p_3 = \gamma - \alpha \gamma = \gamma(1 - \alpha)$
   - $p_4 = (1 - \alpha)(1 - \gamma)$

- **Kết luận mang tính triết học của MaxEnt:**
  Vì $p_1 = P(A = t, B = t) = P(A = t) \cdot P(B = t)$, điều này chứng minh rằng **khi không có thêm thông tin về mối tương quan, phân phối tối đa hóa Entropy tự động xem hai biến là độc lập thống kê**. MaxEnt hoàn toàn khách quan, không tự ý thiên vị hay suy diễn tương quan bừa bãi!

---

## Dạng 5: Suy Diễn Trong Mạng Bayes Bằng Phép Liệt Kê (Inference by Enumeration)

### Bài toán 5.1: Truy Vấn Hậu Nghiệm Của Mạng Báo Động
Xét mạng Alarm gồm 5 biến: Đột nhập ($B$), Động đất ($E$), Chuông ($A$), John gọi ($J$), Mary gọi ($M$):
$$P(B, E, A, J, M) = P(B) P(E) P(A \mid B, E) P(J \mid A) P(M \mid A)$$
Biết bằng chứng thu thập được: Cả John và Mary đều gọi điện báo chuông reo ($J = t, M = t$).
Hãy thiết lập biểu thức tính phân phối xác suất hậu nghiệm của biến Đột nhập:
$$\mathbf{P}(B \mid J = t, M = t) = \langle P(B = t \mid j, m), P(B = f \mid j, m) \rangle$$

#### Lời giải chi tiết:

1. **Thiết lập công thức với hằng số chuẩn hóa $\alpha$:**
   Theo định nghĩa xác suất có điều kiện:
   $$\mathbf{P}(B \mid j, m) = \frac{\mathbf{P}(B, j, m)}{P(j, m)} = \alpha \cdot \mathbf{P}(B, j, m)$$
   Trong đó hằng số chuẩn hóa $\alpha = \frac{1}{P(j, m)} = \frac{1}{P(B=t, j, m) + P(B=f, j, m)}$.

2. **Triệt tiêu các biến ẩn (Hidden variables $E$ và $A$) bằng Marginalization:**
   Hai biến không nằm trong truy vấn và cũng không nằm trong bằng chứng là $E$ và $A$. Ta lấy tổng xác suất trên mọi trạng thái của $E$ và $A$:
   $$\mathbf{P}(B, j, m) = \sum_{e \in \{t, f\}} \sum_{a \in \{t, f\}} \mathbf{P}(B, e, a, j, m)$$
   Thay công thức phân rã của mạng Bayes vào:
   $$\mathbf{P}(B, j, m) = \sum_{e} \sum_{a} \mathbf{P}(B) P(e) P(a \mid B, e) P(j \mid a) P(m \mid a)$$

3. **Tối ưu hóa thứ tự lấy tổng (Đưa các nhân tử độc lập ra ngoài):**
   Nhận thấy $\mathbf{P}(B)$ không phụ thuộc vào $e$ và $a$, còn $P(e)$ không phụ thuộc vào $a$:
   $$\mathbf{P}(B \mid j, m) = \alpha \cdot \mathbf{P}(B) \sum_{e} P(e) \sum_{a} P(a \mid B, e) P(j \mid a) P(m \mid a)$$
   Biểu thức này cho phép tính toán cực kỳ tối ưu, tính tổng trong ngoặc với $a$ trước, sau đó nhân với $P(e)$ và tính tổng ngoài theo $e$, cuối cùng chuẩn hóa bằng cách chia cho tổng 2 thành phần để được xác suất hậu nghiệm chính xác.
