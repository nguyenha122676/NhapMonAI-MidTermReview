# Chương 5 – Lý Thuyết Toàn Diện: Lập Trình Logic Với PROLOG (Logic Programming with PROLOG)

> **Mục tiêu đạt điểm A+:** Nắm vững triết học lập trình khai báo (Declarative Programming), cơ chế thực thi của máy ảo Prolog (SLD-Resolution, Depth-First Search, Backtracking), kỹ thuật vẽ cây tìm kiếm (SLD Search Trees), bản chất toán học của phép đồng nhất hóa Unification, điều khiển luồng thực thi nâng cao (Toán tử Cut `!`, Green/Red Cut, Negation as Failure `\+`), cấu trúc dữ liệu danh sách (Lists, Accumulators, phân tích độ phức tạp $O(N)$ vs $O(N^2)$), và các mở rộng hiện đại (Meta-programming, Lập kế hoạch Trạng thái, CLP(FD)).

---

## 1. Triết Học Lập Trình Khai Báo & Nền Tảng Hình Thức

### 1.1. Công thức Kowalski: Algorithm = Logic + Control
Năm 1979, nhà khoa học máy tính Robert Kowalski đưa ra phương trình nổi tiếng định hình toàn bộ lĩnh vực Lập trình Logic:
$$\text{Algorithm} = \text{Logic} + \text{Control}$$

Trong đó:
- **Thành phần Logic (Logic component):** Mô tả **bài toán là gì** (What the problem is) – bao gồm các đối tượng, sự thật (Facts) và các mối quan hệ, quy tắc đúng đắn (Rules) của miền bài toán trong thế giới thực. Đây là trách nhiệm của người lập trình.
- **Thành phần Điều khiển (Control component):** Xác định **cách thức giải quyết bài toán** (How the problem is solved) – bao gồm thứ tự áp dụng các luật, chiến lược tìm kiếm trong không gian trạng thái, và cơ chế quay lui (Backtracking). Đây là trách nhiệm của bộ máy suy diễn Prolog (Inference Engine).

### 1.2. Lập trình Khai báo (Declarative) vs Lập trình Mệnh lệnh (Imperative)

| Tiêu chí so sánh | Lập trình Mệnh lệnh (Imperative: C++, Java, Python) | Lập trình Khai báo / Logic (Declarative: PROLOG) |
|---|---|---|
| **Câu hỏi cốt lõi** | "Làm thế nào để tính toán kết quả?" (*How to solve*) | "Cái gì là chân lý trong thế giới?" (*What is true*) |
| **Bản chất câu lệnh** | Các chỉ thị tuần tự làm thay đổi trạng thái các ô nhớ (*State mutation*). | Tập hợp các tiên đề logic: Chân lý vô điều kiện (*Facts*) và Luật suy diễn (*Rules*). |
| **Bản chất của Biến (Variables)** | Vùng nhớ có thể gán lại giá trị nhiều lần ($x = x + 1$). | Biến logic toán học: chỉ được ràng buộc giá trị duy nhất một lần trong một nhánh (*Unification*), giải phóng khi quay lui. |
| **Luồng điều khiển (Control Flow)** | Rẽ nhánh (`if-else`), vòng lặp (`for`, `while`), nhảy lệnh (`goto`). | Đệ quy (*Recursion*), Tìm kiếm theo chiều sâu (*DFS*), Quay lui (*Backtracking*). |
| **Tính đa hướng (Bidirectionality)** | Hàm chỉ có 1 chiều (nhận tham số đầu vào Input $\rightarrow$ trả về kết quả Output). | Vị từ đa hướng: một tham số vừa có thể là Input để kiểm tra, vừa có thể là Output để sinh nghiệm. |

