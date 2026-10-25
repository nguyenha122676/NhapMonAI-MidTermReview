# Chapter 3 – Khái Niệm Bắt Buộc Học Thuộc & Từ Điển Song Ngữ
## Cẩm Nang Ghi Nhớ Nhanh Đạt Điểm A+ (Flashcards & Lexicon)

> **Môn học:** Nhập môn Trí tuệ Nhân tạo (Introduction to Artificial Intelligence - MAT1206E / MAT3508)  
> **Nguồn chuẩn hóa:** Slide bài giảng TS. Hoàng Anh Đức, giáo trình *Wolfgang Ertel (2025)*, *Russell & Norvig (2021)*.  
> **Quy chuẩn hiển thị:** 100% thuật ngữ quan trọng đều có định dạng song ngữ chuẩn `Tiếng Việt (English Term)` để phục vụ cả đề thi tiếng Việt và tiếng Anh.  
> **Ngày cập nhật:** 23/10/2026

---

## 1. Từ Điển Thuật Ngữ Cốt Lõi Song Ngữ (Comprehensive Bilingual Lexicon)

| STT | Thuật ngữ Tiếng Việt | Thuật ngữ Tiếng Anh | Định nghĩa / Ý nghĩa kỹ thuật |
| :---: | :--- | :--- | :--- |
| **1** | Logic vị từ bậc nhất | **First-Order Predicate Logic (PL1 / FOL)** | Hệ logic mở rộng của PL0, bổ sung đối tượng, hàm, vị từ và lượng từ $\forall, \exists$. |
| **2** | Miền biện luận | **Universe of discourse / Domain ($\mathcal{U}$)** | Tập hợp các thực thể cụ thể trong thế giới thực mà các biến nhận giá trị. |
| **3** | Hạng thức | **Term** | Biểu thức cú pháp đại diện cho một đối tượng (biến, hằng hoặc hàm bao bọc term). |
| **4** | Hạng thức nguyên tử | **Atomic term** | Hạng thức chỉ gồm một biến hoặc một hằng số đơn lẻ (ví dụ $x, c$). |
| **5** | Hạng thức phức hợp | **Complex term** | Hạng thức được tạo bằng cách áp dụng một ký hiệu hàm lên các hạng thức con (ví dụ $f(x, a)$). |
| **6** | Hạng thức đóng | **Ground term** | Hạng thức hoàn toàn không chứa bất kỳ biến số nào (ví dụ $f(a, b)$). |
| **7** | Ký hiệu hàm | **Function symbol** | Ký hiệu nhận $n$ đối tượng đầu vào và trả về một đối tượng khác; KHÔNG trả về True/False! |
| **8** | Ký hiệu vị từ | **Predicate symbol** | Quan hệ nhận $n$ đối tượng đầu vào và trả về giá trị chân trị True hoặc False. |
| **9** | Công thức nguyên tử | **Atomic formula / Atom** | Một ký hiệu vị từ áp dụng lên các hạng thức, ví dụ $P(t_1, \dots, t_n)$ hay $x = y$. |
| **10** | Lượng từ toàn thể | **Universal quantifier ($\forall$)** | Ký hiệu phát biểu tính đúng đắn cho mọi đối tượng trong miền biện luận: "với mọi". |
| **11** | Lượng từ tồn tại | **Existential quantifier ($\exists$)** | Ký hiệu phát biểu sự tồn tại của ít nhất một đối tượng thỏa mãn tính chất: "tồn tại". |
| **12** | Phạm vi lượng từ | **Scope of quantifier** | Phân vùng công thức con chịu sự chi phối trực tiếp của một lượng từ. |
| **13** | Biến ràng buộc | **Bound variable** | Biến số xuất hiện bên trong phạm vi của một lượng từ cùng tên. |
| **14** | Biến tự do | **Free variable** | Biến số xuất hiện trong công thức nhưng không bị lượng từ nào cùng tên bao bọc. |
| **15** | Câu / Công thức đóng | **Sentence / Closed formula** | Công thức hoàn toàn không chứa biến tự do nào; có thể đánh giá chân trị tuyệt đối. |
| **16** | Cấu trúc ngữ nghĩa | **Structure $\mathcal{M} = (\mathcal{U}, \mathcal{I})$** | Một miền biện luận $\mathcal{U}$ kết hợp cùng hàm giải thích $\mathcal{I}$ gán ý nghĩa thực tế. |
| **17** | Phép gán biến | **Variable assignment ($\alpha$)** | Ánh xạ gán mỗi biến tự do vào một phần tử cụ thể trong miền biện luận $\mathcal{U}$. |
| **18** | Mô hình | **Model** | Cấu trúc ngữ nghĩa làm cho công thức nhận giá trị đúng dưới mọi phép gán biến. |
| **19** | Phép thế | **Substitution ($\sigma$)** | Tập hữu hạn các cặp thay thế biến bằng hạng thức: $\{x_1 / t_1, \dots, x_n / t_n\}$. |
| **20** | Bắt biến | **Variable capture** | Hiện tượng lỗi khi thế hạng thức chứa biến vào phạm vi lượng từ làm biến tự do bị ràng buộc sai. |
| **21** | Dạng chuẩn tiền tố | **Prenex Normal Form (PNF)** | Dạng chuẩn có toàn bộ lượng từ đứng ở đầu (Prefix) và phần thân không chứa lượng từ (Matrix). |
| **22** | Tiền tố | **Prefix** | Chuỗi các lượng từ $Q_1 x_1 \dots Q_n x_n$ đứng ở đầu công thức PNF. |
| **23** | Phần thân | **Matrix** | Phần công thức thuần túy đại số mệnh đề nằm sau Prefix trong công thức PNF. |
| **24** | Skolem hóa | **Skolemization** | Kỹ thuật loại bỏ hoàn toàn các lượng từ tồn tại $\exists$ bằng cách thay bằng hằng hoặc hàm Skolem. |
| **25** | Hằng Skolem | **Skolem constant** | Hằng số mới dùng thay thế biến $\exists$ khi phía trước nó không có lượng từ $\forall$ nào. |
| **26** | Hàm Skolem | **Skolem function** | Ký hiệu hàm mới dùng thay thế biến $\exists$ phụ thuộc vào các biến $\forall$ bao quanh nó. |
| **27** | Bảo toàn tính thỏa được | **Equisatisfiability** | Hai công thức có thể không tương đương ($\not\equiv$) nhưng công thức này thỏa được khi và chỉ khi công thức kia thỏa được. |
| **28** | Dạng chuẩn mệnh đề | **Clausal Normal Form (CNF)** | Hội của các mệnh đề tuyển rời rạc trong FOL sau khi đã Skolem hóa và bỏ $\forall$. |
| **29** | Đổi tên biến độc lập | **Standardizing variables apart** | Đổi tên biến để các clause khác nhau không dùng chung tên biến trước khi hợp giải. |
| **30** | Vũ trụ Herbrand | **Herbrand universe ($H$)** | Tập hợp tất cả các ground term có thể tạo ra từ các ký hiệu hằng và hàm trong bài toán. |
| **31** | Phép hợp nhất | **Unification** | Quá trình tìm một phép thế biến làm cho hai hay nhiều biểu thức trở nên giống hệt nhau. |
| **32** | Phép thế làm khớp | **Unifier** | Phép thế $\sigma$ thỏa mãn $\sigma(E_1) = \sigma(E_2) = \dots = \sigma(E_k)$. |
| **33** | Phép thế tổng quát nhất | **Most General Unifier (MGU)** | Unifier tổng quát nhất, từ đó mọi unifier khác đều có thể suy ra bằng cách ghép thêm phép thế. |
| **34** | Tập bất đồng | **Disagreement set** | Tập các biểu thức con tại vị trí khác biệt đầu tiên khi quét các chuỗi từ trái sang phải. |
| **35** | Kiểm tra tự chứa | **Occurs Check** | Bước kiểm tra bắt buộc xem biến cần gán có xuất hiện bên trong hạng thức được gán hay không. |
| **36** | Hợp giải tổng quát | **Generalized resolution rule** | Luật hợp giải trong FOL: triệt tiêu cặp vị từ đối ngẫu sau khi làm khớp bằng MGU. |
| **37** | Luật thừa số hóa | **Factorization rule** | Luật hợp nhất 2 literal cùng dấu trong một clause qua MGU để bảo toàn tính đầy đủ bác bỏ. |
| **38** | Tính đầy đủ bác bỏ | **Refutation-completeness** | Tính chất của hệ suy diễn đảm bảo luôn tìm ra mệnh đề rỗng $\square$ nếu tập clause mâu thuẫn. |
| **39** | Nửa-quyết định được | **Semi-decidable** | Nếu khẳng định đúng thì thuật toán sẽ dừng và kết luận; nếu sai có thể chạy vô hạn. |
| **40** | Viết lại hạng thức | **Term rewriting** | Kỹ thuật định hướng các đẳng thức thành quy tắc thay thế một chiều để đơn giản hóa biểu thức. |
| **41** | Demodulation | **Demodulation** | Dùng một đẳng thức đóng để viết lại và rút gọn các hạng thức trong cơ sở tri thức. |
| **42** | Paramodulation | **Paramodulation** | Luật suy diễn tích hợp quan hệ đẳng thức trực tiếp vào quá trình hợp giải. |
| **43** | Bộ chứng minh tự động | **Automated Theorem Prover (ATP)** | Phần mềm máy tính tự động tìm chứng minh cho các bài toán logic hình thức (ví dụ E Prover). |
| **44** | Định dạng TPTP | **TPTP format** | Chuẩn ngôn ngữ đầu vào quốc tế (Thousands of Problems for Theorem Provers). |

