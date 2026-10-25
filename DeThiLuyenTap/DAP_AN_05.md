# ĐÁP ÁN VÀ LỜI GIẢI CHI TIẾT CHUẨN A+ — ĐỀ 05
## Kèm Barem Điểm, Phân Tích Phương Pháp & Cạm Bẫy Phòng Thi

> **Môn học:** Nhập Môn Trí Tuệ Nhân Tạo (Introduction to Artificial Intelligence)  
> **Thời gian làm bài:** 90 phút $\bullet$ **Hình thức:** Tự luận chuẩn quốc tế  
> **Chuẩn mực:** Đáp án được trình bày chuẩn chỉ theo giáo trình *Wolfgang Ertel (2025)*, *Russell & Norvig (AIMA 2021)* và Slide bài giảng TS. Hoàng Anh Đức.

---

## Câu 1 (1.5 điểm) — Bản Chất Định Nghĩa AI: "Hành Động Như Người" vs "Tác Tử Duy Lý"

### Question (English)
Consider the definition: “Artificial Intelligence is the study of systems that act like humans.”
1. Give one strength and two limitations of this definition. (0.8 point)
2. Contrast it with the **rational-agent** view of AI and give one example in which rational behavior need not imitate human behavior. (0.7 point)

### Câu hỏi (Tiếng Việt)
Xét định nghĩa: “Trí tuệ nhân tạo là ngành nghiên cứu các hệ thống hành động giống con người.”
1. Nêu một ưu điểm và hai hạn chế của định nghĩa này. (0.8 điểm)
2. So sánh với quan điểm **tác tử duy lý (rational agent)** về AI và cho một ví dụ trong đó hành vi hợp lý không cần bắt chước hành vi con người. (0.7 điểm)

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Ưu điểm và hạn chế của định nghĩa "Hành động như người" (*Acting Humanly*):

* **Ưu điểm cốt lõi (Strength):**
  * **Cung cấp một tiêu chuẩn thực nghiệm có thể đo lường và kiểm chứng khách quan:** Định nghĩa này gắn liền với Phép thử Turing (Turing Test - 1950), tập trung vào hành vi quan sát được từ bên ngoài (external observable behavior) thay vì sa đà vào các tranh cãi triết học trừu tượng, khó định lượng về "ý thức" hay "tâm trí" bên trong.
* **Hai hạn chế lớn (Two Limitations):**
  1. **Con người vốn chứa đựng nhiều khiếm khuyết phi lý và giới hạn sinh học:**
     * Con người thường xuyên mệt mỏi, cảm tính, hay quên, tính toán chậm và mắc các thiên kiến nhận thức (cognitive biases). Nếu AI phải "hành động giống con người", nó sẽ phải cố tình tính nhẩm sai hoặc đưa ra quyết định sai lầm trong các tình huống áp lực để "được giống người" — điều này đi ngược lại mục đích kỹ thuật của AI.
  2. **Định nghĩa mang tính dĩ nhân vi trung (Anthropic Bias) và loại trừ trí tuệ siêu việt:**
     * Định nghĩa lấy con người làm thước đo duy nhất của trí tuệ. Nó không thừa nhận các hệ thống tính toán vượt trội hơn con người (ví dụ: thuật toán tìm đường trên đồ thị hàng triệu đỉnh trong vài phần nghìn giây, hoặc động cơ cờ vây AlphaGo với các nước đi vượt khỏi trực giác nhân loại).

#### 2. Đối chiếu với quan điểm Tác tử duy lý (Rational Agent View):

* **Định nghĩa Tác tử duy lý (Russell & Norvig, Ertel):**
  * Một tác tử duy lý là tác tử hành động nhằm **tối đa hóa giá trị kỳ vọng của độ đo hiệu suất (Expected Performance Measure)**, dựa trên chuỗi tri giác đã tích lũy và tri thức nền tảng sẵn có.
* **So sánh đối chiếu:**
  * Quan điểm *Acting Humanly* hướng tới việc **bắt chước (imitation)** hành vi con người trong thực tế (mô tả - descriptive).
  * Quan điểm *Rational Agent* hướng tới việc **làm điều đúng đắn nhất (doing the right thing / optimization)** theo chuẩn mực toán học và logic (chuẩn tắc - normative). Tính duy lý không đòi hỏi cỗ máy phải suy nghĩ hay hành xử như một sinh vật sinh học.
* **Ví dụ thực tế minh họa:**
  * **Hệ thống lái tự động trên máy bay thương mại (Fly-by-wire Autopilot):**
    * Khi máy bay đi qua vùng nhiễu động khí quyển cực mạnh, hệ thống máy tính thực hiện hàng nghìn phép hiệu chỉnh cánh lái siêu nhỏ trong mỗi micro-giây dựa trên tính toán khí động học chính xác.
    * Con người không thể phản ứng ở tốc độ mili-giây đó và phi công thường có xu hướng giật mạnh cần lái theo phản xạ sợ hãi (gây mất ổn định phi cơ). Hành vi duy lý tối ưu của AI ở đây hoàn toàn khác biệt và vượt trội so với phản xạ sinh học của con người.

---

**Rubric Chấm Điểm:**
* Nêu đúng 1 ưu điểm (tiêu chuẩn thực nghiệm, Turing test): **0.3 điểm**.
* Nêu và phân tích sâu sắc 2 hạn chế (sai sót con người, thiên kiến dĩ nhân vi trung): **0.5 điểm** (mỗi ý 0.25).
* Định nghĩa chuẩn Rational Agent và đối chiếu với Acting Humanly: **0.45 điểm**.
* Ví dụ minh họa rõ ràng, chứng minh tính vượt trội không phụ thuộc vào bắt chước người: **0.25 điểm**.

