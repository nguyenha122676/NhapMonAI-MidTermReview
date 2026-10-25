# Bộ tài liệu ôn thi giữa kỳ Nhập môn AI - Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Tạo 21 tài liệu Markdown tiếng Việt trong 7 thư mục chương và một README tổng, tập trung sâu vào phần có khả năng thi cao, dùng thuật ngữ tiếng Anh nhất quán và có bài mẫu kèm lời giải đã kiểm chứng.

**Architecture:** Mỗi chương là một đơn vị độc lập gồm lý thuyết, dạng bài và khái niệm học thuộc. Một ma trận bằng chứng nối câu hỏi trong các họ đề với từng dạng bài; README cung cấp lộ trình và quy ước chung. Nội dung được tổng hợp theo thứ tự ưu tiên: slide chính thức/in-class, đề thi, rồi tài liệu tự ôn đã đối chiếu.

**Tech Stack:** Markdown UTF-8, LaTeX inline/display, PowerShell để kiểm tra cấu trúc và liên kết, Poppler để đọc PDF, SWI-Prolog nếu có để kiểm chứng truy vấn.

**Spec:** `D:\NhapMonAI\MidTermReview\THIET_KE_BO_TAI_LIEU_ON_THI.md`

## Global Constraints

- Nội dung giải thích bằng tiếng Việt; thuật ngữ quan trọng có tiếng Anh bên cạnh.
- Tập trung sâu vào phần trọng tâm thi; nội dung ngoài trọng tâm chỉ tóm tắt và gắn nhãn `Mở rộng theo slide`.
- Không tuyên bố dạng nào chắc chắn xuất hiện; chỉ dùng `rất cao`, `cao`, `bổ trợ`.
- Ba mã MAT3508 ngày 03/11/2025 là một họ đề; `Sample.pdf` có trọng số tham khảo thấp hơn.
- Mẫu trả lời thi phải thuần Việt hoặc thuần Anh, không trộn hai ngôn ngữ trong cùng mẫu.
- Mỗi file có mục `Nguồn đã dùng` và `Ngày kiểm tra: 23/10/2026`.
- Không sao chép lỗi trong đáp án cũ; mọi bài tính và truy vết phải được kiểm chứng độc lập.

## Review Focus

- Công thức/ký hiệu trích từ PDF không bị hỏng do OCR; kiểm tra trực quan trang nguồn khi cần.
- Thuật ngữ và ký hiệu nhất quán giữa 21 file, nhất là Horn/SLD, substitution/MGU, empty clause và PROLOG.
- Không đếm ba mã MAT3508 như ba kỳ thi riêng khi xếp mức ưu tiên.
- Lời giải A* nêu rõ heuristic, blank tile, tie-break và repeated-state policy; lời giải Prolog đúng thứ tự clause/goal.
- Link tương đối trong README và link chéo giữa chương hoạt động, không có file thiếu.

---

### Task 1: Xây ma trận bằng chứng và khung thư mục

**Files:**
- Create: `D:\NhapMonAI\MidTermReview\docs\EVIDENCE_MATRIX.md`
- Create: bảy thư mục chương theo spec

**Interfaces:**
- Consumes: sáu PDF trong `dethithu`, thiết kế đã duyệt và tên chương trong `SlidePreparation`.
- Produces: taxonomy dạng bài, mức ưu tiên và danh sách nguồn cho Tasks 2–9.

- [ ] **Step 1:** Lập bảng `chương → dạng bài → file/câu → họ đề → điểm → mức ưu tiên` và ghi rõ các câu trùng giữa ba mã MAT3508.
- [ ] **Step 2:** Thêm taxonomy cố định cho mỗi chương và quy tắc số bài mẫu: hai bài cho dạng rất cao/cao, một ví dụ cho dạng bổ trợ.
- [ ] **Step 3:** Tạo đúng bảy thư mục chương với tên đã chốt trong spec.
- [ ] **Step 4:** Kiểm tra ma trận bao phủ mọi câu của sáu PDF và không dùng nhãn `chắc chắn`.

### Task 2: Chapter 1 - Introduction

**Files:**
- Create: `Chapter 1 - Introduction/01_LY_THUYET_CHI_TIET.md`
- Create: `Chapter 1 - Introduction/02_DANG_BAI_TRONG_TAM_VA_LOI_GIAI.md`
- Create: `Chapter 1 - Introduction/03_KHAI_NIEM_BAT_BUOC_HOC_THUOC.md`

