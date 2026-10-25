# ĐÁP ÁN VÀ LỜI GIẢI CHI TIẾT CHUẨN A+ — ĐỀ 02
## Kèm Barem Điểm, Phân Tích Phương Pháp & Cạm Bẫy Phòng Thi

> **Môn học:** Nhập Môn Trí Tuệ Nhân Tạo (Introduction to Artificial Intelligence)  
> **Thời gian làm bài:** 90 phút $\bullet$ **Hình thức:** Tự luận chuẩn quốc tế  
> **Chuẩn mực:** Đáp án được trình bày chuẩn chỉ theo giáo trình *Wolfgang Ertel (2025)*, *Russell & Norvig (AIMA 2021)* và Slide bài giảng TS. Hoàng Anh Đức.

---

## Câu 1 (1.5 điểm) — Tác Tử Thông Minh, Trạng Thái Nội Bộ & Lịch Sử Tri Giác

### Question (English)
1. Define an agent, a software agent, and a hardware agent. (0.75 point)
2. Explain why an agent with memory is generally not a mathematical function from only the current input to the current output. Give a simple example in which the same current input leads to different actions. (0.75 point)

### Câu hỏi (Tiếng Việt)
1. Định nghĩa agent (tác tử), software agent (tác tử phần mềm) và hardware agent (tác tử phần cứng). (0.75 điểm)
2. Giải thích vì sao một agent có bộ nhớ nhìn chung không phải là một hàm toán học chỉ ánh xạ từ đầu vào hiện tại sang đầu ra hiện tại. Cho một ví dụ đơn giản trong đó cùng một đầu vào hiện tại dẫn tới các hành động khác nhau. (0.75 điểm)

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Định nghĩa Agent, Software Agent và Hardware Agent:
* **Tác tử (Agent):** Theo định nghĩa chuẩn của *Russell & Norvig (AIMA)* và *Ertel*, một tác tử là bất kỳ thực thể nào có khả năng **cảm nhận môi trường (perceiving)** thông qua các bộ cảm biến (sensors) và **tác động lên môi trường (acting)** đó thông qua các cơ cấu tác động (actuators). Về mặt toán học trừu tượng, hành vi của tác tử được mô tả bởi một hàm tác tử (agent function) ánh xạ chuỗi lịch sử tri giác thành hành động:
  $$f: \mathcal{P}^* \to \mathcal{A}$$
  trong đó $\mathcal{P}^*$ là tập các chuỗi tri giác (percept sequences) và $\mathcal{A}$ là không gian hành động.
* **Tác tử phần mềm (Software Agent / Softbot):** Là tác tử hoạt động hoàn toàn trong môi trường kỹ thuật số (không gian ảo).
  * *Cảm biến (Sensors):* Nhận chuỗi ký tự, gói tin mạng TCP/IP, lệnh từ hệ điều hành, truy vấn cơ sở dữ liệu, file log hoặc sự kiện bàn phím/chuột.
  * *Cơ cấu tác động (Actuators):* Ghi file lên đĩa, gửi thông điệp mạng, thực thi mã nguồn, hiển thị giao diện người dùng, gửi email hoặc kích hoạt cảnh báo hệ thống.
  * *Ví dụ:* Bot giao dịch chứng khoán tự động, web crawler của Google, spam filter, trợ lý ảo Siri/ChatGPT.
* **Tác tử phần cứng (Hardware Agent / Physical Robot):** Là tác tử hoạt động và tương tác trực tiếp trong thế giới vật lý thực.
  * *Cảm biến (Sensors):* Camera quang học, cảm biến siêu âm, radar, LiDAR, con quay hồi chuyển (gyroscope), cảm biến nhiệt, cảm biến va chạm.
  * *Cơ cấu tác động (Actuators):* Động cơ điện xoay bánh xe, cánh tay robot servo, bơm thủy lực, loa phát âm thanh, chân vịt flycam.
  * *Ví dụ:* Robot hút bụi Roomba, xe tự hành Tesla, tay máy hàn tự động trên dây chuyền sản xuất xe hơi.

#### 2. Vì sao Agent có bộ nhớ không phải là hàm ánh xạ từ đầu vào hiện tại:
* **Bản chất toán học:**
  * Một **tác tử phản xạ đơn giản (Simple Reflex Agent)** chỉ phụ thuộc vào tri giác ngay tại thời điểm hiện tại:
    $$\text{Action}_t = f(p_t) \quad \text{với } p_t \in \mathcal{P}$$
  * Ngược lại, một **tác tử có bộ nhớ (Agent with Memory / Model-based Reflex Agent)** duy trì một **trạng thái nội bộ (Internal State $s_t$)** nhằm phản ánh các khía cạnh của thế giới mà cảm biến hiện thời không quan sát thấy (unobserved history). Quá trình cập nhật và ra quyết định diễn ra theo hệ thức hồi quy hai bước:
    $$\begin{cases} s_t = \text{UpdateState}(s_{t-1},\, a_{t-1},\, p_t) & \text{(Cập nhật trạng thái từ quá khứ và tri giác mới)} \\ a_t = \text{Action}(s_t) & \text{(Hành động dựa trên trạng thái nội bộ tổng hợp)} \end{cases}$$
  * Do đó, cùng một tri giác hiện tại $p_t$ như nhau, nếu hai thời điểm $t_1$ và $t_2$ có trạng thái nội bộ khác nhau ($s_{t_1} \neq s_{t_2}$ do lịch sử trước đó khác biệt), thì tác tử sẽ sinh ra hai hành động hoàn toàn khác nhau:
    $$a_{t_1} = \text{Action}(s_{t_1}) \neq \text{Action}(s_{t_2}) = a_{t_2}$$