---

## Câu 2 (1.0 điểm) — Suy Diễn Hướng Mục Tiêu Dạng SLD (Goal-Directed SLD Derivation)

### Question (English)
The following Horn-clause knowledge base is given:
$$A. \qquad B. \qquad C. \qquad A \land B \implies D. \qquad C \land D \implies E.$$
Prove the query $E$ by an SLD-style, goal-directed derivation. Show the selected goal, the rule or fact used, and the new goal list at each step.

### Câu hỏi (Tiếng Việt)
Cho cơ sở tri thức gồm các Horn clause sau:
$$A. \qquad B. \qquad C. \qquad A \land B \implies D. \qquad C \land D \implies E.$$
Chứng minh truy vấn $E$ bằng phép suy diễn hướng mục tiêu theo kiểu SLD (Linear Resolution with Selection function for Definite clauses). Ở mỗi bước, trình bày mục tiêu được chọn, luật hoặc fact được dùng và danh sách mục tiêu mới.

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Biểu diễn Cơ sở tri thức dưới dạng Mệnh đề Horn xác định:
* Sự kiện (Facts):
  * $F_1: A$
  * $F_2: B$
  * $F_3: C$
* Luật suy diễn (Rules):
  * $R_1: D \leftarrow A \land B \quad (\equiv \neg A \lor \neg B \lor D)$
  * $R_2: E \leftarrow C \land D \quad (\equiv \neg C \lor \neg D \lor E)$
* Mục tiêu truy vấn ban đầu (Query): $\leftarrow E$ (Phủ định mục tiêu: $\neg E$).

#### 2. Bảng diễn tiến suy diễn SLD chi tiết (SLD Derivation Table):
Quy ước hàm chọn (Selection function): Luôn chọn mục tiêu con ngoài cùng bên trái trong danh sách mục tiêu hiện hành.

| Bước | Danh sách mục tiêu hiện hành (Goal List) | Mục tiêu con được chọn | Luật / Fact áp dụng | Phép phân giải và Danh sách mục tiêu mới | Trạng thái |
|:---:|:---|:---:|:---:|:---|:---:|
| **0** | $[\, E \,]$ | $E$ | $R_2: E \leftarrow C \land D$ | Thay $E$ bằng thân luật của $R_2$: sinh $[\, C,\, D \,]$ | Tiếp tục |
| **1** | $[\, C,\, D \,]$ | $C$ | $F_3: C$ | Fact $C$ triệt tiêu thành công literal $C$: sinh $[\, D \,]$ | Tiếp tục |
| **2** | $[\, D \,]$ | $D$ | $R_1: D \leftarrow A \land B$ | Thay $D$ bằng thân luật của $R_1$: sinh $[\, A,\, B \,]$ | Tiếp tục |
| **3** | $[\, A,\, B \,]$ | $A$ | $F_1: A$ | Fact $A$ triệt tiêu literal $A$: sinh $[\, B \,]$ | Tiếp tục |
| **4** | $[\, B \,]$ | $B$ | $F_2: B$ | Fact $B$ triệt tiêu literal $B$: sinh $[\, \Box \,]$ (Rỗng) | **Thành công** |

#### 3. Cây suy dẫn SLD (SLD Derivation Tree):

```
                     ?- E.
                       |
               [Áp dụng R2: E :- C, D]
                       |
                     ?- C, D.
                    /        \
          [Khớp Fact F3: C]   |
                  /           |
                ?- D.         |
                  |           |
          [Áp dụng R1: D :- A, B]
                  |
                ?- A, B.
               /        \
     [Khớp Fact F1: A]   |
             /           |
           ?- B.         |
             |           |
     [Khớp Fact F2: B]   |
             |           |
            [] (Rỗng / □)
```

#### 4. Kết luận:
Quá trình suy diễn kết thúc tại **Mệnh đề mục tiêu rỗng $[\, \Box \,]$**, chứng minh rằng mục tiêu phản chứng dẫn tới mâu thuẫn.  
Do đó truy vấn thành công:
$$KB \vdash_{\text{SLD}} E \implies KB \models E \quad \text{(Điều phải chứng minh)}$$

---

**Rubric Chấm Điểm:**
* Khởi tạo đúng mục tiêu ban đầu $[E]$ và áp dụng đúng luật $R_2$: **0.3 điểm**.
* Trình bày tuần tự, mạch lạc từng bước chọn goal, chỉ rõ fact triệt tiêu tương ứng: **0.5 điểm**.
* Dẫn ra danh sách rỗng $[\Box]$ và khẳng định kết luận logic: **0.2 điểm**.

---

## Câu 3 (1.0 điểm) — Thuật Toán Hợp Nhất Robinson Với Hạng Thức Phức Hợp

### Question (English)
Find the most general unifier (MGU), if one exists, for
$$Q(x, h(y), y) \quad \text{and} \quad Q(f(a), h(b), b).$$
Show the equations solved and verify the final substitution by applying it to both atoms.

### Câu hỏi (Tiếng Việt)
Tìm bộ hợp nhất tổng quát nhất (MGU), nếu tồn tại, cho
$$Q(x, h(y), y) \quad \text{and} \quad Q(f(a), h(b), b).$$
Trình bày các phương trình được giải và kiểm tra phép thế cuối bằng cách áp dụng nó cho cả hai atom.