**Interfaces:**
- Consumes: Task 1 taxonomy; `Introduction.pdf`, `Introduction_InClass.pdf`; câu Introduction trong mọi họ đề.
- Produces: chuẩn diễn đạt các khái niệm agent, Turing Test, Chinese Room, Symbolicism/Connectionism để README liên kết.

- [ ] **Step 1:** Viết lý thuyết trọng tâm: định nghĩa AI, Turing Test, Chinese Room, agents/memory, Symbolicism/Connectionism, lịch sử ngắn và machines can think.
- [ ] **Step 2:** Viết dạng bài tự luận với khung lập luận, hai bài biến thể trọng tâm và mẫu trả lời thuần Việt; thêm một mẫu trả lời thuần Anh ngắn ở mục riêng.
- [ ] **Step 3:** Viết flashcard, bảng phân biệt và động từ đề bài; thêm tự kiểm tra và nguồn.
- [ ] **Step 4:** Đối chiếu mọi khẳng định lịch sử/định nghĩa với slide, loại bỏ phát biểu tuyệt đối không có nguồn.

### Task 3: Chapter 2 - Propositional Logic

**Files:**
- Create: `Chapter 2 - Propositional Logic/01_LY_THUYET_CHI_TIET.md`
- Create: `Chapter 2 - Propositional Logic/02_DANG_BAI_TRONG_TAM_VA_LOI_GIAI.md`
- Create: `Chapter 2 - Propositional Logic/03_KHAI_NIEM_BAT_BUOC_HOC_THUOC.md`

**Interfaces:**
- Consumes: Task 1 taxonomy; hai slide Propositional Logic; các câu CNF, Resolution, Horn, Forward Chaining và SLD trong đề.
- Produces: quy ước clause/literal/`□`, entailment và Horn để Chapters 3 và 5 liên kết.

- [ ] **Step 1:** Viết lý thuyết cú pháp, ngữ nghĩa, model, satisfiable/valid/unsatisfiable, entailment, CNF, Resolution, Horn và forward chaining.
- [ ] **Step 2:** Viết các dạng CNF + refutation, kiểm tra unsatisfiable, Horn forward chaining và SLD ở mức logic; mỗi dạng trọng tâm có bài cơ bản và biến thể.
- [ ] **Step 3:** Kiểm tra từng bước Resolution bằng cặp mệnh đề cha và kết quả; kết thúc refutation bằng `□`.
- [ ] **Step 4:** Viết flashcard/công thức/bảng phân biệt, tự kiểm tra và nguồn; kiểm tra ký hiệu với slide PDF.

### Task 4: Chapter 3 - First-order Predicate Logic

**Files:**
- Create: `Chapter 3 - First-order Predicate Logic/01_LY_THUYET_CHI_TIET.md`
- Create: `Chapter 3 - First-order Predicate Logic/02_DANG_BAI_TRONG_TAM_VA_LOI_GIAI.md`
- Create: `Chapter 3 - First-order Predicate Logic/03_KHAI_NIEM_BAT_BUOC_HOC_THUOC.md`

**Interfaces:**
- Consumes: Task 1 taxonomy; slide FOL/in-class; các bản tổng hợp PL1 đã có; câu formalization, CNF/Skolem, MGU và occurs check.
- Produces: quy ước `{x ↦ t}`, MGU và Skolem functions để Chapter 5 liên kết.

- [ ] **Step 1:** Viết lý thuyết terms/formulas/quantifiers, free-bound variables, semantics, substitution, PNF, Skolemization, clausal form, unification/MGU/occurs check và generalized resolution.
- [ ] **Step 2:** Viết dạng formalization, FOL→CNF, unification có/không có MGU và occurs-check; mỗi dạng trọng tâm có bài cơ bản và biến thể.
- [ ] **Step 3:** Xác minh MGU bằng cách áp dụng substitution lên cả hai biểu thức; xác minh Skolem function phụ thuộc đúng universal variables.
- [ ] **Step 4:** Viết flashcard/bảng phân biệt/động từ đề bài, tự kiểm tra và nguồn; link về Chapter 2 thay vì lặp phần Resolution cơ bản.

### Task 5: Chapter 4 - Limitations of Logic

**Files:**
- Create: `Chapter 4 - Limitations of Logic/01_LY_THUYET_CHI_TIET.md`
- Create: `Chapter 4 - Limitations of Logic/02_DANG_BAI_TRONG_TAM_VA_LOI_GIAI.md`
- Create: `Chapter 4 - Limitations of Logic/03_KHAI_NIEM_BAT_BUOC_HOC_THUOC.md`

**Interfaces:**
- Consumes: Task 1 taxonomy; slide và tài liệu Limitations; câu semi-decidable, combinatorial explosion, Flying Penguin/Tweety.
- Produces: khung phân biệt decidable/semi-decidable, monotonic/non-monotonic và probability/fuzzy.

