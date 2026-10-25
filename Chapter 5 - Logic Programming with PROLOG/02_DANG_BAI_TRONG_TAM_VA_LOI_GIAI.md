# Chương 5 – Các Dạng Bài Tập Trọng Tâm & Lời Giải Chi Tiết (Key Exam Problems & Step-by-Step Solutions)

> **Mục tiêu đạt điểm A+:** Rèn luyện thuần thục các kỹ năng giải bài thi: Đồng nhất hóa Term và Danh sách lồng nhau; Vẽ cây tìm kiếm SLD hoàn chỉnh có đánh nhãn phép thế và nhánh quay lui; Phân tích và khắc phục vòng lặp vô hạn (Infinite Loop); Dự đoán chính xác hành vi của Cut (`!`) và Phủ định thất bại (`\+`); Thiết kế thuật toán đệ quy danh sách tối ưu $\mathcal{O}(N)$ bằng biến tích lũy (Accumulator); và Mô hình hóa bài toán trạng thái (Planning / CLP).

---

## Dạng 1: Đồng Nhất Hóa Term & Thao Tác Tách Danh Sách Phức Hợp

### Phương pháp giải chuẩn xác:
1. Đếm chính xác số lượng phần tử của danh sách (phân tách bởi dấu phẩy ở tầng ngoài cùng).
2. Quy tắc toán tử `[Head | Tail]`:
   - `Head`: Nhận **1 phần tử duy nhất** ở vị trí đầu tiên.
   - `Tail`: Nhận **toàn bộ danh sách còn lại** phía sau (bắt buộc phải có dạng danh sách `[...]`, nếu hết phần tử thì $Tail = []$).
3. Ký tự gạch dưới `_` bỏ qua đúng 1 phần tử tại vị trí đó; `|_` bỏ qua toàn bộ phần đuôi còn lại.

---

### Bài toán 1.1 (Trích Quiz 17–21 Slide & Đề thi): Unification Danh sách lồng nhau
Cho danh sách $L = [[], dead(z), [2, [b, c]], [], Z]$. Hãy xác định giá trị ràng buộc của các biến trong các câu truy vấn độc lập sau:

1. `?- [X | Y] = [[], dead(z), [2, [b, c]], [], Z].`
2. `?- [X, Y | W] = [[], dead(z), [2, [b, c]], [], Z].`
3. `?- [X1, X2, X3, X4 | Tail] = [[], dead(z), [2, [b, c]], [], Z].`
4. `?- [_, X, _, Y | _] = [[], dead(z), [2, [b, c]], [], Z].`
5. `?- [_, _, [_ | X] | _] = [[], dead(z), [2, [b, c]], [], Z].`

#### Lời giải chi tiết:
Danh sách bên phải gồm 5 phần tử:
- Phần tử 1: `[]` (danh sách rỗng)
- Phần tử 2: `dead(z)` (compound term)
- Phần tử 3: `[2, [b, c]]` (danh sách lồng)
- Phần tử 4: `[]` (danh sách rỗng)
- Phần tử 5: $Z$ (biến)

1. **Truy vấn 1:**
   - Head gán cho $X$: $X = []$.
   - Tail gán cho $Y$: $Y = [dead(z), [2, [b, c]], [], Z]$.
2. **Truy vấn 2:**
   - Hai phần tử đầu lần lượt là $X = []$ và $Y = dead(z)$.
   - Phần đuôi còn lại 3 phần tử: $W = [[2, [b, c]], [], Z]$.
3. **Truy vấn 3:**
   - Bốn phần tử đầu: $X_1 = [], X_2 = dead(z), X_3 = [2, [b, c]], X_4 = []$.
   - Phần đuôi chỉ còn phần tử thứ năm, nhưng vì là Tail nên phải đặt trong ngoặc vuông danh sách: $Tail = [Z]$ (Lưu ý: Không được viết $Tail = Z$!).
4. **Truy vấn 4:**
   - Vị trí 1: `_` khớp `[]` (bỏ qua).
   - Vị trí 2: $X = dead(z)$.
   - Vị trí 3: `_` khớp `[2, [b, c]]` (bỏ qua).
   - Vị trí 4: $Y = []$.
   - Phần đuôi: `|_` khớp `[Z]` (bỏ qua).
   - Kết quả: $X = dead(z), Y = []$.
5. **Truy vấn 5:**
   - Vị trí thứ 3 là danh sách `[2, [b, c]]`.
   - Khớp mẫu `[_ | X]`:
     - `_` khớp với phần tử đầu là số `2`.
     - $X$ nhận phần đuôi còn lại: $X = [[b, c]]$ (Lưu ý: phần đuôi của danh sách `[2, [b,c]]` là danh sách chứa `[b,c]`, tức là `[[b, c]]`).

