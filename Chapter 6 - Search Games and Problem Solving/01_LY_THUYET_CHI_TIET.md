# Chương 6 – Lý Thuyết Toàn Diện: Tìm Kiếm, Trò Chơi Đối Kháng & Giải Quyết Vấn Đề (Search, Games and Problem Solving)

> **Mục tiêu đạt điểm A+:** Nắm vững toàn bộ mô hình toán học 5 thành phần của bài toán tìm kiếm; bản chất bùng nổ tổ hợp hàm mũ và định lý thống trị của tầng lá cuối cùng; so sánh đa chiều các thuật toán tìm kiếm mù (BFS, DFS, UCS, IDS); chứng minh chặt chẽ tính tối ưu của thuật toán A* qua hai điều kiện Admissible và Consistent; phân tích các hàm Heuristic 8-puzzle và quan hệ trội (Dominance); làm chủ thuật toán Minimax và kỹ thuật Tỉa nhánh Alpha-Beta ($\alpha \ge \beta$); mở rộng sang cây Expectiminimax, hàm đánh giá tĩnh Samuel và DeepMind AlphaGo.

---

## 1. Bản Chất Bài Toán Tìm Kiếm & Mô Hình 5 Thành Phần

### 1.1. Khái niệm Tác tử Giải quyết Vấn đề (Problem-Solving Agent)
Trong Trí tuệ Nhân tạo cổ điển, một tác tử thông minh dựa trên mục tiêu (Goal-based Agent) giải quyết bài toán bằng cách hình thành mục tiêu, mô hình hóa bài toán thành không gian trạng thái trừu tượng, và tiến hành **Tìm kiếm (Search)** một chuỗi hành động dẫn từ điểm xuất phát đến đích.