- [ ] **Step 1:** Viết sâu bốn phần trọng tâm: search-space explosion, decidability, Flying Penguin/monotonicity và modelling uncertainty.
- [ ] **Step 2:** Tóm tắt Gödel/Church/Turing, OWA, frame problem và fuzzy logic ở mục mở rộng, không để lấn át trọng tâm thi.
- [ ] **Step 3:** Viết các dạng tự luận với cấu trúc định nghĩa→nguyên nhân→hệ quả→ví dụ; tạo bài semi-decidability, combinatorial explosion và Tweety kèm đáp án.
- [ ] **Step 4:** Viết flashcard/bảng phân biệt, tự kiểm tra và nguồn; kiểm tra không dùng các khẩu hiệu tuyệt đối thiếu điều kiện.

### Task 6: Chapter 5 - Logic Programming with PROLOG

**Files:**
- Create: `Chapter 5 - Logic Programming with PROLOG/01_LY_THUYET_CHI_TIET.md`
- Create: `Chapter 5 - Logic Programming with PROLOG/02_DANG_BAI_TRONG_TAM_VA_LOI_GIAI.md`
- Create: `Chapter 5 - Logic Programming with PROLOG/03_KHAI_NIEM_BAT_BUOC_HOC_THUOC.md`

**Interfaces:**
- Consumes: Task 1 taxonomy; hai slide Prolog; ba tài liệu Prolog đã có; câu trace recursion, cut, program writing, query enumeration và complete search tree.
- Produces: chuẩn vẽ cây SLD và thứ tự nghiệm.

- [ ] **Step 1:** Viết lý thuyết facts/rules/queries, declarative-procedural semantics, SLD, DFS/backtracking, recursion, arithmetic, lists, cut/fail/NAF và infinite loops.
- [ ] **Step 2:** Chỉ tóm tắt self-modifying programs, planning và CLP ở mục mở rộng theo slide.
- [ ] **Step 3:** Viết năm nhóm dạng bài: đọc kết quả query, trace recursion, vẽ complete search tree, viết predicate đệ quy và phân tích cut; có bài cơ bản/biến thể và đáp án từng bước.
- [ ] **Step 4:** Chạy các ví dụ trên SWI-Prolog nếu có; nếu không, kiểm chứng bằng cây SLD và ghi rõ giới hạn kiểm chứng.
- [ ] **Step 5:** Viết flashcard, bảng lỗi cú pháp/ngữ nghĩa, tự kiểm tra và nguồn; link sang Chapters 2–3 cho Horn và unification.

### Task 7: Chapter 6 - Search, Games and Problem Solving

**Files:**
- Create: `Chapter 6 - Search Games and Problem Solving/01_LY_THUYET_CHI_TIET.md`
- Create: `Chapter 6 - Search Games and Problem Solving/02_DANG_BAI_TRONG_TAM_VA_LOI_GIAI.md`
- Create: `Chapter 6 - Search Games and Problem Solving/03_KHAI_NIEM_BAT_BUOC_HOC_THUOC.md`

**Interfaces:**
- Consumes: Task 1 taxonomy; Search slide/in-class; tài liệu tự ôn; câu BFS-vs-A*, A* 8-puzzle, admissible/consistent và minimax/alpha-beta.
- Produces: bảng so sánh thuật toán, chuẩn trình bày Open/Closed và game tree.

- [ ] **Step 1:** Viết lý thuyết problem formulation, BFS/DFS/UCS/IDS, heuristic/Greedy/A*, admissible/consistent, minimax, alpha-beta và move ordering.
- [ ] **Step 2:** Tóm tắt IDA*, expectiminimax và evaluation functions ở phần mở rộng.
- [ ] **Step 3:** Viết dạng so sánh thuật toán, A* 8-puzzle với misplaced/Manhattan, chứng minh tính heuristic, minimax và alpha-beta; mỗi dạng trọng tâm có bài cơ bản và biến thể.
- [ ] **Step 4:** Kiểm chứng từng bảng Open/Closed và `g,h,f`; ghi convention về ô trống, tie-break và repeated states; kiểm tra các nhánh alpha-beta thực sự được prune.
- [ ] **Step 5:** Viết flashcard/công thức/bảng so sánh, tự kiểm tra và nguồn.

### Task 8: Chapter 7 - Reasoning with Uncertainty

