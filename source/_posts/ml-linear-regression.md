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
| $(x^{(i)}, y^{(i)}) \quad i=1,\dots,m$ | training set                |
| $X$                                    | space of input values       |
| $Y$                                    | space of output values      |
| $h : X → Y$                            | hypothesis                  |

$h_\theta(x) = \theta^T x =
\begin{bmatrix}
\theta\_0 & \theta\_1 & \dots & \theta_n
\end{bmatrix}
\begin{bmatrix}
x\_0 \newline x\_1 \newline \vdots \newline x_n
\end{bmatrix}
$

where
&nbsp;&nbsp;&nbsp; $x_{0}^{(i)} = 1$

learning algorithm : training set → h

## Cost Function

$J(\theta) = \dfrac{1}{2m} \displaystyle \sum\_{i=1}^m \left (h_\theta(x^{(i)}) - y^{(i)} \right)^2$

## Gradient Descent

> Goal: $minimize _\theta J(\theta)$

repeat until convergence:
&nbsp;&nbsp;&nbsp; $\theta\_j := \theta\_j - \alpha \displaystyle \frac{\partial}{\partial \theta_j} J(\theta)$

where
&nbsp;&nbsp;&nbsp; $\alpha$: learning rate
&nbsp;&nbsp;&nbsp; $j$: index of feature

(simultaneous update)

<!--
- batch gradient descent
- stochastic gradient descent
-->

### Feature Scaling and Mean Normalization

$x\_i := \dfrac{x\_i - \mu\_i}{s_i}$

where
&nbsp;&nbsp;&nbsp; $\mu\_i$: average of all values for feature $x_i$
&nbsp;&nbsp;&nbsp; $s_i$: range of values (max - min) --- or standard deviation

### Learning Rate

plot(x = number of iterations, y = $J(θ)$)

- If $\alpha$ is too small: slow convergence
- If $\alpha$ is too large: ￼may not decrease on every iteration and thus may not converge

> It has been proven that if learning rate $\alpha$ is sufficiently small, then $J(θ)$ will decrease on every iteration

## Normal Equation

<!-- $h_\theta(x) = X \cdot \theta$ -->

$\theta = (X^T X)^{-1} X^T y$

> There is no need to do feature scaling with the normal equation

### Noninvertibility

If $X^T X$ is noninvertible, the common causes might be having:

- Redundant features (i.e. some features are linearly dependent)
- Too many features (e.g. m ≤ n)

Solutions: delete some features or use "regularization"

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
