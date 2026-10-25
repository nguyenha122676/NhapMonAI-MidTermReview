# Chương 6 – Bảng Khái Niệm Bắt Buộc Học Thuộc & Từ Điển Thuật Ngữ (Core Terminology & Memorization Guide)

> **Mục tiêu đạt điểm A+:** Làm chủ hệ thống thuật ngữ song ngữ Anh – Việt về Tìm kiếm không gian trạng thái, Thuật toán Heuristic (A*, IDA*), Trò chơi đối kháng Minimax và Tỉa nhánh Alpha-Beta; thuộc lòng các định lý toán học (Định lý 1 về tầng lá đáy, Admissible, Consistent, Dominance); và nhận diện tức thì các bẫy phòng thi để đạt điểm tuyệt đối.

---

## 1. Bảng Đối Chiếu Thuật Ngữ Song Ngữ (Bilingual Terminology Lexicon)

| Thuật ngữ Tiếng Việt | English Term | Ký hiệu / Công thức | Bản chất kỹ thuật & Ngữ cảnh phòng thi |
|---|---|---|---|
| **Không gian trạng thái** | State Space Graph | Đồ thị $G = (V, E)$ | Cấu trúc topo trừu tượng của thế giới; mỗi trạng thái vật lý xuất hiện duy nhất 1 lần dưới dạng 1 đỉnh. |
| **Cây tìm kiếm** | Search Tree | Gốc $s_0 \rightarrow$ Lá | Tiến trình duyệt của thuật toán; một trạng thái vật lý có thể xuất hiện nhiều lần ở các nút khác nhau nếu có chu trình. |
| **Hệ số rẽ nhánh** | Branching Factor | $b$ hoặc $b(s)$ | Số lượng trạng thái kế tiếp (successor states) sinh ra từ một nút thông qua các hành động hợp lệ. |
| **Hệ số rẽ nhánh hữu hiệu** | Effective Branching Factor | $b^*$ | Nghiệm thực của phương trình cấp số nhân $N = 1 + b^* + \dots + (b^*)^d$; đo lường độ sắc bén của Heuristic. |
| **Tính đầy đủ** | Completeness | $KB \vdash \alpha$ nếu có nghiệm | Đảm bảo thuật toán luôn tìm ra lời giải bất cứ khi nào bài toán có nghiệm tồn tại. |
| **Tính tối ưu** | Optimality | $PathCost = C^*$ | Đảm bảo thuật toán tìm ra đường đi có tổng chi phí nhỏ nhất trong số tất cả các lời giải khả thi. |
| **Tìm kiếm mù** | Uninformed / Blind Search | BFS, DFS, UCS, IDS | Các thuật toán không có tri thức về việc trạng thái nào trông có vẻ gần đích hơn trạng thái khác. |
| **Tìm kiếm theo giá đồng nhất** | Uniform-Cost Search (UCS) | Priority Queue theo $g(n)$ | Thuật toán Dijkstra trên cây; luôn mở rộng nút có chi phí đường đi tích lũy nhỏ nhất; chỉ kiểm tra đích khi POP. |
| **Lặp sâu dần** | Iterative Deepening Search (IDS) | Lặp DFS với $limit = 0, 1, \dots$ | Kết hợp tối ưu của BFS và bộ nhớ tuyến tính $\mathcal{O}(b \cdot d)$ của DFS; thuật toán tìm kiếm mù số 1 trong thực tế. |
| **Hàm ước lượng Heuristic** | Heuristic Function | $h(n)$ | Hàm ước lượng chi phí rẻ nhất từ nút hiện tại $n$ đến trạng thái đích; $h(\text{Goal}) = 0$. |
| **Tính chấp nhận được** | Admissibility | $0 \le h(n) \le h^*(n)$ | Heuristic "lạc quan", không bao giờ đánh giá cao hơn chi phí thực tế; bảo đảm tính tối ưu của A* Tree Search. |
| **Tính nhất quán / Đơn điệu** | Consistency / Monotonicity | $h(n) \le c(n, a, n') + h(n')$ | Thỏa mãn bất đẳng thức tam giác; bảo đảm $f(n)$ không giảm và A* Graph Search tối ưu mà không cần reopen nút. |
| **Quan hệ trội** | Dominance | $h_2(n) \ge h_1(n), \forall n$ | Heuristic $h_2$ trội hơn $h_1$; sử dụng $h_2$ giúp A* mở rộng ít nút hơn và cắt tỉa không gian tìm kiếm sắc bén hơn. |
| **Khoảng cách Manhattan** | Manhattan Distance | $h_2 = \sum (\|\Delta x\| + \|\Delta y\|)$ | Tổng khoảng cách di chuyển ngang và dọc của từng quân cờ đến ô đích trong 8-puzzle (không tính ô trống). |
| **Số ô sai vị trí** | Misplaced Tiles | $h_1 = \sum [tile_i \ne goal_i]$ | Đếm số lượng quân cờ không nằm đúng vị trí đích (không tính ô trống). |
| **Trò chơi tổng bằng không** | Zero-Sum Game | $U_{MAX} + U_{MIN} = 0$ | Lợi ích của người này là thiệt hại tuyệt đối của người kia; không có tình huống đôi bên cùng có lợi. |
| **Đẩy ngược giá trị** | Backed-up Value | Minimax value propagation | Điểm số của các nút nội bộ được tính đệ quy từ các nút lá đẩy ngược lên gốc theo nguyên lý Max/Min. |
| **Tỉa nhánh Alpha-Beta** | Alpha-Beta Pruning | Cắt tỉa khi $\alpha \ge \beta$ | Kỹ thuật bỏ qua các nhánh con không thể làm thay đổi quyết định tối ưu của MAX hoặc MIN; không đổi giá trị Minimax. |
| **Cận dưới của MAX** | Alpha ($\alpha$) | $\alpha = \max(\alpha, v)$ | Giá trị tốt nhất (lớn nhất) mà người chơi MAX đã bảo đảm đạt được trên đường đi từ gốc đến nút hiện tại. |
| **Cận trên của MIN** | Beta ($\beta$) | $\beta = \min(\beta, v)$ | Giá trị tốt nhất (nhỏ nhất) mà đối thủ MIN đã bảo đảm đạt được trên đường đi từ gốc đến nút hiện tại. |
| **Nút cơ hội** | Chance Node | $\sum P(s') U(s')$ | Nút mô phỏng các sự kiện ngẫu nhiên (đổ xúc xắc, chia bài) trong cây Expectiminimax; tính theo kỳ vọng toán học. |

