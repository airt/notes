---
title: Notes of Linear Regression
date: 2017-08-23
tags: ML
---

Notes of [Linear Regression](https://www.coursera.org/learn/machine-learning/supplement/cRa2m/model-representation)

<!-- more -->

## Model Representation

| &nbsp;                                 | &nbsp;                      |
|----------------------------------------|-----------------------------|
| m                                      | number of training examples |
| n                                      | number of features          |
| $x^{(i)}$                              | input variables / features  |
| $y^{(i)}$                              | output variable / target    |
| $(x^{(i)}, y^{(i)})$                   | training example            |
| $(x^{(i)}, y^{(i)}) \quad i=1 \dots m$ | training set                |
| $h : X → Y$                            | hypothesis                  |

$h_\theta(x) = \theta^T x$

where
$\;\;$ $x_{0}^{(i)} = 1$

learning algorithm : training set → h

## Cost Function

$\displaystyle J(\theta) = \frac{1}{2m} \sum\_{i=1}^m \left( h\_\theta(x^{(i)}) - y^{(i)} \right) ^ 2$

## Gradient Descent

> Goal: $minimize _\theta J(\theta)$

### Batch Gradient Descent

Repeat until convergence
$\;\;$ $\displaystyle \theta\_j := \theta\_j - \alpha \frac{\partial}{\partial \theta_j} J(\theta) \quad \text{for} \; j \gets 0 \dots n$

where
$\;\;$ $\alpha$: learning rate
$\;$ $\displaystyle \frac{\partial}{\partial \theta\_j} J(\theta) = \frac{1}{m} \sum\_{i=1}^m (h\_\theta(x^{(i)}) - y^{(i)}) \; x\_j^{(i)}$

(simultaneous update)

### Stochastic Gradient Descent

Randomly shuffle training examples

Repeat
$\;\;$ $\text{for} \; i \gets 1 \dots m$
$\;\;\;\;$ $\displaystyle \theta\_j := \theta\_j - \alpha \; (h\_\theta(x^{(i)}) - y^{(i)}) \; x\_j^{(i)} \quad \text{for} \; j \gets 0 \dots n$

### Mini-Batch Gradient Descent

- Batch gradient descent: Use all $m$ examples in each iteration
- Stochastic gradient descent: Use 1 example in each iteration
- Mini-batch gradient descent: Use $b$ examples in each iteration

### Online Learning

[Online Learning - Wikipedia](https://en.wikipedia.org/wiki/online_machine_learning)

### Feature Scaling and Mean Normalization

$x\_i := \dfrac{x\_i - \mu\_i}{s_i}$

where
$\;\;$ $\mu\_i$: average of all values for feature $x_i$
$\;\;$ $s_i$: range of values (max - min) --- or standard deviation

### Regularization

$\displaystyle J(\theta) = \frac{1}{2m} \left[ \sum\_{i=1}^m \left( h\_\theta(x^{(i)}) - y^{(i)} \right) ^ 2 + \lambda \sum\_{j=1}^n \theta\_j^2 \right]$

where
$\;\;$ $\lambda$: regularization parameter

> $\displaystyle \sum\_{j=1}^n \theta\_j^2$ excludes the bias term $\theta_0$

### Vectorization

$\displaystyle \theta := \theta - \alpha \frac{1}{m} X^T (X \theta - y)$

### Learning Rate

plot(1:iterations, $J(θ)$)

- If $\alpha$ is too small: slow convergence
- If $\alpha$ is too large: may not decrease on every iteration and thus may not converge

> It has been proven that if learning rate $\alpha$ is sufficiently small, then $J(θ)$ will decrease on every iteration

## Normal Equation

$\theta = (X^T X)^{-1} X^T y$

> There is no need to do feature scaling with the normal equation

### Derivation

$
X =
\begin{bmatrix}
--- (x^{(1)})^T --- \newline
--- (x^{(2)})^T --- \newline
\vdots \newline
--- (x^{(m)})^T --- \newline
\end{bmatrix}
$

$
y =
\begin{bmatrix}
y^{(1)} \newline
y^{(2)} \newline
\vdots \newline
y^{(m)} \newline
\end{bmatrix}
$

$
X \theta - y =
\begin{bmatrix}
h\_\theta(x^{(1)}) - y^{(1)} \newline
h\_\theta(x^{(2)}) - y^{(2)} \newline
\vdots \newline
h\_\theta(x^{(m)}) - y^{(m)} \newline
\end{bmatrix}
$

$
\displaystyle
\frac{1}{2m} (X \theta - y)^T (X \theta - y) =
\frac{1}{2m} \sum\_{i=1}^m \left( h_\theta(x^{(i)}) - y^{(i)} \right)^2 =
J(\theta)
$

$
\nabla_\theta J(\theta) = X^T X \theta - X^T y
$

$\nabla_\theta J(\theta) = 0$ &nbsp; $\to$ &nbsp; $\theta = (X^T X)^{-1} X^T y$

### Noninvertibility

If $X^T X$ is noninvertible, the common causes might be having:

- Redundant features (i.e. some features are linearly dependent)
- Too many features (e.g. m ≤ n)

Solutions: reduce the number of features or use regularization

### Regularization

$\theta = \left( X^T X + \lambda L \right) ^ {-1} X^T y$

where
$\;\;$ $\lambda$: regularization parameter
$\;\;$ $
L =
\begin{bmatrix}
0 & & & & \newline
& 1 & & & \newline
& & 1 & & \newline
& & & \ddots & \newline
& & & & 1 \newline
\end{bmatrix}
$

## Comparison of Gradient Descent and Normal Equation

| Gradient Descent           | Normal Equation                                      |
|----------------------------|------------------------------------------------------|
| Need to choose $\alpha$    | No need to choose $\alpha$                           |
| Need many iterations       | No need to iterate                                   |
| $\mathcal{O}(k n^2)$       | $\mathcal{O}(n^3)$, need to calculate $(X^T X)^{-1}$ |
| Works well when n is large | Slow if n is very large                              |

> In practice, when n exceeds 10,000 it might be a good time to go from a normal solution to an iterative process

## Combine Features

For example, combine $x\_1$ and $x\_2$ into a new feature $x\_3$ by taking $x\_1 \cdot x\_2$

## Polynomial Regression

> Hypothesis function need not be linear (a straight line) if that does not fit the data well

For example, to make it a square root function:

$x\_2 = \sqrt{x\_1}$ &nbsp; $s.t.$ &nbsp; $h\_\theta(x) = \theta\_0 + \theta\_1 x\_1 + \theta\_2 \sqrt{x_1}$

> If choose features this way then feature scaling becomes very important

---

- <https://www.coursera.org/learn/machine-learning/supplement/d5Pt1/lecture-slides>
- <https://www.coursera.org/learn/machine-learning/supplement/ExY6Z/lecture-slides>
- <https://www.coursera.org/learn/machine-learning/supplement/HDawH/lecture-slides>
- <https://www.coursera.org/learn/machine-learning/supplement/itpOu/lecture-slides>
