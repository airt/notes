---
title: Notes of Neural Networks
date: 2017-09-10
tags: ML
---

Notes of [Neural Networks](https://www.coursera.org/learn/machine-learning/supplement/Bln5m/model-representation-i)

<!-- more -->

## Model Representation

### Neuron

{% asset_img neuron.png %}

### Neural Network

{% asset_img neural-network.png %}

&nbsp;
<!--
Layer 1: input layer
Layer 2: hidden layer
Layer 3: output layer
-->

$
\begin{bmatrix}
x\_1 \newline
x\_2 \newline
x\_3 \newline
\end{bmatrix}
\rightarrow
\begin{bmatrix}
a\_1^{(2)} \newline
a\_2^{(2)} \newline
a\_3^{(2)} \newline
\end{bmatrix}
\rightarrow
h\_\theta(x)
$

<!--
$
\begin{align}
a\_1^{(2)} & = g(\Theta\_{10}^{(1)}x\_0 + \Theta\_{11}^{(1)}x\_1 + \Theta\_{12}^{(1)}x\_2 + \Theta\_{13}^{(1)}x\_3) \newline
a\_2^{(2)} & = g(\Theta\_{20}^{(1)}x\_0 + \Theta\_{21}^{(1)}x\_1 + \Theta\_{22}^{(1)}x\_2 + \Theta\_{23}^{(1)}x\_3) \newline
a\_3^{(2)} & = g(\Theta\_{30}^{(1)}x\_0 + \Theta\_{31}^{(1)}x\_1 + \Theta\_{32}^{(1)}x\_2 + \Theta\_{33}^{(1)}x\_3) \newline
a\_1^{(3)} & = g(\Theta\_{10}^{(2)}a\_0^{(2)} + \Theta\_{11}^{(2)}a\_1^{(2)} + \Theta\_{12}^{(2)}a\_2^{(2)} + \Theta\_{13}^{(2)}a\_3^{(2)}) \newline
\end{align}
$
-->

$a^{(l)} = g(\Theta^{(l-1)} a^{(l-1)})$

where
$\;\;$ $l$: index of layer
$\;\;$ $a^{(l)}$: "activation" in layer $l$
$\;\;$ $a\_i^{(l)}$: "activation" of unit $i$ in layer $l$
$\;\;$ $a\_0^{(l)} = 1$: bias units
$\;\;$ $a^{(1)} = x$: input layer
$\;\;$ $\Theta^{(l)} \in \mathbb{R} ^ {s\_{l+1} \times (s\_l + 1)}$: matrix of weights
$\;\;$ $s\_l$: number of units in layer $l$

## Multiclass Classification

{% asset_img neural-network-multiclass.png %}

&nbsp;
$
y \in
\lbrace
\begin{bmatrix} 1 \newline 0 \newline \vdots \newline 0 \end{bmatrix}
,
\begin{bmatrix} 0 \newline 1 \newline \vdots \newline 0 \end{bmatrix}
\dots
\begin{bmatrix} 0 \newline 0 \newline \vdots \newline 1 \end{bmatrix}
\rbrace
$

$h\_\Theta(x) \in \mathbb{R} ^ {K}$

$\mathrm{prediction} = \max\_k(h\_\Theta(x)\_k)$

where
$\;\;$ $K$: number of classes

## Cost Function

$
\displaystyle
\begin{gather}
J(\Theta) =
\-
\frac{1}{m}
\sum\_{i=1}^m
\sum\_{k=1}^K
\left[
y^{(i)}\_k
\log((h\_\Theta(x^{(i)}))\_k)
\+
(1 - y^{(i)}\_k)
\log(1 - (h\_\Theta(x^{(i)}))\_k)
\right]
\+
\frac{\lambda}{2m}
\sum\_{l=1}^{L-1}
\sum\_{i=1}^{s\_l}
\sum\_{j=1}^{s\_{l+1}}
(\Theta\_{j,i}^{(l)})^2
\end{gather}
$

where
$\;\;$ $L$: total number of layers
$\;\;$ $K$: number of classes / output units
$\;\;$ $s\_l$: number of units in layer $l$

> The double sum simply adds up the logistic regression costs calculated for each cell in the output layer
> The triple sum simply adds up the squares of all the individual $\Theta$s in the entire network

## Back Propagation

> Goal: $minimize _\Theta J(\Theta)$

### Computing Partial Derivatives

<!--
$\dfrac{\partial}{\partial \Theta_{ij}^{(l)}} J(\Theta)$
-->

TODO

### Unrolling Parameters

For example, $
\Theta^{(1)} \in \mathbb{R} ^ {10 \times 11}
$, $
\Theta^{(2)} \in \mathbb{R} ^ {10 \times 11}
$, $
\Theta^{(3)} \in \mathbb{R} ^ {1 \times 11}
$

Unroll:

```m
unrolledTheta = [Theta1(:); Theta2(:); Theta3(:)]
```

Reshape:

```m
Theta1 = reshape(unrolledTheta(1:110), 10, 11)
Theta2 = reshape(unrolledTheta(111:220), 10, 11)
Theta3 = reshape(unrolledTheta(221:231), 1, 11)
```

### Gradient Checking

Check that &nbsp; $
\displaystyle
\frac{\partial}{\partial \Theta} J(\Theta) \approx
\frac{J(\Theta + \epsilon) - J(\Theta - \epsilon)}{2 \epsilon}
$

where
$\;\;$ $\epsilon$: a small value, usually set to $10^{-4}$

<!--
$
\displaystyle
\frac{\partial}{\partial \Theta\_i} J(\Theta) \approx
\frac{J(\Theta\_1 \dots \Theta\_i + \epsilon \dots \Theta\_n) - J(\Theta\_1 \dots \Theta\_i - \epsilon \dots \Theta\_n)}{2 \epsilon}
$
-->

### Random Initialization

<!--
> Initializing all theta weights to zero does not work with neural networks
> When backpropagate, all nodes will update to the same value repeatedly
-->

Initialize each $\Theta_{ij}^{(l)}$ to a random value in $[-\epsilon, \epsilon]$

where
$\;\;$ $\epsilon = \frac{\sqrt{6}}{\sqrt{L\_{in} + L\_{out}}}$
$\;\;$ $L\_{in} = s\_l$
$\;\;$ $L\_{out} = s\_{l+1}$

### Network Architecture

- Number of input units = dimension of features $x^{(i)}$
- Number of output units = number of classes
- Number of hidden units per layer = usually more the better (cost of computation increases with more hidden units)
- Number of hidden layers = defaults 1 (if ＞ 1, it is recommended to have same number of units in every hidden layer)

### Summary

1. Randomly initialize weights
1. Implement forward propagation to get $h_\Theta(x^{(i)})$ for any $x^{(i)}$
1. Implement code to compute cost function $J(\Theta)$
1. Implement back propagation to compute partial derivatives
1. Use gradient checking to confirm that back propagation works (then disable gradient checking)
1. Use gradient descent or advanced optimization method with back propagation to minimize $J(\Theta)$ as a function of $\Theta$

---

- <https://www.coursera.org/learn/machine-learning/supplement/jtFHI/lecture-slides>
- <https://www.coursera.org/learn/machine-learning/supplement/FklyY/lecture-slides>