---

## 2. Flashcards Định Nghĩa Cốt Lõi (Exam Flashcards)

### Flashcard 1: Phân biệt Hạng thức (Term) và Công thức (Formula)
- **Hạng thức (Term):** Đại diện cho một **Đối tượng (Object)** trong thế giới thực (ví dụ: $x$, $\text{john}$, $\text{plus}(x, 2)$). Hạng thức **KHÔNG CÓ** giá trị chân lý Đúng/Sai.
- **Công thức (Formula):** Là phát biểu mang **Chân trị True hoặc False** (ví dụ: $\text{Greater}(x, 2)$, $x = y$, $\forall x P(x)$).

### Flashcard 2: Khi nào dùng Hằng Skolem và khi nào dùng Hàm Skolem?
- **Hằng Skolem (Skolem Constant):** Khi biến tồn tại $\exists y$ **không đứng sau** bất kỳ lượng từ toàn thể $\forall$ nào. (Ví dụ: $\exists y \, P(y) \to P(c)$).
- **Hàm Skolem (Skolem Function):** Khi biến tồn tại $\exists y$ **nằm trong phạm vi của một hoặc nhiều** lượng từ toàn thể $\forall x_1, \dots, \forall x_k$. Giá trị của $y$ phụ thuộc vào các $x_i$, do đó phải thay bằng hàm $f(x_1, \dots, x_k)$. (Ví dụ: $\forall x \exists y \, \text{Mother}(y, x) \to \forall x \, \text{Mother}(m(x), x)$).

