# Chương 5 – Bảng Khái Niệm Bắt Buộc Học Thuộc & Từ Điển Thuật Ngữ (Core Terminology & Memorization Guide)

> **Mục tiêu đạt điểm A+:** Làm chủ hệ thống thuật ngữ song ngữ Anh – Việt về Lập trình Logic với PROLOG, ghi nhớ các quy tắc thực thi thủ tục của máy ảo WAM, thuộc lòng các bảng so sánh toán tử số học/đồng nhất, các bẫy vòng lặp vô hạn và cách dùng toán tử Cut (`!`) để trả lời trọn vẹn điểm số phần lý thuyết và bài tập.

---

## 1. Bảng Đối Chiếu Thuật Ngữ Song Ngữ (Bilingual Terminology Lexicon)

| Thuật ngữ Tiếng Việt | English Term | Ký hiệu / Cú pháp | Bản chất kỹ thuật & Ngữ cảnh phòng thi |
|---|---|---|---|
| **Lập trình Khai báo** | Declarative Programming | $\text{Algorithm} = \text{Logic} + \text{Control}$ | Hệ hình lập trình mô tả *cái gì đúng* (tri thức) thay vì chỉ thị *làm thế nào* (thuật toán tuần tự). |
| **Ngữ nghĩa Khai báo** | Declarative Semantics | $A \leftarrow B_1 \land \dots \land B_n$ | Ý nghĩa logic thuần túy trong toán học; không phụ thuộc vào thứ tự dòng hay thứ tự mục tiêu. |
| **Ngữ nghĩa Thủ tục** | Procedural Semantics | Top-to-Bottom, Left-to-Right | Cách thức máy ảo Prolog thực thi trên thực tế; thứ tự dòng quyết định thứ tự nghiệm và nguy cơ lặp vô tận. |
| **Mệnh đề Horn** | Horn Clause | $\neg B_1 \lor \dots \lor \neg B_n \lor A$ | Mệnh đề tuyển có tối đa 1 literal khẳng định (Head); nền tảng của thuật toán suy diễn SLD-Resolution. |
| **Sự thật** | Fact | `head.` | Mệnh đề có 1 literal dương, 0 literal âm; chân lý khẳng định luôn đúng vô điều kiện trong cơ sở tri thức. |
| **Quy tắc** | Rule | `Head :- Body.` | Mệnh đề có Head (1 literal dương) và Body (các literal âm nối nhau bởi dấu phẩy đại diện cho phép AND). |
| **Truy vấn / Mục tiêu** | Query / Goal | `?- G1, G2, ..., Gk.` | Mệnh đề không có literal dương (chỉ có literal âm); câu hỏi đặt ra cho hệ thống tìm phép thế thỏa mãn. |
| **Đồng nhất hóa** | Unification | Toán tử `=` | Thuật toán tìm phép thế biến (Substitution $\theta$) làm cho hai Term có cấu trúc giống hệt nhau. |
| **Cây Tìm kiếm SLD** | SLD Search Tree | Nút gốc $\rightarrow$ Lá `[]` / `fail` | Cây biểu diễn toàn bộ không gian tìm kiếm DFS của Prolog; mỗi nhánh là việc chọn 1 Clause trong KB. |
| **Quay lui** | Backtracking | Return to Choice Point | Cơ chế tự động khôi phục lại trạng thái cũ và thử nhánh rẽ tiếp theo khi chạm nhánh cụt (`fail`) hoặc gõ `;`. |
| **Điểm lựa chọn** | Choice Point | Node with multiple branches | Vị trí trong cây tìm kiếm nơi còn các mệnh đề khác trong KB có thể đồng nhất được với mục tiêu hiện tại. |
| **Biến ẩn danh** | Anonymous Variable | Ký tự gạch dưới `_` | Mỗi lần `_` xuất hiện, Prolog sinh ra một biến mới độc lập (`_G101`, `_G102`), không quan tâm giá trị gán. |
| **Toán tử Cắt** | Cut Operator | Ký hiệu `!` | Vị từ tích hợp thành công ngay lập tức và **đóng băng toàn bộ lựa chọn** (triệt tiêu các choice points kể từ khi vào vị từ). |
| **Vết cắt xanh** | Green Cut | `!` tối ưu hóa | Chỉ tăng tốc độ thực thi, **không làm thay đổi** tập nghiệm và ngữ nghĩa logic của chương trình. |
| **Vết cắt đỏ** | Red Cut | `!` thay đổi logic | **Làm thay đổi** ngữ nghĩa logic và tập nghiệm; nếu bỏ `!` chương trình sẽ ra kết quả sai lệch hoặc thừa nghiệm sai. |
| **Phủ định thất bại** | Negation as Failure (NAF) | `\+ Goal` hoặc `not(Goal)` | Coi một mệnh đề là SAI nếu Prolog **không thể tìm ra chứng minh** trong cơ sở tri thức (Giả định Thế giới Đóng CWA). |
| **Biến tích lũy** | Accumulator | `accrev(List, Acc, Res)` | Kỹ thuật truyền kết quả trung gian tích lũy qua các tầng đệ quy, giảm độ phức tạp từ $\mathcal{O}(N^2)$ xuống $\mathcal{O}(N)$. |
| **Đánh giá số học** | Arithmetic Evaluation | Toán tử `is` | Bắt buộc tính toán trị số biểu thức bên phải trước, sau đó đồng nhất kết quả số học vào biến bên trái. |