---

## 2. Bộ Flashcards Khái Niệm Cốt Lõi (High-Yield Flashcards)

### Flashcard 1: Định Lý 1 Về Tầng Lá Cuối Cùng & Sự Ưu Việt Của IDS
- **Mặt trước:** Tại sao thuật toán Lặp sâu dần (Iterative Deepening Search - IDS) khi lặp lại việc duyệt từ gốc không bị coi là lãng phí tài nguyên?
- **Mặt sau:**
  - Theo Định lý 1, tỉ lệ số nút ở tầng đáy $d$ so với tổng số nút toàn cây là $\frac{b-1}{b} = 1 - \frac{1}{b}$. Với $b = 10$, $90\%$ số nút nằm ở tầng cuối; với $b = 30$, hơn $96.7\%$ số nút nằm ở tầng cuối.
  - Tổng số nút sinh ra qua toàn bộ các lần lặp của IDS là:
    $$N_{\text{IDS}} = (d+1) \cdot 1 + d \cdot b + (d-1) \cdot b^2 + \dots + 1 \cdot b^d \le \frac{b}{b-1} b^d = \mathcal{O}(b^d)$$
  - Số lần lặp lại ở các tầng nông ($0, 1, 2$) chỉ tốn thêm một hằng số phụ vụn vặt ($\approx 11\%$). Đổi lại, IDS chỉ tốn **bộ nhớ tuyến tính $\mathcal{O}(b \cdot d)$**, tránh hoàn toàn thảm họa tràn RAM của BFS!