### Lời Giải Chi Tiết Chuẩn A+

#### Bước 1: Thiết lập hệ phương trình đối số tương ứng
Hai nguyên tử có cùng tên vị từ $Q$ bậc 3. Để hợp nhất chúng, ta lập hệ gồm 3 phương trình:
$$S_0 = \{ x \stackrel{?}{=} f(a),\quad h(y) \stackrel{?}{=} h(b),\quad y \stackrel{?}{=} b \}$$

#### Bước 2: Quá trình giải từng phương trình theo thuật toán Robinson

1. **Xét phương trình (1): $x \stackrel{?}{=} f(a)$**
   * Vế trái là biến $x$, vế phải là hạng thức $f(a)$.
   * Kiểm tra xuất hiện (Occurs-Check): $x \notin \text{Vars}(f(a))$.
   * Sinh ra phép thế:
     $$\theta_1 = \{x \mapsto f(a)\}$$
   * Áp dụng $\theta_1$ cho phần còn lại của hệ phương trình:
     $$S_1 = \{ h(y) \stackrel{?}{=} h(b),\quad y \stackrel{?}{=} b \}$$

2. **Xét phương trình (2): $h(y) \stackrel{?}{=} h(b)$**
   * Cả hai vế đều có ký hiệu hàm ngoài cùng là $h$. Áp dụng quy tắc khử hàm (Decomposition):
     $$y \stackrel{?}{=} b$$
   * Vế trái là biến $y$, vế phải là hằng số $b$.
   * Kiểm tra Occurs-Check: $y \notin \text{Vars}(b)$.
   * Sinh ra phép thế:
     $$\theta_2 = \{y \mapsto b\}$$
   * Áp dụng $\theta_2$ vào phương trình thứ ba: $y \stackrel{?}{=} b$ trở thành $b \stackrel{?}{=} b$ (Đồng nhất thức chân lý, tự động loại bỏ).

#### Bước 3: Hợp thành phép thế tổng quát nhất (MGU Composition)
Hợp thành hai phép thế $\theta = \theta_1 \circ \theta_2$:
* $x\theta = f(a)$
* $y\theta = b$
Do đó, Bộ hợp nhất tổng quát nhất là:
$$\mathbf{MGU \;\; \theta = \{x \mapsto f(a),\; y \mapsto b\}}$$

#### Bước 4: Kiểm tra lại toàn diện (Verification)
Áp dụng $\theta$ vào hai nguyên tử ban đầu:
* Đối với nguyên tử thứ nhất:
  $$Q(x, h(y), y)\theta = Q(f(a),\, h(b),\, b)$$
* Đối với nguyên tử thứ hai:
  $$Q(f(a), h(b), b)\theta = Q(f(a),\, h(b),\, b)$$
* Hai nguyên tử sau phép thế hoàn toàn trùng khớp:
  $$Q(x, h(y), y)\theta \equiv Q(f(a), h(b), b)\theta$$
Phép hợp nhất thành công tuyệt đối!

---

**Rubric Chấm Điểm:**
* Thiết lập đúng hệ 3 phương trình đối số ban đầu: **0.3 điểm**.
* Giải chi tiết từng phương trình và tìm đúng MGU $\theta = \{x \mapsto f(a), y \mapsto b\}$: **0.4 điểm**.
* Thực hiện bước kiểm chứng thế ngược lại vào cả hai nguyên tử: **0.3 điểm**.

---

## Câu 4 (1.0 điểm) — Phân Biệt Bất Định Xác Suất vs Chân Trị Mờ (Fuzzy Logic)

### Question (English)
For each statement, choose the most suitable representation among **classical two-valued logic**, **probability**, and **fuzzy logic**, then justify your choice.
1. Classify and justify all three statements:
   - “A face-up card is observed to be a heart.”
   - “Tomorrow it will rain, based on incomplete weather information.”
   - “The room is warm,” where warmth has gradual degrees rather than a sharp boundary.
2. State the central difference between probabilistic uncertainty and fuzzy truth.

### Câu hỏi (Tiếng Việt)
Với mỗi phát biểu, hãy chọn cách biểu diễn phù hợp nhất trong số **logic hai trị cổ điển**, **xác suất** và **logic mờ**, rồi giải thích lựa chọn.
1. Phân loại và giải thích cả ba phát biểu:
   - “Quan sát thấy một lá bài đang ngửa là lá cơ.”
   - “Ngày mai trời sẽ mưa, dựa trên thông tin thời tiết chưa đầy đủ.”
   - “Căn phòng ấm,” trong đó mức độ ấm thay đổi liên tục thay vì có một ranh giới sắc nét.
2. Nêu khác biệt cốt lõi giữa sự bất định xác suất và chân trị mờ.

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Phân loại và lập luận cho từng phát biểu:

1. **Phát biểu 1: “Quan sát thấy một lá bài đang ngửa là lá cơ.”**
   * **Cách biểu diễn phù hợp nhất:** **Logic hai trị cổ điển (Classical Two-Valued Boolean Logic)**.
   * **Giải thích:** Lá bài đang lật ngửa và người quan sát trực tiếp nhìn thấy rõ chất cơ. Mệnh đề này sở hữu thông tin hoàn hảo (perfect information), không có sự mơ hồ về ngữ nghĩa và không có sự bất định về tri giác. Chân trị mang tính tất định: $\text{True} = 1$.

