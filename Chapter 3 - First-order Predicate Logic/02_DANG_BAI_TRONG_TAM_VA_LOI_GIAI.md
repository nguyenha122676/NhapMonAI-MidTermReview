# Chapter 3 – Dạng Bài Trọng Tâm Và Lời Giải Mẫu Chi Tiết
## Cẩm Nang Thực Chiến Đạt Điểm Tuyệt Đối (Chuẩn A+)

> **Môn học:** Nhập môn Trí tuệ Nhân tạo (Introduction to Artificial Intelligence - MAT1206E / MAT3508)  
> **Nguồn bài tập:** Toàn bộ Exercises 3.1 – 3.9 trong giáo trình *Wolfgang Ertel 2025*, slide bài giảng của TS. Hoàng Anh Đức, các tệp thực nghiệm TPTP (`family_tree_3_1.p`, `russell_3_7.p`) và 6 bộ đề thi lưu trữ.  
> **Ngày cập nhật:** 23/10/2026

---

## Bảng Ma Trận Các Dạng Bài Thi Giữa Kỳ – Chapter 3

| Dạng bài | Tên dạng bài toán | Xác suất xuất hiện | Độ phức tạp |
| :---: | :--- | :---: | :---: |
| **Dạng 1** | Biểu diễn ngôn ngữ tự nhiên sang PL1 (Formalization) | **Rất cao (95%)** | Cơ bản – Trung bình |
| **Dạng 2** | Chuẩn hóa công thức PL1 sang dạng Clause / CNF (Skolemization) | **Rất cao (90%)** | Trung bình |
| **Dạng 3** | Thuật toán Hợp nhất (Unification) & Phát hiện Occurs-Check | **Rất cao (95%)** | Trung bình |
| **Dạng 4** | Chứng minh phản chứng bằng Hợp giải tổng quát (FOL Resolution) | **Cao (85%)** | Trung bình – Khó |
| **Dạng 5** | Biểu diễn bài toán theo định dạng chuẩn TPTP cho ATPs | **Bổ trợ (50%)** | Cơ bản |

---

## DẠNG 1: BIỂU DIỄN NGÔN NGỮ TỰ NHIÊN SANG PL1 (FORMALIZATION)

### 1.1. Hai quy tắc vàng sống còn tránh mất điểm
Sinh viên thường xuyên mắc sai lầm nghiêm trọng khi chọn toán tử liên kết đi cùng lượng từ:

> [!WARNING]
> 1. **Lượng từ toàn thể $\forall$ luôn đi cùng phép kéo theo $\Rightarrow$:**
>    - *"Mọi sinh viên đều chăm chỉ"*:
>      $$\text{ĐÚNG: } \forall x (\text{Student}(x) \Rightarrow \text{HardWorking}(x))$$
>      $$\text{SAI CỐT TỬ: } \forall x (\text{Student}(x) \land \text{HardWorking}(x))$$
>      *(Nếu dùng $\land$, câu này có nghĩa là "Mọi vật trong vũ trụ đều là sinh viên VÀ đều chăm chỉ" - sai hoàn toàn!)*
> 
> 2. **Lượng từ tồn tại $\exists$ luôn đi cùng phép hội $\land$:**
>    - *"Có một sinh viên chăm chỉ"*:
>      $$\text{ĐÚNG: } \exists x (\text{Student}(x) \land \text{HardWorking}(x))$$
>      $$\text{SAI CỐT TỬ: } \exists x (\text{Student}(x) \Rightarrow \text{HardWorking}(x))$$
>      *(Nếu dùng $\Rightarrow$, chỉ cần tồn tại một vật KHÔNG PHẢI là sinh viên (ví dụ một chiếc bàn: $\text{Student}(\text{bàn}) = \text{False}$), thì mệnh đề kéo theo hiển nhiên nhận giá trị True - vô nghĩa!)*

---

### 1.2. Các bài tập mẫu có lời giải chi tiết

#### Bài 1.1 (Cạm bẫy đảo thứ tự lượng từ $\forall \exists$ vs $\exists \forall$)
**Đề bài:** Hãy viết công thức PL1 cho hai phát biểu sau và giải thích sự khác biệt ngữ nghĩa:
1. Phát biểu A: *"Mọi sinh viên đều học ít nhất một môn học"*.
2. Phát biểu B: *"Có một môn học mà tất cả sinh viên đều học"*.

**Lời giải:**
Đặt các vị từ: $\text{Student}(x)$ ("$x$ là sinh viên"), $\text{Course}(y)$ ("$y$ là môn học"), $\text{Takes}(x, y)$ ("$x$ học môn $y$").