### Flashcard 2: Điều Kiện Admissible vs Consistent Của Thuật Toán A*
- **Mặt trước:** Phân biệt rõ sự khác nhau giữa tính Admissible và tính Consistent của hàm Heuristic. Khi nào cần Consistent?
- **Mặt sau:**
  - **Admissible ($0 \le h(n) \le h^*(n)$):** Đảm bảo không bao giờ đánh giá cao hơn chi phí thực tế. Điều kiện này **đủ để đảm bảo A* tối ưu trên Cây tìm kiếm (Tree Search)**.
  - **Consistent ($h(n) \le c(n, a, n') + h(n')$):** Bất đẳng thức tam giác, đòi hỏi độ giảm ước lượng không được vượt quá chi phí bước đi thực tế. Điều kiện này **bắt buộc đối với A* trên Đồ thị (Graph Search)** để đảm bảo giá trị $f(n)$ tăng đơn điệu dọc đường đi.
  - Khi $h$ consistent, trạng thái được lấy ra khỏi Open (Pop) lần đầu tiên đã được bảo đảm có đường đi ngắn nhất, do đó **không bao giờ phải mở rộng lại trạng thái đó (không cần reopen ClosedList)**. Mọi heuristic consistent đều là admissible (nếu $h(Goal)=0$).

### Flashcard 3: Quy Tắc Dừng Của UCS và A* (Pop vs Push)
- **Mặt trước:** Tại sao thuật toán UCS và A* không được phép dừng lại ngay khi sinh ra trạng thái đích (Push / Generate)?
- **Mặt sau:**
  - Khi một trạng thái đích $Goal$ vừa được sinh ra, nó chỉ là một nút con được đưa vào hàng đợi ưu tiên với chi phí $f(Goal) = g(Goal)$.
  - Trong hàng đợi Open lúc đó có thể vẫn còn những nút chưa mở rộng khác có giá trị $f$ nhỏ hơn. Các nút này hoàn toàn có thể dẫn tới một đường đi khác đến đích với **chi phí rẻ hơn nữa**!
  - Do đó, thuật toán **chỉ được phép dừng và kết luận tối ưu khi trạng thái đích được lấy ra khỏi hàng đợi (Pop / Expand)**, vì lúc này toàn bộ các đường đi khả dĩ khác đều có chi phí lớn hơn hoặc bằng nó!

### Flashcard 4: Bản Chất Toán Học Của Tỉa Nhánh Alpha-Beta ($\alpha \ge \beta$)
- **Mặt trước:** Giải thích cơ chế toán học tại sao điều kiện $\alpha \ge \beta$ lại cho phép ta cắt tỉa nhánh cây trò chơi mà không làm mất tính tối ưu?
- **Mặt sau:**
  - $\alpha$ là điểm số cao nhất mà MAX đã chắc chắn đạt được ở một nhánh khác.
  - $\beta$ là điểm số thấp nhất mà MIN có thể ghìm chân MAX ở nhánh hiện tại.
  - Nếu $\alpha \ge \beta$, điều đó có nghĩa là: *"Ở nhánh hiện tại, đối thủ MIN đã có cách ép điểm số của MAX xuống mức $\le \beta \le \alpha$. Trong khi đó MAX đã nắm chắc trong tay ít nhất $\alpha$ điểm ở nhánh khác!"*.
  - Người chơi MAX duy lý sẽ không bao giờ chọn đi vào nhánh hiện tại. Do đó, việc tìm hiểu xem MIN có thể ép điểm số xuống sâu hơn nữa hay không trở nên hoàn toàn vô nghĩa $\implies$ **Tỉa bỏ ngay lập tức (Cutoff)**!