2. **Phát biểu 2: “Ngày mai trời sẽ mưa, dựa trên thông tin thời tiết chưa đầy đủ.”**
   * **Cách biểu diễn phù hợp nhất:** **Lý thuyết xác suất (Probability Theory)**.
   * **Giải thích:** Khái niệm "mưa" là một sự kiện nhị phân rõ ràng (ngày mai trời hoặc mưa hoặc không mưa). Tuy nhiên, tại thời điểm hiện tại, ta **thiếu thông tin hoàn chỉnh** về tương lai (đo lường khí áp, mây, độ ẩm chưa đủ). Do đó, ta phải dùng xác suất (ví dụ: $P(\text{Mưa}) = 0.7$) để định lượng mức độ tin cậy vào việc sự kiện sẽ xảy ra.

3. **Phát biểu 3: “Căn phòng ấm, trong đó mức độ ấm thay đổi liên tục thay vì có một ranh giới sắc nét.”**
   * **Cách biểu diễn phù hợp nhất:** **Logic mờ (Fuzzy Logic - Lotfi Zadeh 1965)**.
   * **Giải thích:** Dù ta đo được chính xác nhiệt độ phòng là $24.5^\circ\text{C}$ (hoàn toàn không có bất định về dữ liệu), thì bản thân khái niệm ngôn ngữ "ấm" không có một ngưỡng ngắt nhị phân cứng nhắc (không thể bảo $24.9^\circ\text{C}$ là lạnh còn $25.0^\circ\text{C}$ là ấm). Ta sử dụng hàm thuộc $\mu_{\text{Ấm}}(24.5) = 0.8 \in [0, 1]$ để biểu diễn mức độ thuộc về tập mờ "Ấm".

#### 2. Khác biệt cốt lõi giữa Bất định xác suất và Chân trị mờ:

| Tiêu chí | Bất định xác suất (Probabilistic Uncertainty) | Chân trị mờ (Fuzzy Truth / Vagueness) |
|:---|:---|:---|
| **Bản chất vấn đề** | Xử lý **Sự thiếu hụt thông tin (Ignorance / Incomplete Knowledge)** về một thế giới vốn có ranh giới rõ ràng. | Xử lý **Tính mơ hồ về ngữ nghĩa (Vagueness / Ambiguity)** của các khái niệm trong ngôn ngữ tự nhiên. |
| **Bản chất của phát biểu** | Phát biểu là **Nhị phân rõ nét (Crisp)**: Về bản chất nó chỉ có thể Đúng ($1$) hoặc Sai ($0$), nhưng ta chưa biết chắc. | Bản thân phát biểu **không phải là nhị phân**: Nó đúng ở một **mức độ (degree of truth)** liên tục trên đoạn $[0, 1]$. |
| **Khi có thông tin hoàn hảo** | Xác suất sụp đổ về $0$ hoặc $1$ (hết bất định). | Chân trị mờ **vẫn giữ nguyên giá trị liên tục** (biết phòng $25^\circ\text{C}$ thì phòng vẫn "ấm ở mức 0.8"). |

---

**Rubric Chấm Điểm:**
* Phân loại đúng và giải thích thuyết phục cho cả 3 phát biểu: **0.6 điểm** (mỗi phát biểu 0.2).
* Phân biệt sâu sắc bản chất thiếu thông tin vs tính mơ hồ ngữ nghĩa: **0.4 điểm**.

---

## Câu 5 (1.5 điểm) — Lập Trình Logic PROLOG: Đệ Quy Danh Sách & Truy Vết Ngăn Xếp

### Question (English)
Write a PROLOG predicate `count_occurrences(+X, +List, -N)` that counts how many times `X` occurs in `List`. Assume `X` is ground and `List` is a finite proper list of ground terms. You may use `=`, `\=`, and arithmetic `is`, but no library counting predicate.
Then trace the recursive calls and returned values for:
```prolog
?- count_occurrences(a, [a,b,a,a], N).
```

### Câu hỏi (Tiếng Việt)
Viết predicate PROLOG `count_occurrences(+X, +List, -N)` để đếm số lần phần tử `X` xuất hiện trong `List`. Giả sử `X` là ground (đã được gán giá trị) và `List` là một danh sách hợp thức hữu hạn gồm các ground term. Có thể dùng `=`, `\=` và phép toán số học `is`, nhưng không được dùng predicate đếm có sẵn trong thư viện.
Sau đó truy vết các lời gọi đệ quy và giá trị trả về cho truy vấn:
```prolog
?- count_occurrences(a, [a,b,a,a], N).
```

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Cài đặt Predicate trong PROLOG:

Có thể viết theo hai phong cách chuẩn mực:

**Cách 1: Khai báo thuần túy với các nhánh điều kiện loại trừ nhau (Pure Declarative)**
```prolog
% Trường hợp cơ sở: Danh sách rỗng thì số lần xuất hiện là 0
count_occurrences(_, [], 0).

% Trường hợp 1: Phần tử đầu danh sách trùng khớp với X
count_occurrences(X, [X|Tail], N) :-
    count_occurrences(X, Tail, N_tail),
    N is N_tail + 1.

% Trường hợp 2: Phần tử đầu danh sách khác X
count_occurrences(X, [Head|Tail], N) :-
    X \= Head,
    count_occurrences(X, Tail, N).
```