### 1.3. Ngữ nghĩa Khai báo (Declarative Semantics) vs Ngữ nghĩa Thủ tục (Procedural Semantics)
Một chương trình PROLOG luôn tồn tại hai cách đọc song song:
1. **Ngữ nghĩa Khai báo (Declarative Semantics):**
   - Diễn giải chương trình như các mệnh đề toán học trong Logic Vị từ Bậc nhất (FOL / PL1).
   - Mệnh đề $A \leftarrow B_1 \land B_2$ có nghĩa toán học: "$A$ đúng nếu $B_1$ đúng và $B_2$ đúng".
   - Trong toán học thuần túy, thứ tự viết các mệnh đề hay thứ tự các điều kiện hội không làm thay đổi giá trị chân lý:
     $$B_1 \land B_2 \equiv B_2 \land B_1$$
2. **Ngữ nghĩa Thủ tục (Procedural Semantics):**
   - Quy định **cách thức cụ thể** mà trình thông dịch PROLOG tính toán và thực thi.
   - PROLOG quét cơ sở tri thức theo thứ tự cố định: **Từ trên xuống dưới (Top-to-Bottom)** và giải quyết các mục tiêu con **Từ trái sang phải (Left-to-Right)**.
   - **Hệ quả sống còn:** Hai chương trình có ngữ nghĩa khai báo giống hệt nhau nhưng có thể có ngữ nghĩa thủ tục hoàn toàn trái ngược: một bên chạy tức thì cho ra kết quả, bên kia rơi vào **vòng lặp vô hạn (Infinite Loop)** làm tràn bộ nhớ!

### 1.4. Nền tảng Lý thuyết: Mệnh đề Horn (Horn Clauses) và Máy ảo WAM
- **Mệnh đề Horn (Horn Clause):** Là mệnh đề tuyển (clause) chứa **tối đa một vị từ khẳng định (positive literal)**:
  $$\neg B_1 \lor \neg B_2 \lor \dots \lor \neg B_n \lor A \iff A \leftarrow B_1 \land B_2 \land \dots \land B_n$$
  - **Fact (Sự thật):** Đúng 1 literal dương, 0 literal âm ($A \leftarrow \top$, viết là `A.`).
  - **Rule (Quy tắc):** Đúng 1 literal dương $A$ (Head) và 1 hoặc nhiều literal âm $B_i$ (Body) ($A \leftarrow B_1 \land \dots \land B_n$, viết là `A :- B1, ..., Bn.`).
  - **Goal / Query (Mục tiêu / Truy vấn):** 0 literal dương, chỉ có các literal âm ($\leftarrow G_1 \land \dots \land G_k$, viết là `?- G1, ..., Gk.`).
- **Ưu điểm của Mệnh đề Horn:** Cho phép áp dụng thuật toán **SLD-Resolution** (Selective Linear Definite clause resolution) mang tính tất định, cực kỳ hiệu quả, biến việc chứng minh định lý thành các lời gọi thủ tục hàm lồng nhau.
- **Kiến trúc Máy ảo WAM (Warren Abstract Machine):** Năm 1983, David H. D. Warren thiết kế máy ảo trừu tượng WAM, biên dịch mã Prolog thành bytecode tối ưu hóa thanh ghi, ngăn xếp lựa chọn (choice-point stack) và vệt lưu biến (trail) để hỗ trợ quay lui tức thời. WAM là nền tảng của mọi hệ Prolog hiện đại (SWI-Prolog, GNU-Prolog).

---

## 2. Cú Pháp & Hệ Thống Thuật Ngữ Dữ Liệu (Terms)

Mọi cấu trúc dữ liệu trong PROLOG đều được gọi chung là một **Term**:

```
                                  TERM
               ┌────────────────────┴────────────────────┐
          Simple Term                              Compound Term
        ┌──────┴──────┐                     (Cấu trúc phức hợp / Ký hiệu hàm:
    Constants      Variables                   functor(arg1, arg2, ...))
     ┌──┴──┐     (Bắt đầu bằng HOA:
   Atoms Numbers   X, Y, Person, _tail)
```

