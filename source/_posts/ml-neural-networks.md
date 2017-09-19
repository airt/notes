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
&nbsp;&nbsp;&nbsp; $l$: index of layer
&nbsp;&nbsp;&nbsp; $a^{(l)}$: "activation" in layer $l$
&nbsp;&nbsp;&nbsp; $a\_i^{(l)}$: "activation" of unit $i$ in layer $l$
&nbsp;&nbsp;&nbsp; $a\_0^{(l)} = 1$: bias units
&nbsp;&nbsp;&nbsp; $a^{(1)} = x$: input layer
&nbsp;&nbsp;&nbsp; $\Theta^{(l)} \in \mathbb{R} ^ {s\_{l+1} \times (s\_l + 1)}$: matrix of weights
&nbsp;&nbsp;&nbsp; $s\_l$: number of units in layer $l$

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
&nbsp;&nbsp;&nbsp; $K$: number of classes

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
&nbsp;&nbsp;&nbsp; $L$: total number of layers
&nbsp;&nbsp;&nbsp; $K$: number of classes / output units
&nbsp;&nbsp;&nbsp; $s\_l$: number of units in layer $l$

> The double sum simply adds up the logistic regression costs calculated for each cell in the output layer
> The triple sum simply adds up the squares of all the individual $\Theta$s in the entire network

---

- <https://www.coursera.org/learn/machine-learning/supplement/jtFHI/lecture-slides>