**Cách 2: Sử dụng cấu trúc rẽ nhánh if-then-else `( Cond -> Then ; Else )`**
```prolog
count_occurrences(_, [], 0).
count_occurrences(X, [Head|Tail], N) :-
    (   X = Head
    ->  count_occurrences(X, Tail, N_tail),
        N is N_tail + 1
    ;   count_occurrences(X, Tail, N)
    ).
```

#### 2. Truy vết quá trình thực thi đệ quy (Execution Trace Stack):

Mục tiêu truy vấn: `?- count_occurrences(a, [a, b, a, a], N).`

##### Pha 1: Đi sâu vào đệ quy (Call / Descent Phase):
1. **Call (Level 1):** `count_occurrences(a, [a, b, a, a], N)`
   * Đầu danh sách là `a`, khớp với $X = a$.
   * Gọi đệ quy: `count_occurrences(a, [b, a, a], N1)`. Biểu thức hoãn lại: $N = N_1 + 1$.
2. **Call (Level 2):** `count_occurrences(a, [b, a, a], N1)`
   * Đầu danh sách là `b`, $a \neq b$.
   * Gọi đệ quy: `count_occurrences(a, [a, a], N1)`. Giữ nguyên biến kết quả $N_1$.
3. **Call (Level 3):** `count_occurrences(a, [a, a], N1)`
   * Đầu danh sách là `a`, khớp với $X = a$.
   * Gọi đệ quy: `count_occurrences(a, [a], N2)`. Biểu thức hoãn lại: $N_1 = N_2 + 1$.
4. **Call (Level 4):** `count_occurrences(a, [a], N2)`
   * Đầu danh sách là `a`, khớp với $X = a$.
   * Gọi đệ quy: `count_occurrences(a, [], N3)`. Biểu thức hoãn lại: $N_2 = N_3 + 1$.
5. **Call (Level 5):** `count_occurrences(a, [], N3)`
   * Khớp với **Trường hợp cơ sở (Base case)**: Danh sách rỗng.
   * Gán giá trị: $\mathbf{N_3 = 0}$.

##### Pha 2: Trả kết quả ngược lên và tính toán số học (Exit / Unwinding Phase):
6. **Exit (Level 5):** Trả về $N_3 = 0$.
7. **Exit (Level 4):** Tính $N_2 = N_3 + 1 = 0 + 1 = \mathbf{1}$. Trả về $N_2 = 1$.
8. **Exit (Level 3):** Tính $N_1 = N_2 + 1 = 1 + 1 = \mathbf{2}$. Trả về $N_1 = 2$.
9. **Exit (Level 2):** Nhánh này không tăng đếm, trả về $N_1 = \mathbf{2}$.
10. **Exit (Level 1):** Tính $N = N_1 + 1 = 2 + 1 = \mathbf{3}$.

#### 3. Kết quả xuất màn hình:
$$\mathbf{N = 3.}$$

---

**Rubric Chấm Điểm:**
* Viết đúng trường hợp cơ sở (`Base case` danh sách rỗng ra 0): **0.25 điểm**.
* Viết đúng hai trường hợp đệ quy (trùng khớp tăng 1, không trùng giữ nguyên): **0.65 điểm**.
* Lập vết chi tiết các bước gọi xuống (Call stack) và unwinding tính giá trị $N_3 \to N_2 \to N_1 \to N$: **0.4 điểm**.
* Kết luận đúng $N = 3$: **0.2 điểm**.

---

## Câu 6 (2.0 điểm) — Thuật Toán $A^*$ Đồ Thị: Cập Nhật OPEN & Heuristic Không Nhất Quán

### Question (English)
Consider this directed weighted graph. Every table entry denotes a directed edge from the left node to the right node.

| Edge | Cost | Edge | Cost |
|---|---:|---|---:|
| S-A | 2 | S-B | 2 |
| A-C | 2 | A-G | 7 |
| B-C | 1 | B-D | 3 |
| C-G | 3 | D-G | 2 |

The heuristic is
$$h(S)=5,\; h(A)=4,\; h(B)=4,\; h(C)=2,\; h(D)=1,\; h(G)=0.$$
Use A* graph search with $f=g+h$. Generate successors alphabetically, break remaining ties by earlier insertion, update a state in OPEN when a cheaper path is found, and stop when the goal is removed from OPEN. When an OPEN entry is improved, remove its old entry and reinsert the improved entry at the end of its new $f$-priority group.
1. Show the OPEN list after each expansion, including $g,h,f$, and give the returned path and total cost. (1.2 points)
2. Is the heuristic admissible? Is it consistent? Prove each answer. What implementation precaution is needed for an admissible but inconsistent heuristic? (0.8 point)

### Câu hỏi (Tiếng Việt)
Xét đồ thị có hướng và có trọng số sau. Mỗi mục trong bảng biểu diễn một cạnh có hướng từ nút bên trái sang nút bên phải.

| Cạnh | Chi phí | Cạnh | Chi phí |
|---|---:|---|---:|
| S-A | 2 | S-B | 2 |
| A-C | 2 | A-G | 7 |
| B-C | 1 | B-D | 3 |
| C-G | 3 | D-G | 2 |