### Flashcard 5: Heuristic $h_1$ (Misplaced) vs $h_2$ (Manhattan) trong 8-Puzzle
- **Mặt trước:** Tại sao khoảng cách Manhattan $h_2$ luôn trội hơn số ô sai vị trí $h_1$ trong trò chơi 8-puzzle?
- **Mặt sau:**
  - Mỗi ô số sai vị trí đóng góp đúng $1$ đơn vị vào $h_1(n)$.
  - Nhưng trong không gian lưới 2 chiều, một ô sai vị trí cách ô đích của nó ít nhất 1 bước trượt, và thường là $2, 3$ hoặc $4$ bước: $|\Delta x| + |\Delta y| \ge 1$.
  - Do đó, với mọi trạng thái $n$, ta luôn có: $h_2(n) \ge h_1(n)$.
  - Vì cả hai hàm đều admissible và $h_2(n) \ge h_1(n)$, ta nói **$h_2$ trội hơn $h_1$**. A* dùng $h_2$ luôn mở rộng tập nút con là tập con của tập nút mở rộng bởi $h_1$, giúp tiết kiệm thời gian tính toán vượt trội!

---

## 3. Các Bảng So Sánh Đa Chiều Nền Tảng (Comprehensive Comparison Tables)

### Bảng 1: So Sánh Toàn Diện Các Thuật Toán Tìm Kiếm Không Gian Trạng Thái

| Thuật toán | Đầy đủ? (Complete) | Tối ưu? (Optimal) | Độ phức tạp Thời gian | Độ phức tạp Không gian (RAM) | Cấu trúc dữ liệu Frontier | Tiêu chí đánh giá $f(n)$ |
|---|:---:|:---:|---|---|---|---|
| **BFS** | CÓ (nếu $b < \infty$) | CÓ (chỉ khi chi phí $c = 1$) | $\mathcal{O}(b^d)$ | $\mathcal{O}(b^d)$ *(Tràn RAM)* | FIFO Queue | Độ sâu $d(n)$ |
| **DFS** | KHÔNG (kẹt chu trình) | KHÔNG | $\mathcal{O}(b^m)$ | $\mathcal{O}(b \cdot m)$ *(Tiết kiệm)* | LIFO Stack | Chiều sâu tối đa |
| **UCS** | CÓ (nếu $c \ge \epsilon > 0$) | CÓ (với chi phí bất kỳ) | $\mathcal{O}(b^{1 + \lfloor C^*/\epsilon \rfloor})$ | $\mathcal{O}(b^{1 + \lfloor C^*/\epsilon \rfloor})$ | Priority Queue | Chi phí quá khứ $g(n)$ |
| **IDS** | CÓ (nếu $b < \infty$) | CÓ (chỉ khi chi phí $c = 1$) | $\mathcal{O}(b^d)$ | $\mathcal{O}(b \cdot d)$ *(Hoàn hảo)* | LIFO Stack tăng dần limit | Độ sâu giới hạn $limit$ |
| **Greedy**| KHÔNG | KHÔNG | $\mathcal{O}(b^m)$ | $\mathcal{O}(b^m)$ | Priority Queue | Chi phí ước lượng $h(n)$ |
| **A\*** | CÓ | CÓ (nếu $h$ Admissible) | $\mathcal{O}(b^d)$ | $\mathcal{O}(b^d)$ *(Nhược điểm RAM)* | Priority Queue | $f(n) = g(n) + h(n)$ |
| **IDA\*** | CÓ | CÓ (như A*) | $\mathcal{O}(b^d)$ | $\mathcal{O}(b \cdot d)$ *(Khắc phục RAM)*| LIFO Stack tăng ngưỡng $f$ | Ngưỡng $\theta = f(n)$ |

---

### Bảng 2: So Sánh Cây Tìm Kiếm (Tree Search) vs Đồ Thị Tìm Kiếm (Graph Search)

