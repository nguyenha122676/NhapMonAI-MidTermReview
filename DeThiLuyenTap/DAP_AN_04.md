# ĐÁP ÁN VÀ THANG ĐIỂM — ĐỀ 04

## Câu 1 (1.5 điểm)

### Question (English)

In Searle's Chinese Room thought experiment, a person who does not know Chinese follows a large rule book to transform Chinese input symbols into Chinese output symbols.

1. State the main conclusion of the Chinese Room argument.
2. Evaluate the argument: explain one important objection and decide, with justification, whether it proves that no AI system can ever understand.

### Câu hỏi (Tiếng Việt)

Trong thí nghiệm tư duy Chinese Room của Searle, một người không biết tiếng Trung làm theo một cuốn sách luật lớn để biến đổi các ký hiệu đầu vào tiếng Trung thành các ký hiệu đầu ra tiếng Trung.

1. Nêu kết luận chính của lập luận Chinese Room.
2. Đánh giá lập luận: giải thích một phản biện quan trọng và đưa ra kết luận có lý giải về việc lập luận này có chứng minh rằng không hệ AI nào có thể hiểu hay không.

### Đáp án

- Lập luận Chinese Room cho rằng thao tác ký hiệu đúng cú pháp (**syntax**) chưa đủ để tạo ra hiểu biết/ngữ nghĩa (**semantics**). Một chương trình có thể cho đầu ra giống người hiểu tiếng Trung nhưng người trong phòng chỉ làm theo quy tắc.
- Một phản biện tiêu biểu là **Systems Reply**: cá nhân trong phòng không hiểu, nhưng toàn bộ hệ thống gồm người, sách luật, bộ nhớ và quy trình có thể được xem là chủ thể hiểu. Các phản biện hợp lý khác như Robot Reply hoặc Brain Simulator Reply cũng được chấp nhận nếu giải thích đúng.
- Lập luận không chứng minh một cách quyết định rằng mọi AI đều không thể hiểu. Nó nhắm vào tuyên bố rằng chỉ chạy chương trình thao tác ký hiệu là điều kiện đủ cho hiểu biết; kết luận còn phụ thuộc vào định nghĩa “understanding” và cấp độ hệ thống được đánh giá.

**Rubric:** kết luận chính 0.5; một phản biện đúng 0.5; đánh giá có lập luận 0.5.

## Câu 2 (1.0 điểm)

### Question (English)

Let

\[
KB=\{A\Rightarrow B,\;B\Rightarrow C,\;C\Rightarrow D,\;A\}.
\]

Use resolution refutation to prove that \(KB\models D\). Show the CNF clauses and every resolution step.

### Câu hỏi (Tiếng Việt)

Cho

\[
KB=\{A\Rightarrow B,\;B\Rightarrow C,\;C\Rightarrow D,\;A\}.
\]

Dùng phân giải bằng phản chứng để chứng minh \(KB\models D\). Trình bày các clause CNF và mọi bước phân giải.

### Đáp án

Đổi sang CNF:

\[
\neg A\lor B,\quad \neg B\lor C,\quad \neg C\lor D,\quad A.
\]

Để chứng minh \(D\), thêm phủ định mục tiêu \(\neg D\):

1. Resolve \(\neg C\lor D\) với \(\neg D\) thu được \(\neg C\).
2. Resolve \(\neg B\lor C\) với \(\neg C\) thu được \(\neg B\).
3. Resolve \(\neg A\lor B\) với \(\neg B\) thu được \(\neg A\).
4. Resolve \(A\) với \(\neg A\) thu được mệnh đề rỗng \(\square\).

Vậy \(KB\cup\{\neg D\}\) không thỏa được, do đó \(KB\models D\).

**Rubric:** CNF và thêm phủ định mục tiêu 0.3; chuỗi phân giải đúng 0.5; kết luận 0.2.

## Câu 3 (1.0 điểm)

### Question (English)

For each pair of atoms, determine whether they are unifiable. If they are not, identify the precise reason.

