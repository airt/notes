---
title: Notes of Logistic Regression
date: 2017-09-01
tags: ML
---

Notes of [Logistic Regression](https://www.coursera.org/learn/machine-learning/supplement/fDCQp/classification)

<!-- more -->

## Hypothesis Representation

$h_\theta(x) = g(\theta^T x)$

### Sigmoid Function

$g(z) = \dfrac{1}{1 + e^{-z}}$ &nbsp; $\in (0, 1)$

### Probability

$P(y = 1 \mid x; \theta) = h_\theta(x)$

$P(y = 0 \mid x; \theta) = 1 - h_\theta(x)$

## Decision Boundary

> The line that separates the area where y = 0 and where y = 1

$\theta^T x \geq 0$ &nbsp; $\to$ &nbsp; $h_\theta(x) \geq 0.5$ &nbsp; $\to$ &nbsp; $y = 1$

$\theta^T x < 0$ &nbsp; $\to$ &nbsp; $h_\theta(x) < 0.5$ &nbsp; $\to$ &nbsp; $y = 0$

## Cost Function

$\displaystyle J(\theta) = \frac{1}{m} \sum\_{i=1}^m \mathrm{cost}(h\_\theta(x^{(i)}), y^{(i)})$

$
\mathrm{cost}(h\_\theta(x), y) =
\- y \log(h\_\theta(x)) - (1 - y) \log(1 - h\_\theta(x))
=
\begin{cases}
-\log(h\_\theta(x))     & \quad \text{if} \; y = 1 \newline
-\log(1 - h\_\theta(x)) & \quad \text{if} \; y = 0 \newline
\end{cases}
$

$s.t.$ &nbsp; $
\mathrm{cost}(h\_\theta(x), y) =
\begin{cases}
0          & \quad \text{if} \; h\_\theta(x) = y \newline
\to \infty & \quad \text{if} \; y = 1 \; \mathrm{and} \; h\_\theta(x) \to 0 \newline
\to \infty & \quad \text{if} \; y = 0 \; \mathrm{and} \; h\_\theta(x) \to 1 \newline
\end{cases}
$

### Vectorization

$\displaystyle J(\theta) = \frac{1}{m} \left( - y^T \log(g(X \theta)) - (1 - y)^T \log(1 - g(X \theta)) \right)$

## Gradient Descent

Repeat until convergence
$\;\;$ $\displaystyle \theta\_j := \theta\_j - \alpha \frac{\partial}{\partial \theta_j} J(\theta) \quad \text{for} \; j \gets 0 \dots n$

where
$\;\;$ $\alpha$: learning rate
$\;$ $\displaystyle \frac{\partial}{\partial \theta\_j} J(\theta) = \frac{1}{m} \sum\_{i=1}^m (h\_\theta(x^{(i)}) - y^{(i)}) \; x\_j^{(i)}$

(simultaneous update)

### Vectorization

$\displaystyle \theta := \theta - \alpha \frac{1}{m} X^T (g(X \theta) - y)$

## Multiclass Classification

> one-vs-all

$y \in \lbrace 1 \dots k \rbrace$

$h\_\theta(x) \in \mathbb{R} ^ {K}$

$h\_\theta(x)\_k = P(y = k \mid x; \theta)$

$\mathrm{prediction} = \max\_k(h\_\theta(x)\_k)$

where
$\;\;$ $K$: number of classes

## Regularization

$\displaystyle J(\theta) = \frac{1}{m} \sum\_{i=1}^m \mathrm{cost}(h\_\theta(x^{(i)}), y^{(i)}) + \frac{\lambda}{2m} \sum\_{j=1}^n \theta\_j^2$

where
$\;\;$ $\lambda$: regularization parameter

> $\displaystyle \sum\_{j=1}^n \theta\_j^2$ excludes the bias term $\theta_0$

---

- <https://www.coursera.org/learn/machine-learning/supplement/QEYX8/lecture-slides>
- <https://www.coursera.org/learn/machine-learning/supplement/CUz2O/lecture-slides>