* **Ví dụ thực tế minh họa:**
  * Xét một **Robot hút bụi thông minh trong phòng làm việc**:
    * **Đầu vào hiện tại ($p_t$):** Cảm biến chạm báo phát hiện vật cản phía trước mặt (ví dụ: chân bàn).
    * **Kịch bản 1 (Lịch sử: Chưa từng chạm góc này):** Trạng thái nội bộ lưu trữ $s_{t_1} = \text{"Đang vẽ bản đồ khu vực mới"}$. Robot chọn hành động: *Quay sang phải 90 độ và tiếp tục dò đường mép tường*.
    * **Kịch bản 2 (Lịch sử: Đã thử quay phải 3 lần liên tiếp nhưng đều gặp vật cản kẹp kín):** Trạng thái nội bộ ghi nhận $s_{t_2} = \text{"Bị kẹt trong góc hẹp"}$. Cùng nhận đầu vào chạm phía trước, robot không quay phải nữa mà chọn hành động: *Lùi lại 20cm, quay 180 độ hoặc phát âm thanh hú còi báo hiệu người dùng đến giải cứu*.
  * Rõ ràng, cùng một đầu vào hiện tại $p_t = \text{"Chạm vật cản"}$, nhưng hai hành động sinh ra là trái ngược nhau nhờ có bộ nhớ lịch sử.

---

**Rubric Chấm Điểm:**
* Nêu định nghĩa Agent, Software Agent và Hardware Agent đầy đủ (kèm cảm biến/cơ cấu tác động): **0.75 điểm** (mỗi ý 0.25).
* Phân tích toán học giữa Simple Reflex ($a=f(p)$) và Agent with Memory ($s_t = \text{Update}(s_{t-1}, p_t)$): **0.4 điểm**.
* Ví dụ minh họa rõ ràng, chứng minh cùng đầu vào sinh ra hành động khác nhau: **0.35 điểm**.

---

## Câu 2 (1.0 điểm) — Thuật Toán Suy Diễn Tiến (Forward Chaining) Trên KB Dạng Horn

### Question (English)
Use forward chaining to determine whether `Safe` follows from the Horn knowledge base:
- Facts: `Powered`, `SensorOK`, `DoorClosed`.
- Rules: `Powered ∧ SensorOK ⇒ Monitoring`; `Monitoring ∧ DoorClosed ⇒ Safe`; `Safe ⇒ Ready`.
Show the agenda/inferred facts after each rule fires.

### Câu hỏi (Tiếng Việt)
Dùng suy diễn tiến (forward chaining) để xác định liệu `Safe` có được suy ra từ cơ sở tri thức Horn sau hay không:
- Các sự kiện: `Powered`, `SensorOK`, `DoorClosed`.
- Các luật: `Powered ∧ SensorOK ⇒ Monitoring`; `Monitoring ∧ DoorClosed ⇒ Safe`; `Safe ⇒ Ready`.
Trình bày agenda/tập sự kiện suy ra sau mỗi lần một luật được kích hoạt.

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Khung lý thuyết thuật toán Forward Chaining:
* **Định nghĩa:** Áp dụng cho Cơ sở tri thức gồm các **mệnh đề Horn xác định (Definite Horn Clauses)** dạng $P_1 \land P_2 \land \dots \land P_k \implies Q$.
* **Cơ chế:** Thuật toán hoạt động theo nguyên lý điều khiển bằng dữ liệu (data-driven). Ta duy trì:
  * Một mảng `count[rule]` ghi nhận số lượng tiền đề (premise) chưa được thỏa mãn của mỗi luật.
  * Một hàng đợi `Agenda` chứa các sự kiện đã được khẳng định là đúng nhưng chưa được lan truyền (propagate).
  * Một tập `Inferred` (hoặc `KB`) lưu các sự kiện đã được chứng minh chân lý nhằm tránh lặp vô hạn.

#### 2. Khởi tạo cấu trúc dữ liệu:
* **Các luật (Rules):**
  * $R_1: \text{Powered} \land \text{SensorOK} \implies \text{Monitoring} \implies \text{count}[R_1] = 2$
  * $R_2: \text{Monitoring} \land \text{DoorClosed} \implies \text{Safe} \implies \text{count}[R_2] = 2$
  * $R_3: \text{Safe} \implies \text{Ready} \implies \text{count}[R_3] = 1$
* **Khởi tạo ban đầu:**
  * $\text{Inferred} = \emptyset$
  * $\text{Agenda} = [\text{Powered},\, \text{SensorOK},\, \text{DoorClosed}]$
  * Mục tiêu truy vấn: $\text{Query} = \text{Safe}$.

#### 3. Bảng diễn tiến thực thi từng bước (Trace Table):

| Bước | Lấy từ Agenda | Cập nhật tập Inferred | Kiểm tra tiền đề các Rule (Giảm count) | Luật được kích hoạt (Fired Rule) | Thêm vào Agenda |
|:---:|:---|:---|:---|:---:|:---|
| **0** | *(Khởi tạo)* | $\emptyset$ | $\text{count}[R_1]=2, \text{count}[R_2]=2, \text{count}[R_3]=1$ | *Chưa* | $[\text{Powered}, \text{SensorOK}, \text{DoorClosed}]$ |
| **1** | $\text{Powered}$ | $\{\text{Powered}\}$ | Giảm $\text{count}[R_1] = 2 - 1 = 1$. | *Chưa* | $[\text{SensorOK}, \text{DoorClosed}]$ |
| **2** | $\text{SensorOK}$ | $\{\text{Powered}, \text{SensorOK}\}$ | Giảm $\text{count}[R_1] = 1 - 1 = 0$. $\implies R_1$ thỏa mãn! | **$R_1$ kích hoạt** $\implies$ sinh $\text{Monitoring}$ | $[\text{DoorClosed}, \text{Monitoring}]$ |
| **3** | $\text{DoorClosed}$ | $\{\text{Powered}, \text{SensorOK}, \text{DoorClosed}\}$ | Giảm $\text{count}[R_2] = 2 - 1 = 1$. | *Chưa* | $[\text{Monitoring}]$ |
| **4** | $\text{Monitoring}$ | $\{\text{Powered}, \text{SensorOK}, \text{DoorClosed}, \text{Monitoring}\}$ | Giảm $\text{count}[R_2] = 1 - 1 = 0$. $\implies R_2$ thỏa mãn! | **$R_2$ kích hoạt** $\implies$ sinh $\text{Safe}$ | $[\text{Safe}]$ |
| **5** | $\text{Safe}$ | $\{\text{Powered}, \text{SensorOK}, \text{DoorClosed}, \text{Monitoring}, \text{Safe}\}$ | Phát hiện $\text{Safe} == \text{Query}$! | **Đạt mục tiêu** | *Dừng thuật toán* |