### 2.1. Atoms (Hằng nguyên tử)
- Bắt đầu bằng **chữ cái thường**: `mia`, `vincent`, `apple`, `karen`.
- Ký hiệu toán tử đặc biệt: `+`, `-`, `:-`, `?-`.
- Chuỗi ký tự bất kỳ đặt trong **dấu nháy đơn `'...'`**: `'Mia'`, `'intro ai'`, `'Hanoi University'` (dùng khi nguyên tử chứa chữ hoa hoặc khoảng trắng).

### 2.2. Numbers (Số học)
- Số nguyên (`42`, `-100`) hoặc số thực (`3.14159`, `-0.05`).

### 2.3. Variables (Biến logic)
- Bắt đầu bằng **chữ cái IN HOA** hoặc **dấu gạch dưới `_`**: `X`, `Y`, `Person`, `Next_state`.
- **Biến ẩn danh (Anonymous Variable) `_`:** Dùng khi cần giữ chỗ cho một đối số nhưng không quan tâm đến giá trị cụ thể của nó.
  > [!IMPORTANT]
  > Mỗi lần ký tự `_` xuất hiện độc lập, Prolog coi nó là **một biến hoàn toàn mới và độc lập** (ví dụ `_G102`, `_G103`). Biểu thức `f(_, _)` có thể nhận hai giá trị khác nhau, trong khi `f(X, X)` bắt buộc hai tham số phải nhận cùng một giá trị!

### 2.4. Compound Terms (Thuật ngữ phức hợp)
- Cú pháp: `functor(argument_1, argument_2, ..., argument_n)`.
- **Functor (Tên cấu trúc):** Phải là một Atom.
- **Arity (Ngôi / Số lượng tham số):** Số nguyên $n \ge 0$.
- Ký hiệu nhận diện chuẩn: `functor/arity`.
- **Quy tắc phân biệt:** Hai vị từ cùng tên nhưng khác Arity là **hai vị từ hoàn toàn độc lập trong cơ sở tri thức**. Ví dụ: `loves/2` (`loves(vincent, mia)`) và `loves/3` (`loves(vincent, mia, deeply)`) không hề xung đột hay ghi đè lên nhau.

---

## 3. Cơ Chế Thực Thi: SLD-Resolution, Unification & Search Trees

### 3.1. Thuật toán Đồng nhất hóa (Unification - Toán tử `=`)
Hai term $T_1$ và $T_2$ đồng nhất được với nhau ($T_1 = T_2$) theo các bước đệ quy:
1. Nếu $T_1$ và $T_2$ là các hằng số (Atoms hoặc Numbers): chúng đồng nhất khi và chỉ khi chúng giống hệt nhau (`mia = mia` thành công; `mia = vincent` thất bại).
2. Nếu $T_1$ là một biến chưa ràng buộc (unbound variable) và $T_2$ là bất kỳ term nào: $T_1$ được liên kết (bound) với $T_2$ (`X = mia` $\implies X$ nhận giá trị `mia`). Ngược lại, nếu $T_2$ là biến thì $T_2$ liên kết với $T_1$.
3. Nếu cả $T_1$ và $T_2$ đều là Compound Terms: chúng đồng nhất khi và chỉ khi:
   - Chúng có **cùng Functor**.
   - Chúng có **cùng Arity** ($n$).
   - Tất cả các cặp đối số tương ứng đồng nhất đệ quy: $\forall i \in \{1, \dots, n\}: arg_i(T_1) = arg_i(T_2)$.
4. Trong mọi trường hợp khác: phép đồng nhất thất bại (`fail`).

> [!WARNING]
> **Occurs-check:** Theo lý thuyết logic toán học FOL, khi gán $X = f(X)$, hệ thống phải kiểm tra xem $X$ có xuất hiện bên trong $f(X)$ không (Occurs-check) để tránh tạo ra cấu trúc vô hạn tuần hoàn. Để tối ưu tốc độ thực thi, hầu hết các hệ thống Prolog tiêu chuẩn **mặc định bỏ qua kiểm tra Occurs-check**, chấp nhận rủi ro treo hệ thống nếu người dùng viết các phép gán đệ quy đóng!

