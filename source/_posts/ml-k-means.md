---
title: Notes of K-Means
date: 2017-10-10
tags: ML
---

Notes of [K-Means](https://www.coursera.org/learn/machine-learning/lecture/czmip/unsupervised-learning-introduction)

<!-- more -->

## Input

- $K$ (number of clusters)
- Training set $\{ x^{(1)}, x^{(2)} \dots x^{(m)} \}$

## Algorithm

Randomly initialize $K$ cluster centroids $\mu_1, \mu_2 \dots \mu_K \in \mathbb{R}^n$

Repeat
<br/>$\;\;$ for $i$ = $1$ to $m$
<br/>$\;\;\;\;$ $c^{(i)}$ := index (from $1$ to $K$) of cluster centroid closest to $x^{(i)}$
<br/>$\;\;$ for $k$ = $1$ to $K$
<br/>$\;\;\;\;$ $\mu_k$ := average (mean) of points assigned to cluster $k$

Run 100 times, pick clustering that gave lowest cost $J(c^{(1)} \dots c^{(m)}, \mu_1 \dots \mu_K)$

## Optimization Objective

$\displaystyle J(c^{(1)} \dots c^{(m)}, \mu_1 \dots \mu_K) =
\frac{1}{m} \sum_{i=1}^m ||x^{(i)} - \mu_{c^{(i)}}|| ^ 2$

<!--
$\displaystyle \min_{\underset{c^{(1)} \dots c^{(m)}}{\mu_1 \dots \mu_K}}
J(c^{(1)} \dots c^{(m)}, \mu_1 \dots \mu_K)$
-->

## Random Initialization

- Should have $K < m$
- Randomly pick $K$ training examples
- Set $\mu_1 \dots \mu_K$ equal to these $K$ examples

## Choosing the Number of Clusters

Sometimes, you are running K-means to get clusters to use for some later or downstream purpose
Evaluate K-means based on a metric for how well it performs for that later purpose

---

- <https://www.coursera.org/learn/machine-learning/supplement/hFF7A/lecture-slides>