### Flashcard 3: Tại sao công thức sau Skolem hóa không tương đương logic với công thức ban đầu?
- **Trả lời:** Vì công thức sau Skolem hóa chứa thêm các ký hiệu hàm/hằng mới không hề có trong ngôn ngữ ban đầu. Tuy nhiên, nó **Bảo toàn tính thỏa được (Equisatisfiable)**: Công thức ban đầu thỏa được khi và chỉ khi công thức Skolem hóa thỏa được. Điều này là hoàn toàn đủ cho các phép chứng minh phản chứng (tìm mâu thuẫn $\square$).

### Flashcard 4: Occurs Check là gì và điều gì xảy ra nếu bỏ qua nó?
- **Trả lời:**  
  Occurs Check là bước kiểm tra xem biến $x$ có xuất hiện bên trong hạng thức $t$ khi thực hiện phép thế $\{x / t\}$ trong thuật toán Unification hay không.  
  Nếu bỏ qua Occurs Check và cho phép gán $\{x / f(x)\}$, thuật toán sẽ tạo ra một cấu trúc vô hạn tuần hoàn ($x = f(f(f(\dots)))$), làm cho hệ suy diễn mất tính đúng đắn (Soundness) và chứng minh sai các mệnh đề toán học.

### Flashcard 5: Tại sao Luật Thừa số hóa (Factorization) là bắt buộc trong FOL Resolution?
- **Trả lời:**  
  Khác với PL0 nơi các literal giống nhau tự triệt tiêu ($A \lor A \equiv A$), trong PL1 hai literal có thể không giống hệt nhau về mặt ký tự cú pháp mà chỉ giống nhau sau khi áp dụng MGU.  
  Nếu không có Factorization, các bài toán như Nghịch lý Thợ cạo Russell sẽ luôn sinh ra các clause có độ dài 2 literal và không bao giờ thu nhỏ được để sinh ra Mệnh đề Rỗng $\square$. Do đó, Factorization là bắt buộc để hệ suy diễn đạt **Tính đầy đủ bác bỏ (Refutation-completeness)**.