1. **Phát biểu A:** Với mỗi sinh viên $x$, luôn tìm được môn $y$ tương ứng:
   $$\forall x \Big( \text{Student}(x) \Rightarrow \exists y \big( \text{Course}(y) \land \text{Takes}(x, y) \big) \Big)$$
2. **Phát biểu B:** Tồn tại một môn học $y$ cụ thể chung cho toàn bộ sinh viên:
   $$\exists y \Big( \text{Course}(y) \land \forall x \big( \text{Student}(x) \Rightarrow \text{Takes}(x, y) \big) \Big)$$
3. **Phân tích ngữ nghĩa:**
   - Trong phát biểu A, môn $y$ phụ thuộc vào sinh viên $x$ (mỗi sinh viên có thể học các môn hoàn toàn khác nhau). Khi Skolem hóa, $y$ trở thành hàm $f(x)$.
   - Trong phát biểu B, môn $y$ là duy nhất độc lập cho tất cả mọi người (ví dụ môn Triết học hay Nhập môn AI). Khi Skolem hóa, $y$ là một hằng số $c$.

---

#### Bài 1.2 (Biểu diễn quan hệ xã hội phức tạp - Ertel Exercise 3.1)
**Đề bài:** Formalize các câu sau sang PL1:
1. *"Không có ai thích tất cả mọi người"*.
2. *"Mỗi người đều có một người mà họ không thích"*.
3. *"Người nào chỉ cạo đầu cho những ai không tự cạo đầu thì không tồn tại"*.

**Lời giải:**
Đặt vị từ: $\text{Person}(x)$, $\text{Likes}(x, y)$, $\text{Shaves}(x, y)$.
1. **Câu 1:** $\neg \exists x \Big( \text{Person}(x) \land \forall y \big( \text{Person}(y) \Rightarrow \text{Likes}(x, y) \big) \Big)$  
   *(Tương đương: $\forall x \big( \text{Person}(x) \Rightarrow \exists y (\text{Person}(y) \land \neg \text{Likes}(x, y)) \big)$)*.
2. **Câu 2:** $\forall x \Big( \text{Person}(x) \Rightarrow \exists y \big( \text{Person}(y) \land \neg \text{Likes}(x, y) \big) \Big)$.
3. **Câu 3:** $\neg \exists b \Big( \forall x \big( \text{Shaves}(b, x) \Leftrightarrow \neg \text{Shaves}(x, x) \big) \Big)$ (Nghịch lý Thợ cạo Russell).

---

## DẠNG 2: CHUẨN HÓA CÔNG THỨC PL1 SANG DẠNG MỆNH ĐỀ CNF (SKOLEMIZATION)

### 2.1. Quy trình chuẩn hóa 6 bước
1. **Bước 1 (Khử $\Leftrightarrow$ và $\Rightarrow$):** Thay $A \Rightarrow B$ bằng $\neg A \lor B$.
2. **Bước 2 (Đẩy $\neg$ vào sát vị từ):** Sử dụng De Morgan và đổi lượng từ:
   $$\neg \forall x \, \varphi \ \equiv \ \exists x \, \neg \varphi, \qquad \neg \exists x \, \varphi \ \equiv \ \forall x \, \neg \varphi$$
3. **Bước 3 (Chuẩn hóa tên biến - Standardize Variables Apart):** Đổi tên biến để mỗi lượng từ sở hữu một tên biến riêng biệt, tránh trùng lặp.
4. **Bước 4 (Đưa về Dạng chuẩn tiền tố - Prenex Normal Form):** Đẩy toàn bộ lượng từ ra đầu công thức.
5. **Bước 5 (Skolem hóa - Skolemization):**
   - Loại bỏ lượng từ $\exists y$:
     - Nếu phía trước $\exists y$ không có lượng từ $\forall$ nào $\implies$ thay $y$ bằng **Hằng Skolem** $c$.
     - Nếu phía trước $\exists y$ có các lượng từ $\forall x_1, \dots, \forall x_k$ $\implies$ thay $y$ bằng **Hàm Skolem** $f(x_1, \dots, x_k)$.
6. **Bước 6 (Bỏ $\forall$ và phân phối về CNF):** Xóa bỏ toàn bộ ký hiệu $\forall$, dùng luật phân phối của $\lor$ qua $\land$ để tách thành các clause độc lập.

---

### 2.2. Các bài tập mẫu có lời giải chi tiết