1. \(P(x)\) and \(P(f(x))\)
2. \(P(f(a))\) and \(P(g(a))\)

Briefly distinguish an **occurs-check failure** from a **function-symbol clash**.

### Câu hỏi (Tiếng Việt)

Với mỗi cặp atom, hãy xác định chúng có hợp nhất được hay không. Nếu không, nêu chính xác nguyên nhân.

1. \(P(x)\) và \(P(f(x))\)
2. \(P(f(a))\) và \(P(g(a))\)

Phân biệt ngắn gọn lỗi **occurs check** với xung đột **function symbol**.

### Đáp án

1. \(P(x)\) và \(P(f(x))\) không hợp nhất được trong logic bậc nhất chuẩn. Phép thế yêu cầu \(x=f(x)\), nhưng \(x\) xuất hiện bên trong hạng \(f(x)\): lỗi **occurs check**.
2. \(P(f(a))\) và \(P(g(a))\) không hợp nhất được vì hai hàm ngoài cùng khác nhau, \(f\neq g\): **function-symbol clash**.

Occurs check ngăn một biến được gán bằng hạng chứa chính nó, còn symbol clash xảy ra khi hai hằng hoặc hai ký hiệu hàm không giống nhau ở cùng vị trí.

**Rubric:** mỗi trường hợp và lý do 0.35; phân biệt khái niệm 0.3.

## Câu 4 (1.0 điểm)

### Question (English)

Answer briefly.

1. Define **monotonicity** in classical logic and the **Open World Assumption (OWA)**.
2. Under OWA, if neither \(Bird(tweety)\) nor \(\neg Bird(tweety)\) can be derived, may we conclude \(\neg Bird(tweety)\)? Why?

### Câu hỏi (Tiếng Việt)

Trả lời ngắn gọn.

1. Định nghĩa **tính đơn điệu (monotonicity)** trong logic cổ điển và **Giả định Thế giới Mở (Open World Assumption — OWA)**.
2. Theo OWA, nếu không suy ra được cả \(Bird(tweety)\) lẫn \(\neg Bird(tweety)\), ta có được phép kết luận \(\neg Bird(tweety)\) không? Vì sao?

### Đáp án

1a. **Monotonicity:** nếu \(KB\models\alpha\), thì khi thêm tri thức mới \(\Delta\), vẫn có \(KB\cup\Delta\models\alpha\). Kết luận cũ không bị rút lại.

1b. **Open World Assumption:** điều không biết đúng không đồng nghĩa với sai; cơ sở tri thức có thể chưa đầy đủ.

2. Không. Việc không suy ra được \(Bird(tweety)\) chỉ cho biết mệnh đề chưa được xác định. Muốn kết luận phủ định cần chứng cứ hoặc luật suy ra \(\neg Bird(tweety)\).

**Rubric:** monotonicity 0.35; OWA 0.35; áp dụng đúng 0.3.

## Câu 5 (1.5 điểm)

### Question (English)

Consider the following PROLOG program.

```prolog
min_cut(X, Y, X) :- X =< Y, !.
min_cut(_, Y, Y).
```

1. Evaluate both queries: give all answers returned by `?- min_cut(2, 5, M).`, then determine whether `?- min_cut(2, 5, 5).` succeeds or fails and trace the relevant clause selection.
2. State the intended mode of `min_cut/3`. Explain why the cut is a **red cut** rather than a green cut.

### Câu hỏi (Tiếng Việt)

Cho chương trình PROLOG sau:

```prolog
min_cut(X, Y, X) :- X =< Y, !.
min_cut(_, Y, Y).
```

1. Đánh giá cả hai truy vấn: liệt kê mọi đáp án của `?- min_cut(2, 5, M).`, sau đó xác định `?- min_cut(2, 5, 5).` thành công hay thất bại và truy vết việc chọn clause liên quan.
2. Nêu mode dự kiến của `min_cut/3`. Giải thích vì sao cut này là **red cut** chứ không phải green cut.