---

## 2. Bộ Flashcards Khái Niệm Cốt Lõi (High-Yield Flashcards)

### Flashcard 1: Declarative Semantics vs Procedural Semantics
- **Mặt trước:** Phân biệt ngữ nghĩa khai báo và ngữ nghĩa thủ tục. Tại sao cùng một cơ sở tri thức nhưng đổi thứ tự dòng lại có thể gây treo hệ thống?
- **Mặt sau:**
  - **Khai báo (Declarative):** Diễn giải chương trình như các công thức logic toán học. Trong logic toán, $A \land B \equiv B \land A$ và tập hợp các tiên đề không có thứ tự trước sau.
  - **Thủ tục (Procedural):** Quy định cách máy ảo Prolog chạy: luôn chọn Subgoal bên trái nhất (**Left-to-Right**) và quét các mệnh đề từ trên xuống dưới (**Top-to-Bottom**).
  - **Hệ quả:** Nếu viết luật đệ quy trái `ancestor(X, Y) :- ancestor(X, Z), parent(Z, Y).`, về mặt toán học là đúng, nhưng về mặt thủ tục, Prolog liên tục gọi chính nó ở nhánh ngoài cùng bên trái dẫn đến lặp vô tận (Infinite recursion / Stack overflow).

### Flashcard 2: Cơ chế của Toán tử Cut (`!`) và Choice Points
- **Mặt trước:** Toán tử Cut `!` hoạt động như thế nào khi gặp lần đầu và khi quay lui?
- **Mặt sau:**
  - Khi gặp lần đầu tiên theo chiều đi xuống: `!` **luôn thành công ngay lập tức**.
  - Tác dụng: **Cam kết lựa chọn (Commit)** – nó dọn sạch và triệt tiêu tất cả các điểm lựa chọn (Choice points) đã được tạo ra từ thời điểm vị từ hiện tại được gọi cho đến khi gặp `!`.
  - Cụ thể: (1) Không thử lại các subgoal đứng trước `!` trong thân luật; (2) Không thử các clause khác có cùng Head nằm bên dưới clause hiện tại.
  - Khi luồng điều khiển phía sau bị `fail` và quay lui ngược lại chạm vào `!`: `!` **thất bại ngay lập tức** và đẩy luồng quay lui ra hẳn bên ngoài vị từ chứa nó.

### Flashcard 3: Cạm bẫy Head Unification xảy ra TRƯỚC Cut
- **Mặt trước:** Tại sao chương trình `max(X, Y, X) :- X >= Y, !. max(_, Y, Y).` lại trả về `true.` cho truy vấn `?- max(5, 2, 2).`?
- **Mặt sau:**
  - Quá trình Unification tại Head (`max(5, 2, 2) = max(X, Y, X)`) diễn ra **TRƯỚC KHI** Prolog bước vào thân luật chứa `!`.
  - Phép so khớp này đòi hỏi $X = 5$ và $X = 2$ (mâu thuẫn), dẫn đến Unification thất bại ngay ở Head.
  - Vì chưa bước vào thân luật nên luồng điều khiển **chưa từng gặp `!`**.
  - Prolog quay lui bình thản thử tiếp clause 2: `max(_, 2, 2)` $\implies$ khớp hoàn toàn và trả lời `true.`.
  - Khắc phục chuẩn: `max(X, Y, Max) :- X >= Y, !, Max = X. max(_, Y, Y).`