#### Bài 2.1 (Skolem hóa công thức nhiều lượng từ đan xen)
**Đề bài:** Chuyển công thức sau sang dạng chuẩn mệnh đề CNF:
$$\Phi = \forall x \exists y \forall z \exists w \, \Big( \neg P(x, y) \lor \big( Q(x, z) \Rightarrow R(x, y, w) \big) \Big)$$

**Lời giải:**
1. Khử phép kéo theo bên trong phần thân:
   $$Q(x, z) \Rightarrow R(x, y, w) \ \equiv \ \neg Q(x, z) \lor R(x, y, w)$$
   Công thức ở dạng PNF sẵn:
   $$\Phi = \forall x \exists y \forall z \exists w \, \Big( \neg P(x, y) \lor \neg Q(x, z) \lor R(x, y, w) \Big)$$
2. **Tiến hành Skolem hóa:**
   - Lượng từ $\exists y$ đứng sau $\forall x \implies$ thay biến $y$ bằng hàm Skolem $f(x)$.
   - Lượng từ $\exists w$ đứng sau cả $\forall x$ và $\forall z \implies$ thay biến $w$ bằng hàm Skolem 2 biến $g(x, z)$.
3. Loại bỏ các lượng từ toàn thể $\forall x, \forall z$:
   $$\Phi_{\text{CNF}} = \neg P(x, f(x)) \lor \neg Q(x, z) \lor R(x, f(x), g(x, z))$$
4. **Kết luận:** Thu được duy nhất 1 clause với 3 literals.

---

#### Bài 2.2 (Chuyển đổi toàn diện công thức phức tạp)
**Đề bài:** Đưa công thức sau về dạng các clause CNF:
$$\Psi = \forall x \Big( \exists y \, P(x, y) \implies \forall z \, Q(x, z) \Big)$$

**Lời giải:**
1. Khử phép kéo theo chính:
   $$\Psi \equiv \forall x \Big( \neg \big( \exists y \, P(x, y) \big) \lor \forall z \, Q(x, z) \Big)$$
2. Đẩy phủ định vào trong (lượng từ $\exists y$ biến thành $\forall y$):
   $$\Psi \equiv \forall x \Big( \forall y \, \neg P(x, y) \lor \forall z \, Q(x, z) \Big)$$
3. Đưa các lượng từ ra đầu để tạo PNF:
   $$\Psi \equiv \forall x \forall y \forall z \, \Big( \neg P(x, y) \lor Q(x, z) \Big)$$
4. Không có lượng từ $\exists$ nào, do đó không cần Skolem hóa! Lược bỏ toàn bộ $\forall$:
   $$\Psi_{\text{CNF}} = \neg P(x, y) \lor Q(x, z)$$

---

## DẠNG 3: THUẬT TOÁN HỢP NHẤT (UNIFICATION) & TÌM MGU

### 3.1. Phương pháp giải theo Tập bất đồng (Disagreement Set)
- Duyệt đồng thời các biểu thức từ trái sang phải.
- Khi gặp vị trí khác nhau đầu tiên, trích xuất hai biểu thức con tạo thành tập bất đồng $D = \{t_1, t_2\}$.
- Một trong hai biểu thức bắt buộc phải là một biến (ví dụ biến $v$), và biểu thức kia là một hạng thức $t$.
- **Kiểm tra Occurs-Check:** Nếu biến $v$ xuất hiện bên trong $t$ $\implies$ **DỪNG, THẤT BẠI (Not Unifiable)!**
- Nếu hợp lệ: Cập nhật phép thế $\sigma = \sigma \circ \{v / t\}$, áp dụng phép thế lên toàn bộ các biểu thức và lặp lại cho đến khi các biểu thức đồng nhất hoàn toàn.

---

### 3.2. Các bài tập mẫu có lời giải chi tiết

#### Bài 3.1 (Tìm MGU thành công từng bước)
**Đề bài:** Tìm Most General Unifier (MGU) của hai biểu thức:
$$E_1 = P(x, \ f(y), \ a), \qquad E_2 = P(g(z), \ f(b), \ w)$$

**Lời giải:**
1. Khởi tạo: $\sigma_0 = \epsilon$ (phép thế rỗng).
2. **Bước 1:** Quét từ trái sang phải:
   - Cùng vị từ $P$, kiểm tra đối số thứ nhất: $x$ và $g(z)$.
   - Tập bất đồng $D_1 = \{x, g(z)\}$.
   - Biến $x$ không xuất hiện trong $g(z)$ (Occurs check thỏa mãn).
   - Phép thế 1: $\sigma_1 = \{x / g(z)\}$.
   - Áp dụng $\sigma_1$:
     $$E_1' = P(g(z), f(y), a), \qquad E_2' = P(g(z), f(b), w)$$