*(Ghi chú: Nếu thuật toán chạy vét cạn tiếp, $\text{Safe}$ sẽ kích hoạt $R_3$ để thêm $\text{Ready}$ vào Inferred).*

#### 4. Kết luận:
Do mục tiêu `Safe` đã được lấy ra và đưa vào tập các sự kiện chân lý (`Inferred`), ta kết luận:
$$\mathbf{KB \models Safe} \quad \text{(Safe được kéo theo một cách logic từ KB)}$$
Độ phức tạp thời gian của thuật toán là tuyến tính: $O(\text{Kích thước KB})$.

---

**Rubric Chấm Điểm:**
* Khởi tạo đúng Agenda và bảng đếm tiền đề: **0.2 điểm**.
* Diễn giải chính xác từng bước kích hoạt luật ($R_1$ sinh ra `Monitoring`, $R_2$ sinh ra `Safe`): **0.5 điểm**.
* Điều kiện dừng chính xác và kết luận logic $KB \models \text{Safe}$: **0.3 điểm**.

---

## Câu 3 (1.0 điểm) — Thuật Toán Hợp Nhất Robinson (Robinson's Unification Algorithm)

### Question (English)
Find the most general unifier (MGU), or show that none exists:
$$P(f(x), y, g(y)) \quad \text{and} \quad P(f(a), g(z), g(g(b))).$$
Show the equation set, substitutions, composition, and verification.

### Câu hỏi (Tiếng Việt)
Tìm bộ hợp nhất tổng quát nhất (MGU), hoặc chứng minh rằng không tồn tại:
$$P(f(x), y, g(y)) \quad \text{và} \quad P(f(a), g(z), g(g(b))).$$
Trình bày tập phương trình, các phép thế, phép hợp thành và bước kiểm tra kết quả.

### Lời Giải Chi Tiết Chuẩn A+

#### Bước 1: Thiết lập hệ phương trình hợp nhất (Equation System)
Để hợp nhất hai nguyên tử $E_1 = P(f(x), y, g(y))$ và $E_2 = P(f(a), g(z), g(g(b)))$, hai nguyên tử phải có cùng tên vị từ (ở đây đều là vị từ bậc 3 $P$) và các đối số tương ứng phải bằng nhau:
$$S_0 = \{ f(x) \stackrel{?}{=} f(a),\quad y \stackrel{?}{=} g(z),\quad g(y) \stackrel{?}{=} g(g(b)) \}$$

#### Bước 2: Quá trình giải hệ phương trình và suy dẫn phép thế (Robinson Steps)

1. **Xét phương trình (1): $f(x) \stackrel{?}{=} f(a)$**
   * Cùng ký hiệu hàm $f$, khử hàm thu được: $x \stackrel{?}{=} a$.
   * $x$ là biến, $a$ là hằng số ($x \notin \text{Vars}(a)$, vượt qua phép kiểm tra xuất hiện *Occurs-Check*).
   * Sinh ra phép thế đầu tiên:
     $$\theta_1 = \{x \mapsto a\}$$
   * Áp dụng $\theta_1$ cho toàn bộ các phương trình còn lại trong hệ: Hệ phương trình trở thành:
     $$S_1 = \{ y \stackrel{?}{=} g(z),\quad g(y) \stackrel{?}{=} g(g(b)) \}$$

2. **Xét phương trình (3): $g(y) \stackrel{?}{=} g(g(b))$** *(Ta có thể giải phương trình 3 trước để gán giá trị cụ thể cho biến $y$)*
   * Cùng ký hiệu hàm $g$, khử hàm thu được: $y \stackrel{?}{=} g(b)$.
   * $y$ là biến, hạng thức vế phải là $g(b)$ ($y \notin \text{Vars}(g(b))$, thỏa mãn *Occurs-Check*).
   * Sinh ra phép thế thứ hai:
     $$\theta_2 = \{y \mapsto g(b)\}$$
   * Áp dụng $\theta_2$ vào phương trình còn lại $y \stackrel{?}{=} g(z)$:
     $$g(b) \stackrel{?}{=} g(z)$$

3. **Xét phương trình mới: $g(b) \stackrel{?}{=} g(z)$**
   * Cùng ký hiệu hàm $g$, khử hàm thu được: $b \stackrel{?}{=} z$, tương đương: $z \stackrel{?}{=} b$.
   * $z$ là biến, $b$ là hằng số ($z \notin \text{Vars}(b)$, thỏa mãn *Occurs-Check*).
   * Sinh ra phép thế thứ ba:
     $$\theta_3 = \{z \mapsto b\}$$

#### Bước 3: Hợp thành các phép thế (Substitution Composition)
Hợp thành các phép thế theo định nghĩa $\theta = \theta_1 \circ \theta_2 \circ \theta_3$:
* $x\theta = (x\theta_1)\theta_2\theta_3 = a\theta_2\theta_3 = a$.
* $y\theta = (y\theta_2)\theta_3 = g(b)\theta_3 = g(b)$.
* $z\theta = (z\theta_3) = b$.
Do đó, Bộ hợp nhất tổng quát nhất (Most General Unifier) là:
$$\mathbf{MGU \;\; \theta = \{x \mapsto a,\; y \mapsto g(b),\; z \mapsto b\}}$$

#### Bước 4: Kiểm tra lại (Verification)
Áp dụng $\theta$ vào hai biểu thức ban đầu:
* Áp dụng vào $E_1$:
  $$E_1\theta = P(f(x), y, g(y))\theta = P(f(a),\, g(b),\, g(g(b)))$$
* Áp dụng vào $E_2$:
  $$E_2\theta = P(f(a), g(z), g(g(b)))\theta = P(f(a),\, g(b),\, g(g(b)))$$