---

## Dạng 2: Xây Dựng Cây Tìm Kiếm SLD & Liệt Kê Nghiệm Theo Thứ Tự

### Phương pháp vẽ Cây SLD đạt điểm tối đa:
- **Nút:** Thể hiện rõ danh sách các subgoals chưa được giải quyết (Goal Stack).
- **Cạnh:** Ghi rõ số hiệu Clause áp dụng và phép thế Unification ($\theta$).
- **Chiến lược:** Luôn chọn Subgoal bên trái nhất (Leftmost). Quét các Clause trong KB từ trên xuống dưới.
- **Nút lá:** Ghi rõ `[]` (Thành công $\rightarrow$ xuất nghiệm) hoặc `fail` (Thất bại $\rightarrow$ kích hoạt quay lui).

---

### Bài toán 2.1: Truy vấn Quan hệ Gia đình với Backtracking
Cho cơ sở tri thức sau:
```prolog
1: parent(tom, bob).
2: parent(tom, liz).
3: parent(bob, ann).
4: parent(bob, pat).
5: parent(pat, jim).
```
Hãy vẽ cây tìm kiếm SLD hoàn chỉnh và liệt kê toàn bộ các bộ nghiệm theo đúng thứ tự xuất hiện cho truy vấn:
`?- parent(X, Y), parent(Y, Z).`

#### Lời giải chi tiết:

```
                       [ ?- parent(X, Y), parent(Y, Z) ]
        ┌───────────────────┬───────────────────┬───────────────────┬───────────────────┬───────────────────┐
     (Cl. 1)             (Cl. 2)             (Cl. 3)             (Cl. 4)             (Cl. 5)
   X=tom, Y=bob        X=tom, Y=liz        X=bob, Y=ann        X=bob, Y=pat        X=pat, Y=jim
        │                   │                   │                   │                   │
        v                   v                   v                   v                   v
[ parent(bob, Z) ]   [ parent(liz, Z) ]  [ parent(ann, Z) ]  [ parent(pat, Z) ]  [ parent(jim, Z) ]
   ┌────┴────┐              │                   │                   │                   │
 (Cl.3)    (Cl.4)        (Cl.1-5)            (Cl.1-5)            (Cl.5)              (Cl.1-5)
 Z=ann     Z=pat           fail                fail              Z=jim                 fail
   │         │                                                      │
   v         v                                                      v
  [ ]       [ ]                                                    [ ]
Nghiệm 1  Nghiệm 2                                               Nghiệm 3
```

- **Thứ tự các bộ nghiệm trả về:**
  1. `X = tom, Y = bob, Z = ann ;`
  2. `X = tom, Y = bob, Z = pat ;`
  3. `X = bob, Y = pat, Z = jim.`

---

### Bài toán 2.2: Cây SLD với Vị từ Đệ quy & Phép thế Đổi tên Biến
Cho cơ sở tri thức:
```prolog
1: edge(a, b).
2: edge(b, c).
3: path(X, Y) :- edge(X, Y).
4: path(X, Y) :- edge(X, Z), path(Z, Y).
```
Vẽ cây SLD cho truy vấn: `?- path(a, c).`

#### Lời giải chi tiết:
- Gốc: `[ ?- path(a, c) ]`
  - **Nhánh 1 (Thử Clause 3 với $X = a, Y = c$):**
    - Subgoal: `[ edge(a, c) ]`.
    - Quét KB: không có fact nào là `edge(a, c)`.
    - Kết quả: `fail`. Kích hoạt quay lui về gốc.
  - **Nhánh 2 (Thử Clause 4 với $X = a, Y = c$, sinh biến mới $Z_1$):**
    - Subgoal: `[ edge(a, Z1), path(Z1, c) ]`.
    - Giải quyết mục tiêu trái: `edge(a, Z1)`.
      - Khớp Clause 1: `edge(a, b)` $\implies Z_1 = b$.
    - Subgoal còn lại: `[ path(b, c) ]`.
      - **Nhánh 2.1 (Thử Clause 3 với $X_2 = b, Y_2 = c$):**
        - Subgoal: `[ edge(b, c) ]`.
        - Khớp Clause 2: `edge(b, c)`.
        - Subgoal: `[]` (Rỗng).
        - **Thành công (Success)!** Kết quả trả về: `true.`.

---

## Dạng 3: Nhận Diện & Khắc Phục Vòng Lặp Vô Hạn (Infinite Loops)