### Đáp án

1a. Với `min_cut(2, 5, M)`, clause đầu hợp nhất, điều kiện `2 =< 5` đúng, rồi `!` cắt bỏ các lựa chọn còn lại. Chỉ có `M = 2`.

1b. Với `min_cut(2, 5, 5)`, clause đầu không hợp nhất vì đối số thứ ba buộc vừa là `2` vừa là `5`; do đó chưa đi tới cut. PROLOG thử clause hai `min_cut(_, Y, Y)`, hợp nhất thành `Y = 5`, nên truy vấn **succeeds**.

2. Mode dự kiến là `min_cut(+X, +Y, -M)`. Với mode này chương trình cho minimum như mong muốn. Tuy nhiên cut là **red cut** vì nếu bỏ cut, quan hệ/đáp án quan sát được thay đổi; đồng thời khi dùng đối số đầu ra đã được gán như truy vấn trên, chương trình chấp nhận `5` dù minimum đúng phải là `2`. Tính đúng phụ thuộc vào mode gọi.

**Rubric:** truy vấn 1 là 0.35; trace truy vấn 2 là 0.5; mode 0.2; giải thích red cut 0.45.

## Câu 6 (2.0 điểm)

### Question (English)

Consider the directed weighted graph below. Every table entry denotes a directed edge from the left node to the right node. Successors are generated alphabetically.

| Edge | Cost | Edge | Cost |
|---|---:|---|---:|
| S-A | 2 | S-B | 1 |
| A-G | 4 | B-C | 1 |
| C-G | 5 |  |  |

The heuristic values are:

\[
h(S)=4,\;h(A)=3,\;h(B)=4,\;h(C)=3,\;h(G)=0.
\]

For A*, use \(f(n)=g(n)+h(n)\), break ties alphabetically, use graph search, and stop when the goal is removed from OPEN.

1. Compare the three searches: state the BFS solution and cost; show the UCS expansion order and solution; then show the OPEN list after each A* expansion and give its returned path and cost.
2. Is the heuristic admissible? Is it consistent? Justify using the graph.

### Câu hỏi (Tiếng Việt)

Xét đồ thị có hướng và có trọng số dưới đây. Mỗi mục trong bảng biểu diễn một cạnh có hướng từ nút bên trái sang nút bên phải. Các nút kế tiếp được sinh theo thứ tự chữ cái.

| Cạnh | Chi phí | Cạnh | Chi phí |
|---|---:|---|---:|
| S-A | 2 | S-B | 1 |
| A-G | 4 | B-C | 1 |
| C-G | 5 |  |  |

Các giá trị heuristic là:

\[
h(S)=4,\;h(A)=3,\;h(B)=4,\;h(C)=3,\;h(G)=0.
\]

Với A*, dùng \(f(n)=g(n)+h(n)\), khi hòa thì ưu tiên theo thứ tự chữ cái, dùng graph search và dừng khi goal được lấy ra khỏi OPEN.

1. So sánh ba thuật toán: nêu nghiệm và chi phí của BFS; trình bày thứ tự mở rộng và nghiệm của UCS; sau đó ghi danh sách OPEN sau mỗi lần mở rộng A* và nêu đường đi cùng chi phí trả về.
2. Heuristic có admissible không? Có consistent không? Chứng minh bằng đồ thị.

### Đáp án

1a. BFS tối ưu theo số cạnh. Ở độ sâu 2, nó gặp đường \(S-A-G\); cost là \(2+4=6\).

1b. UCS:
   - Lấy \(S(0)\), đưa \(B(1),A(2)\).
   - Lấy \(B(1)\), đưa \(C(2)\).
   - Với hòa cost 2 và quy tắc chữ cái, lấy \(A(2)\), đưa \(G(6)\).
   - Lấy \(C(2)\), đường tới \(G\) có cost 7 nên không cải thiện.
   - Lấy \(G(6)\). Kết quả \(S-A-G\), cost 6.