* **Nhận xét:** $E_1\theta = E_2\theta$. Phép hợp nhất thành công tuyệt đối!

---

**Rubric Chấm Điểm:**
* Thiết lập đúng 3 phương trình đối số ban đầu: **0.2 điểm**.
* Giải từng phương trình, nêu rõ quy tắc khử hàm và phép kiểm tra Occurs-Check: **0.5 điểm**.
* Hợp thành đúng $\theta$ và thực hiện bước kiểm chứng $E_1\theta \equiv E_2\theta$: **0.3 điểm**.

---

## Câu 4 (1.0 điểm) — Hiện Tượng Bùng Nổ Tổ Hợp Trong Tìm Kiếm Chứng Minh

### Question (English)
Explain combinatorial explosion in proof search. If every proof-search node produces 4 successors and a proof requires depth 11, how many nodes are there at the final level? Explain why a 100-times faster computer does not solve the underlying problem, and name one AI strategy that helps.

### Câu hỏi (Tiếng Việt)
Giải thích hiện tượng bùng nổ tổ hợp (combinatorial explosion) trong tìm kiếm chứng minh. Nếu mỗi nút tạo ra 4 nút kế tiếp và một chứng minh cần độ sâu 11, tầng cuối có bao nhiêu nút? Giải thích vì sao máy tính nhanh hơn 100 lần không giải quyết được vấn đề cốt lõi và nêu một chiến lược AI có thể hỗ trợ.

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Bản chất của Bùng nổ tổ hợp (Combinatorial Explosion):
* Trong bài toán tự động chứng minh định lý (Automated Theorem Proving) hoặc tìm kiếm trong không gian trạng thái, không gian tìm kiếm phát triển dưới dạng cây phân nhánh.
* Nếu mỗi bước có hệ số phân nhánh trung bình là $b$ (branching factor), thì tại độ sâu $d$, số lượng trạng thái cần kiểm tra tăng trưởng theo **hàm mũ**:
  $$N(d) = b^d$$
* **Bùng nổ tổ hợp** là hiện tượng khi kích thước bài toán (độ sâu $d$) chỉ cần tăng lên một lượng rất nhỏ tuyến tính, nhưng không gian trạng thái, thời gian tính toán và bộ nhớ yêu cầu lại bùng nổ theo cấp số nhân vượt quá mọi giới hạn tài nguyên vật lý của máy tính.

#### 2. Tính toán cụ thể với $b = 4$ và $d = 11$:
* **Số nút ở tầng cuối cùng (tầng $d = 11$):**
  $$N_{\text{leaf}} = b^d = 4^{11} = 2^{22} = \mathbf{4,194,304} \text{ nút}$$
* *(Mở rộng: Tổng số nút trên toàn bộ cây tìm kiếm là $S = \sum_{i=0}^{11} 4^i = \frac{4^{12}-1}{4-1} = \frac{16,777,216 - 1}{3} = 5,592,405$ nút).*

#### 3. Vì sao máy tính nhanh hơn 100 lần không giải quyết được vấn đề cốt lõi?
* Giả sử máy tính cũ giải được bài toán ở độ sâu giới hạn $d_{\text{old}}$ trong thời gian $T$, tức là xử lý được $b^{d_{\text{old}}}$ nút.
* Khi nâng cấp phần cứng lên máy tính mới chạy nhanh gấp $k = 100$ lần, số lượng nút máy tính mới xử lý được trong cùng thời gian $T$ là:
  $$N_{\text{new}} = 100 \times b^{d_{\text{old}}}$$
* Độ sâu mới $d_{\text{new}}$ mà máy tính nhanh hơn 100 lần có thể đạt tới được tính theo công thức logarithm:
  $$b^{d_{\text{new}}} = 100 \times b^{d_{\text{old}}} \implies d_{\text{new}} = d_{\text{old}} + \log_b(100)$$
* Với $b = 4$:
  $$\Delta d = \log_4(100) = \frac{\ln(100)}{\ln(4)} = \frac{4.605}{1.386} \approx \mathbf{3.32} \text{ tầng}$$
* **Kết luận triết lý:** Máy tính nhanh hơn **100 lần** (một bước nhảy vọt phần cứng cực lớn) chỉ giúp ta đào sâu thêm được vẻn vẹn **chưa đầy 4 bước suy diễn**! Tăng tốc độ phần cứng chỉ là một giải pháp tỷ lệ hằng số đối với một hàm độ phức tạp tăng theo cấp số nhân ($O(b^d)$). Nó hoàn toàn bất lực trước quy luật bùng nổ tổ hợp.

#### 4. Các chiến lược AI giúp giải quyết vấn đề:
1. **Tìm kiếm có tri thức dẫn đường (Heuristic Search):** Sử dụng hàm đánh giá $h(n)$ (như giải thuật $A^*$, Best-First Search) để định hướng mở rộng các nhánh hứa hẹn nhất thay vì tìm kiếm mù quáng (blind search).
2. **Cắt tỉa không gian tìm kiếm (Pruning & Constraints):** Loại bỏ các nhánh dư thừa hoặc nhánh bất khả thi (ví dụ: cắt tỉa Alpha-Beta trong trò chơi đối kháng, Forward Checking trong CSP).
3. **Chiến lược tập hỗ trợ (Set-of-Support Strategy):** Trong chứng minh phân giải, chỉ phân giải các mệnh đề bắt nguồn từ giả thiết phản chứng (mục tiêu phủ định), ngăn ngừa việc các tiên đề trong KB tự phân giải lẫn nhau sinh ra hàng triệu mệnh đề rác vô dụng.
4. **Chia để trị và Lập chỉ mục (Indexing & Subsumption):** Loại bỏ các mệnh đề bị bao hàm (subsumption) để giảm tối đa hệ số phân nhánh $b$.

---

