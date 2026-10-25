# Thiết kế bộ tài liệu ôn thi giữa kỳ Nhập môn AI

## 1. Mục tiêu

Tạo một bộ tài liệu tự học bằng tiếng Việt cho 7 chương đầu của môn Nhập môn Trí tuệ nhân tạo, dựa trên slide và tài liệu sẵn có trong `D:\NhapMonAI\SlidePreparation`, đồng thời ưu tiên các dạng câu hỏi xuất hiện trong các đề tại `D:\NhapMonAI\MidTermReview\dethithu`.

Bộ tài liệu phải giúp người học:

- Hiểu bản chất thay vì chỉ học thuộc lời giải.
- Nhận diện và giải được các dạng bài thi có xác suất xuất hiện cao.
- Ghi nhớ thuật ngữ tiếng Anh vì đề thi có thể hoàn toàn bằng tiếng Anh.
- Có thể ôn nhanh theo từng chương hoặc tra cứu một chủ đề cụ thể.

## 2. Định dạng và cấu trúc thư mục

Định dạng chính: Markdown (`.md`).

Tạo 7 thư mục trong `D:\NhapMonAI\MidTermReview`:

1. `Chapter 1 - Introduction`
2. `Chapter 2 - Propositional Logic`
3. `Chapter 3 - First-order Predicate Logic`
4. `Chapter 4 - Limitations of Logic`
5. `Chapter 5 - Logic Programming with PROLOG`
6. `Chapter 6 - Search Games and Problem Solving`
7. `Chapter 7 - Reasoning with Uncertainty`

Mỗi thư mục có đúng ba tài liệu chính:

- `01_LY_THUYET_CHI_TIET.md`
- `02_DANG_BAI_TRONG_TAM_VA_LOI_GIAI.md`
- `03_KHAI_NIEM_BAT_BUOC_HOC_THUOC.md`

Thư mục gốc có thêm `README.md` làm mục lục, hướng dẫn lộ trình ôn tập và liên kết tới toàn bộ 21 tài liệu.

## 3. Chuẩn nội dung chung

### 3.1. Tài liệu lý thuyết

- Viết bằng tiếng Việt, giải thích từ trực giác đến định nghĩa hình thức.
- Thuật ngữ quan trọng xuất hiện theo dạng `tiếng Việt (English term)` ở lần xuất hiện đầu tiên và được nhắc lại khi dễ nhầm.
- Có ví dụ ngắn ngay sau khái niệm khó.
- Có mục “Dễ nhầm trong phòng thi” và “Tự kiểm tra nhanh”.
- Chia nội dung thành `Cốt lõi phải biết`, `Khả năng thi cao` và `Mở rộng theo slide`.
- Chỉ đưa nội dung có thể kiểm chứng từ nguồn trong workspace. Không viện dẫn trang hoặc nội dung trực tiếp từ giáo trình khi workspace chưa có bản sách.

### 3.2. Tài liệu dạng bài

- Xếp hạng từng dạng: **rất cao**, **cao**, hoặc **bổ trợ**, dựa trên đề đã phân tích; không tuyên bố dạng nào chắc chắn xuất hiện trong kỳ thi tương lai.
- Mỗi dạng có: dấu hiệu nhận biết, quy trình giải, lỗi thường gặp, 1–2 bài mẫu và lời giải từng bước.
- Mỗi dạng trọng tâm có một bài cơ bản và một bài biến thể; dạng bổ trợ có thể chỉ cần một ví dụ.
- Ưu tiên tái tạo dạng bài, không sao chép nguyên xi đề cũ.
- Các đáp án phải được tự kiểm tra; không mặc định đáp án trong file đề là chính xác.

### 3.3. Tài liệu học thuộc

- Danh sách định nghĩa, công thức, điều kiện và từ vựng bắt buộc nhớ.
- Mỗi mục có câu trả lời mẫu ngắn bằng tiếng Việt, kèm cụm từ tiếng Anh cần nhận diện.
- Có bảng phân biệt các cặp dễ nhầm và checklist tự đánh giá cuối chương.
- Bổ sung động từ thường gặp trong đề như `show`, `derive`, `refute`, `entail`, `unify`, `expand`, `prune`, `condition on`.
- Mẫu trả lời thi bằng tiếng Việt phải là câu thuần Việt; nếu có mẫu tiếng Anh thì đặt thành một phiên bản tách biệt, không trộn hai ngôn ngữ trong cùng câu trả lời.