### 3.2. Quy trình Thực thi Thủ tục (Procedural Execution)
Khi nhận một truy vấn `?- G1, G2, ..., Gk.`, Prolog thực thi theo đúng 2 nguyên tắc sắt đá:
1. **Left-to-Right (Từ trái sang phải):** Luôn chọn mục tiêu ngoài cùng bên trái ($G_1$) làm mục tiêu hiện tại cần giải quyết.
2. **Top-to-Bottom (Từ trên xuống dưới):** Quét qua cơ sở tri thức từ dòng đầu tiên xuống dòng cuối cùng, tìm mệnh đề (Clause) đầu tiên có Head đồng nhất được với $G_1$.
   - Nếu khớp một **Fact**: Mục tiêu $G_1$ bị loại bỏ; tiếp tục giải quyết các mục tiêu còn lại $G_2, \dots, G_k$.
   - Nếu khớp một **Rule** ($H \text{ :- } B_1, \dots, B_m$): $G_1$ được thay thế bằng toàn bộ Body của Rule, tạo thành danh sách mục tiêu mới: $B_1, \dots, B_m, G_2, \dots, G_k$.
   - Nếu **không có mệnh đề nào khớp** (hoặc gặp `fail`): Prolog kích hoạt **Quay lui (Backtracking)** về điểm lựa chọn (Choice point) gần nhất để thử mệnh đề tiếp theo.

### 3.3. Cây Tìm Kiếm SLD (SLD Search Tree)
Cây tìm kiếm biểu diễn toàn bộ không gian trạng thái tính toán của Prolog:
- **Nút gốc (Root):** Truy vấn ban đầu `[?- Goal]`.
- **Nút trung gian:** Danh sách các mục tiêu con còn lại cần chứng minh cùng phép thế tích lũy $\theta$.
- **Cạnh nối:** Việc lựa chọn một Clause trong KB (ghi rõ số hiệu dòng và phép thế Unification).
- **Nút lá thành công `[]` (Empty Goal List):** Không còn mục tiêu nào, hệ thống dừng và in ra giá trị các biến nghiệm.
- **Nút lá thất bại (`fail`):** Nhánh cụt, Prolog tự động quay lui lên nút cha.

```
Ví dụ Minh họa SLD Tree:
1: loves(vincent, mia).
2: loves(marsellus, mia).
3: jealous(X, Y) :- loves(X, Z), loves(Y, Z).

Truy vấn: ?- jealous(marsellus, W).

                      [ jealous(marsellus, W) ]
                                 | (áp dụng Clause 3: X = marsellus, Y = W)
                                 v
                 [ loves(marsellus, Z), loves(W, Z) ]
                                 | (quét KB tìm loves(marsellus, Z) -> khớp Cl. 2: Z = mia)
                                 v
                         [ loves(W, mia) ]
                          /             \
       (khớp Cl. 1: W = vincent)       (khớp Cl. 2: W = marsellus)
                        /                 \
                      [ ]                 [ ]
            Nghiệm 1: W = vincent    Nghiệm 2: W = marsellus
```

---

## 4. Định Nghĩa Đệ Quy & Cạm Bẫy Vòng Lặp Vô Hạn (Infinite Loops)

### 4.1. Cấu trúc Chuẩn của Vị từ Đệ quy
Một định nghĩa đệ quy đúng đắn luôn bắt buộc phải gồm hai phần:
1. **Base Case (Trường hợp suy biến / Điểm dừng):** Mệnh đề không đệ quy, xử lý trường hợp kích thước nhỏ nhất (thường là danh sách rỗng `[]` hoặc số $0$).
2. **Recursive Case (Bước đệ quy):** Giảm kích thước dữ liệu bài toán và gọi lại chính vị từ đó.