**Rubric Chấm Điểm:**
* Định nghĩa đúng bùng nổ tổ hợp và tính đúng số nút $4^{11} = 4,194,304$: **0.4 điểm**.
* Lập luận toán học chỉ ra máy tính nhanh 100 lần chỉ tăng thêm $\Delta d = \log_4(100) \approx 3.32$ tầng: **0.4 điểm**.
* Nêu tên và giải thích ngắn gọn ít nhất 1 chiến lược AI hiệu quả: **0.2 điểm**.

---

## Câu 5 (1.5 điểm) — Ngôn Ngữ PROLOG, Thứ Tự Tìm Kiếm SLD & Cơ Chế Quay Lui

### Question (English)
Consider:
```prolog
parent(alex, beth).
parent(alex, carl).
parent(beth, dana).
parent(carl, erin).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
```
List all answers returned by `?- ancestor(alex, Who).` in Prolog order. Explain which clause produces each answer and where backtracking occurs.

### Câu hỏi (Tiếng Việt)
Cho chương trình:
```prolog
parent(alex, beth).
parent(alex, carl).
parent(beth, dana).
parent(carl, erin).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
```
Liệt kê mọi đáp án của truy vấn `?- ancestor(alex, Who).` theo đúng thứ tự Prolog trả về. Giải thích clause nào tạo ra từng đáp án và việc backtracking xảy ra ở đâu.

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Quy tắc vận hành của Prolog Engine:
* **Thứ tự xét luật (Clause Order):** Từ trên xuống dưới trong mã nguồn.
* **Thứ tự xét mục tiêu con (Goal Order):** Từ trái sang phải trong thân luật (Rule body).
* **Chiến lược tìm kiếm:** Duyệt theo chiều sâu (Depth-First Search - DFS) kết hợp với **Quay lui (Backtracking)** tại các điểm lựa chọn (Choice Points).

#### 2. Phân tích quá trình thực thi chi tiết (SLD Execution Trace):

Mục tiêu ban đầu: `?- ancestor(alex, Who).`

```
                           ?- ancestor(alex, Who).
                           /                     \
       (Thử Rule 1: trực tiếp)                  (Thử Rule 2: đệ quy)
       parent(alex, Who)                         parent(alex, Z), ancestor(Z, Who)
        /             \                           /                             \
 (Fact 1)             (Fact 2)              Z = beth                         Z = carl
Who = beth            Who = carl        ancestor(beth, Who)             ancestor(carl, Who)
 [NGHIỆM 1]           [NGHIỆM 2]          /             \                 /             \
                                       Rule 1          Rule 2          Rule 1          Rule 2
                                     Who = dana          ...         Who = erin          ...
                                     [NGHIỆM 3]      (Hết con)       [NGHIỆM 4]      (Hết con)
```

1. **Giai đoạn 1: Khai thác Rule 1 (`ancestor(X, Y) :- parent(X, Y).`)**
   * Hợp nhất với đầu luật 1: `{X -> alex, Y -> Who}`. Mục tiêu quy về: `?- parent(alex, Who).`
   * Duyệt cơ sở dữ liệu từ trên xuống:
     * Khớp với **Fact 1** `parent(alex, beth)` $\implies$ Phép thế `{Who -> beth}`.
     * **Xuất nghiệm 1:** `Who = beth` (do Rule 1 sinh ra).
   * Người dùng gõ `;` (hoặc Prolog tự động tìm nghiệm tiếp), con trỏ quay lui (*Backtrack*) về điểm lựa chọn tại `parent(alex, Who)`:
     * Khớp với **Fact 2** `parent(alex, carl)` $\implies$ Phép thế `{Who -> carl}`.
     * **Xuất nghiệm 2:** `Who = carl` (do Rule 1 sinh ra).
   * Quay lui tiếp: Không còn fact nào có dạng `parent(alex, ...)` $\implies$ Rule 1 thất bại hoàn toàn.

2. **Giai đoạn 2: Khai thác Rule 2 (`ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).`)**
   * Prolog quay lui về gốc và thử **Rule 2**. Hợp nhất: `{X -> alex, Y -> Who}`.
   * Thân luật sinh ra 2 mục tiêu con nối tiếp: `parent(alex, Z), ancestor(Z, Who)`.
   * **Nhánh Z = beth:**
     * Khớp mục tiêu đầu tiên `parent(alex, Z)` với **Fact 1**, gán `{Z -> beth}`.
     * Mục tiêu con thứ hai trở thành: `?- ancestor(beth, Who).`
     * Đệ quy áp dụng Rule 1 trước: `parent(beth, Who)`. Khớp với **Fact 3** `parent(beth, dana)`.
     * **Xuất nghiệm 3:** `Who = dana` (sinh ra qua chuỗi: Rule 2 chọn Z=beth $\to$ Rule 1 trực tiếp).
     * Quay lui: `parent(beth, Who)` không còn nghiệm nào khác.
     * Thử Rule 2 cho `ancestor(beth, Who)`: cần tìm `parent(beth, Z1)`. Gán `Z1 = dana`. Sau đó gọi `ancestor(dana, Who)`. Nhưng trong KB không có bất kỳ fact `parent(dana, ...)` nào $\implies$ Thất bại (Fail) và quay lui đóng nhánh.

3. **Giai đoạn 3: Quay lui tại Rule 2 của gốc (Nhánh Z = carl)**
   * Con trỏ quay lui về lựa chọn tiếp theo của `parent(alex, Z)`. Khớp với **Fact 2**, gán `{Z -> carl}`.
   * Mục tiêu con thứ hai trở thành: `?- ancestor(carl, Who).`
   * Đệ quy áp dụng Rule 1 trước: `parent(carl, Who)`. Khớp với **Fact 4** `parent(carl, erin)`.
   * **Xuất nghiệm 4:** `Who = erin` (sinh ra qua chuỗi: Rule 2 chọn Z=carl $\to$ Rule 1 trực tiếp).
   * Quay lui: Không còn fact `parent(carl, ...)`.
   * Thử Rule 2 cho `ancestor(carl, Who)`: cần tìm con của `erin`, nhưng không có fact `parent(erin, ...)` $\implies$ Thất bại.

4. **Kết thúc:** Toàn bộ cây SLD đã duyệt cạn kiệt. Hệ thống trả về `false`.