3. **Bước 2:** Quét tiếp đến đối số thứ hai:
   - Cùng ký hiệu hàm $f$, đi sâu vào đối số của hàm: $y$ và $b$.
   - Tập bất đồng $D_2 = \{y, b\}$.
   - Biến $y$ không xuất hiện trong $b$ (hợp lệ).
   - Phép thế 2: $\sigma_2 = \sigma_1 \circ \{y / b\} = \{x / g(z), \ y / b\}$.
   - Áp dụng:
     $$E_1'' = P(g(z), f(b), a), \qquad E_2'' = P(g(z), f(b), w)$$
4. **Bước 3:** Quét đến đối số thứ ba:
   - Đối số là $a$ và $w$.
   - Tập bất đồng $D_3 = \{w, a\}$.
   - Biến $w$ không xuất hiện trong $a$ (hợp lệ).
   - Phép thế 3: $\sigma_3 = \sigma_2 \circ \{w / a\} = \{x / g(z), \ y / b, \ w / a\}$.
5. **Kết luận:** Hai biểu thức trở nên giống hệt nhau:
   $$E_1''' = E_2''' = P(g(z), f(b), a)$$
   MGU thu được là: $\sigma = \{x / g(z), \ y / b, \ w / a\}$.

---

#### Bài 3.2 (Các trường hợp Unification thất bại – Bẫy đề thi)
**Đề bài:** Hãy giải thích tại sao các cặp biểu thức sau không thể hợp nhất (Not Unifiable):
1. $E_1 = P(a), \quad E_2 = P(b)$
2. $E_1 = P(x, x), \quad E_2 = P(y, f(y))$
3. $E_1 = Q(f(x)), \quad E_2 = Q(g(x))$

**Lời giải:**
1. **Trường hợp 1:** Tập bất đồng $D = \{a, b\}$. Cả hai đều là hằng số khác nhau (Constant Clash), không có biến nào để gán $\implies$ **Thất bại!**
2. **Trường hợp 2:** 
   - Đối số 1: $x$ và $y \implies$ gán $\{x / y\}$. Biểu thức trở thành: $E_1' = P(y, y)$ và $E_2' = P(y, f(y))$.
   - Đối số 2: Tập bất đồng $D = \{y, f(y)\}$.
   - Kiểm tra Occurs-Check: Biến $y$ **xuất hiện bên trong** hạng thức $f(y)$!
   - Nếu cho phép gán sẽ sinh cấu trúc vô hạn $y = f(f(f(\dots)))$ $\implies$ **Thất bại do vi phạm Occurs Check!**
3. **Trường hợp 3:** Tập bất đồng $D = \{f(x), g(x)\}$. Cả hai đều là ký hiệu hàm nhưng khác tên ($f \neq g$) (Function Clash) $\implies$ **Thất bại!**

---

## DẠNG 4: CHỨNG MINH PHẢN CHỨNG BẰNG HỢP GIẢI TỔNG QUÁT (FOL RESOLUTION)

### Bài 4.1 (Tam đoạn luận Aristoteles kinh điển)
**Đề bài:** Cho hai tiền đề:
1. *"Mọi người đều phải chết"*
2. *"Socrates là một con người"*
Hãy dùng Hợp giải trong PL1 chứng minh rằng: *"Socrates phải chết"*.

**Lời giải:**
1. **Hình thức hóa:**
   - $P_1: \forall x (\text{Human}(x) \Rightarrow \text{Mortal}(x))$
   - $P_2: \text{Human}(\text{socrates})$
   - Kết luận cần chứng minh: $Q: \text{Mortal}(\text{socrates})$
2. **Phủ định kết luận và chuyển sang CNF:**
   - Phủ định truy vấn: $\neg \text{Mortal}(\text{socrates})$
   - $P_1$ chuyển thành clause: $\neg \text{Human}(x) \lor \text{Mortal}(x)$
   - Danh sách các clause:
     - $(1) \ \neg \text{Human}(x) \lor \text{Mortal}(x)$
     - $(2) \ \text{Human}(\text{socrates})$
     - $(3) \ \neg \text{Mortal}(\text{socrates})$
3. **Các bước hợp giải:**
   - Hợp giải clause (1) và (2):
     - MGU hợp nhất $\text{Human}(x)$ và $\text{Human}(\text{socrates})$ là $\sigma_1 = \{x / \text{socrates}\}$.
     - Resolvent sinh ra: $(4) \ \text{Mortal}(\text{socrates})$.
   - Hợp giải clause (3) và (4):
     - Hai literal đối ngẫu $\neg \text{Mortal}(\text{socrates})$ và $\text{Mortal}(\text{socrates})$ triệt tiêu nhau hoàn toàn với MGU rỗng $\epsilon$.
     - Sinh ra: $(5) \ \square$ (mệnh đề rỗng).