### 4.2. Bẫy 1: Đệ quy Trái (Left-Recursion)
Xét luật định nghĩa quan hệ tổ tiên:
```prolog
% CÁCH VIẾT SAI CHẾT NGƯỜI (Left-recursive)
ancestor(X, Y) :- ancestor(X, Z), parent(Z, Y).
ancestor(X, Y) :- parent(X, Y).
```
- **Về mặt khai báo:** Toán học hoàn toàn đúng: "X là tổ tiên của Y nếu X là tổ tiên của Z và Z là cha mẹ của Y".
- **Về mặt thủ tục của Prolog:**
  1. Nhận truy vấn `?- ancestor(tom, bob).`.
  2. Khớp ngay với dòng 1: sinh ra mục tiêu con `ancestor(tom, Z)`.
  3. Để giải `ancestor(tom, Z)`, Prolog lại quét từ trên xuống, lại khớp dòng 1: sinh ra `ancestor(tom, Z1)`.
  4. Quá trình lặp lại vô tận cho đến khi **tràn bộ nhớ ngăn xếp (Stack Overflow)**. Prolog không bao giờ chạm được tới dòng Base case!
- **Quy tắc khắc phục:** Luôn đặt Base Case lên trước Recursive Case, và trong thân luật đệ quy, luôn đặt mục tiêu làm giảm bài toán lên trước lời gọi đệ quy:
  ```prolog
  ancestor(X, Y) :- parent(X, Y).                         % Base case trước
  ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).         % Giảm bài toán (parent) trước đệ quy
  ```

### 4.3. Bẫy 2: Luật Đối Xứng (Symmetry Rule) trong Ertel Sec 5.2
Xét cơ sở tri thức quan hệ gia đình kinh điển (`rel.pl`):
```prolog
child(oscar, karen, frank).
child(mary, karen, frank).
child(eve, anne, oscar).
...
child(X, Z, Y) :- child(X, Y, Z).                         % Luật đối xứng cha/mẹ (Dòng 8)

descendant(X, Y) :- child(X, Y, Z).                       % Con trực tiếp (Dòng 10)
descendant(X, Y) :- child(X, U, V), descendant(U, Y).     % Hậu duệ đệ quy (Dòng 11)
```
- Khi hỏi `?- descendant(clyde, karen).`:
  - Dòng 10 gọi `child(clyde, karen, Z)`. Các fact không khớp $\implies$ khớp Dòng 8.
  - Dòng 8 đổi chỗ tham số: gọi `child(clyde, Z, karen)`.
  - Để giải mục tiêu mới, Prolog lại quét từ trên xuống $\implies$ lại khớp Dòng 8 $\implies$ đổi chỗ ngược lại thành `child(clyde, karen, Z)`.
  - **Hậu quả:** Prolog rơi vào vòng lặp vô tận đổi chỗ qua lại hai tham số cha/mẹ và **không bao giờ chuyển sang dòng 11**.
- **Giải pháp Kiến trúc Chuẩn A+ (Tách Fact khỏi Rule - `rel02.pl`):**
  ```prolog
  % Lưu trữ dữ liệu thô bằng vị từ khác
  child_fact(oscar, karen, frank).
  child_fact(mary, karen, frank).
  ...
  % child/3 chỉ tra cứu vào child_fact hữu hạn, KHÔNG tự gọi đệ quy chính nó!
  child(X, Y, Z) :- child_fact(X, Y, Z).
  child(X, Z, Y) :- child_fact(X, Y, Z).

  descendant(X, Y) :- child(X, Y, Z).
  descendant(X, Y) :- child(X, U, V), descendant(U, Y).
  ```
  Nhờ tách biệt này, `child/3` không thể tạo chu trình đệ quy kín, triệt tiêu 100% nguy cơ lặp vô hạn!

---

## 5. Kỹ Thuật Điều Khiển Luồng Thực Thi (Procedural Control)