#### 3. Bảng tổng hợp các đáp án theo đúng thứ tự thời gian:

| Thứ tự | Đáp án (`Who =`) | Clause và Fact tạo ra nghiệm | Điểm quay lui (Backtracking point) |
|:---:|:---:|:---|:---|
| **1** | `beth` | Clause 1 trực tiếp với `parent(alex, beth)` | Lưu choice point tại `parent(alex, ...)` |
| **2** | `carl` | Clause 1 trực tiếp với `parent(alex, carl)` | Hết nghiệm Clause 1 $\implies$ quay lui thử Clause 2 |
| **3** | `dana` | Clause 2 chọn $Z = \text{beth}$, sau đó đệ quy áp dụng Clause 1 với `parent(beth, dana)` | Thử đệ quy tiếp không có con $\implies$ quay lui chọn $Z$ khác |
| **4** | `erin` | Clause 2 chọn $Z = \text{carl}$, sau đó đệ quy áp dụng Clause 1 với `parent(carl, erin)` | Toàn bộ cây cạn nghiệm $\implies$ dừng |

---

**Rubric Chấm Điểm:**
* Liệt kê đúng 4 nghiệm và chuẩn xác tuyệt đối thứ tự xuất hiện (`beth`, `carl`, `dana`, `erin`): **0.8 điểm** (mỗi nghiệm đúng vị trí 0.2).
* Phân tích rõ ràng vai trò của Clause 1, Clause 2 cho từng nghiệm: **0.4 điểm**.
* Chỉ ra chính xác các điểm xảy ra cơ chế Backtracking: **0.3 điểm**.

---

## Câu 6 (2.0 điểm) — Thuật Toán Minimax & Cắt Tỉa Alpha-Beta ($\alpha$-$\beta$ Pruning)

### Question (English)
A game tree has a MAX root `A` with three MIN children `B`, `C`, and `D`. Their leaf values from left to right are:
- under `B`: `6, 4, 7`;
- under `C`: `5, 2, 8`;
- under `D`: `3, 9, 1`.
1. Compute the minimax value of every internal node and the best move for MAX. (1.0 point)
2. Apply alpha-beta pruning from left to right. State the values of `α` and `β` at every cutoff and list all pruned leaves. (1.0 point)

### Câu hỏi (Tiếng Việt)
Một cây trò chơi có nút gốc MAX `A` với ba nút con MIN là `B`, `C` và `D`. Giá trị các lá từ trái sang phải là:
- dưới `B`: `6, 4, 7`;
- dưới `C`: `5, 2, 8`;
- dưới `D`: `3, 9, 1`.
1. Tính giá trị minimax của mọi nút trong và nước đi tốt nhất cho MAX. (1.0 điểm)
2. Áp dụng cắt tỉa alpha-beta từ trái sang phải. Nêu giá trị `α` và `β` tại mỗi điểm cắt và liệt kê mọi lá bị cắt. (1.0 điểm)

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Tính giá trị Minimax đầy đủ (Không cắt tỉa):
Cây trò chơi có độ sâu 2:
* Tầng 0: Nút gốc MAX $A$.
* Tầng 1: Các nút con MIN: $B, C, D$.
* Tầng 2: Các nút lá (giá trị hữu ích).

Áp dụng định nghĩa hàm Minimax từ dưới lên (Bottom-up evaluation):
* Tại nút con MIN $B$:
  $$V(B) = \min(6,\, 4,\, 7) = \mathbf{4}$$
* Tại nút con MIN $C$:
  $$V(C) = \min(5,\, 2,\, 8) = \mathbf{2}$$
* Tại nút con MIN $D$:
  $$V(D) = \min(3,\, 9,\, 1) = \mathbf{1}$$
* Tại nút gốc MAX $A$:
  $$V(A) = \max(V(B),\, V(C),\, V(D)) = \max(4,\, 2,\, 1) = \mathbf{4}$$
* **Nước đi tối ưu cho người chơi MAX:** MAX tại $A$ sẽ chọn đi vào nhánh **$B$** để đảm bảo đạt được điểm số tối thiểu là $4$.

#### 2. Quá trình cắt tỉa Alpha-Beta từ trái sang phải (Alpha-Beta Pruning Trace):

* **Quy ước:**
  * $\alpha$: Giá trị tốt nhất mà người chơi MAX đã tìm thấy dọc đường đi tới thời điểm hiện tại (ngưỡng dưới của MAX, khởi tạo $\alpha = -\infty$).
  * $\beta$: Giá trị tốt nhất mà người chơi MIN đã tìm thấy dọc đường đi tới thời điểm hiện tại (ngưỡng trên của MIN, khởi tạo $\beta = +\infty$).
  * **Điều kiện cắt tỉa:** Tại bất kỳ thời điểm nào nếu $\alpha \ge \beta$, lập tức dừng duyệt các nhánh con còn lại của nút đó.

```
                         A [MAX] (alpha=4, beta=+inf)
                     /             |             \
             B [MIN]            C [MIN]           D [MIN]
           (beta = 4)         (beta = 2)        (beta = 3)
           /   |   \          /   |   \         /   |   \
          6    4    7        5    2   [8]      3   [9]  [1]
                                       ^            ^    ^
                                    (CẮT!)       (CẮT TOÀN BỘ!)
```

##### Bước 1: Khám phá cây con $B$
* Tại gốc $A$: $\alpha = -\infty, \beta = +\infty$. Truyền khoảng $[\alpha, \beta] = [-\infty, +\infty]$ xuống nút MIN $B$.
* Tại nút $B$ (nút MIN, cập nhật $\beta$):
  * Thăm lá thứ nhất (giá trị 6): $\beta = \min(+\infty, 6) = 6$.
  * Thăm lá thứ hai (giá trị 4): $\beta = \min(6, 4) = 4$.
  * Thăm lá thứ ba (giá trị 7): $\beta = \min(4, 7) = 4$.
  * Đã duyệt hết các lá của $B$. Trả về giá trị $V(B) = 4$ cho gốc $A$.