4. **Kết luận:** Đã dẫn xuất được mâu thuẫn $\square$, chứng tỏ Socrates chắc chắn phải chết.

---

### Bài 4.2 (Nghịch lý Thợ cạo Russell – Bắt buộc dùng Factorization)
**Đề bài:** Cho phát biểu: *"Tồn tại một người thợ cạo cạo đầu cho những ai và chỉ những ai không tự cạo đầu"*. Dùng hệ hợp giải chứng minh phát biểu này là mâu thuẫn (không thể tồn tại một người như vậy).

**Lời giải:**
1. **Hình thức hóa phát biểu:**
   $$\Phi = \exists b \forall x \Big( \text{Shaves}(b, x) \Leftrightarrow \neg \text{Shaves}(x, x) \Big)$$
   Để chứng minh không thể tồn tại, ta chỉ cần chứng minh rằng chính công thức $\Phi$ là không thỏa được ($\Phi \vdash \square$).
2. **Skolem hóa và chuyển sang CNF:**
   - Biến $b$ đứng đầu (không phụ thuộc $\forall$) $\implies$ thay $b$ bằng hằng Skolem $\text{barber}$.
   - Khử $\Leftrightarrow$ thành 2 mệnh đề:
     - $(1) \ \neg \text{Shaves}(\text{barber}, x) \lor \neg \text{Shaves}(x, x)$
     - $(2) \ \text{Shaves}(\text{barber}, y) \lor \text{Shaves}(y, y)$ *(đã đổi tên biến thành $y$)*
3. **Áp dụng Luật Thừa số hóa (Factorization):**
   - Trên clause (1): Hợp nhất $\text{Shaves}(\text{barber}, x)$ và $\text{Shaves}(x, x)$ với MGU $\sigma_1 = \{x / \text{barber}\}$.
     Rút gọn thành:
     $$(3) \ \neg \text{Shaves}(\text{barber}, \text{barber})$$
   - Trên clause (2): Hợp nhất $\text{Shaves}(\text{barber}, y)$ và $\text{Shaves}(y, y)$ với MGU $\sigma_2 = \{y / \text{barber}\}$.
     Rút gọn thành:
     $$(4) \ \text{Shaves}(\text{barber}, \text{barber})$$
4. **Hợp giải trực tiếp:**
   - $\text{Res}(3, 4)$ triệt tiêu hoàn toàn với $\sigma = \epsilon \implies (5) \ \square$ (Mệnh đề rỗng).
5. **Kết luận:** Suy ra điều mâu thuẫn. Không thể tồn tại người thợ cạo như vậy!

---

## DẠNG 5: BIỂU DIỄN BÀI TOÁN THEO ĐỊNH DẠNG CHUẨN TPTP CHO ATPS

### 5.1. Giới thiệu định dạng TPTP (Thousands of Problems for Theorem Provers)
TPTP là chuẩn quốc tế để biểu diễn các bài toán suy luận tự động cho các bộ Prover như E Prover, Vampire, Prover9:
- Cú pháp một dòng tiên đề (Axiom):
  `fof(tên_tiên_đề, axiom, công_thức).`
- Cú pháp một câu kết luận cần chứng minh (Conjecture):
  `fof(tên_mục_tiêu, conjecture, công_thức).`
- Các ký hiệu trong TPTP:
  - `!` là lượng từ $\forall$ (Universal)
  - `?` là lượng từ $\exists$ (Existential)
  - `&` là phép hội $\land$
  - `|` là phép tuyển $\lor$
  - `~` là phủ định $\neg$
  - `=>` là phép kéo theo
  - `<=>` là tương đương

### 5.2. Ví dụ mã TPTP cho Tam đoạn luận Aristoteles (`socrates.p`)
```tptp
% Tiên đề 1: Mọi người đều phải chết
fof(all_men_mortal, axiom,
    ![X]: ( human(X) => mortal(X) )
).

% Tiên đề 2: Socrates là một con người
fof(socrates_is_human, axiom,
    human(socrates)
).

% Mục tiêu chứng minh: Socrates phải chết
fof(socrates_is_mortal, conjecture,
    mortal(socrates)
).
```
Khi chạy qua E Prover: `eprover --auto socrates.p`, bộ giải sẽ tự động phủ định conjecture, Skolem hóa, tìm MGU và in ra `SZS status Theorem` (Chứng minh thành công!).