### Bài toán 3.1: Phân tích Luật Đối Xứng trong `rel.pl` ([Ertel 2025], Ex 5.4)
Cho cơ sở tri thức gia đình:
```prolog
1: child_fact(oscar, karen, frank).
2: child_fact(mary, karen, frank).
3: child_fact(eve, anne, oscar).
4: child_fact(clyde, mary, oscarb).

5: child(X, Z, Y) :- child(X, Y, Z).                         % Luật đối xứng
6: descendant(X, Y) :- child(X, Y, Z).                       % Trực tiếp
7: descendant(X, Y) :- child(X, U, V), descendant(U, Y).     % Bắc cầu
```
1. Điều gì xảy ra khi thực hiện truy vấn `?- descendant(clyde, karen).`? Giải thích chi tiết cơ chế gây lỗi.
2. Tại sao hệ chứng minh định lý tự động **E** lại giải được truy vấn này mà không bị treo?
3. Viết lại mã nguồn Prolog chuẩn A+ để loại bỏ hoàn toàn vòng lặp.

#### Lời giải chi tiết:
1. **Cơ chế gây vòng lặp vô hạn:**
   - Để chứng minh `descendant(clyde, karen)`, Prolog thử Clause 6 $\implies$ sinh mục tiêu `child(clyde, karen, Z)`.
   - Quét KB tìm `child`: không có Fact nào tên là `child` (chỉ có `child_fact`).
   - Prolog khớp Clause 5: `child(clyde, karen, Z) :- child(clyde, Z, karen)`.
   - Mục tiêu mới trở thành `child(clyde, Z, karen)`.
   - Để giải mục tiêu mới, Prolog lại quét từ trên xuống $\implies$ lại gặp Clause 5 $\implies$ hoán vị lại thành `child(clyde, karen, Z)`.
   - **Hệ quả:** Prolog rơi vào chu trình đệ quy lẫn nhau vô tận giữa 2 tham số cha/mẹ, tiêu thụ hết không gian bộ nhớ ngăn xếp và báo lỗi **Out of Local Stack / Loop**. Dòng 7 không bao giờ được chạm tới.
2. **Tại sao Hệ chứng minh E giải quyết thành công?**
   - **Prolog:** Sử dụng chiến lược DFS (Tìm kiếm theo chiều sâu) đơn giản không kiểm tra chu trình và phụ thuộc chặt chẽ vào thứ tự mệnh đề (Ngữ nghĩa thủ tục).
   - **Hệ chứng minh E (Theorem Prover E):** Dựa trên thuật toán Phân giải hoàn chỉnh (Superposition / Complete Resolution) với chiến lược tìm kiếm theo chiều rộng (BFS) hoặc Best-First Search. E có cơ chế **Subsumption (Loại bỏ mệnh đề dư thừa)** và **Loop Detection**. Khi hoán vị tham số của `child`, E nhận diện đây là mệnh đề tương đương đã có trong không gian tìm kiếm nên không mở rộng tiếp nhánh này, từ đó tìm ra đường dẫn qua Clause 7 để kết luận thành công.
3. **Mã nguồn khắc phục chuẩn A+:**
   Tách bạch hoàn toàn giữa quan hệ dữ liệu thô và quan hệ suy diễn:
   ```prolog
   % Tách biệt: child/3 dẫn xuất từ child_fact, KHÔNG tự gọi lại chính nó
   child(X, Y, Z) :- child_fact(X, Y, Z).
   child(X, Z, Y) :- child_fact(X, Y, Z).

   descendant(X, Y) :- child(X, Y, Z).
   descendant(X, Y) :- child(X, U, V), descendant(U, Y).
   ```

---

## Dạng 4: Toán Tử Cắt Cut (`!`) & Phủ Định Dưới Dạng Thất Bại (`\+`)

### Bài toán 4.1: Cạm bẫy Head Unification trước Cut trong `max/3`
Xét định nghĩa hàm tìm số lớn nhất:
```prolog
1: max(X, Y, X) :- X >= Y, !.
2: max(_, Y, Y).
```
1. Xác định kết quả và giải thích cơ chế của truy vấn: `?- max(5, 2, M).`
2. Xác định kết quả và giải thích nghịch lý sai logic của truy vấn: `?- max(5, 2, 2).`
3. Sửa lại mã nguồn để vị từ hoạt động chính xác trong mọi trường hợp.

#### Lời giải chi tiết:
1. **Truy vấn `?- max(5, 2, M).`:**
   - Khớp Head dòng 1: $X = 5, Y = 2, M = X = 5$.
   - Kiểm tra điều kiện: $5 \ge 2$ (Đúng).
   - Gặp Cut `!`: Đóng băng lựa chọn, loại bỏ dòng 2.
   - Kết quả: `M = 5.` (Chính xác).