1c. A* (ghi \(node:g,h,f\)):
   - Sau khi mở rộng \(S\): `[A:2,3,5; B:1,4,5]`.
   - Mở rộng \(A\): `[B:1,4,5; G:6,0,6]`.
   - Mở rộng \(B\): `[C:2,3,5; G:6,0,6]`.
   - Mở rộng \(C\): ứng viên \(G\) cost 7 không tốt hơn; OPEN `[G:6,0,6]`.
   - Lấy \(G\). Kết quả \(S-A-G\), cost 6.
2. Khoảng cách thật: \(h^*(G)=0,h^*(A)=4,h^*(C)=5,h^*(B)=6,h^*(S)=6\). Mọi \(h(n)\le h^*(n)\), nên heuristic **admissible**. Kiểm tra từng cạnh: \(4\le2+3\), \(4\le1+4\), \(3\le4+0\), \(4\le1+3\), \(3\le5+0\); vì vậy heuristic **consistent**.

**Rubric:** BFS 0.3; UCS 0.45; A* với OPEN và đáp án 0.75; admissible/consistent 0.5.

## Câu 7 (2.0 điểm)

### Question (English)

A Bayesian network has four Boolean variables with edges

\[
B\rightarrow A\leftarrow E,\qquad A\rightarrow C,
\]

where \(B\) = Burglary, \(E\) = Earthquake, \(A\) = Alarm, and \(C\) = Call.

1. Write the factorization of \(P(B,E,A,C)\).
2. Analyze the network using d-separation: determine whether \(B\) and \(E\) are marginally independent, determine whether \(B\) and \(C\) are conditionally independent given \(A\), and explain how evidence \(E=true\) can affect belief in \(B=true\) after observing \(A=true\). Name the final effect.

### Câu hỏi (Tiếng Việt)

Một mạng Bayes có bốn biến Boolean với các cạnh

\[
B\rightarrow A\leftarrow E,\qquad A\rightarrow C,
\]

trong đó \(B\) = Trộm (Burglary), \(E\) = Động đất (Earthquake), \(A\) = Báo động (Alarm), và \(C\) = Cuộc gọi (Call).

1. Viết phép phân rã của \(P(B,E,A,C)\).
2. Phân tích mạng bằng d-separation: xác định \(B\) và \(E\) có độc lập biên không; xác định \(B\) và \(C\) có độc lập có điều kiện khi biết \(A\) không; và giải thích bằng chứng \(E=true\) có thể ảnh hưởng thế nào tới niềm tin vào \(B=true\) sau khi đã quan sát \(A=true\). Nêu tên hiện tượng cuối cùng.

### Đáp án

1. \(P(B,E,A,C)=P(B)P(E)P(A\mid B,E)P(C\mid A)\).

2a. Có. Đường duy nhất \(B\rightarrow A\leftarrow E\) chứa collider \(A\) chưa được quan sát và không có hậu duệ được quan sát, nên đường bị chặn: \(B\perp E\).

2b. Có. Đường trực tiếp liên quan là \(B\rightarrow A\rightarrow C\). Khi condition on non-collider \(A\), đường này bị chặn: \(B\perp C\mid A\).

2c. Quan sát \(A=true\) mở collider giữa \(B\) và \(E\), nên đồ thị không còn bảo đảm chúng độc lập: chúng **có thể** trở nên phụ thuộc. Chỉ từ cấu trúc mạng, chưa có CPT, ta không thể khẳng định hướng hay độ lớn của thay đổi. Trong mô hình nguyên nhân thông thường, nếu burglary và earthquake đều làm alarm có khả năng cao hơn, biết thêm \(E=true\) thường làm \(P(B=true\mid A=true,E=true)\) giảm so với \(P(B=true\mid A=true)\); hiện tượng này gọi là **explaining away**.

**Rubric:** factorization 0.5; mỗi nhận định d-separation 0.5; explaining away 0.5.

**Tổng: 10/10**