### Flashcard 4: Phân biệt triệt để `=`, `==`, `is`, `=:=`
- **Mặt trước:** Ý nghĩa và sự khác nhau căn bản giữa 4 toán tử `=`, `==`, `is`, `=:=` trong Prolog.
- **Mặt sau:**
  - `X = Y`: **Đồng nhất hóa (Unification)**. So khớp cấu trúc cú pháp, có thể liên kết biến tự do (`X = 2 + 3` $\implies X = 2 + 3$).
  - `X == Y`: **Giống hệt cấu trúc (Identical)**. Kiểm tra xem hai term có giống nhau tuyệt đối từng ký tự không, KHÔNG liên kết biến (`X == 2` $\implies \text{false}$ nếu $X$ chưa có giá trị).
  - `X is Expr`: **Tính toán số học (Arithmetic Evaluation)**. Bắt buộc tính ra giá trị số học của `Expr` bên phải, rồi gán kết quả đó cho `X` (`X is 2 + 3` $\implies X = 5$).
  - `Expr1 =:= Expr2`: **So sánh giá trị số (Arithmetic Equality)**. Tính toán trị số cả hai bên rồi so sánh bằng (`2 + 3 =:= 1 + 4` $\implies \text{true}$).

### Flashcard 5: Naive Reverse ($O(N^2)$) vs Fast Reverse ($O(N)$)
- **Mặt trước:** Tại sao thuật toán đảo danh sách ngây thơ `nrev` tốn $\mathcal{O}(N^2)$ trong khi dùng Accumulator `accrev` chỉ tốn $\mathcal{O}(N)$?
- **Mặt sau:**
  - `nrev` sau khi đệ quy đảo đuôi $T$ (độ dài $N-1$) thì gọi `append(RT, [H], R)`. Thuật toán `append` phải duyệt từ đầu đến cuối danh sách thứ nhất (tốn $N-1$ bước). Tổng chi phí: $\sum_{i=1}^{N-1} i = \frac{N(N-1)}{2} = \mathcal{O}(N^2)$.
  - `accrev` dùng biến tích lũy `Acc` như một Stack: mỗi bước bốc phần tử đầu $H$ gắn vào đầu `Acc` (`[H | Acc]`), đây là thao tác $O(1)$. Danh sách $N$ phần tử chỉ cần $N$ bước chuyển: $T(N) = \mathcal{O}(N)$.

---

## 3. Các Bảng So Sánh Đa Chiều Nền Tảng (Comprehensive Comparison Tables)

### Bảng 1: Bảng Ma Trận Toán Tử So Sánh & Tính Toán Trong PROLOG

| Toán tử | Tên gọi chuẩn | Ràng buộc Biến tự do? | Ép tính toán số học? | Ví dụ kiểm tra | Kết quả trả về |
|---|---|---|---|---|---|
| `=` | Unification | **CÓ** (Liên kết biến tự do) | **KHÔNG** | `X = 3 + 2` | `X = 3 + 2` |
| `\=` | Not Unifiable | KHÔNG | KHÔNG | `a \= b` | `true` |
| `==` | Structural Identical | KHÔNG (Chỉ kiểm tra hình thức) | KHÔNG | `X == Y` (biến tự do) | `false` |
| `\==` | Structural Not Identical | KHÔNG | KHÔNG | `a(X) \== a(Y)` | `true` |
| `is` | Arithmetic Evaluate | **CÓ** (Gán kết quả số cho biến) | **CÓ** (Bắt buộc vế phải) | `X is 3 + 2` | `X = 5` |
| `=:=` | Arithmetic Equal | KHÔNG | **CÓ** (Cả hai vế) | `3 + 2 =:= 1 + 4` | `true` |
| `=\=` | Arithmetic Not Equal | KHÔNG | **CÓ** (Cả hai vế) | `3 + 2 =\= 6` | `true` |
| `<`, `>`, `=<`, `>=` | Numeric Relations | KHÔNG | **CÓ** (Cả hai vế) | `3 =< 5` | `true` |