2. **Truy vấn `?- max(5, 2, 2).`:**
   - Thử dòng 1: So khớp `max(5, 2, 2)` với `max(X, Y, X)`.
     - Đòi hỏi $X = 5$ và đối số thứ ba $X = 2$ $\implies$ Mâu thuẫn ($5 \ne 2$).
     - **Unification thất bại ngay tại Head!**
   - Vì thất bại tại Head nên luồng điều khiển **chưa từng bước vào thân luật và chưa chạm tới Cut `!`**.
   - Do đó, Prolog quay lui thử tiếp dòng 2: `max(_, 2, 2)`.
   - Dòng 2 khớp hoàn hảo!
   - Kết quả trả về: **`true.`**!
   - *Phê phán:* Đây là lỗi logic chết người, hệ thống khẳng định $2$ là giá trị lớn nhất giữa $5$ và $2$!
3. **Mã nguồn sửa chuẩn:**
   Không ràng buộc biến kết quả ở Head trước khi kiểm tra Cut:
   ```prolog
   max(X, Y, Max) :- X >= Y, !, Max = X.
   max(_, Y, Y).
   ```
   Khi gọi `max(5, 2, 2)`: Head khớp với $Max = 2$. Kiểm tra $5 \ge 2$ đúng $\implies$ gặp `!` $\implies$ cam kết chọn luật 1 $\implies$ gán $2 = 5$ (Thất bại) $\implies$ trả về **`false.`** chuẩn xác!

---

### Bài toán 4.2: Mô phỏng Negation as Failure (NAF)
Cho chương trình:
```prolog
animal(cobra).
animal(dog).
snake(cobra).

likes(mary, X) :- snake(X), !, fail.
likes(mary, X) :- animal(X).
```
1. Dự đoán kết quả của `?- likes(mary, cobra).`
2. Dự đoán kết quả của `?- likes(mary, dog).`
3. Viết lại vị từ `likes/2` bằng toán tử `\+`.

#### Lời giải chi tiết:
1. `?- likes(mary, cobra).`:
   - Thử luật 1: `snake(cobra)` thành công $\implies$ gặp `!` (triệt tiêu luật 2) $\implies$ gặp `fail` $\implies$ toàn bộ truy vấn thất bại: **`false.`**. (Mary không thích rắn hổ mang).
2. `?- likes(mary, dog).`:
   - Thử luật 1: `snake(dog)` thất bại $\implies$ chưa chạm tới `!` $\implies$ chuyển sang luật 2.
   - Thử luật 2: `animal(dog)` thành công $\implies$ **`true.`**. (Mary thích chó).
3. **Viết lại dùng `\+`:**
   ```prolog
   likes(mary, X) :- animal(X), \+ snake(X).
   ```

---

## Dạng 5: Thiết Kế Vị Từ Đệ Quy Trên Danh Sách & Tối Ưu Độ Phức Tạp

### Bài toán 5.1: Phân tích Thuật toán Đảo Danh Sách Naive vs Fast Reverse
1. Viết mã nguồn cho vị từ nối danh sách `append/3` và chứng minh độ phức tạp tính toán của nó.
2. Trình bày mã nguồn `nrev/2` (Naive reverse) và tính toán số bước thực thi $T(N)$ trên danh sách độ dài $N$.
3. Trình bày mã nguồn `reverse/2` dùng biến tích lũy (Accumulator) và chứng minh độ phức tạp $\mathcal{O}(N)$.

#### Lời giải chi tiết:
1. **Vị từ `append/3`:**
   ```prolog
   append([], L, L).
   append([X | L1], L2, [X | L3]) :- append(L1, L2, L3).
   ```
   - *Chứng minh độ phức tạp:* Thuật toán bóc tách từng phần tử của danh sách thứ nhất `L1` cho đến khi danh sách rỗng. Số lần gọi đệ quy đúng bằng độ dài của `L1` cộng 1:
     $$T_{\text{append}} = |L_1| + 1 = \mathcal{O}(|L_1|)$$
     Hoàn toàn không phụ thuộc vào kích thước của `L2`.

2. **Naive Reverse (`nrev/2`):**
   ```prolog
   nrev([], []).
   nrev([H | T], R) :- nrev(T, RT), append(RT, [H], R).
   ```
   - *Phân tích chi phí:* Để đảo danh sách độ dài $N$, ta đảo danh sách con độ dài $N-1$ rồi gọi `append` danh sách độ dài $N-1$ với danh sách 1 phần tử.
   - Hệ thức truy hồi:
     $$T(N) = T(N-1) + (N-1)$$
     $$T(N) = 0 + 1 + 2 + \dots + (N-1) = \frac{N(N-1)}{2} = \mathcal{O}(N^2)$$
   - Độ phức tạp thời gian bậc hai $\mathcal{O}(N^2)$ là quá lớn đối với các danh sách hàng ngàn phần tử.