### 5.1. Toán tử Cắt (Cut `!`)
Toán tử Cut `!` là vị từ đặc biệt dùng để can thiệp trực tiếp vào máy ảo Prolog:
1. `!` luôn **thành công ngay lập tức** ở lần chạm đầu tiên.
2. **Cam kết lựa chọn (Commit):** Khi luồng điều khiển đã vượt qua `!`, Prolog **đóng băng toàn bộ các lựa chọn đã thực hiện**:
   - Triệt tiêu mọi khả năng quay lui thử lại các mục tiêu con đứng trước `!` trong mệnh đề hiện tại.
   - Triệt tiêu mọi khả năng thử các mệnh đề khác có cùng Head bên dưới mệnh đề hiện tại.

#### Phân biệt Green Cut và Red Cut:
- **Green Cut (Vết cắt xanh):**
  - Chỉ dùng để **tăng tốc hiệu năng**, dọn dẹp bộ nhớ ngăn xếp khi biết chắc chắn không còn nghiệm nào khác.
  - Nếu xóa bỏ Green Cut, **ngữ nghĩa logic và tập kết quả trả về của chương trình hoàn toàn không thay đổi**.
- **Red Cut (Vết cắt đỏ):**
  - Làm **thay đổi trực tiếp ngữ nghĩa logic** của chương trình.
  - Thường dựa vào Cut để ngầm định bỏ qua các điều kiện kiểm tra ở các mệnh đề sau. Nếu xóa bỏ Red Cut, chương trình sẽ cho ra kết quả sai lệch hoặc sinh thêm các nghiệm rác sai!

#### Ví dụ Kinh điển: Tìm số lớn nhất `max/3`
```prolog
% Bản chuẩn dùng Cut (Red Cut)
max(X, Y, X) :- X >= Y, !.
max(_, Y, Y).
```
- Nếu hỏi `?- max(5, 2, M).`: $5 \ge 2$ đúng $\implies$ gặp `!` $\implies$ cam kết chọn luật 1, $M = 5$. Mệnh đề 2 bị loại bỏ hoàn toàn, không tốn chi phí kiểm tra $5 < 2$.
- **Cạm bẫy Head Unification xảy ra TRƯỚC Cut:**
  Nếu người dùng gọi kiểm tra: `?- max(5, 2, 2).`:
  1. Prolog so khớp Head luật 1: `max(5, 2, 2)` với `max(X, Y, X)`. Đòi hỏi $X = 5$ và $X = 2$ (Mâu thuẫn!). Unification thất bại ngay tại Head!
  2. Do chưa vào thân luật 1 nên **chưa gặp `!`**. Prolog bình thản chuyển xuống luật 2: `max(_, 2, 2)` $\implies$ **Khớp thành công và trả về `true.`!** (Sai logic trầm trọng: 2 không phải max của 5 và 2!).
- **Cách viết chuẩn A+ phòng chống bẫy Cut:**
  ```prolog
  max(X, Y, Max) :- X >= Y, !, Max = X.
  max(_, Y, Y).
  ```

### 5.2. Vị từ `fail` và Vòng lặp Cưỡng bức Thất bại (Failure-Driven Loop)
- Vị từ `fail` là một mục tiêu luôn luôn thất bại.
- Khi gặp `fail`, Prolog bắt buộc phải kích hoạt cơ chế quay lui (Backtracking).
- Ứng dụng duyệt in toàn bộ cơ sở dữ liệu:
  ```prolog
  print_all_students :-
      student(Name, ID),
      write(Name), write(' - '), write(ID), nl,
      fail.                                 % Ép quay lui tìm sinh viên tiếp theo
  print_all_students.                       % Kết thúc êm đẹp khi hết dữ liệu
  ```

### 5.3. Phủ Định Dưới Dạng Thất Bại (Negation as Failure - NAF: `\+ Goal`)
Prolog không có phủ định toán học cổ điển ($\neg$). Thay vào đó, nó định nghĩa phủ định qua cặp bài trùng `!` và `fail`:
```prolog
not(Goal) :- Goal, !, fail.
not(_).
```
- **Cơ chế:**
  - Nếu `Goal` chứng minh được thành công $\implies$ đi qua `!` (chặn đường lùi) rồi gặp `fail` $\implies$ toàn bộ phủ định trả về thất bại (`false`).
  - Nếu `Goal` không thể chứng minh được $\implies$ mệnh đề 1 thất bại, chuyển xuống mệnh đề 2 `not(_).` $\implies$ trả về thành công (`true`).