---

### Bảng 2: So Sánh Green Cut vs Red Cut

| Tiêu chí | Green Cut (Vết cắt xanh) | Red Cut (Vết cắt đỏ) |
|---|---|---|
| **Mục đích sử dụng** | Tối ưu hóa hiệu năng, giải phóng bộ nhớ Stack khi đã có nghiệm duy nhất. | Điều khiển luồng rẽ nhánh, thay thế cấu trúc `if-then-else` và loại trừ trường hợp. |
| **Ảnh hưởng ngữ nghĩa logic** | **KHÔNG** làm thay đổi tập nghiệm của chương trình. | **CÓ** làm thay đổi tập nghiệm và ngữ nghĩa khai báo của chương trình. |
| **Hậu quả khi xóa bỏ `!`** | Chương trình chạy chậm hơn nhưng kết quả trả về **vẫn hoàn toàn đúng**. | Chương trình chạy sai logic, sinh thêm các **nghiệm rác (false solutions)**. |
| **Mức độ phụ thuộc thứ tự** | Thấp hơn; logic bài toán vẫn được bảo toàn bởi các điều kiện tường minh. | Cực cao; các mệnh đề phía dưới phụ thuộc hoàn toàn vào việc Cut đã chặn trường hợp trên. |
| **Ví dụ minh họa** | `member(X, [X\|_]) :- !.`<br>`member(X, [_\|T]) :- member(X, T).` | `max(X, Y, X) :- X >= Y, !.`<br>`max(_, Y, Y).` *(Bỏ điều kiện $X < Y$ ở dòng 2)* |

---

### Bảng 3: So Sánh Phủ Định Cổ Điển ($\neg$) vs Phủ Định Thất Bại (NAF `\+`)

| Tiêu chí | Phủ Định Cổ Điển (Classical Negation $\neg$) | Phủ Định Dưới Dạng Thất Bại (NAF `\+`) |
|---|---|---|
| **Nền tảng lý thuyết** | Logic toán học vị từ bậc nhất (FOL / PL1). | Lập trình logic, Giả định Thế giới Đóng (CWA). |
| **Bản chất ý nghĩa** | Mệnh đề $\neg P$ là **chân lý khách quan** được chứng minh là sai trong mọi mô hình. | Hệ thống **không thể tìm thấy chứng minh** cho $P$ từ các dữ kiện hiện có trong KB. |
| **Xử lý khi thiếu thông tin** | Giữ trạng thái Chưa xác định (Unknown). | Tự động kết luận khẳng định phủ định là **ĐÚNG** (`true`). |
| **Tính đơn điệu** | Có tính đơn điệu (Monotonic): Thêm dữ kiện không làm mất chân lý cũ. | Phi đơn điệu (Non-monotonic): Thêm một Fact mới có thể làm câu phủ định cũ từ `true` biến thành `false`. |
| **Nguy cơ sai lệch** | Không có (Hoàn toàn chính xác toán học). | Dễ đưa ra kết luận vội vã sai lầm nếu cơ sở dữ liệu bị khuyết thiếu. |

---

## 4. Bẫy Thi Cử & Những Sai Lầm Chết Người (Deadly Exam Traps)

1. **Bẫy 1: Quên dấu ngoặc vuông khi lấy Tail của danh sách 1 phần tử.**
   - *Sai lầm:* `?- [X1, X2 | Tail] = [a, b, c].` $\implies$ viết $Tail = c$.
   - *Sự thật chuẩn A+:* Phần Tail luôn luôn là một danh sách: $Tail = [c]$.
2. **Bẫy 2: Viết phép gán số học bằng dấu bằng `=` thay vì `is`.**
   - *Sai lầm:* Viết `N = N0 + 1` trong thân hàm đệ quy đếm độ dài danh sách.
   - *Sự thật chuẩn A+:* `N = N0 + 1` chỉ liên kết $N$ với Term cấu trúc `+(N0, 1)`, không tính toán ra số! Bắt buộc phải viết `N is N0 + 1`.
