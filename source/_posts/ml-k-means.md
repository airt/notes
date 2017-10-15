---
title: Notes of K-Means
date: 2017-10-10
tags: ML
---

Notes of [K-Means](https://www.coursera.org/learn/machine-learning/lecture/czmip/unsupervised-learning-introduction)

<!-- more -->

## K-Means

### Input

- $K$ (number of clusters)
- Training set $\\{ x^{(1)}, x^{(2)} \dots x^{(m)} \\}$

### Algorithm

Randomly initialize $K$ cluster centroids $\mu\_1, \mu\_2 \dots \mu\_K \in \mathbb{R}^n$

Repeat {
$\;\;$ for $i$ = $1$ to $m$
$\;\;\;\;$ $c^{(i)}$ := index (from $1$ to $K$) of cluster centroid closest to $x^{(i)}$
$\;\;$ for $k$ = $1$ to $K$
$\;\;\;\;$ $\mu\_k$ := average (mean) of points assigned to cluster $k$
}

Run 100 times, pick clustering that gave lowest cost $J(c^{(1)} \dots c^{(m)}, \mu\_1 \dots \mu\_K)$

### Optimization Objective

$
\displaystyle
J(c^{(1)} \dots c^{(m)}, \mu\_1 \dots \mu\_K) =
\frac{1}{m} \sum\_{i=1}^m ||x^{(i)} - \mu\_{c^{(i)}}|| ^ 2
$

<!--
$
\displaystyle
\min\_{\underset{c^{(1)} \dots c^{(m)}}{\mu\_1 \dots \mu\_K}}
J(c^{(1)} \dots c^{(m)}, \mu\_1 \dots \mu\_K)
$
-->

### Random Initialization

- Should have $K < m$
- Randomly pick $K$ training examples
- Set $\mu\_1 \dots \mu\_K$ equal to these $K$ examples

### Choosing the Number of Clusters

Sometimes, you are running K-means to get clusters to use for some later or downstream purpose
Evaluate K-means based on a metric for how well it performs for that later purpose

---

- <https://www.coursera.org/learn/machine-learning/supplement/hFF7A/lecture-slides>