### Flashcard 6: Nửa-quyết định được (Semi-decidability) của PL1 có ý nghĩa thực tiễn gì?
- **Trả lời:**  
  Theo định lý của Turing và Church (1936), không có thuật toán nào có thể quyết định được tính hợp thức của mọi câu trong PL1. Nếu một câu là hệ quả logic ($KB \models \varphi$), bộ chứng minh đầy đủ chắc chắn sẽ tìm ra chứng minh sau hữu hạn bước. Nhưng nếu câu đó sai ($KB \not\models \varphi$), thuật toán có thể rơi vào vòng lặp vô tận. Vì vậy trong thực tế, các bộ ATP luôn phải đặt giới hạn thời gian (time-out) khi tìm kiếm chứng minh.

---

## 3. Bảng Phân Biệt Sâu Các Cặp Khái Niệm Dễ Nhầm Lẫn

### 3.1. Phân biệt Biến tự do (Free Variable) vs Biến ràng buộc (Bound Variable)

| Tiêu chí | Biến tự do (Free Variable) | Biến ràng buộc (Bound Variable) |
| :--- | :--- | :--- |
| **Định nghĩa** | Biến không bị bất kỳ lượng từ nào cùng tên bao bọc. | Biến nằm trong phạm vi (scope) của một lượng từ $\forall$ hoặc $\exists$. |
| **Ảnh hưởng ngữ nghĩa** | Giá trị phụ thuộc vào phép gán biến cụ thể $\alpha$. | Giá trị được định lượng toàn bộ đối với miền biện luận $\mathcal{U}$. |
| **Đánh giá chân trị** | Công thức chứa biến tự do **chưa thể** có chân trị tuyệt đối. | Nếu mọi biến đều bị ràng buộc (Sentence), công thức có chân trị tuyệt đối. |
| **Ví dụ trong $\forall x P(x, y)$** | Biến $y$ là tự do. | Biến $x$ là ràng buộc bởi $\forall x$. |

---

### 3.2. Phân biệt Logic Mệnh đề (PL0) vs Logic Vị từ Bậc nhất (PL1)

| Tiêu chí so sánh | Logic Mệnh đề (Propositional Logic - PL0) | Logic Vị từ Bậc nhất (First-Order Logic - PL1) |
| :--- | :--- | :--- |
| **Đơn vị biểu diễn** | Biến mệnh đề nguyên tử (hộp đen nhận True/False). | Đối tượng (Terms), Hàm (Functions), Vị từ (Predicates). |
| **Khả năng khái quát** | Kém; bài toán 100 robot cần 1 triệu biến rời rạc. | Vô hạn; chỉ cần 1 công thức ngắn gọn nhờ lượng từ $\forall, \exists$. |
| **Tính quyết định được** | **Quyết định được (Decidable)**: Thuật toán luôn dừng. | **Nửa-quyết định được (Semi-decidable)**: Có thể lặp vô hạn nếu sai. |
| **Độ phức tạp suy luận** | SAT là NP-complete; Horn-SAT là tuyến tính $O(n)$. | Bán quyết định; không gian Herbrand có thể vô hạn. |
| **Hệ hợp giải** | Resolution + Factorization cơ bản. | Generalized Resolution + Unification + Occurs-check + Factorization. |