### 3.4. Template bắt buộc

- Lý thuyết: mục tiêu → trực giác → định nghĩa/ký hiệu → ví dụ → lỗi dễ nhầm → tự kiểm tra và đáp án ngắn → nguồn.
- Dạng bài: bằng chứng từ đề/mức ưu tiên → dấu hiệu nhận biết → quy ước → thuật toán giải → ví dụ có lời giải → lỗi → checklist chấm điểm.
- Học thuộc: flashcard hỏi/đáp → bảng phân biệt → công thức → glossary Việt–Anh và động từ đề bài → checklist.

### 3.5. Chuẩn ký hiệu và trình bày

- UTF-8, Markdown và công thức LaTeX.
- Dùng nhất quán: logic mệnh đề (Propositional Logic/PL0), logic vị từ bậc nhất (First-order Predicate Logic/FOL/PL1), mệnh đề rỗng `□`, phép thế `{x ↦ t}`, PROLOG trong tiêu đề và `Prolog` trong văn xuôi.
- Mã Prolog dùng code fence `prolog`; cây dùng Mermaid khi ngắn và luôn có bản ASCII nếu Mermaid làm giảm khả năng đọc.
- Chủ đề giao nhau được giải thích ở chương chính và liên kết tương đối từ chương khác, không sao chép dài: Horn ở Chapter 2, unification ở Chapter 3, operational semantics ở Chapter 5, giới hạn ở Chapter 4, kỹ thuật tìm kiếm/xác suất ở Chapter 6–7.

## 4. Phạm vi từng chương

### Chapter 1 - Introduction

Định nghĩa AI; bốn hướng tiếp cận; Turing Test; Chinese Room; agent, software agent, hardware agent; agent có trạng thái/bộ nhớ; symbolic AI và connectionism; lịch sử AI; knowledge-based, autonomous và learning agents; lập luận “machines can think”.

### Chapter 2 - Propositional Logic

Ngôn ngữ, cú pháp, ngữ nghĩa; truth assignment; model; satisfiable, valid, unsatisfiable; entailment; các phép tương đương; CNF; clause/literal; resolution và refutation; Horn clauses; forward chaining; soundness, completeness, decidability và độ phức tạp cơ bản.

### Chapter 3 - First-order Predicate Logic

Terms, predicates, functions, quantifiers; free/bound variables; formalization; semantics; substitution; prenex form; Skolemization; clausal form; unification, MGU, disagreement set, occurs check; generalized resolution; semi-decidability và liên hệ với automated theorem proving.

### Chapter 4 - Limitations of Logic

Combinatorial explosion; decidable và semi-decidable; Gödel/Church/Turing ở mức cần cho môn học; monotonicity; Tweety/flying penguin; inconsistency và principle of explosion; open-world assumption; frame problem; giới hạn của logic hai trị; phân biệt probability và fuzzy logic.

### Chapter 5 - Logic Programming with PROLOG

Facts, rules, queries; declarative/procedural semantics; unification; SLD resolution; thứ tự clause/goal; depth-first search và backtracking; search tree; recursion; arithmetic; list processing; cut, fail, negation as failure; lỗi vòng lặp; đọc và viết chương trình ngắn.

### Chapter 6 - Search, Games and Problem Solving

Problem formulation; state space/search tree; BFS, DFS, UCS, IDS; completeness/optimality/complexity; heuristic search; Greedy và A*; g/h/f; admissible và consistent; 8-puzzle với misplaced tiles/Manhattan distance; minimax; alpha-beta pruning; move ordering; expectiminimax ở mức nhận biết.

### Chapter 7 - Reasoning with Uncertainty

Tiên đề xác suất; conditional probability; product/sum rule; Bayes theorem; total probability; entropy; Maximum Entropy và Lagrange multipliers; Bayesian Networks; chain rule/factorization; conditional independence; chain/fork/collider; d-separation và explaining away; tính xác suất mạng nhỏ.