| Tiêu chí | Cây Tìm Kiếm (Tree Search) | Đồ Thị Tìm Kiếm (Graph Search) |
|---|---|---|
| **Bộ nhớ ClosedList** | **KHÔNG CÓ**. Không lưu lại các trạng thái đã từng duyệt. | **BẮT BUỘC CÓ**. Duy trì tập `ClosedList` (Visited Set) để kiểm tra trùng lặp. |
| **Xử lý chu trình** | Rất dễ bị rơi vào vòng lặp vô tận nếu đồ thị có chu trình. | Triệt tiêu 100% mọi chu trình và bước đi lặp lại. |
| **Độ phức tạp bộ nhớ** | Tuyến tính $\mathcal{O}(b \cdot d)$ (đối với DFS/IDS). | Luôn luôn là cấp số nhân $\mathcal{O}(b^d)$ vì phải lưu toàn bộ các trạng thái đã thăm. |
| **Điều kiện Heuristic cho A\*** | Chỉ cần tính **Admissible** ($0 \le h \le h^*$). | Cần tính **Consistent** (Nhất quán) để tránh phải cập nhật lại nút trong Closed. |

---

### Bảng 3: So Sánh Minimax vs Tỉa Nhánh Alpha-Beta

| Tiêu chí | Thuật Toán Minimax Thuần Túy | Thuật Toán Tỉa Nhánh Alpha-Beta |
|---|---|---|
| **Giá trị trả về tại gốc** | Giá trị Minimax tối ưu lý thuyết. | **Giống hệt 100%** giá trị Minimax của thuật toán thuần túy. |
| **Số lượng nút duyệt (Xấu nhất)**| Toàn bộ cây trò chơi: $N = \mathcal{O}(b^d)$. | Không tỉa được gì nếu thứ tự duyệt tệ nhất: $\mathcal{O}(b^d)$. |
| **Số lượng nút duyệt (Lý tưởng)**| Vẫn duyệt toàn bộ: $\mathcal{O}(b^d)$. | **Giảm ngoạn mục xuống: $\mathcal{O}(b^{d/2}) = \mathcal{O}((\sqrt{b})^d)$**. |
| **Tầm nhìn sâu thực tế** | Duyệt được tối đa độ sâu $d$. | **Nhìn sâu gấp đôi ($2d$)** với cùng một ngân sách thời gian tính toán! |
| **Yếu tố quyết định hiệu năng** | Không phụ thuộc vào thứ tự duyệt nước đi. | **Phụ thuộc sống còn vào Thứ tự duyệt nước đi (Move Ordering)**. |

---

## 4. Bẫy Thi Cử & Những Sai Lầm Chết Người (Deadly Exam Traps)

1. **Bẫy 1: Tính cả ô trống (Blank tile) khi tính Heuristic $h_1$ và $h_2$ trong 8-puzzle.**
   - *Sai lầm:* Cộng thêm khoảng cách của ô trống vào tổng khoảng cách Manhattan $h_2$ hoặc đếm ô trống khi tính $h_1$.
   - *Sự thật chuẩn A+:* Cả $h_1$ và $h_2$ **CHỈ ĐƯỢC TÍNH TRÊN 8 QUÂN CỜ SỐ (Từ 1 đến 8), HOÀN TOÀN BỎ QUA Ô TRỐNG**! Nếu tính cả ô trống, heuristic có thể đánh giá cao hơn chi phí thực tế ($h > h^*$), làm mất tính Admissible!
2. **Bẫy 2: Dừng thuật toán A* ngay khi vừa sinh ra trạng thái đích (Push).**
   - *Sai lầm:* Vừa thấy con trỏ trỏ tới nút có trạng thái Goal là kết luận thuật toán dừng và trả về chi phí.
   - *Sự thật chuẩn A+:* Thuật toán A* và UCS **chỉ được phép dừng khi trạng thái đích được lấy ra khỏi hàng đợi (Pop)**. Trong hàng đợi có thể có đường đi khác chưa tới đích nhưng có tiềm năng chi phí rẻ hơn.
3. **Bẫy 3: Nhầm lẫn vai trò của $\alpha$ và $\beta$ trong tỉa nhánh Alpha-Beta.**
   - *Sai lầm:* Cập nhật $\alpha$ tại nút MIN hoặc cập nhật $\beta$ tại nút MAX.
   - *Sự thật chuẩn A+:*
     - Nút **MAX** chỉ cập nhật **$\alpha$**: $\alpha = \max(\alpha, v)$.
     - Nút **MIN** chỉ cập nhật **$\beta$**: $\beta = \min(\beta, v)$.
     - Cắt tỉa xảy ra ngay khi thỏa mãn bất đẳng thức: **$\alpha \ge \beta$**.