Heuristic là:
$$h(S)=5,\; h(A)=4,\; h(B)=4,\; h(C)=2,\; h(D)=1,\; h(G)=0.$$
Dùng tìm kiếm đồ thị $A^*$ với $f=g+h$. Sinh nút kế tiếp theo thứ tự chữ cái, phá hòa còn lại theo thứ tự đưa vào sớm hơn, cập nhật một trạng thái trong OPEN nếu tìm thấy đường đi rẻ hơn và dừng khi trạng thái đích được lấy ra khỏi OPEN. Khi một mục trong OPEN được cải thiện, xóa mục cũ và chèn lại mục mới vào cuối nhóm cùng độ ưu tiên $f$.
1. Ghi danh sách OPEN sau mỗi lần mở rộng (gồm $g,h,f$) và nêu đường đi cùng tổng chi phí trả về. (1.2 điểm)
2. Heuristic có admissible không? Có consistent không? Chứng minh từng kết luận. Cần lưu ý gì khi cài đặt $A^*$ với heuristic admissible nhưng không consistent? (0.8 điểm)

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Bảng diễn tiến thuật toán $A^*$ Graph Search qua từng bước:

| Bước | Nút được lấy ra (Pop) | $g$ | $h$ | $f$ | Các nút con sinh ra | Thao tác cập nhật OPEN | Danh sách OPEN sau khi cập nhật |
|:---:|:---|:---:|:---:|:---:|:---|:---|:---|
| **0** | *(Khởi tạo)* | 0 | 5 | 5 | Đưa $S$ vào OPEN | Khởi tạo | $[\, S(0, 5, 5) \,]$ |
| **1** | **$S$** | 0 | 5 | 5 | • $A: g=0+2=2, h=4 \implies f=6$<br>• $B: g=0+2=2, h=4 \implies f=6$<br>*(Sinh theo thứ tự chữ cái $A$ trước $B$)* | Thêm $A, B$ | $[\, \mathbf{A(2, 4, 6)},\, B(2, 4, 6) \,]$ |
| **2** | **$A$** | 2 | 4 | 6 | • $C: g=2+2=4, h=2 \implies f=6$<br>• $G: g=2+7=9, h=0 \implies f=9$ | $B$ đến trước nên đứng đầu; thêm $C$ vào cuối nhóm $f=6$; thêm $G(9)$ | $[\, \mathbf{B(2, 4, 6)},\, C(4, 2, 6),\, G(9, 0, 9) \,]$ |
| **3** | **$B$** | 2 | 4 | 6 | • $C: g=2+1=3, h=2 \implies f=5$<br>• $D: g=2+3=5, h=1 \implies f=6$ | **ĐƯỜNG MỚI TỐT HƠN TỚI $C$!**<br>Xóa $C(4,2,6)$, đưa $C(3,2,5)$ lên đầu vì $f=5 < 6$; thêm $D(5,1,6)$ vào cuối nhóm $f=6$ | $[\, \mathbf{C(3, 2, 5)},\, D(5, 1, 6),\, G(9, 0, 9) \,]$ |
| **4** | **$C$** | 3 | 2 | 5 | • $G: g=3+3=6, h=0 \implies f=6$ | **ĐƯỜNG MỚI TỐT HƠN TỚI $G$!**<br>Xóa $G(9,0,9)$, chèn $G(6,0,6)$ vào sau $D(5,1,6)$ (cùng nhóm $f=6$) | $[\, \mathbf{D(5, 1, 6)},\, G(6, 0, 6) \,]$ |
| **5** | **$D$** | 5 | 1 | 6 | • $G: g=5+2=7, h=0 \implies f=7$ | Đường tới $G$ có $g=7$ kém hơn $g=6$ đang có $\implies$ Bỏ qua | $[\, \mathbf{G(6, 0, 6)} \,]$ |
| **6** | **$G$** | 6 | 0 | 6 | **Lấy Đích $G$ ra khỏi OPEN $\implies$ DỪNG!** | Thuật toán dừng | *Kết thúc* |

* **Đường đi tối ưu tìm được:** $\mathbf{S \to B \to C \to G}$
* **Tổng chi phí tối ưu:** $\text{Cost} = 2 + 1 + 3 = \mathbf{6}$.

#### 2. Kiểm tra tính Hợp lệ (Admissibility) và Nhất quán (Consistency):

* **Tính khoảng cách thực tế tối ưu $h^*(n)$ từ mỗi nút tới đích $G$:**
  * $h^*(G) = 0$
  * Từ $D$: $D \to G$ chi phí $2 \implies \mathbf{h^*(D) = 2}$.
  * Từ $C$: $C \to G$ chi phí $3 \implies \mathbf{h^*(C) = 3}$.
  * Từ $B$: có 2 đường:
    * $B \to C \to G$ chi phí $1 + 3 = 4$.
    * $B \to D \to G$ chi phí $3 + 2 = 5$.
    * $\implies \mathbf{h^*(B) = \min(4, 5) = 4}$.
  * Từ $A$: có 2 đường:
    * $A \to C \to G$ chi phí $2 + 3 = 5$.
    * $A \to G$ chi phí $7$.
    * $\implies \mathbf{h^*(A) = \min(5, 7) = 5}$.
  * Từ $S$: có 2 đường:
    * $S \to A \to C \to G$ chi phí $2 + 5 = 7$.
    * $S \to B \to C \to G$ chi phí $2 + 4 = 6$.
    * $\implies \mathbf{h^*(S) = \min(7, 6) = 6}$.