- **Bản chất CWA:** NAF chỉ khẳng định **"Hệ thống không tìm thấy bằng chứng chứng minh Goal là đúng"**, chứ không hề chứng minh "Goal là sai trong thực tế".

---

## 6. Cấu Trúc Dữ Liệu Danh Sách & Phân Tích Độ Phức Tạp

### 6.1. Cú pháp `[Head | Tail]`
Danh sách trong Prolog là cấu trúc đệ quy:
- Danh sách rỗng: `[]`.
- Danh sách khác rỗng: `[Head | Tail]`:
  - `Head`: Là **một phần tử đơn lẻ** đầu tiên.
  - `Tail`: Là **một danh sách** chứa toàn bộ các phần tử còn lại.

#### Các ví dụ Unification danh sách trọng tâm thi cử:
- `[H | T] = [a, b, c]` $\implies H = a, T = [b, c]$.
- `[H | T] = [a]` $\implies H = a, T = []$.
- `[H | T] = []` $\implies$ **Thất bại (`fail`)** vì danh sách rỗng không có Head và Tail.
- `[X, Y | W] = [a, b, c, d]` $\implies X = a, Y = b, W = [c, d]$.
- `[_, X, _, Y | _] = [[], dead(z), [2,[b,c]], [], Z]` $\implies X = dead(z), Y = []$.
- `[_, _, [_|X] | _] = [[], dead(z), [2,[b,c]], [], Z]` $\implies$ Vị trí 3 là `[2,[b,c]]`, tách `[_|X]` ta được $X = [[b, c]]$.

### 6.2. Các Vị từ Thao tác Danh sách Căn bản
1. **Kiểm tra thành viên (`member/2`):**
   ```prolog
   member(X, [X | _]).
   member(X, [_ | T]) :- member(X, T).
   ```
2. **Nối hai danh sách (`append/3`):**
   ```prolog
   append([], L, L).
   append([X | L1], L2, [X | L3]) :- append(L1, L2, L3).
   ```
   - **Độ phức tạp thời gian:** Thuật toán chỉ đệ quy duyệt qua các phần tử của danh sách thứ nhất `L1` cho đến khi gặp `[]`.
   - Do đó: $T_{\text{append}} = \mathcal{O}(|L_1|)$, hoàn toàn không phụ thuộc vào độ dài của `L2`!

### 6.3. So sánh Thuật toán Đảo Danh Sách: Naive Reverse vs Fast Reverse

| Thuật toán | Mã nguồn Prolog | Cơ chế hoạt động | Độ phức tạp thời gian | Đánh giá |
|---|---|---|---|---|
| **Naive Reverse (`nrev/2`)** | `nrev([], []).`<br>`nrev([H\|T], R) :- nrev(T, RT), append(RT, [H], R).` | Gọi đệ quy đảo đuôi $T$, sau đó gọi `append` để dán $H$ vào cuối. | $T(N) = T(N-1) + (N-1) = \frac{N(N-1)}{2} = \mathcal{O}(N^2)$ | Quá chậm, gây bùng nổ thời gian khi danh sách dài. |
| **Fast Reverse (`accrev/3` dùng Accumulator)** | `reverse(L, R) :- accrev(L, [], R).`<br>`accrev([], A, A).`<br>`accrev([H\|T], A, R) :- accrev(T, [H\|A], R).` | Coi `Accumulator` như một Stack: bốc phần tử đầu $H$ đẩy vào đỉnh Stack `[H\|A]`. | Mỗi phần tử chỉ chuyển qua biến tích lũy đúng 1 lần: $T(N) = \mathcal{O}(N)$ | Tối ưu tuyến tính tuyệt đối, đạt chuẩn A+. |

---

## 7. Phép Tính Số Học & So Sánh Trong Prolog