* Tại gốc $A$ (nút MAX, cập nhật $\alpha$):
  $$\alpha = \max(\alpha, V(B)) = \max(-\infty, 4) = 4$$
  Khoảng giá trị hiện tại của $A$ là $[\alpha = 4,\, \beta = +\infty]$.

##### Bước 2: Khám phá cây con $C$
* Gốc $A$ truyền khoảng $[\alpha = 4,\, \beta = +\infty]$ xuống nút MIN $C$.
* Tại nút $C$ (nút MIN, cập nhật $\beta$):
  * Thăm lá thứ nhất (giá trị 5): $\beta = \min(+\infty, 5) = 5$. Ta có $\alpha = 4, \beta = 5$ (chưa thỏa điều kiện cắt vì $\alpha < \beta$).
  * Thăm lá thứ hai (giá trị 2): $\beta = \min(5, 2) = 2$.
  * Kiểm tra điều kiện cắt tỉa:
    $$\alpha = 4 \ge \beta = 2 \implies \mathbf{\alpha \ge \beta \text{ (Thỏa mãn!)}}$$
  * **Cắt tỉa (Alpha-cutoff tại $C$):** Người chơi MIN tại $C$ chắc chắn sẽ chọn nước đi có giá trị không vượt quá 2 ($\le 2$). Nhưng người chơi MAX tại gốc $A$ đã có phương án bảo đảm đạt ít nhất điểm 4 (ở nhánh $B$). Do đó MAX sẽ không bao giờ để thế cờ đi vào $C$.
  * **Lá bị cắt:** Cắt bỏ lá có giá trị **8**.

##### Bước 3: Khám phá cây con $D$
* Gốc $A$ vẫn duy trì khoảng $[\alpha = 4,\, \beta = +\infty]$ và truyền xuống nút MIN $D$.
* Tại nút $D$ (nút MIN, cập nhật $\beta$):
  * Thăm lá thứ nhất (giá trị 3): $\beta = \min(+\infty, 3) = 3$.
  * Kiểm tra điều kiện cắt tỉa:
    $$\alpha = 4 \ge \beta = 3 \implies \mathbf{\alpha \ge \beta \text{ (Thỏa mãn!)}}$$
  * **Cắt tỉa (Alpha-cutoff tại $D$):** MIN tại $D$ đã tìm được một nước đi có giá trị 3, nghĩa là $V(D) \le 3$. MAX tại $A$ sẽ không bao giờ chọn nhánh $D$ vì đã có nhánh $B$ với giá trị 4.
  * **Các lá bị cắt:** Lập tức cắt bỏ toàn bộ các lá còn lại của $D$, bao gồm các lá có giá trị **9** và **1**.

#### 3. Bảng tổng kết kết quả cắt tỉa:

| Nút xảy ra cắt tỉa | Giá trị $\alpha$ | Giá trị $\beta$ | Điều kiện | Các nút lá bị cắt bỏ | Số lá tiết kiệm |
|:---:|:---:|:---:|:---:|:---|:---:|
| **$C$** | $4$ | $2$ | $\alpha = 4 \ge \beta = 2$ | Lá **8** | 1 lá |
| **$D$** | $4$ | $3$ | $\alpha = 4 \ge \beta = 3$ | Lá **9**, lá **1** | 2 lá |

* **Tổng kết:** Tổng số lá của cây là 9 lá. Nhờ cắt tỉa Alpha-Beta, thuật toán chỉ cần đánh giá 6 lá, **cắt bỏ được 3 lá (8, 9, 1)** mà vẫn đảm bảo 100% tìm ra được nước đi tối ưu chính xác tuyệt đối.

---

**Rubric Chấm Điểm:**
* Tính đúng Minimax của $B, C, D$ và nút gốc $A$, chỉ rõ nước đi tốt nhất là $B$: **1.0 điểm**.
* Cập nhật chính xác tiến trình biến đổi của $\alpha, \beta$ qua từng nút: **0.5 điểm**.
* Liệt kê đúng 3 lá bị cắt (lá 8 tại C, lá 9 và 1 tại D) kèm điều kiện $\alpha \ge \beta$: **0.5 điểm**.

---

## Câu 7 (2.0 điểm) — Suy Diễn Xác Suất Bayes & Nghịch Lý Tỷ Lệ Gốc (Base Rate Fallacy)

### Question (English)
A disease has prevalence $P(D)=0.02$. A test has sensitivity $P(+|D)=0.90$ and specificity $P(-|\neg D)=0.95$.
1. Compute $P(+)$ using the law of total probability, then compute $P(D|+)$ using Bayes' theorem. (1.6 points)
2. Explain briefly why the posterior is much lower than the sensitivity. (0.4 point)

### Câu hỏi (Tiếng Việt)
Một bệnh có tỷ lệ hiện mắc $P(D)=0.02$. Một xét nghiệm có độ nhạy $P(+|D)=0.90$ và độ đặc hiệu $P(-|\neg D)=0.95$.
1. Tính $P(+)$ bằng luật xác suất toàn phần, sau đó tính $P(D|+)$ bằng định lý Bayes. (1.6 điểm)
2. Giải thích ngắn gọn vì sao xác suất hậu nghiệm thấp hơn nhiều so với độ nhạy. (0.4 điểm)

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Tóm tắt dữ kiện và các tham số xác suất y khoa:
* Biến cố $D$: Người được kiểm tra thực sự mắc bệnh $\implies$ Xác suất tiên nghiệm (Prevalence / Prior):
  $$P(D) = 0.02 \implies P(\neg D) = 1 - P(D) = 1 - 0.02 = 0.98$$
* Biến cố $+$: Kết quả xét nghiệm là dương tính.
* Độ nhạy (Sensitivity / True Positive Rate):
  $$P(+ \mid D) = 0.90$$
* Độ đặc hiệu (Specificity / True Negative Rate):
  $$P(- \mid \neg D) = 0.95$$
* Tỷ lệ dương tính giả (False Positive Rate):
  $$P(+ \mid \neg D) = 1 - P(- \mid \neg D) = 1 - 0.95 = 0.05$$