3. **Fast Reverse (`accrev/3` dùng Accumulator):**
   ```prolog
   reverse(List, Result) :- accrev(List, [], Result).

   accrev([], Acc, Acc).
   accrev([H | T], Acc, Result) :- accrev(T, [H | Acc], Result).
   ```
   - *Cơ chế hoạt động:* Biến `Acc` đóng vai trò một ngăn xếp LIFO. Mỗi bước đệ quy lấy phần tử đầu $H$ đẩy vào đỉnh của `Acc` (thao tác `[H | Acc]` tốn $\mathcal{O}(1)$). Khi danh sách cạn kiệt thành `[]`, `Acc` chứa toàn bộ các phần tử theo thứ tự đảo ngược.
   - Mỗi phần tử chỉ được duyệt qua đúng 1 lần:
     $$T(N) = N + 1 = \mathcal{O}(N)$$
   - Đạt hiệu năng tối ưu tuyến tính tuyệt đối.

---

### Bài toán 5.2 ([Ertel 2025], Ex 5.5): In 1024 số 1 ngắn nhất
Viết chương trình Prolog ngắn nhất in ra đúng 1024 số 1 mà không dùng vòng lặp thủ tục dài dòng.

#### Lời giải chi tiết:
Sử dụng nguyên lý chia đôi nhị phân: $1024 = 2^{10}$. Mỗi bước đệ quy nhân đôi số lượng in ra:
```prolog
p(0) :- write(1).
p(N) :- N > 0, N1 is N - 1, p(N1), p(N1).

% Thực thi:
% ?- p(10).
```
Chỉ đúng 3 dòng mã lệnh, chương trình thực hiện $2^{10} = 1024$ lời gọi in ký tự 1 cực kỳ thanh lịch.

---

## Dạng 6: Lập Kế Hoạch Trạng Thái & Lập Trình Logic Ràng Buộc CLP(FD)

### Bài toán 6.1: Mô hình hóa Nông dân qua sông (Farmer, Wolf, Goat, Cabbage)
Hãy viết các thành phần cốt lõi của bài toán lập kế hoạch đưa sói, dê, bắp cải qua sông:
1. Định nghĩa biểu diễn trạng thái.
2. Viết vị từ kiểm tra trạng thái an toàn `safe/1`.
3. Giải thích tại sao trong vị từ tìm kiếm đường đi `plan/4`, điều kiện `\+ member(Next, Visited)` mang tính chất quyết định sự thành bại của thuật toán.

#### Lời giải chi tiết:
1. **Biểu diễn trạng thái:**
   Dùng compound term 4 ngôi: `state(Farmer, Wolf, Goat, Cabbage)` với các giá trị bờ `left` hoặc `right`.
   - Trạng thái đầu: `state(left, left, left, left)`.
   - Trạng thái đích: `state(right, right, right, right)`.

2. **Vị từ kiểm tra trạng thái an toàn `safe/1`:**
   ```prolog
   across(left, right).
   across(right, left).

   % An toàn khi sói và dê khác bờ, VÀ dê và bắp cải khác bờ
   safe(state(_, W, G, C)) :- across(W, G), across(G, C).
   % Hoặc an toàn khi nông dân ở cùng bờ bảo vệ sói và dê
   safe(state(F, F, F, _)).
   % Hoặc nông dân ở cùng bờ bảo vệ dê và bắp cải
   safe(state(F, _, F, F)).
   ```

3. **Vai trò sinh tử của `\+ member(Next, Visited)`:**
   - Không gian trạng thái của bài toán là một đồ thị vô hướng có chu trình (người nông dân có thể chèo đò từ bờ trái sang bờ phải rồi ngay lập tức chèo thuyền không quay lại bờ trái).
   - Prolog sử dụng thuật toán tìm kiếm DFS mù quáng. Nếu không lưu vết các trạng thái đã đi qua (`Visited`), hệ thống sẽ chèo thuyền qua lại giữa 2 bờ vô hạn lần, dẫn đến **vòng lặp vô tận (Infinite Loop)** và không bao giờ tìm ra lời giải.
   - `\+ member(Next, Visited)` đảm bảo thuật toán chỉ mở rộng các trạng thái mới tinh, bảo toàn tính đầy đủ của quá trình lập kế hoạch.
