---
title: Notes of Linear Algebra Review
date: 2017-08-25
tags: ML
---

Notes of [Linear Algebra Review](https://www.coursera.org/learn/machine-learning/supplement/Q6mSN/matrices-and-vectors)

<!-- more -->

## Matrix

$\mathbb{R} ^ {3 \times 2}$:

$$
\begin{bmatrix}
a & b \newline
c & d \newline
e & f \newline
\end{bmatrix}
$$

```m
A = [1, 2; 3, 4; 5, 6]

[rows, columns] = size(A)
```

$A_{ij}$: element in the ith row and jth column of matrix $A$

```m
A(3, 2)
```

## Vector

$\mathbb{R} ^ {3}$:

$$
\begin{bmatrix}
x \newline
y \newline
z \newline
\end{bmatrix}
$$

```m
v = [1; 2; 3]
```

$v_i$: element in the ith row of the vector $v$

```m
v(3)
```

## Addition

$$
\begin{bmatrix}
a & b \newline
c & d \newline
\end{bmatrix}
+
\begin{bmatrix}
w & x \newline
y & z \newline
\end{bmatrix}
=
\begin{bmatrix}
a + w & b + x \newline
c + y & d + z \newline
\end{bmatrix}
$$

```m
A = [1, 2, 3; 4, 5, 6]
B = [1, 4, 7; 2, 5, 8]

A + B
```

## Scalar Multiplication

$$
\begin{bmatrix}
a & b \newline
c & d \newline
\end{bmatrix}
\cdot
x
=
\begin{bmatrix}
a \cdot x & b \cdot x \newline
c \cdot x & d \cdot x \newline
\end{bmatrix}
$$

```m
A = [1, 2, 3; 4, 5, 6]
s = 2

A * s
```

## Matrix-Vector Multiplication

$$
\begin{bmatrix}
a & b \newline
c & d \newline
e & f \newline
\end{bmatrix}
\cdot
\begin{bmatrix}
x \newline
y \newline
\end{bmatrix}
=
\begin{bmatrix}
a \cdot x + b \cdot y \newline
c \cdot x + d \cdot y \newline
e \cdot x + f \cdot y \newline
\end{bmatrix}
$$

```m
A = [1, 2, 3; 4, 5, 6; 7, 8, 9]
v = [1; 1; 1]

A * v
```

## Matrix-Matrix Multiplication

$$
\begin{bmatrix}
a & b \newline
c & d \newline
e & f \newline
\end{bmatrix}
\cdot
\begin{bmatrix}
w & x \newline
y & z \newline
\end{bmatrix}
=
\begin{bmatrix}
a \cdot w + b \cdot y & a \cdot x + b \cdot z \newline
c \cdot w + d \cdot y & c \cdot x + d \cdot z \newline
e \cdot w + f \cdot y & e \cdot x + f \cdot z \newline
\end{bmatrix}
$$

```m
A = [1, 2; 3, 4; 5, 6]
B = [1; 2]

A * B
```

## Matrix Multiplication Properties

Not Commutative: $A B \neq B A$ in general

Associative: $(A B) C = A (B C)$

Identity: $I$ (or $I_{n \times n}$) &nbsp; $s.t.$ &nbsp; $A I = I A = A$

$$
I_{3 \times 3}
=
\begin{bmatrix}
1 & 0 & 0 \newline
0 & 1 & 0 \newline
0 & 0 & 1 \newline
\end{bmatrix}
$$

```m
I = eye(3)
```

## Inverse and Transpose

Transposition: $A^T$ &nbsp; $s.t.$ &nbsp; $A_{ij} = (A^T)_{ji}$

```m
A = [1, 2, 3; 4, 5, 6; 7, 8, 9]

A'
```

Inverse: $A^{-1}$ &nbsp; $s.t.$ &nbsp; $A A^{-1} = A^{-1} A = I$

```m
A = [1, 2, 0; 0, 5, 6; 7, 0, 9]

inv(A)
```

> Matrices that don't have an inverse are *singular* or *degenerate*

Pseudoinverse: $A^{+}$ &nbsp; $s.t.$ &nbsp; $A A^{+} A = A$, &nbsp; $A^{+} A A^{+} = A^{+}$

```m
A = [1, 2, 0; 0, 5, 6; 7, 0, 9]

pinv(A)
```

---

- <https://www.coursera.org/learn/machine-learning/supplement/xRMqw/lecture-slides>
- <https://en.wikibooks.org/wiki/LaTeX/Mathematics>
