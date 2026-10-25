# Chương 6 – Các Dạng Bài Tập Trọng Tâm & Lời Giải Chi Tiết (Key Exam Problems & Step-by-Step Solutions)

> **Mục tiêu đạt điểm A+:** Rèn luyện thuần thục kỹ năng giải toàn bộ các bài thi tự luận và bài tập tính toán: Tính toán hệ số rẽ nhánh hữu hiệu $b^*$; Truy vết bảng Open/Closed của thuật toán A* trên 8-puzzle có tie-breaking rõ ràng; Chứng minh toán học tính Admissible, Consistent và Dominance của các hàm Heuristic; Vẽ cây Minimax và thực hiện chính xác từng bước tỉa nhánh Alpha-Beta ($\alpha \ge \beta$); và Tính toán giá trị Expectiminimax trên nút cơ hội ngẫu nhiên.

---

## Dạng 1: Hệ Số Rẽ Nhánh & Bùng Nổ Không Gian Trạng Thái

### Bài toán 1.1: Tính Hệ Số Rẽ Nhánh Hữu Hiệu $b^*$ ([Ertel 2025], Ex 6.3)
Một thuật toán tìm kiếm giải quyết một bài toán và tìm thấy trạng thái đích ở độ sâu $d = 3$. Tổng số nút đã sinh ra trên toàn bộ cây tìm kiếm (bao gồm cả nút gốc ở độ sâu 0) là $N = 40$ nút.
1. Hãy thiết lập phương trình toán học xác định hệ số rẽ nhánh hữu hiệu $b^*$.
2. Giải thích ý nghĩa của $b^*$ đối với chất lượng của một hàm Heuristic.

#### Lời giải chi tiết:
1. **Thiết lập phương trình:**
   Theo định nghĩa, một cây tìm kiếm đều có hệ số rẽ nhánh cố định $b^*$ và độ sâu $d = 3$ sẽ sinh ra tổng số nút theo cấp số nhân:
   $$N = \sum_{i=0}^3 (b^*)^i = 1 + b^* + (b^*)^2 + (b^*)^3 = 40$$
   Hay viết gọn lại:
   $$(b^*)^3 + (b^*)^2 + b^* - 39 = 0$$
   - Thử nghiệm giá trị:
     - Với $b^* = 3$: $1 + 3 + 9 + 27 = 40$. Phương trình nghiệm đúng hoàn hảo!
     - Do đó, hệ số rẽ nhánh hữu hiệu của thuật toán này là **$b^* = 3.0$**.
2. **Ý nghĩa của $b^*$:**
   - Hệ số rẽ nhánh hữu hiệu $b^*$ phản ánh mức độ tập trung của thuật toán tìm kiếm. Một thuật toán tìm kiếm mù (như BFS) thường có $b^*$ xấp xỉ hệ số rẽ nhánh vật lý của bài toán ($b \approx 3$ đến $4$).
   - Một hàm Heuristic lý tưởng $h^*$ sẽ hướng thuật toán đi thẳng tắp một mạch đến đích mà không rẽ nhánh sai, khi đó $b^* \approx 1.0$.
   - Khi so sánh hai hàm Heuristic $h_A$ và $h_B$, hàm nào mang lại giá trị $b^*$ nhỏ hơn thì hàm đó có sức mạnh cắt tỉa không gian tìm kiếm vượt trội hơn.

---

### Bài toán 1.2: Chứng Minh Định Lý 1 Về Tầng Lá Cuối Cùng ([Ertel 2025], Ex 6.1)
Chứng minh rằng trong một cây tìm kiếm đều có hệ số rẽ nhánh $b$ và độ sâu $d$:
1. Tỉ lệ số nút ở tầng đáy $d$ so với tổng số nút toàn cây xấp xỉ bằng $1 - \frac{1}{b}$.
2. Tính tỉ lệ này khi $b = 10$ và $b = 30$. Rút ra kết luận thực tiễn khi thiết kế thuật toán IDS.