#### 2. Tính xác suất toàn phần $P(+)$:
Theo **Luật xác suất toàn phần (Law of Total Probability)**, biến cố nhận kết quả xét nghiệm dương tính xảy ra trong hai trường hợp xung khắc: dương tính thật (có bệnh) và dương tính giả (không bệnh):
$$P(+) = P(+ \mid D) \cdot P(D) + P(+ \mid \neg D) \cdot P(\neg D)$$

Thay số chi tiết:
$$P(+) = (0.90 \times 0.02) + (0.05 \times 0.98)$$
$$P(+) = 0.0180 + 0.0490 = \mathbf{0.0670} \quad (6.70\%)$$

#### 3. Tính xác suất hậu nghiệm $P(D \mid +)$ theo Định lý Bayes:
Theo **Định lý Bayes (Bayes' Rule)**:
$$P(D \mid +) = \frac{P(+ \mid D) \cdot P(D)}{P(+)} = \frac{P(+ \mid D) \cdot P(D)}{P(+ \mid D) \cdot P(D) + P(+ \mid \neg D) \cdot P(\neg D)}$$

Thay số:
$$P(D \mid +) = \frac{0.0180}{0.0670} = \frac{18}{67} \approx \mathbf{0.268656...} \approx \mathbf{26.87\%}$$

#### 4. Giải thích hiện tượng & Bản chất Nghịch lý Tỷ lệ Gốc (Base Rate Fallacy):
Mặc dù xét nghiệm có độ nhạy rất cao ($90\%$) và độ đặc hiệu lên tới $95\%$, nhưng một người khi nhận kết quả dương tính chỉ có xác suất thực sự mắc bệnh là **$26.87\%$** (nghĩa là hơn $73\%$ người nhận kết quả dương tính thực chất hoàn toàn khỏe mạnh!).

* **Giải thích trực quan bằng Quy mô mẫu quần thể (100.000 dân):**
  * Trong $100.000$ người:
    * Số người thực sự có bệnh: $100.000 \times 0.02 = 2.000$ người.
      * Trong đó, xét nghiệm dương tính đúng: $2.000 \times 0.90 = \mathbf{1.800}$ người.
    * Số người khỏe mạnh: $100.000 \times 0.98 = 98.000$ người.
      * Dù tỷ lệ dương tính giả chỉ là $5\%$, nhưng áp dụng trên tập người khỏe mạnh khổng lồ sẽ sinh ra: $98.000 \times 0.05 = \mathbf{4.900}$ ca dương tính giả!
  * **Tổng số ca dương tính trong cộng đồng:**
    $$\text{Tổng dương tính} = 1.800 + 4.900 = 6.700 \text{ ca}$$
  * Do đó, xác suất một ca dương tính là người có bệnh thật sự:
    $$P(D \mid +) = \frac{1.800}{1.800 + 4.900} = \frac{1.800}{6.700} \approx 26.87\%$$
* **Kết luận nhận thức AI:**
  * Nguyên nhân gốc rễ là **Tỷ lệ hiện mắc của bệnh trong cộng đồng quá nhỏ (hiếm gặp, $2\%$)**, khiến cho nhóm người khỏe mạnh áp đảo hoàn toàn ($98\%$).
  * Hiện tượng này gọi là **Nghịch lý tỷ lệ gốc (Base Rate Fallacy)**: Con người thường chỉ chú ý đến thông tin độ chính xác bề ngoài của xét nghiệm (độ nhạy $90\%$) mà bỏ qua thông tin nền tảng cực kỳ quan trọng là tần suất xuất hiện ban đầu của hiện tượng (Prior probability).

---

**Rubric Chấm Điểm:**
* Xác định đúng $P(+ \mid \neg D) = 0.05$ và tính đúng $P(+) = 0.067$: **0.8 điểm**.
* Áp dụng chuẩn công thức Bayes và tính đúng $P(D \mid +) \approx 26.87\%$: **0.8 điểm**.
* Giải thích sâu sắc nguyên nhân do Base Rate Fallacy (có phân tích quần thể hoặc so sánh số ca dương tính thật vs giả): **0.4 điểm**.

---

## BẢNG TỔNG KẾT ĐIỂM TOÀN BÀI — ĐỀ 02

| Câu hỏi | Chủ đề kiến thức | Điểm tối đa | Chuẩn đầu ra (Target Competency) |
|:---:|:---|:---:|:---|
| **Câu 1** | Chương 1: Tác tử thông minh & Trạng thái nội bộ | **1.5** | Phân biệt Agent, Software/Hardware Agent, mô hình toán học $a_t = F(s_t, p_t)$ |
| **Câu 2** | Chương 2: Suy diễn tiến trên Horn KB | **1.0** | Nắm vững Forward Chaining, bảng theo dõi Agenda và Inferred facts |
| **Câu 3** | Chương 3: Hợp nhất Robinson trong FOL | **1.0** | Tìm MGU, giải hệ phương trình, Occurs-Check và Verify phép thế |
| **Câu 4** | Chương 4: Bùng nổ tổ hợp trong suy diễn | **1.0** | Hiểu bản chất $b^d$, tính toán tốc độ phần cứng vs độ sâu $\log_b(k)$ |
| **Câu 5** | Chương 5: Thứ tự SLD & Quay lui trong Prolog | **1.5** | Lập vết cây thực thi Prolog, thứ tự nghiệm và cơ chế Backtracking |
| **Câu 6** | Chương 6: Cắt tỉa Alpha-Beta Game Tree | **2.0** | Tính Minimax, cập nhật khoảng $[\alpha, \beta]$ và xác định chính xác các lá bị tỉa |
| **Câu 7** | Chương 7: Xác suất Bayes & Base Rate Fallacy | **2.0** | Xác suất toàn phần, công thức Bayes và giải thích định lượng quần thể |
| **TỔNG** | **Toàn bộ 7 Chương học phần AI** | **10.0** | **Đạt chuẩn điểm 10/10 (Xuất sắc - Chuẩn chỉ)** |

## Tổng điểm

**Tổng: 10/10**