* **Chứng minh Tính hợp lệ (Admissibility):**
  * Điều kiện: $0 \le h(n) \le h^*(n)$ với mọi nút $n$.
  * Đối chiếu bảng giá trị:
    * $h(S) = 5 \le h^*(S) = 6$ (Thỏa)
    * $h(A) = 4 \le h^*(A) = 5$ (Thỏa)
    * $h(B) = 4 \le h^*(B) = 4$ (Thỏa)
    * $h(C) = 2 \le h^*(C) = 3$ (Thỏa)
    * $h(D) = 1 \le h^*(D) = 2$ (Thỏa)
    * $h(G) = 0 \le h^*(G) = 0$ (Thỏa)
  * $\implies$ **Heuristic $h(n)$ là HỢP LỆ (ADMISSIBLE).**

* **Chứng minh Tính nhất quán (Consistency):**
  * Điều kiện: $h(u) \le c(u, v) + h(v)$ với mọi cạnh $(u, v)$.
  * Xét cạnh có hướng **$B \to C$**:
    * Chi phí cạnh: $c(B, C) = 1$.
    * Giá trị heuristic: $h(B) = 4$, $h(C) = 2$.
    * Bất đẳng thức tam giác:
      $$h(B) \le c(B, C) + h(C) \iff 4 \le 1 + 2 = 3 \quad (\text{Vô lý vì } 4 > 3)$$
  * Vì bất đẳng thức tam giác bị vi phạm nghiêm trọng trên cạnh $B \to C$, ta kết luận:
    > **Heuristic $h(n)$ KHÔNG NHẤT QUÁN (INCONSISTENT).**

* **Lưu ý cốt tử khi cài đặt thuật toán (Implementation Precaution):**
  * Nếu một heuristic chỉ hợp lệ (admissible) nhưng **không nhất quán (inconsistent)**, một trạng thái đã từng được lấy ra khỏi OPEN và đưa vào tập CLOSED hoàn toàn có thể được tìm thấy một đường đi mới với chi phí rẻ hơn thông qua một nhánh khác về sau.
  * Do đó, thuật toán bắt buộc phải cho phép **TÁI MỞ RỘNG (REOPENING NODES)**: Khi phát hiện đường đi mới tới một nút $u \in \text{CLOSED}$ có $g_{\text{new}}(u) < g_{\text{old}}(u)$, hệ thống phải chuyển $u$ từ CLOSED quay trở lại danh sách OPEN.
  * Nếu không cài đặt cơ chế Reopening, thuật toán tìm kiếm đồ thị $A^*$ sẽ **mất tính tối ưu (lose optimality)** và có thể trả về một đường đi dưới mức tối ưu.

---

**Rubric Chấm Điểm:**
* Lập bảng diễn tiến OPEN chính xác qua từng bước, thể hiện đúng thao tác update: **0.9 điểm**.
* Chỉ ra đúng đường đi tối ưu $S-B-C-G$ và chi phí $6$: **0.3 điểm**.
* Tính đúng $h^*(n)$ và chứng minh $h(n)$ Admissible: **0.3 điểm**.
* Chỉ ra vi phạm tam giác trên cạnh $B \to C$ ($4 > 1+2$) và phân tích sâu cơ chế Reopening: **0.5 điểm**.

---

## Câu 7 (2.0 điểm) — Bộ Lọc Thư Rác Bayes & Nghịch Lý Tỷ Lệ Gốc Trong Phân Lớp

### Question (English)
An email filter uses a Boolean feature $K$: the email contains a suspicious keyword. Let $S$ denote that the email is spam.
$$P(S)=0.10, \qquad P(K \mid S)=0.80, \qquad P(K \mid \neg S)=0.20.$$
1. Compute $P(K)$, then compute $P(S \mid K)$ using Bayes' theorem. (1.4 points)
2. Compare the posterior with the prior and explain why a positive keyword does not imply that the email is certainly spam. (0.6 point)

### Câu hỏi (Tiếng Việt)
Một bộ lọc email dùng đặc trưng Boolean $K$: email chứa một từ khóa đáng ngờ. Gọi $S$ là sự kiện email là thư rác (spam).
$$P(S)=0.10, \qquad P(K \mid S)=0.80, \qquad P(K \mid \neg S)=0.20.$$
1. Tính $P(K)$ bằng luật xác suất toàn phần, sau đó tính $P(S \mid K)$ bằng định lý Bayes. (1.4 điểm)
2. So sánh xác suất hậu nghiệm với xác suất tiên nghiệm và giải thích vì sao một email chứa từ khóa đáng ngờ vẫn chưa chắc chắn là thư rác. (0.6 điểm)

### Lời Giải Chi Tiết Chuẩn A+

#### 1. Tính toán xác suất toàn phần và hậu nghiệm Bayes:

* **Tóm tắt tham số tiên nghiệm và bằng chứng:**
  * Xác suất tiên nghiệm email là thư rác:
    $$P(S) = 0.10 \implies P(\neg S) = 1 - 0.10 = 0.90$$
    (nghĩa là 90% email trong hộp thư là thư hợp lệ).
  * Khả năng chứa từ khóa nếu là thư rác (True Positive Rate):
    $$P(K \mid S) = 0.80$$
  * Tỷ lệ từ khóa xuất hiện nhầm trong thư hợp lệ (False Positive Rate):
    $$P(K \mid \neg S) = 0.20$$

##### A. Tính xác suất toàn phần $P(K)$ theo Luật Xác Suất Toàn Phần:
Biến cố email chứa từ khóa $K$ có thể đến từ hai nguồn xung khắc: từ thư rác hoặc từ thư hợp lệ:
$$P(K) = P(K \mid S) \cdot P(S) + P(K \mid \neg S) \cdot P(\neg S)$$

