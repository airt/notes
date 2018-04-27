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

<span/>

<!--
Layer 1: input layer
Layer 2: hidden layer
Layer 3: output layer
-->

$\begin{bmatrix}
x_1 \newline
x_2 \newline
x_3 \newline
\end{bmatrix}
\rightarrow
\begin{bmatrix}
a_1^{(2)} \newline
a_2^{(2)} \newline
a_3^{(2)} \newline
\end{bmatrix}
\rightarrow
h_\theta(x)$

<!--
$\begin{align}
a_1^{(2)} & = g(\Theta_{10}^{(1)}x_0 + \Theta_{11}^{(1)}x_1 + \Theta_{12}^{(1)}x_2 + \Theta_{13}^{(1)}x_3) \newline
a_2^{(2)} & = g(\Theta_{20}^{(1)}x_0 + \Theta_{21}^{(1)}x_1 + \Theta_{22}^{(1)}x_2 + \Theta_{23}^{(1)}x_3) \newline
a_3^{(2)} & = g(\Theta_{30}^{(1)}x_0 + \Theta_{31}^{(1)}x_1 + \Theta_{32}^{(1)}x_2 + \Theta_{33}^{(1)}x_3) \newline
a_1^{(3)} & = g(\Theta_{10}^{(2)}a_0^{(2)} + \Theta_{11}^{(2)}a_1^{(2)} + \Theta_{12}^{(2)}a_2^{(2)} + \Theta_{13}^{(2)}a_3^{(2)}) \newline
\end{align}$
-->

$a^{(l)} = g(\Theta^{(l-1)} a^{(l-1)})$

where
<br/>$\;\;$ $l$: index of layer
<br/>$\;\;$ $a^{(l)}$: "activation" in layer $l$
<br/>$\;\;$ $a_i^{(l)}$: "activation" of unit $i$ in layer $l$
<br/>$\;\;$ $a_0^{(l)} = 1$: bias units
<br/>$\;\;$ $a^{(1)} = x$: input layer
<br/>$\;\;$ $\Theta^{(l)} \in \mathbb{R} ^ {s_{l+1} \times (s_l + 1)}$: matrix of weights
<br/>$\;\;$ $s_l$: number of units in layer $l$

## Multiclass Classification

{% asset_img neural-network-multiclass.png %}

<span/>

$y \in
\lbrace
\begin{bmatrix} 1 \newline 0 \newline \vdots \newline 0 \end{bmatrix}
,
\begin{bmatrix} 0 \newline 1 \newline \vdots \newline 0 \end{bmatrix}
\dots
\begin{bmatrix} 0 \newline 0 \newline \vdots \newline 1 \end{bmatrix}
\rbrace$

$h_\Theta(x) \in \mathbb{R} ^ {K}$

$\mathrm{prediction} = \max_k(h_\Theta(x)_k)$

where
<br/>$\;\;$ $K$: number of classes

## Cost Function

$\displaystyle
\begin{gather}
J(\Theta) =
-
\frac{1}{m}
\sum_{i=1}^m
\sum_{k=1}^K
\left[
y^{(i)}_k
\log((h_\Theta(x^{(i)}))_k)
+
(1 - y^{(i)}_k)
\log(1 - (h_\Theta(x^{(i)}))_k)
\right]
+
\frac{\lambda}{2m}
\sum_{l=1}^{L-1}
\sum_{i=1}^{s_l}
\sum_{j=1}^{s_{l+1}}
(\Theta_{j,i}^{(l)})^2
\end{gather}$

where
<br/>$\;\;$ $L$: total number of layers
<br/>$\;\;$ $K$: number of classes / output units
<br/>$\;\;$ $s_l$: number of units in layer $l$

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

For example,
$\Theta^{(1)} \in \mathbb{R} ^ {10 \times 11}$,
$\Theta^{(2)} \in \mathbb{R} ^ {10 \times 11}$,
$\Theta^{(3)} \in \mathbb{R} ^ {1 \times 11}$

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

Check that &nbsp;
$\displaystyle
\frac{\partial}{\partial \Theta} J(\Theta) \approx
\frac{J(\Theta + \epsilon) - J(\Theta - \epsilon)}{2 \epsilon}$

where
<br/>$\;\;$ $\epsilon$: a small value, usually set to $10^{-4}$

<!--
$\displaystyle
\frac{\partial}{\partial \Theta_i} J(\Theta) \approx
\frac{J(\Theta_1 \dots \Theta_i + \epsilon \dots \Theta_n) - J(\Theta_1 \dots \Theta_i - \epsilon \dots \Theta_n)}{2 \epsilon}$
-->

### Random Initialization

<!--
> Initializing all theta weights to zero does not work with neural networks
> When backpropagate, all nodes will update to the same value repeatedly
-->

Initialize each $\Theta_{ij}^{(l)}$ to a random value in $[-\epsilon, \epsilon]$

where
<br/>$\;\;$ $\epsilon = \frac{\sqrt{6}}{\sqrt{L_{in} + L_{out}}}$
<br/>$\;\;$ $L_{in} = s_l$
<br/>$\;\;$ $L_{out} = s_{l+1}$

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
