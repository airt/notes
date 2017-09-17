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

---

- <https://www.coursera.org/learn/machine-learning/supplement/jtFHI/lecture-slides>