Thay số chi tiết:
$$P(K) = (0.80 \times 0.10) + (0.20 \times 0.90)$$
$$P(K) = 0.080 + 0.180 = \mathbf{0.260} \quad (26.0\%)$$

##### B. Tính xác suất hậu nghiệm $P(S \mid K)$ theo Định Lý Bayes:
$$P(S \mid K) = \frac{P(K \mid S) \cdot P(S)}{P(K)} = \frac{0.080}{0.260} = \frac{8}{26} = \frac{4}{13} \approx \mathbf{0.30769...} \approx \mathbf{30.77\%}$$

#### 2. So sánh Tiên nghiệm vs Hậu nghiệm & Phân tích hiện tượng:

* **So sánh định lượng:**
  * Xác suất tiên nghiệm ban đầu: $P(S) = 10\%$.
  * Xác suất hậu nghiệm sau khi phát hiện từ khóa: $P(S \mid K) \approx 30.77\%$.
  * Nhận xét: Việc xuất hiện từ khóa $K$ đã làm tăng niềm tin email đó là thư rác lên **hơn 3 lần** (từ $10\%$ lên gần $31\%$). Bằng chứng $K$ thực sự mang thông tin phân loại tích cực.
* **Vì sao có từ khóa $K$ vẫn KHÔNG THỂ CHẮC CHẮN là thư rác?**
  * Mặc dù xác suất tăng đáng kể, nhưng tại $30.77\%$, điều đó đồng nghĩa với việc vẫn có tới **$69.23\%$ khả năng email này là thư hợp lệ hoàn toàn**!
  * **Phân tích bản chất bằng Quy mô quần thể (Xét 1.000 email nhận được):**
    * Thư rác thật sự ($10\%$): $1.000 \times 0.10 = 100$ email.
      * Trong đó có chứa từ khóa: $100 \times 0.80 = \mathbf{80}$ email.
    * Thư hợp lệ ($90\%$): $1.000 \times 0.90 = 900$ email.
      * Dù tỷ lệ báo nhầm chỉ $20\%$, nhưng nhân với lượng thư hợp lệ khổng lồ: $900 \times 0.20 = \mathbf{180}$ email hợp lệ bị dính từ khóa!
    * **Tổng số email có từ khóa $K$:** $80 + 180 = 260$ email.
    * Trong số 260 email này, số email hợp lệ ($180$) **nhiều hơn gấp đôi** số email thư rác thật ($80$)!
* **Bài học thiết kế AI:**
  * Đây là biểu hiện điển hình của **Nghịch lý tỷ lệ gốc (Base Rate Fallacy)**.
  * Nếu hệ thống lọc tự động lập tức xóa bỏ email chỉ dựa vào một đặc trưng $K$ duy nhất, nó sẽ xóa nhầm $69.23\%$ thư quan trọng của người dùng. Một hệ thống AI duy lý cần kết hợp nhiều đặc trưng độc lập (Naive Bayes Classifier) để đẩy xác suất hậu nghiệm vượt ngưỡng an toàn ($> 99\%$) trước khi thực hiện hành động chặn.

---

**Rubric Chấm Điểm:**
* Tính đúng xác suất toàn phần $P(K) = 0.26$: **0.6 điểm**.
* Áp dụng đúng công thức Bayes và tính đúng $P(S \mid K) = \frac{4}{13} \approx 30.77\%$: **0.8 điểm**.
* So sánh xác suất và phân tích định lượng quần thể (giải thích tại sao thư hợp lệ chiếm áp đảo $69.23\%$): **0.6 điểm**.

---

## BẢNG TỔNG KẾT ĐIỂM TOÀN BÀI — ĐỀ 05

| Câu hỏi | Chủ đề kiến thức | Điểm tối đa | Chuẩn đầu ra (Target Competency) |
|:---:|:---|:---:|:---|
| **Câu 1** | Chương 1: Hành động như người vs Tác tử duy lý | **1.5** | Nắm vững ưu/nhược điểm Turing, định nghĩa Rational Agent, tối ưu hóa |
| **Câu 2** | Chương 2: Suy diễn hướng mục tiêu SLD trên Horn KB | **1.0** | Lập vết mục tiêu con, triệt tiêu literal rút ra mệnh đề rỗng $[\Box]$ |
| **Câu 3** | Chương 3: Hợp nhất Robinson trên vị từ bậc cao | **1.0** | Thiết lập phương trình đối số, khử hàm và tìm MGU chính xác tuyệt đối |
| **Câu 4** | Chương 4: Bất định xác suất vs Logic mờ | **1.0** | Phân biệt sự thiếu thông tin (Probability) vs sự mơ hồ ngữ nghĩa (Fuzzy) |
| **Câu 5** | Chương 5: Đệ quy danh sách & Trace ngăn xếp Prolog | **1.5** | Viết mã chuẩn Prolog, truy vết Call/Exit unwinding pha tính toán |
| **Câu 6** | Chương 6: Thuật toán $A^*$, Cập nhật OPEN & Reopening | **2.0** | Trace A*, chứng minh Admissibility & Inconsistency, phân tích Reopening |
| **Câu 7** | Chương 7: Bộ lọc Naive Bayes & Base Rate Fallacy | **2.0** | Tính xác suất toàn phần, công thức Bayes, phân tích sai số quần thể |
| **TỔNG** | **Toàn bộ 7 Chương học phần AI** | **10.0** | **Đạt chuẩn điểm 10/10 (Xuất sắc - Chuẩn chỉ)** |

## Tổng điểm

**Tổng: 10/10**