---

## 4. Động Từ Chỉ Lệnh Thường Gặp Trong Đề Thi PL1

| Động từ chỉ lệnh | Ý nghĩa tiếng Việt | Hành động bắt buộc phải thực hiện trong bài làm |
| :--- | :--- | :--- |
| **Formalize into FOL** | Hình thức hóa sang PL1 | Đặt tên các vị từ và hàm, chuyển phát biểu tự nhiên thành công thức chứa $\forall, \exists$. |
| **Convert to PNF** | Chuyển sang dạng tiền tố | Đổi tên biến, đẩy toàn bộ các lượng từ ra phía trước công thức theo đúng quy tắc. |
| **Skolemize** | Skolem hóa | Thay thế lượng từ $\exists$ bằng hằng Skolem hoặc hàm Skolem tùy thuộc vào các $\forall$ phía trước. |
| **Transform to CNF** | Đưa về dạng chuẩn mệnh đề | Bỏ $\forall$, phân phối phép tuyển qua phép hội, tách thành tập các clause độc lập. |
| **Unify / Find MGU** | Hợp nhất / Tìm MGU | Quét tập bất đồng, kiểm tra Occurs-Check, tính chuỗi phép thế $\sigma$ làm 2 biểu thức đồng nhất. |
| **Standardize variables apart** | Đổi tên biến độc lập | Đổi tên các biến số giữa các clause để không có hai clause nào dùng chung tên biến. |
| **Apply Factorization** | Áp dụng thừa số hóa | Tìm MGU hợp nhất hai literal cùng dấu trong một clause để rút gọn độ dài clause. |
| **Prove by Resolution** | Chứng minh bằng hợp giải | Lập phủ định câu hỏi, Skolem hóa, hợp giải các cặp literal đối ngẫu đến khi sinh ra $\square$. |

---

## 5. Checklist Tự Đánh Giá Năng Lực Đạt Điểm A+ – Chapter 3

Hãy tự kiểm tra xem bạn đã sẵn sàng đạt điểm tuyệt đối cho phần Logic Vị từ Bậc nhất chưa:

- [ ] Tôi luôn dùng phép kéo theo $\Rightarrow$ cho $\forall$ và dùng phép hội $\land$ cho $\exists$, không bao giờ nhầm lẫn.
- [ ] Tôi phân biệt được sự khác biệt ngữ nghĩa giữa $\forall x \exists y$ và $\exists y \forall x$.
- [ ] Tôi biết cách đưa công thức về dạng chuẩn tiền tố (PNF) và không mắc bẫy đổi lượng từ khi có phép kéo theo ở vế trái.
- [ ] Tôi phân biệt chính xác khi nào dùng Hằng Skolem và khi nào dùng Hàm Skolem.
- [ ] Tôi hiểu bản chất tại sao Skolem hóa chỉ bảo toàn tính thỏa được (Equisatisfiable) chứ không tương đương logic.
- [ ] Tôi giải thích được Định lý đầy đủ Gödel và tính chất Nửa-quyết định được của PL1 (Turing-Church).
- [ ] Tôi thực hiện thành thạo thuật toán Unification từng bước qua tập bất đồng và tìm ra MGU.
- [ ] Tôi phát hiện được ngay lập tức các trường hợp vi phạm Occurs-Check.
- [ ] Tôi giải thích được vai trò sống còn của Factorization và giải được bài toán Nghịch lý Thợ cạo Russell.
- [ ] Tôi biết cách trình bày bài chứng minh phản chứng hợp giải đầy đủ các bước từ tiền đề đến mệnh đề rỗng $\square$.
- [ ] Tôi đọc hiểu và viết được các bài toán cơ bản dưới định dạng chuẩn TPTP.