#### Lời giải chi tiết:
1. **Chứng minh:**
   - Số nút ở tầng lá cuối cùng (độ sâu $d$) là: $L_d = b^d$.
   - Tổng số nút toàn bộ cây từ độ sâu $0$ đến $d$ là: $N = \frac{b^{d+1}-1}{b-1}$.
   - Tỉ lệ số nút tầng đáy:
     $$\frac{L_d}{N} = \frac{b^d}{\frac{b^{d+1}-1}{b-1}} = \frac{b^d(b-1)}{b^{d+1}-1} = \frac{b-1}{b - b^{-d}}$$
   - Khi độ sâu $d$ đủ lớn ($d \ge 5$), số hạng $b^{-d} = \frac{1}{b^d} \approx 0$, ta có:
     $$\frac{L_d}{N} \approx \frac{b-1}{b} = 1 - \frac{1}{b} \quad \text{(đpcm)}$$
2. **Tính toán số học & Kết luận:**
   - Khi $b = 10$: Tỉ lệ là $1 - \frac{1}{10} = 90\%$.
   - Khi $b = 30$: Tỉ lệ là $1 - \frac{1}{30} \approx 96.67\%$.
   - **Kết luận:** Hơn $90\%$ đến $97\%$ tài nguyên tính toán của cây tìm kiếm tập trung ở tầng cuối cùng. Do đó, thuật toán Lặp sâu dần (Iterative Deepening Search - IDS) khi lặp lại việc duyệt các tầng trên từ $0$ đến $d-1$ chỉ tốn thêm một phần công sức cực nhỏ (khoảng $\frac{1}{b-1}$ tổng thời gian), nhưng lại tiết kiệm được toàn bộ bộ nhớ RAM từ cấp số nhân xuống cấp tuyến tính!

---

## Dạng 2: Thuật Toán A* Từng Bước Trên 8-Puzzle (Bảng Open/Closed)

### Bài toán 2.1: Chạy A* Thủ Công Với Bảng Open/Closed Đầy Đủ
Cho bài toán 8-puzzle với:
- **Trạng thái ban đầu $S$:**
  ```
  1   .   3
  4   2   6
  7   5   8
  ```
  (Biểu diễn vector dòng: `[1, 0, 3, 4, 2, 6, 7, 5, 8]`, trong đó `0` là ô trống `.`).
- **Trạng thái đích $G$:**
  ```
  1   2   3
  4   5   6
  7   8   .
  ```
  (Vector: `[1, 2, 3, 4, 5, 6, 7, 8, 0]`).
- Chi phí mỗi bước trượt ô là $c = 1$.
- Hàm Heuristic sử dụng: **$h_1(n)$ (Misplaced Tiles - Số ô sai vị trí, không tính ô trống)**.
- **Thứ tự sinh nước đi ưu tiên khi tie-break:** `Up, Down, Left, Right`.
- Sử dụng **Graph Search** (không mở rộng lại các trạng thái đã có trong Closed với chi phí $g$ lớn hơn hoặc bằng).

Hãy lập bảng theo dõi chi tiết quá trình thực thi thuật toán A* qua từng vòng lặp.

#### Lời giải chi tiết:

1. **Khởi tạo:**
   - Trạng thái gốc $S$: Ô `2`, `5`, `8` sai vị trí so với đích $\implies h(S) = 3$.
   - Chi phí $g(S) = 0 \implies f(S) = 0 + 3 = 3$.
   - $\text{Open} = [S(f=3, g=0, h=3)]$, $\text{Closed} = \emptyset$.

2. **Lần lặp 1:**
   - Pop nút có $f$ nhỏ nhất: $S(f=3)$.
   - Kiểm tra Goal: $S \ne G$. Đưa $S$ vào Closed.
   - Các nước đi hợp lệ cho ô trống tại $(0, 1)$:
     - `Down` (đổi chỗ với 2): sinh nút $C = [1, 2, 3, 4, 0, 6, 7, 5, 8]$.
       - $g(C) = 1$. Ô `5`, `8` sai vị trí $\implies h(C) = 2 \implies f(C) = 1 + 2 = 3$.
     - `Left` (đổi chỗ với 1): sinh nút $A = [0, 1, 3, 4, 2, 6, 7, 5, 8]$.
       - $g(A) = 1$. Ô `1`, `2`, `5`, `8` sai vị trí $\implies h(A) = 4 \implies f(A) = 1 + 4 = 5$.
     - `Right` (đổi chỗ với 3): sinh nút $B = [1, 3, 0, 4, 2, 6, 7, 5, 8]$.
       - $g(B) = 1$. Ô `3`, `2`, `5`, `8` sai vị trí $\implies h(B) = 4 \implies f(B) = 1 + 4 = 5$.
   - $\text{Open} = [C(3), A(5), B(5)]$, $\text{Closed} = \{S\}$.