4. **Bẫy 4: Quên cập nhật $g(n)$ trong thuật toán A*.**
   - *Sai lầm:* Chỉ sắp xếp hàng đợi Open theo $h(n)$ thay vì $f(n) = g(n) + h(n)$.
   - *Sự thật chuẩn A+:* Sắp xếp theo $h(n)$ là thuật toán Tham lam (Greedy), không tối ưu. A* bắt buộc phải cộng dồn chi phí đã đi qua: $g(\text{child}) = g(\text{parent}) + c$.

---

## 5. Động Từ Chỉ Lệnh Phòng Thi & Chiến Thuật Trả Lời (Action Verbs Guide)

| Động từ đề thi | Yêu cầu hành động chuẩn A+ | Cấu trúc câu trả lời tối ưu |
|---|---|---|
| **Trace the execution of A\*...** | Lập bảng Open/Closed chi tiết từng vòng lặp. | Bảng gồm các cột: Lần lặp, Nút được Pop, $(g, h, f)$, Successors sinh ra, Open sau sắp xếp, Closed. Cuối cùng kết luận đường đi tối ưu và tổng chi phí $C^*$. |
| **Prove that heuristic is admissible...** | Chứng minh bất đẳng thức $0 \le h(n) \le h^*(n)$ dựa trên bài toán nới lỏng (Relaxed problem). | 1. Phát biểu định nghĩa $\rightarrow$ 2. Mô hình hóa bài toán nới lỏng $\rightarrow$ 3. Lập luận số bước tối thiểu $\rightarrow$ 4. Kết luận $h(n) \le h^*(n)$. |
| **Apply Alpha-Beta pruning...** | Ghi rõ biến thiên khoảng $[\alpha, \beta]$ tại từng nút và chỉ rõ các nhánh bị tỉa. | 1. Vẽ cây trò chơi $\rightarrow$ 2. Điền cặp $[\alpha, \beta]$ truyền xuống $\rightarrow$ 3. Ghi rõ giá trị $v$ trả về $\rightarrow$ 4. Gạch chéo nhánh tỉa và ghi rõ lý do "Pruned because $\alpha \ge \beta$". |
| **Compute effective branching factor...** | Lập phương trình cấp số nhân $N = \sum (b^*)^i$ và giải nghiệm. | Thiết lập phương trình $\rightarrow$ Thử nghiệm giá trị nguyên gần đúng $\rightarrow$ Kết luận $b^*$. |

---

## 6. Bảng Kiểm Năng Lực Trước Giờ Thi (Pre-Exam Competency Checklist)

- [ ] Tôi giải thích được mô hình bài toán tìm kiếm 5 thành phần và phân biệt được State Graph vs Search Tree.
- [ ] Tôi chứng minh được Định lý 1 về tầng lá cuối cùng chiếm $1 - 1/b$ số nút và giải thích được tại sao IDS tối ưu.
- [ ] Tôi thuộc bảng so sánh 4 tiêu chí (Complete, Optimal, Time, Space) của BFS, DFS, UCS, IDS, A*.
- [ ] Tôi lập được bảng Open/Closed đầy đủ từng bước chạy A* trên 8-puzzle cho cả $h_1$ (Misplaced) và $h_2$ (Manhattan).
- [ ] Tôi chứng minh được toán học tính Admissible, Consistent và quan hệ Dominance ($h_2 \ge h_1$).
- [ ] Tôi tính đúng giá trị Minimax và thực hiện thuần thục từng bước tỉa nhánh Alpha-Beta $(\alpha \ge \beta)$ không bị nhầm lẫn.
- [ ] Tôi tính được giá trị kỳ vọng Expectiminimax tại các nút cơ hội có xác suất ngẫu nhiên.