**Files:**
- Create: `Chapter 7 - Reasoning with Uncertainty/01_LY_THUYET_CHI_TIET.md`
- Create: `Chapter 7 - Reasoning with Uncertainty/02_DANG_BAI_TRONG_TAM_VA_LOI_GIAI.md`
- Create: `Chapter 7 - Reasoning with Uncertainty/03_KHAI_NIEM_BAT_BUOC_HOC_THUOC.md`

**Interfaces:**
- Consumes: Task 1 taxonomy; Uncertainty slide/in-class; tài liệu tổng hợp; câu Bayesian factorization/CI/total probability và MaxEnt/Lagrange.
- Produces: bảng công thức xác suất, quy tắc d-separation và quy trình MaxEnt.

- [ ] **Step 1:** Viết lý thuyết xác suất, conditional probability, Bayes/total probability, entropy/MaxEnt, Bayesian Networks, factorization, chain/fork/collider, d-separation và explaining away.
- [ ] **Step 2:** Tóm tắt LEXMED/cost matrix và xây dựng mạng lớn ở phần mở rộng theo slide.
- [ ] **Step 3:** Viết dạng tính xác suất toàn phần, BN factorization, conditional independence và MaxEnt bằng Lagrange; mỗi dạng trọng tâm có bài cơ bản và biến thể.
- [ ] **Step 4:** Kiểm tra tổng xác suất bằng 1, mọi CPT/ràng buộc hợp lệ, đạo hàm và nghiệm MaxEnt thỏa điều kiện; phân biệt common-cause dependence với explaining away.
- [ ] **Step 5:** Viết flashcard/công thức/bảng phân biệt, tự kiểm tra và nguồn.

### Task 9: README tổng và liên kết chéo

**Files:**
- Create: `D:\NhapMonAI\MidTermReview\README.md`
- Modify: 21 file của Tasks 2–8 để thêm link chéo cần thiết

**Interfaces:**
- Consumes: toàn bộ file đã hoàn thành và Evidence Matrix.
- Produces: điểm vào duy nhất cho người học.

- [ ] **Step 1:** Viết bản đồ 7 chương và liên kết tới 21 file.
- [ ] **Step 2:** Viết cách dùng ba loại tài liệu, lộ trình ôn 1 ngày/3 ngày/7 ngày và bảng trọng số theo họ đề.
- [ ] **Step 3:** Thêm glossary trung tâm, quy ước ký hiệu, động từ đề bài và cảnh báo lỗi trong đáp án cũ.
- [ ] **Step 4:** Thêm các link chéo cho chủ đề giao nhau và kiểm tra không sao chép nội dung dài giữa chương.

### Task 10: Kiểm tra hoàn chỉnh

**Files:**
- Verify: `D:\NhapMonAI\MidTermReview\README.md`
- Verify: `D:\NhapMonAI\MidTermReview\Chapter *\*.md`
- Verify: `D:\NhapMonAI\MidTermReview\docs\EVIDENCE_MATRIX.md`

**Interfaces:**
- Consumes: Tasks 1–9.
- Produces: bộ tài liệu sẵn sàng sử dụng.

- [ ] **Step 1:** Đếm đúng bảy thư mục, 21 file chương và một README; phát hiện file rỗng hoặc sai tên.
- [ ] **Step 2:** Tìm các mục bắt buộc `Dễ nhầm`, `Tự kiểm tra`, `Nguồn đã dùng`, `Ngày kiểm tra` và các nhãn ưu tiên trong từng loại file phù hợp.
- [ ] **Step 3:** Kiểm tra mọi link Markdown tương đối trỏ tới file tồn tại.
- [ ] **Step 4:** Tìm từ khóa cấm/nguy cơ như `chắc chắn ra`, ký hiệu không thống nhất và mẫu trả lời trộn ngôn ngữ; sửa mọi kết quả tìm thấy.
- [ ] **Step 5:** Rà ngẫu nhiên ít nhất một lời giải tính toán mỗi Chapters 2, 3, 5, 6, 7 bằng một phương pháp kiểm tra độc lập.
- [ ] **Step 6:** Đối chiếu lần cuối với spec và Evidence Matrix; xác nhận mọi dạng bài trong ma trận đã được bao phủ.

## Self-review result

- Spec coverage: đầy đủ 7 chương, 3 loại tài liệu/chương, README, nguồn, ngôn ngữ, bài mẫu và QA.
- Dependency order: Evidence Matrix trước nội dung; README và QA sau cùng.
- Scope: mỗi task chương tạo đúng ba file và có kiểm chứng riêng; Chapter 5–7 có thêm bước tính toán vì rủi ro cao hơn.
- Review focus đã được gắn vào Tasks 1, 3, 4, 6, 7, 8 và 10.