Prolog phân biệt rất rạch ròi giữa so khớp cấu trúc hình thức và tính toán giá trị số:

| Toán tử | Tên gọi bản chất | Ý nghĩa & Cách xử lý | Ví dụ minh họa |
|---|---|---|---|
| `=` | Unification (Đồng nhất hóa) | So khớp cấu trúc cú pháp hai Term, **KHÔNG tính toán số học**. | `X = 2 + 3` $\implies X = 2 + 3$ (Term dạng `+(2,3)`). |
| `is` | Arithmetic Evaluation | **Bắt buộc tính toán trị số** của biểu thức bên phải trước, rồi đồng nhất kết quả với vế trái. Vế phải không được chứa biến tự do. | `X is 2 + 3` $\implies X = 5$. |
| `=:=` | Arithmetic Equal | So sánh bằng về mặt **giá trị số học** sau khi tính toán cả 2 vế. | `2 + 3 =:= 1 + 4` $\implies \text{true}$. |
| `=\=` | Arithmetic Not Equal | So sánh khác về mặt **giá trị số học**. | `2 + 3 =\= 6` $\implies \text{true}$. |
| `==` | Structural Identical | So sánh hai term có giống hệt nhau từng ký tự mà **không ràng buộc biến**. | `X == Y` $\implies \text{false}$ (nếu X, Y là biến tự do chưa gán). |
| `\==` | Structural Not Identical | So sánh hai term khác nhau về mặt cấu trúc. | `X \== Y` $\implies \text{true}$. |

---

## 8. Các Chủ Đề Mở Rộng Nâng Cao (Slide Topics)

### 8.1. Cơ sở Dữ liệu Động & Meta-Programming (`assert/retract`)
Prolog có khả năng tự sửa đổi mã nguồn lúc runtime thông qua các chỉ thị khai báo `:- dynamic Functor/Arity.`:
- `asserta(Clause)`: Chèn thêm Fact/Rule mới vào **ĐẦU** danh sách các mệnh đề (ưu tiên khớp trước).
- `assertz(Clause)` (hoặc `assert`): Chèn thêm Fact/Rule vào **CUỐI** danh sách.
- `retract(Clause)`: Xóa mệnh đề đầu tiên đồng nhất với `Clause`.
- `retractall(Head)`: Xóa sạch toàn bộ các mệnh đề có Head đồng nhất với mẫu.
- **Ứng dụng Memoization (Quy hoạch động):** Khi tính toán một bài toán con tốn kém (như số Fibonacci), dùng `asserta(memo_fib(N, Val))` để lưu lại. Lần gọi sau tra cứu $O(1)$ ngay lập tức.

### 8.2. Bài toán Lập Kế Hoạch (Planning): Nông dân qua sông
- Biểu diễn trạng thái: `state(Farmer, Wolf, Goat, Cabbage)` trong đó mỗi biến nhận giá trị `left` hoặc `right`.
- **Cơ chế chống lặp trạng thái vô hạn:**
  ```prolog
  plan(Current, Goal, Visited, Path) :-
      go(Current, Next),
      safe(Next),
      \+ member(Next, Visited),             % Bắt buộc: chống đi vòng tròn lặp vô hạn!
      plan(Next, Goal, [Next | Visited], Path).
  ```

### 8.3. Lập trình Logic Ràng buộc (Constraint Logic Programming - CLP(FD))
- Thay vì chiến lược ngây thơ "Sinh và Kiểm tra" (Generate-and-Test) tốn chi phí $O(N!)$, CLP kết hợp bộ giải ràng buộc vào quá trình đồng nhất.
- Bộ giải duy trì miền giá trị hữu hạn (`fd_domain`) và thực hiện **Lan truyền ràng buộc (Constraint Propagation)** để loại bỏ các giá trị bất khả thi trước khi tiến hành gán nghiệm (`fd_labeling`).
- Ví dụ giải bài toán xếp lịch phòng thi `raumplan.pl` chỉ mất vài mili-giây.