3. **Bẫy 3: Đặt toán tử Cut trước phép kiểm tra điều kiện (Guard).**
   - *Sai lầm:* Viết `max(X, Y, X) :- !, X >= Y.`
   - *Sự thật chuẩn A+:* Khi gặp `!`, Prolog cam kết chọn luôn luật này trước khi kiểm tra $X \ge Y$. Nếu điều kiện $X \ge Y$ sai, toàn bộ truy vấn trả về `false.` thay vì thử trường hợp $Y > X$!
4. **Bẫy 4: Viết biến tự do trong biểu thức bên phải của `is`.**
   - *Sai lầm:* `?- 5 is X + 2.` để giải phương trình tìm $X$.
   - *Sự thật chuẩn A+:* Toán tử `is` **không phải là bộ giải phương trình**. Tất cả các biến ở vế phải bắt buộc phải được liên kết giá trị số cụ thể trước khi gọi `is`, nếu không Prolog sẽ báo lỗi ngay lập tức: `ERROR: Arguments are not sufficiently instantiated`.

---

## 5. Động Từ Chỉ Lệnh Phòng Thi & Chiến Thuật Trả Lời (Action Verbs Guide)

| Động từ đề thi | Yêu cầu hành động chuẩn A+ | Cấu trúc câu trả lời tối ưu |
|---|---|---|
| **Trace the execution...** | Ghi lại từng bước gọi hàm (Call), thoát thành công (Exit), thất bại (Fail), và quay lui (Redo) theo mô hình 4-port box model. | Liệt kê tuần tự từng port cùng giá trị biến ràng buộc cụ thể tại từng bước thời gian. |
| **Draw the complete SLD search tree...** | Vẽ cây tìm kiếm đầy đủ: Gốc là truy vấn, các nút là danh sách Subgoals, ghi rõ nhãn Clause và phép thế $\theta$, đánh dấu lá `[]` và `fail`. | Vẽ sơ đồ cây phân nhánh rõ ràng $\rightarrow$ Liệt kê các bộ nghiệm tương ứng với các lá `[]` $\rightarrow$ Nêu rõ điểm quay lui. |
| **List all solutions in chronological order...** | Liệt kê các nghiệm theo đúng thứ tự duyệt DFS (từ trái qua phải của cây tìm kiếm). | Ghi rõ từng nghiệm kết thúc bằng dấu chấm phẩy `;` và nghiệm cuối cùng kết thúc bằng dấu chấm `.`. |
| **Explain why it causes an infinite loop...** | Chỉ rõ nhánh con nào trên cây tìm kiếm có độ sâu vô tận mà không có điểm dừng Base case. | 1. Dẫn dắt luật gây lỗi $\rightarrow$ 2. Mô phỏng 2 chu kỳ đệ quy đầu tiên chứng minh trạng thái lặp lại $\rightarrow$ 3. Kết luận lỗi tràn Stack. |

---

## 6. Bảng Kiểm Năng Lực Trước Giờ Thi (Pre-Exam Competency Checklist)

- [ ] Tôi giải thích được công thức Kowalski $\text{Algorithm} = \text{Logic} + \text{Control}$ và phân biệt được Declarative vs Procedural semantics.
- [ ] Tôi Unification thuần thục các cấu trúc danh sách lồng nhau phức tạp và không bao giờ quên dấu `[...]` cho Tail.
- [ ] Tôi vẽ được cây tìm kiếm SLD hoàn chỉnh có đánh nhãn đầy đủ cho các truy vấn có quay lui Backtracking.
- [ ] Tôi nhận diện được lỗi **Left-Recursion** và lỗi **Luật đối xứng (Symmetry Rule)** và biết cách sửa bằng cách tách Fact/Rule.
- [ ] Tôi phân biệt được bản chất giữa **Green Cut** và **Red Cut**, và giải thích được cạm bẫy Head Unification trước Cut.
- [ ] Tôi giải thích được cơ chế hoạt động của **Negation as Failure (`\+`)** thông qua cặp bài trùng `!` và `fail`.
- [ ] Tôi chứng minh được tại sao `nrev` tốn $\mathcal{O}(N^2)$ và viết được `accrev` tối ưu $\mathcal{O}(N)$ dùng biến tích lũy Accumulator.
- [ ] Tôi sử dụng chuẩn xác không nhầm lẫn giữa `=`, `==`, `is`, và `=:=`.