Một bài toán tìm kiếm chuẩn mực luôn được xác định bởi **5 thành phần hình thức**:
1. **Trạng thái ban đầu (Initial State $s_0$):** Điểm xuất phát của bài toán (ví dụ: Vị trí của các quân cờ, hoặc thành phố xuất phát Bern).
2. **Tập hành động hợp lệ (Actions / Successor Function):** Tại mỗi trạng thái $s$, $\text{Actions}(s)$ là tập các hành động hợp lệ mà tác tử có thể thực hiện. Số lượng hành động hợp lệ tại $s$ chính là **Hệ số rẽ nhánh cục bộ (Local branching factor $b(s)$)**.
3. **Mô hình chuyển trạng thái (Transition Model):** Hàm $\text{Result}(s, a)$ trả về trạng thái mới $s'$ sau khi thực hiện hành động $a \in \text{Actions}(s)$ tại trạng thái $s$.
4. **Kiểm tra mục tiêu (Goal Test):** Một vị từ $\text{IsGoal}(s) \in \{\text{True}, \text{False}\}$ xác định xem một trạng thái đã đạt đích hay chưa.
5. **Chi phí đường đi (Path Cost $g$):** Tổng chi phí của chuỗi hành động dẫn từ trạng thái ban đầu đến trạng thái hiện tại. Thường chi phí bước đi là $c(s, a, s') \ge 0$. Nếu mọi bước đi có chi phí như nhau ($c = 1$), bài toán gọi là có chi phí đơn vị (Unit-cost).

### 1.2. Phân Biệt Sống Còn: Đồ Thị Trạng Thái vs Cây Tìm Kiếm

| Tiêu chí | Đồ thị Không gian Trạng thái (State Space Graph) | Cây Tìm kiếm (Search Tree) |
|---|---|---|
| **Bản chất** | Cấu trúc topo trừu tượng của thế giới vật lý bài toán. | Hành trình duyệt và mở rộng trạng thái của thuật toán. |
| **Sự lặp lại** | Mỗi trạng thái vật lý xuất hiện **đúng 1 lần duy nhất** dưới dạng 1 đỉnh (Vertex). | Một trạng thái vật lý có thể xuất hiện **vô số lần** ở nhiều nút (Nodes) khác nhau nếu có nhiều đường dẫn đến nó. |
| **Kích thước** | Hữu hạn đối với hầu hết các trò chơi bàn cờ (ví dụ: 8-puzzle có đúng $\frac{9!}{2} = 181,440$ đỉnh). | Có thể là **vô hạn** nếu đồ thị có chu trình và thuật toán không có cơ chế kiểm tra lặp (Cycle Check). |

---

## 2. Bùng Nổ Tổ Hợp & Định Lý Thống Trị Tầng Cuối Cùng

### 2.1. Cơn Ác Mộng Lũy Thừa $b^d$
Xét một cây tìm kiếm đều có hệ số rẽ nhánh $b$ và độ sâu lời giải $d$:
- Ở độ sâu $0$: $b^0 = 1$ nút (Gốc).
- Ở độ sâu $1$: $b^1 = b$ nút.
- ...
- Ở độ sâu $d$: $b^d$ nút.

Tổng số nút sinh ra trên toàn bộ cây tìm kiếm là tổng cấp số nhân:
$$N = \sum_{i=0}^d b^i = \frac{b^{d+1} - 1}{b - 1}$$

- Với cờ vua ($b \approx 35, d \approx 80$), tổng số nút là $35^{80} \approx 10^{123}$, vượt xa tổng số nguyên tử trong toàn vũ trụ quan sát được ($\approx 10^{80}$). Duyệt cạn mù quáng (Brute-force) là điều hoàn toàn bất khả thi!

### 2.2. Định lý 1: Sự Thống Trị Tuyệt Đối Của Tầng Lá Cuối Cùng ([Ertel 2025], Ex 6.1)
- Tỉ lệ số nút ở tầng đáy $d$ so với tổng số nút của toàn bộ cây:
  $$\frac{L_d}{N} = \frac{b^d}{\frac{b^{d+1}-1}{b-1}} = \frac{b-1}{b - b^{-d}} \approx \frac{b-1}{b} = 1 - \frac{1}{b}$$
- **Hệ quả kinh tế học tính toán:**
  - Với $b = 10$, tỉ lệ này là $\frac{9}{10} = 90\%$.
  - Với $b = 30$, tỉ lệ này là $\frac{29}{30} \approx 96.7\%$.
  - Với $b = 100$, tỉ lệ này đạt tới **$99\%$**!
- **Ý nghĩa cốt tử:** **Gần như 100% thời gian tính toán và bộ nhớ RAM của thuật toán bị thiêu rụi ở tầng sâu nhất.** Tất cả các tầng từ $0$ đến $d-1$ cộng lại chỉ chiếm một tỉ lệ không đáng kể.

### 2.3. Hệ Số Rẽ Nhánh Hữu Hiệu (Effective Branching Factor $b^*$)
Nếu một thuật toán tìm kiếm sinh ra tổng cộng $N$ nút để tìm thấy lời giải ở độ sâu $d$, **Hệ số rẽ nhánh hữu hiệu $b^*$** là số thực duy nhất thỏa mãn phương trình:
$$N = 1 + b^* + (b^*)^2 + \dots + (b^*)^d = \frac{(b^*)^{d+1} - 1}{b^* - 1}$$
- $b^*$ đo lường độ sắc bén của một hàm Heuristic: $b^*$ càng tiến gần về 1, thuật toán càng tiệm cận một đường đi thẳng tắp không phân nhánh đến đích.

### 2.4. Không Gian Trạng Thái 8-Puzzle & Tính Chẵn Lẻ Của Nghịch Thế
Trò chơi 8-puzzle có 9 ô ($8$ quân cờ số và $1$ ô trống). Tổng số hoán vị sắp xếp là $9! = 362,880$.
- Tuy nhiên, mỗi nước trượt hợp lệ không làm thay đổi **tính chẵn lẻ của số lượng nghịch thế (Permutation Inversions)**.
- Do đó, không gian trạng thái bị phân rã thành **hai thành phần liên thông độc lập hoàn toàn, mỗi miền có kích thước $\frac{9!}{2} = 181,440$ trạng thái**. Nếu trạng thái ban đầu và trạng thái đích có tính chẵn lẻ khác nhau, không tồn tại bất kỳ chuỗi nước đi nào có thể giải được bài toán!

---

## 3. Các Chiến Lược Tìm Kiếm Mù (Uninformed Search Strategies)

"Mù" (Uninformed) có nghĩa là thuật toán không có bất kỳ ước lượng định lượng nào về việc một trạng thái trông có gần đích hơn trạng thái khác hay không.

### 3.1. Tìm kiếm theo Chiều Rộng (Breadth-First Search - BFS)
- **Cơ chế:** Duyệt theo từng tầng (Level-by-level). Thăm hết tất cả các nút ở độ sâu $k$ rồi mới chuyển sang độ sâu $k+1$.
- **Cấu trúc dữ liệu biên (Frontier):** Hàng đợi **FIFO (First-In, First-Out)**.
- **Tính đầy đủ (Completeness):** **ĐẦY ĐỦ** nếu hệ số rẽ nhánh $b < \infty$.
- **Tính tối ưu (Optimality):** **TỐI ƯU KHI VÀ CHỈ KHI CHI PHÍ BƯỚC ĐI BẰNG NHAU (Unit-cost)**. Nếu chi phí bước đi khác nhau, BFS không đảm bảo tối ưu.
- **Độ phức tạp:** Thời gian $\mathcal{O}(b^d)$, Bộ nhớ $\mathcal{O}(b^d)$.
- **Tử huyệt:** **Tràn bộ nhớ RAM**. Vì phải lưu toàn bộ biên của tầng cuối cùng (chiếm 90-99% nút), BFS sẽ làm cạn kiệt RAM của máy tính chỉ sau vài chục giây trước khi CPU kịp tính toán.

### 3.2. Tìm kiếm theo Chiều Sâu (Depth-First Search - DFS)
- **Cơ chế:** Lao thẳng xuống một nhánh cho tới khi chạm nút lá ngõ cụt, sau đó quay lui (Backtracking) về nút cha gần nhất còn nhánh chưa duyệt.
- **Cấu trúc dữ liệu:** Ngăn xếp **LIFO (Last-In, First-Out)** (thường cài đặt bằng đệ quy).
- **Tính đầy đủ:** **KHÔNG ĐẦY ĐỦ** trong không gian trạng thái vô hạn hoặc có chu trình lặp (nó bị kẹt ở nhánh vô tận và không bao giờ thoát ra được).
- **Tính tối ưu:** **KHÔNG TỐI ƯU**. DFS trả về nghiệm đầu tiên tìm thấy bất kể đường đi dài hay ngắn.
- **Độ phức tạp:** Thời gian $\mathcal{O}(b^m)$ (với $m$ là độ sâu tối đa), Bộ nhớ $\mathcal{O}(b \cdot m)$ (với $m \ge d$).
- **Ưu điểm áp đảo:** **Bộ nhớ cực kỳ tiết kiệm $\mathcal{O}(b \cdot m)$** (chỉ cần lưu vết đường đi hiện tại từ gốc và các anh em chưa duyệt).

### 3.3. Tìm kiếm theo Giá Đồng Nhất (Uniform-Cost Search - UCS)
- **Cơ chế:** Mở rộng thuật toán Dijkstra trên cây/đồ thị. Luôn chọn nút $n$ có chi phí đường đi tích lũy $g(n)$ nhỏ nhất trong hàng đợi.
- **Cấu trúc dữ liệu:** Hàng đợi ưu tiên (Priority Queue) sắp xếp theo $g(n)$.
- **Tính đầy đủ & Tối ưu:** **ĐẦY ĐỦ VÀ TỐI ƯU** với mọi bài toán có chi phí bước đi $c(s, a, s') \ge \epsilon > 0$.
- **Độ phức tạp:** Thời gian và bộ nhớ $\mathcal{O}(b^{1 + \lfloor C^* / \epsilon \rfloor})$ (với $C^*$ là chi phí tối ưu, $\epsilon$ là chi phí bước đi nhỏ nhất).
- **Quy tắc Vàng của UCS:** **CHỈ KIỂM TRA MỤC TIÊU KHI LẤY NÚT RA KHỎI HÀNG ĐỢI (POP / EXPAND), KHÔNG ĐƯỢC KIỂM TRA KHI VỪA SINH RA NÚT (PUSH / GENERATE)**.

### 3.4. Cứu Tinh: Lặp Sâu Dần (Iterative Deepening Search - IDS)
IDS kết hợp hoàn hảo giữa **Tính tối ưu & Đầy đủ của BFS** với **Bộ nhớ tí hon của DFS**:
- Chạy DFS với giới hạn độ sâu (Limit) tăng dần: $limit = 0, 1, 2, \dots, d$.
- **Giải mã nghịch lý chi phí lặp:** Nhờ Định lý 1 ("99% nút nằm ở tầng đáy"), tổng số nút sinh ra qua toàn bộ các lần lặp chỉ là:
  $$N_{\text{IDS}} = (d+1) \cdot 1 + d \cdot b + (d-1) \cdot b^2 + \dots + 1 \cdot b^d = \mathcal{O}(b^d)$$
- Thời gian chạy chỉ gấp $\frac{b}{b-1}$ lần BFS (với $b = 10$, chỉ tăng thêm khoảng 11% số nút), nhưng **Bộ nhớ giảm ngoạn mục xuống mức tuyến tính $\mathcal{O}(b \cdot d)$**.
- **Kết luận:** Trong các bài toán tìm kiếm mù có không gian lớn, **IDS luôn là sự lựa chọn số 1**.

---

### Bảng Tổng Hợp So Sánh Các Thuật Toán Tìm Kiếm Mù

| Thuật toán | Đầy đủ? (Complete) | Tối ưu? (Optimal) | Độ phức tạp Thời gian | Độ phức tạp Không gian (Bộ nhớ) | Chiến lược hàng đợi |
|---|---|---|---|---|---|
| **BFS** | CÓ (nếu $b < \infty$) | CÓ (khi chi phí đơn vị $c = 1$) | $\mathcal{O}(b^d)$ | $\mathcal{O}(b^d)$ *(Tràn RAM)* | FIFO Queue |
| **DFS** | KHÔNG (bị kẹt chu trình) | KHÔNG | $\mathcal{O}(b^m)$ | $\mathcal{O}(b \cdot m)$ *(Siêu tiết kiệm)* | LIFO Stack |
| **UCS** | CÓ (nếu $c \ge \epsilon > 0$) | CÓ (với chi phí bất kỳ) | $\mathcal{O}(b^{1 + \lfloor C^*/\epsilon \rfloor})$ | $\mathcal{O}(b^{1 + \lfloor C^*/\epsilon \rfloor})$ | Priority Queue theo $g(n)$ |
| **IDS** | CÓ (nếu $b < \infty$) | CÓ (khi chi phí đơn vị $c = 1$) | $\mathcal{O}(b^d)$ | $\mathcal{O}(b \cdot d)$ *(Tối ưu toàn diện)* | LIFO Stack tăng dần limit |

---

## 4. Kiểm Tra Chu Trình (Cycle Checking) Trong Đồ Thị

Trong các bài toán thực tế, không gian trạng thái thường có các cạnh quay vòng (chu trình). Có hai trường phái kiểm soát chu trình:
1. **Kiểm tra trên đường đi hiện tại (Path Cycle Check):**
   - Mỗi nút lưu con trỏ trỏ ngược về cha (`parent pointer`).
   - Khi sinh một nút ở độ sâu $i$, lần ngược lên gốc để kiểm tra xem trạng thái này đã xuất hiện trên đường đi hiện tại chưa.
   - **Ưu điểm:** Bộ nhớ vẫn giữ nguyên mức tuyến tính $\mathcal{O}(b \cdot d)$.
   - **Nhược điểm thời gian:** Tốn thêm $\mathcal{O}(d)$ phép so sánh cho mỗi nút, tổng thời gian bị nhân thêm hệ số $d$: $\mathcal{O}(d \cdot b^d)$.
2. **Khám phá đồ thị toàn diện (Graph Search với ClosedList / Visited Set):**
   - Duy trì một Bảng băm (Hash Table) lưu toàn bộ các trạng thái đã từng mở rộng.
   - Bất kỳ trạng thái nào đã có trong `ClosedList` đều bị bỏ qua ngay lập tức.
   - **Ưu điểm:** Triệt tiêu hoàn toàn mọi chu trình và bước đi thừa.
   - **Nhược điểm:** Tiêu tốn bộ nhớ cấp số nhân $\mathcal{O}(b^d)$, biến thuật toán tiết kiệm như DFS thành kẻ ngốn RAM!

---

## 5. Tìm Kiếm Heuristic & Thuật Toán A*

Hàm Heuristic $h(n)$ là hàm ước lượng chi phí rẻ nhất để đi từ nút $n$ đến đích:
$$h(n) \approx h^*(n) \quad \text{với } h^*(n) \text{ là chi phí tối ưu thực tế, } h(\text{Goal}) = 0$$

### 5.1. Tìm kiếm Tham Lam (Greedy Best-First Search)
- Đánh giá nút hoàn toàn dựa vào tương lai: $f(n) = h(n)$.
- Rất dễ bị bẫy cục bộ và chướng ngại vật đánh lừa (lao đầu vào ngõ cụt có vẻ gần đích theo đường chim bay). Không đầy đủ và không tối ưu.

### 5.2. Thuật toán A* ($f(n) = g(n) + h(n)$)
Thuật toán A* kết hợp hoàn hảo giữa chi phí quá khứ và ước lượng tương lai:
$$f(n) = g(n) + h(n)$$
- $g(n)$: Chi phí thực tế đã đi từ gốc đến nút $n$.
- $h(n)$: Chi phí ước lượng đi tiếp từ nút $n$ đến đích.
- $f(n)$: Tổng chi phí ước lượng của cả hành trình đi qua nút $n$.

#### Điều kiện 1: Tính Chấp Nhận Được (Admissible Heuristic)
Một heuristic $h(n)$ là **Admissible** nếu nó **không bao giờ ước lượng cao hơn chi phí thực tế**:
$$0 \le h(n) \le h^*(n), \quad \forall n$$
- Heuristic admissible là một người dự toán luôn "lạc quan".
- **Định lý Tính Tối Ưu của A\* Tree Search:** Nếu $h(n)$ là admissible, thuật toán A* chạy trên cây tìm kiếm **chắc chắn tìm ra đường đi có chi phí tối ưu toàn cục**.

#### Điều kiện 2: Tính Nhất Quán (Consistent / Monotonic Heuristic)
Một heuristic $h(n)$ là **Consistent (Nhất quán)** nếu với mọi nút $n$ và nút con $n'$ sinh ra bởi hành động có chi phí $c(n, a, n')$:
$$h(n) \le c(n, a, n') + h(n')$$
- Đây chính là **Bất đẳng thức Tam giác** trong không gian chi phí.
- **Hệ quả quan trọng:** Nếu $h$ consistent thì:
  1. $h$ chắc chắn là admissible (nếu $h(Goal) = 0$).
  2. Giá trị $f(n)$ tăng đơn điệu dọc theo mọi đường đi: $f(n') \ge f(n)$.
  3. Khi A* mở rộng một nút lần đầu tiên trong Graph Search, con đường dẫn tới nút đó **đã được bảo đảm là tối ưu tuyệt đối, không bao giờ phải cập nhật lại (không cần reopen ClosedList)**.

### 5.3. Các Hàm Heuristic Cho 8-Puzzle & Quan Hệ Trội (Dominance)
1. **$h_1(n)$ (Misplaced Tiles - Số ô sai vị trí):** Đếm số lượng ô số không nằm đúng vị trí đích (bỏ qua ô trống).
2. **$h_2(n)$ (Manhattan Distance - Tổng khoảng cách Manhattan):** Tổng khoảng cách dịch chuyển ngang và dọc của từng ô số từ vị trí hiện tại đến vị trí đích:
   $$h_2(n) = \sum_{i=1}^8 \left( |x_i - x_i^*| + |y_i - y_i^*| \right)$$
- **Chứng minh tính Admissible:** Cả $h_1$ và $h_2$ đều admissible vì để đưa một ô về đích, ít nhất phải di chuyển ô đó ít nhất 1 lần ($h_1$), và nếu không có chướng ngại vật thì số bước tối thiểu chính là khoảng cách Manhattan ($h_2$).
- **Khái niệm Trội (Dominance):**
  - Ta luôn có: $\forall n: h_2(n) \ge h_1(n)$.
  - Ta nói **$h_2$ trội hơn $h_1$ ($h_2$ dominates $h_1$)**.
  - **Hệ quả hiệu năng:** Sử dụng heuristic trội $h_2$ sẽ giúp A* mở rộng ít nút hơn, cắt tỉa không gian tìm kiếm sắc bén hơn $h_1$.

### 5.4. Thuật toán Lặp Sâu Dần A* (IDA* - Iterative Deepening A*)
- Giải quyết tử huyệt tràn bộ nhớ $\mathcal{O}(b^d)$ của A*.
- Thay vì cắt tỉa theo độ sâu $d$ như IDS, IDA* **cắt tỉa theo giá trị ngưỡng $f(n)$**:
  - Đặt ngưỡng ban đầu $\theta = f(s_0) = h(s_0)$.
  - Chạy DFS, tỉa bỏ mọi nút có $f(n) > \theta$.
  - Ghi nhận giá trị $f$ nhỏ nhất vượt ngưỡng để làm ngưỡng cho lần lặp tiếp theo.
- **Ưu thế:** Đầy đủ, tối ưu như A* nhưng **bộ nhớ chỉ tốn tuyến tính $\mathcal{O}(b \cdot d)$**.

---

## 6. Trò Chơi Đối Kháng & Thuật Toán Minimax

Xét trò chơi 2 người chơi (Two-player), tổng bằng không (Zero-sum), thông tin hoàn hảo (Perfect information), luân phiên theo lượt (Turn-taking):
- **MAX:** Cố gắng tối đa hóa điểm số của mình.
- **MIN:** Cố gắng giảm thiểu điểm số của MAX xuống mức thấp nhất.

### 6.1. Công thức Minimax Đệ Quy
$$\text{Minimax}(s) = \begin{cases} 
\text{Utility}(s) & \text{nếu } s \text{ là trạng thái kết thúc (Terminal)} \\
\max_{a \in \text{Actions}(s)} \text{Minimax}(\text{Result}(s, a)) & \text{nếu } s \text{ là lượt của MAX} \\
\min_{a \in \text{Actions}(s)} \text{Minimax}(\text{Result}(s, a)) & \text{nếu } s \text{ là lượt của MIN}
\end{cases}$$

- **Cơ chế Đẩy ngược Giá trị (Backed-up Values):** Điểm số thực sự của các nút nội bộ được tính từ dưới các nút lá đẩy ngược lên. MAX đưa ra quyết định tối ưu với giả định đối thủ MIN luôn chơi nước đi hoàn hảo nhất.

---

## 7. Thuật Toán Tỉa Nhánh Alpha-Beta ($\alpha$-$\beta$ Pruning)

### 7.1. Bản Chất Triết Học Của Tỉa Nhánh
> *"Nếu bạn đã phát hiện ra một nước đi của đối thủ tồi tệ hơn nước đi tốt nhất mà bạn đang nắm chắc trong tay, bạn không cần tốn thời gian xem xét các nước đi khác trong nhánh đó nữa!"*

### 7.2. Ý Nghĩa Của Hai Tham Số $\alpha$ và $\beta$
- $\alpha$: **Giá trị tốt nhất (lớn nhất) mà MAX đã bảo đảm đạt được** trên đường đi từ gốc đến hiện tại. Khởi tạo $\alpha = -\infty$.
- $\beta$: **Giá trị tốt nhất (nhỏ nhất) mà MIN đã bảo đảm đạt được** trên đường đi từ gốc đến hiện tại. Khởi tạo $\beta = +\infty$.

### 7.3. Quy Tắc Tỉa Nhánh: $\alpha \ge \beta$
- Tại nút MIN: Cập nhật $\beta = \min(\beta, v)$. Nếu $v \le \alpha \implies$ **Tỉa bỏ toàn bộ các nhánh con còn lại của nút MIN (Alpha-cutoff)**.
- Tại nút MAX: Cập nhật $\alpha = \max(\alpha, v)$. Nếu $v \ge \beta \implies$ **Tỉa bỏ toàn bộ các nhánh con còn lại của nút MAX (Beta-cutoff)**.

```
Sơ đồ Minh họa Cắt tỉa Alpha-Beta:
                   [MAX] (đã nắm chắc alpha = 5)
                  /     \
             val = 5     [MIN] (đang duyệt nhánh mới)
                         /   \
                       [2]   [?] <--- TỈA NGAY LẬP TỨC vì beta <= 2 <= alpha = 5!
```

### 7.4. Ảnh Hưởng Của Thứ Tự Duyệt Nước Đi (Move Ordering)
- **Tỉa nhánh Alpha-Beta KHÔNG BAO GIỜ làm thay đổi giá trị Minimax cuối cùng của nút gốc!**
- Hiệu năng phụ thuộc sống còn vào thứ tự duyệt các nước đi:
  - **Trường hợp xấu nhất (Duyệt nước tệ nhất trước):** Không tỉa được nút nào, chi phí vẫn là $\mathcal{O}(b^d)$.
  - **Trường hợp lý tưởng (Luôn duyệt nước đi tốt nhất trước):** Độ phức tạp giảm xuống chỉ còn:
    $$\mathcal{O}(b^{d/2}) = \mathcal{O}\left((\sqrt{b})^d\right)$$
  - **Hệ quả kỳ diệu:** Với cùng một lượng thời gian tính toán, **Alpha-Beta có thể nhìn sâu gấp đôi Minimax thông thường!**

---

## 8. Các Chủ Đề Mở Rộng Nâng Cao (Slide Topics)

### 8.1. Trò Chơi Bất Định: Cây Expectiminimax
Trong các trò chơi có yếu tố ngẫu nhiên (đổ xúc xắc, chia bài như Cờ cá ngựa, Backgammon, Poker), cây tìm kiếm bổ sung thêm **Nút cơ hội (Chance Nodes)**:
- Nút MAX: Lấy $\max$.
- Nút MIN: Lấy $\min$.
- Nút CHANCE: Lấy **Kỳ vọng toán học (Expected Value)**:
  $$\text{Expectiminimax}(s) = \sum_{r} P(r) \cdot \text{Expectiminimax}(\text{Result}(s, r))$$

### 8.2. Hàm Đánh Giá Tĩnh Tuyến Tính (Arthur Samuel Checkers)
Khi không thể tìm kiếm đến tận cùng ván cờ ($d \approx 80$), ta dừng lại ở độ sâu $d_{\text{cut}}$ và gọi **Hàm đánh giá tĩnh (Heuristic Evaluation Function)**:
$$Eval(s) = \sum_{i=1}^n w_i f_i(s) = w_1 f_1(s) + w_2 f_2(s) + \dots + w_n f_n(s)$$
- Arthur Samuel (thập niên 1950) đã cho máy tính tự đấu hàng ngàn ván cờ đam để học các trọng số $w_i$ qua Temporal Difference Learning – đặt nền móng cho Học Tăng Cường (Reinforcement Learning).

### 8.3. Cuộc Cách Mạng DeepMind AlphaGo (2016)
Với bàn cờ Vây $19 \times 19$ ($b \approx 250$), Minimax và Alpha-Beta truyền thống hoàn toàn bất lực. AlphaGo đã kết hợp:
1. **Policy Network:** Mạng nơ-ron thu hẹp hệ số rẽ nhánh $b$ bằng cách chọn ra các nước đi có xác suất cao nhất.
2. **Value Network:** Mạng nơ-ron đánh giá thế cờ tĩnh thay cho việc duyệt sâu.
3. **MCTS (Monte Carlo Tree Search):** Mô phỏng ngẫu nhiên hàng triệu ván cờ tự đấu để hội tụ về nước đi tối ưu.