3. **Lần lặp 2:**
   - Pop nút $C(f=3)$. Đưa $C$ vào Closed.
   - Ô trống tại $(1, 1)$ có các nước đi:
     - `Up`: quay về $S$ (đã có trong Closed với $g=0 \le 2$) $\implies$ Bỏ qua.
     - `Down` (đổi chỗ với 5): sinh nút $G' = [1, 2, 3, 4, 5, 6, 7, 0, 8]$.
       - $g(G') = 2$. Chỉ còn ô `8` sai vị trí $\implies h(G') = 1 \implies f(G') = 2 + 1 = 3$.
     - `Left` (đổi chỗ với 4): sinh nút $E = [1, 2, 3, 0, 4, 6, 7, 5, 8]$.
       - $g(E) = 2$. Ô `4`, `5`, `8` sai vị trí $\implies h(E) = 3 \implies f(E) = 2 + 3 = 5$.
     - `Right` (đổi chỗ với 6): sinh nút $F = [1, 2, 3, 4, 6, 0, 7, 5, 8]$.
       - $g(F) = 2$. Ô `6`, `5`, `8` sai vị trí $\implies h(F) = 3 \implies f(F) = 2 + 3 = 5$.
   - $\text{Open} = [G'(3), A(5), B(5), E(5), F(5)]$, $\text{Closed} = \{S, C\}$.

4. **Lần lặp 3:**
   - Pop nút $G'(f=3)$. Đưa $G'$ vào Closed.
   - Ô trống tại $(2, 1)$ có các nước đi:
     - `Up`: quay về $C$ (đã có trong Closed) $\implies$ Bỏ qua.
     - `Left` (đổi chỗ với 7): sinh nút $H = [1, 2, 3, 4, 5, 6, 0, 7, 8]$.
       - $g(H) = 3$. Ô `7`, `8` sai vị trí $\implies h(H) = 2 \implies f(H) = 3 + 2 = 5$.
     - `Right` (đổi chỗ với 8): sinh nút $Goal = [1, 2, 3, 4, 5, 6, 7, 8, 0]$.
       - $g(Goal) = 3$. Không còn ô nào sai vị trí $\implies h(Goal) = 0 \implies f(Goal) = 3 + 0 = 3$.
   - $\text{Open} = [Goal(3), A(5), B(5), E(5), F(5), H(5)]$, $\text{Closed} = \{S, C, G'\}$.

5. **Lần lặp 4:**
   - Pop nút $Goal(f=3)$.
   - Kiểm tra Goal: $Goal == G$ $\implies$ **DỪNG THUẬT TOÁN VÀ TRẢ VỀ LỜI GIẢI**.

#### Bảng Tổng Hợp Vết Thuật Toán (Trình bày trong bài thi):

| Lần lặp | Nút được Pop ($n$) | $(g, h, f)$ | Các Successors sinh ra $(g, h, f)$ | Hàng đợi Open sau khi sắp xếp | Tập Closed |
|:---:|---|:---:|---|---|---|
| **1** | $S$ | $(0, 3, 3)$ | $C(1, 2, 3), A(1, 4, 5), B(1, 4, 5)$ | $[C(3), A(5), B(5)]$ | $\{S\}$ |
| **2** | $C$ | $(1, 2, 3)$ | $G'(2, 1, 3), E(2, 3, 5), F(2, 3, 5)$ | $[G'(3), A(5), B(5), E(5), F(5)]$ | $\{S, C\}$ |
| **3** | $G'$ | $(2, 1, 3)$ | $Goal(3, 0, 3), H(3, 2, 5)$ | $[Goal(3), A(5), B(5), E(5), F(5), H(5)]$ | $\{S, C, G'\}$ |
| **4** | $Goal$ | $(3, 0, 3)$ | **Đạt đích $\implies$ Kết thúc** | — | $\{S, C, G', Goal\}$ |

- **Đường đi tối ưu:** $S \xrightarrow{\text{Down}} C \xrightarrow{\text{Down}} G' \xrightarrow{\text{Right}} Goal$.
- **Tổng chi phí tối ưu:** $C^* = 3$.

---

## Dạng 3: Chứng Minh Toán Học Tính Admissible & Consistent

### Bài toán 3.1: Chứng Minh Tính Admissible Của Manhattan Distance ([Ertel 2025], Ex 6.15)
1. Hãy định nghĩa toán học tính chấp nhận được (Admissibility) và tính nhất quán (Consistency) của một hàm Heuristic.
2. Chứng minh rằng hàm khoảng cách Manhattan $h_2(n)$ cho bài toán 8-puzzle là Admissible và Consistent.
3. Chứng minh rằng $h_2(n)$ trội hơn $h_1(n)$ (Misplaced tiles).

#### Lời giải chi tiết:
1. **Định nghĩa hình thức:**
   - **Tính chấp nhận được (Admissible):** Một heuristic $h(n)$ là admissible nếu nó không bao giờ đánh giá cao hơn chi phí thực tế nhỏ nhất để đến đích:
     $$0 \le h(n) \le h^*(n), \quad \forall n$$
   - **Tính nhất quán (Consistent / Monotonic):** Một heuristic $h(n)$ là consistent nếu với mọi trạng thái $n$ và trạng thái kế tiếp $n'$ sinh ra bởi hành động có chi phí $c(n, a, n')$:
     $$h(n) \le c(n, a, n') + h(n')$$
2. **Chứng minh $h_2$ là Admissible & Consistent:**
   - **Chứng minh Admissible:**
     - Giả sử bỏ qua hoàn toàn sự cản trở của các quân cờ khác (mô hình bài toán nới lỏng - Relaxed Problem: các quân cờ có thể đi xuyên qua nhau).
     - Để một quân cờ $i$ từ vị trí $(x_i, y_i)$ di chuyển đến đích $(x_i^*, y_i^*)$, vì bàn cờ chỉ cho phép trượt ngang hoặc dọc nên số bước đi tối thiểu cần thiết bắt buộc phải là khoảng cách Manhattan:
       $$d_M(i) = |x_i - x_i^*| + |y_i - y_i^*|$$
     - Trong thực tế, các quân cờ cản đường nhau nên số bước đi thực tế để đưa tất cả các quân về đích luôn lớn hơn hoặc bằng tổng khoảng cách độc lập của chúng:
       $$h^*(n) \ge \sum_{i=1}^8 d_M(i) = h_2(n)$$
     - Do đó, $0 \le h_2(n) \le h^*(n) \implies h_2$ là **Admissible**.
   - **Chứng minh Consistent:**
     - Xét một bước trượt hợp lệ từ trạng thái $n$ sang $n'$. Bước đi này tốn chi phí $c(n, a, n') = 1$ và chỉ làm dịch chuyển đúng **duy nhất một quân cờ $k$** sang ô bên cạnh (khoảng cách 1 ô).
     - Khoảng cách Manhattan của quân cờ $k$ đến đích chỉ có thể thay đổi tối đa là $+1$ (nếu đi xa đích hơn) hoặc $-1$ (nếu đi gần đích hơn):
       $$|d_M(k, n) - d_M(k, n')| \le 1$$
     - Tất cả các quân cờ khác giữ nguyên vị trí nên khoảng cách của chúng không đổi. Do đó:
       $$h_2(n) - h_2(n') \le 1 \iff h_2(n) \le 1 + h_2(n')$$
     - Vì $c(n, a, n') = 1$, ta có $h_2(n) \le c(n, a, n') + h_2(n')$. Do đó, $h_2$ là **Consistent**.
3. **Chứng minh $h_2$ trội hơn $h_1$ ($h_2$ dominates $h_1$):**
   - Với mỗi quân cờ $i \in \{1, \dots, 8\}$:
     - Nếu quân cờ $i$ đang ở đúng vị trí đích: $d_M(i) = 0$. Cả $h_1$ và $h_2$ đều đóng góp $0$.
     - Nếu quân cờ $i$ sai vị trí: trong $h_1$, nó đóng góp đúng $1$ đơn vị. Trong $h_2$, vì nó ở khác ô đích nên khoảng cách Manhattan $|x_i - x_i^*| + |y_i - y_i^*| \ge 1$.
   - Lấy tổng trên cả 8 quân cờ:
     $$h_2(n) = \sum_{i=1}^8 d_M(i) \ge \sum_{i \text{ sai vị trí}} 1 = h_1(n), \quad \forall n$$
   - Vì $h_2(n) \ge h_1(n)$ với mọi trạng thái $n$, nên **$h_2$ trội hơn $h_1$**.

---

## Dạng 4: Thuật Toán Minimax & Tỉa Nhánh Alpha-Beta

### Bài toán 4.1: Cây Trò Chơi 16 Lá ([Ertel 2025], Ex 6.16)
Cho cây trò chơi 4 tầng gồm nút gốc MAX ở tầng 0, các nút con MIN ở tầng 1, các nút MAX ở tầng 2, và 16 nút lá ở tầng 3 với các giá trị hàm tiện ích được sắp xếp từ trái sang phải như sau:
$$\text{Leaves} = [10, 11, 9, 12, 14, 15, 13, 14, 5, 2, 4, 1, 3, 22, 20, 21]$$
Mỗi nút có đúng 2 nhánh con rẽ nhánh ($b = 2$).

1. Hãy tính giá trị Minimax tại tất cả các nút nội bộ và xác định nước đi tối ưu của người chơi MAX tại nút gốc.
2. Áp dụng thuật toán tỉa nhánh Alpha-Beta theo thứ tự duyệt từ trái sang phải. Ghi rõ biến thiên của khoảng $[\alpha, \beta]$ tại từng bước và chỉ rõ những nút lá nào bị cắt tỉa.

#### Lời giải chi tiết:

```
                                [A: MAX] (Tầng 0)
                 ┌───────────────────────────────────┐
             [B: MIN]                            [C: MIN] (Tầng 1)
        ┌────────┴────────┐                 ┌────────┴────────┐
     [D: MAX]          [E: MAX]          [F: MAX]          [G: MAX] (Tầng 2)
     ┌──┴──┐           ┌──┴──┐           ┌──┴──┐           ┌──┴──┐
   [10]   [11]       [9]    [12]       [14]   [15]       [13]   [14] ... (Nửa trái)
```
*(Quy ước đặt tên nút: Gốc $A$ (MAX). Con của $A$ là $B, C$ (MIN). Con của $B$ là $D, E$ (MAX). Con của $C$ là $F, G$ (MAX). Lá tương ứng: $D \to [10, 11]$, $E \to [9, 12]$, $F \to [14, 15]$, $G \to [13, 14]$... nửa phải tương tự).*

1. **Tính toán Minimax chuẩn (Không cắt tỉa):**
   - **Tầng 2 (MAX):**
     - $D = \max(10, 11) = 11$.
     - $E = \max(9, 12) = 12$.
     - $F = \max(14, 15) = 15$.
     - $G = \max(13, 14) = 14$.
     - $H = \max(5, 2) = 5$.
     - $I = \max(4, 1) = 4$.
     - $J = \max(3, 22) = 22$.
     - $K = \max(20, 21) = 21$.
   - **Tầng 1 (MIN):**
     - Nhánh con trái $B = \min(D, E) = \min(11, 12) = 11$.
     - Nhánh con giữa-trái $C' = \min(F, G) = \min(15, 14) = 14$.
     - Nhánh con giữa-phải $L = \min(H, I) = \min(5, 4) = 4$.
     - Nhánh con phải $M = \min(J, K) = \min(22, 21) = 21$.
   - **Nút gốc A (MAX):** Nhận giá trị cực đại từ các nhánh con.
     - Lựa chọn nước đi tối ưu là nước đi dẫn tới nhánh có điểm Minimax cao nhất.

2. **Truy vết Tỉa Nhánh Alpha-Beta (Duyệt Trái sang Phải):**
   - Khởi tạo tại gốc $A$: $\alpha = -\infty, \beta = +\infty$.
   - Đi xuống $B$, rồi $D$:
     - Nút lá $10$: $D = 10 \implies \alpha_D = \max(-\infty, 10) = 10$.
     - Nút lá $11$: $D = \max(10, 11) = 11$. Trả về $11$ cho $B$.
   - Tại $B$ (MIN): $\beta_B = \min(+\infty, 11) = 11$. Khoảng hiện tại của $B$ là $[-\infty, 11]$.
   - Đi sang $E$ (MAX) với khoảng $[-\infty, 11]$:
     - Nút lá $9$: $E = 9 \implies \alpha_E = \max(-\infty, 9) = 9$.
     - Nút lá $12$: $E = \max(9, 12) = 12$. Trả về $12$ cho $B$.
   - Tại $B$: $\beta_B = \min(11, 12) = 11$. $B$ hoàn thành với giá trị $11$.
   - Trả về gốc $A$: $\alpha_A = \max(-\infty, 11) = 11$.
   - **Xét nhánh phải của A:** truyền khoảng $[\alpha = 11, \beta = +\infty]$ sang nút con tiếp theo.
     - Đi xuống nhánh chứa lá $[5, 2]$:
       - Nút MAX nhận giá trị lá $5 \implies \alpha = \max(11, 5) = 11$.
       - Nhưng tại nút MIN cha phía trên, khi nhận về giá trị con đầu tiên là một số nhỏ hơn hoặc bằng $5$, ta có $\beta \le 5$.
       - Lúc này: $\beta \le 5 \le \alpha = 11 \implies \mathbf{\alpha \ge \beta}$!
       - **KÍCH HOẠT TỈA NHÁNH (Alpha-cutoff):** Toàn bộ nhánh con phía sau chứa các nút $[4, 1]$ bị **TỈA BỎ HOÀN TOÀN** mà không cần mở rộng!

- **Quy tắc ghi điểm tối đa trong bài thi Alpha-Beta:**
  1. Luôn ghi rõ cặp $[\alpha, \beta]$ được truyền xuống từng nút.
  2. Khi cập nhật $\alpha$ (tại MAX) hoặc $\beta$ (tại MIN), ghi rõ biểu thức: $\alpha = \max(\alpha, v)$ hoặc $\beta = \min(\beta, v)$.
  3. Khi xuất hiện điều kiện $\alpha \ge \beta$, khoanh tròn hoặc gạch chéo nhánh bị cắt và kết luận rõ: "Cắt tỉa nhánh con X vì $\beta \le \dots \le \alpha$".

---

## Dạng 5: Trò Chơi Bất Định & Cây Expectiminimax

### Bài toán 5.1: Tính Toán Kỳ Vọng Tại Nút Cơ Hội (Chance Node)
Xét một cây trò chơi 3 tầng:
- Tầng 0: Nút gốc $A$ thuộc lượt của MAX với hai hành động $a_1$ và $a_2$.
- Tầng 1: Hành động $a_1$ dẫn tới nút cơ hội $C_1$, hành động $a_2$ dẫn tới nút cơ hội $C_2$.
- Tầng 2:
  - Nút $C_1$ mô phỏng việc tung đồng xu không cân xứng: Mặt Ngửa (Heads) có xác suất $P(H) = 0.7$ dẫn tới thế cờ có điểm số $+10$; Mặt Sấp (Tails) có xác suất $P(T) = 0.3$ dẫn tới thế cờ có điểm số $-20$.
  - Nút $C_2$ mô phỏng việc đổ xúc xắc 6 mặt cân đối:
    - Mặt $1, 2$: xác suất $\frac{2}{6}$ dẫn tới điểm $+30$.
    - Mặt $3, 4, 5, 6$: xác suất $\frac{4}{6}$ dẫn tới điểm $-3$.
1. Hãy tính giá trị Expectiminimax tại các nút $C_1, C_2$ và nút gốc $A$.
2. Người chơi MAX nên chọn hành động nào để tối ưu hóa quyết định?

#### Lời giải chi tiết:
1. **Tính giá trị kỳ vọng tại các nút Chance (Tầng 1):**
   - Giá trị tại nút cơ hội $C_1$:
     $$V(C_1) = \sum_{s'} P(s') \cdot Utility(s') = 0.7 \times (+10) + 0.3 \times (-20) = 7.0 - 6.0 = \mathbf{+1.0}$$
   - Giá trị tại nút cơ hội $C_2$:
     $$V(C_2) = \frac{2}{6} \times (+30) + \frac{4}{6} \times (-3) = \frac{60}{6} - \frac{12}{6} = 10 - 2 = \mathbf{+8.0}$$
2. **Quyết định tối ưu của MAX tại nút gốc $A$:**
   - Nút gốc $A$ là lượt của MAX, do đó chọn hành động tối đa hóa giá trị kỳ vọng:
     $$V(A) = \max(V(C_1), V(C_2)) = \max(1.0, 8.0) = \mathbf{+8.0}$$
   - **Kết luận:** Người chơi MAX nên chọn **hành động $a_2$** vì mang lại giá trị kỳ vọng toán học cao hơn ($+8.0 > +1.0$).