## 5. Mức ưu tiên theo đề thi

- Ưu tiên rất cao: Resolution/Horn, unification/MGU, PROLOG execution tree, A*, Bayesian/MaxEnt.
- Ưu tiên cao: CNF/Skolemization, recursion/cut, admissible/consistent, minimax/alpha-beta, conditional independence.
- Ưu tiên vừa: câu tự luận Introduction, limitations of logic và thuật ngữ lịch sử.

Không bỏ bất kỳ chương nào, kể cả Chapter 4 vốn không có câu riêng trong bộ MAT3508, vì cấu trúc MAT1206E và Sample phủ đủ 7 chương.

Tần suất được tính theo **họ đề/kỳ thi**, không tính từng file như một kỳ độc lập. Ba mã MAT3508 ngày 03/11/2025 được xem là một họ đề; `Sample.pdf` chỉ là đề demo và có trọng số tham khảo thấp hơn.

Trước khi viết bài tập, tạo ma trận bằng chứng nội bộ theo cấu trúc: `chương → dạng bài → đề/câu đã xuất hiện → họ đề → điểm → mức ưu tiên`. Mọi dạng trong ma trận phải xuất hiện trong tài liệu dạng bài tương ứng.

## 6. Nguồn và thứ tự ưu tiên

1. Slide bài giảng chính thức và slide in-class trong `SlidePreparation`.
2. Đề thi, trong đó phân biệt đề chính thức/biến thể với đề demo.
3. Tài liệu tự ôn đã có, dùng như bản nháp để tổng hợp nhưng phải đối chiếu lại với slide.
4. Kiến thức nền ổn định chỉ dùng để giải thích rõ hơn, không được gắn sai cho giáo trình hoặc slide.

Mỗi tài liệu có mục `Nguồn đã dùng` và `Ngày kiểm tra`. Nếu diễn đạt gần tài liệu MAT3508, phải ghi nhận nguồn và lưu ý giấy phép CC-BY-SA 4.0.

## 7. Kiểm chứng chất lượng

- Đối chiếu tiêu đề và thuật ngữ với slide gốc.
- Đối chiếu phạm vi và trọng số với sáu đề đã phân tích.
- Kiểm tra mọi phép Resolution bằng cách ghi cặp cha và mệnh đề sinh ra; kiểm tra MGU bằng cách áp dụng phép thế ngược vào hai biểu thức.
- Chạy thử chương trình/truy vấn bằng SWI-Prolog nếu môi trường có sẵn; nếu không, kiểm tra độc lập bằng cây SLD.
- Với A*, nêu rõ có/không tính ô trống, quy tắc phá hòa và chính sách trạng thái lặp; kiểm tra lại từng giá trị `g`, `h`, `f`.
- Với Bayesian/MaxEnt, kiểm tra chuẩn hóa tổng xác suất, ràng buộc và các bước đạo hàm/Lagrange.
- Tìm liên kết hỏng, file thiếu, tiêu đề sai và thuật ngữ tiếng Anh không nhất quán.
- Không sao chép các lỗi đã phát hiện trong đáp án đề cũ.

Tiêu chí hoàn thành: đúng 21 file nội dung và một README; mọi dạng trong ma trận bằng chứng xuất hiện ít nhất một lần; mỗi dạng trọng tâm có 1–2 bài và lời giải từng bước; mọi file có mục dễ nhầm/tự kiểm tra/nguồn phù hợp; không có liên kết nội bộ hỏng.

## 8. README tổng

README phải có bản đồ 7 chương, cách dùng ba loại tài liệu, lộ trình ôn theo thời gian còn lại, bảng trọng số theo họ đề, quy ước ký hiệu, glossary trung tâm và cảnh báo các lỗi đã phát hiện trong đáp án cũ.

## 9. Ngoài phạm vi ở giai đoạn này

- Không tạo PDF hoặc Word.
- Không tạo thêm đề thi thử tổng hợp toàn môn; có thể làm ở bước sau.
- Không đi sâu vào nội dung ngoài slide nếu không giúp trực tiếp cho giữa kỳ.

