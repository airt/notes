---
title: Notes of Diagnosing Learning Algorithm
date: 2017-09-20
tags: ML
---

Notes of [Diagnosing Learning Algorithm](https://www.coursera.org/learn/machine-learning/supplement/aFpD3/evaluating-a-hypothesis)

<!-- more -->

## Datasets

- Training set: 60%
- Cross validation set: 20%
- Test set: 20%

$\displaystyle J_{test}(\theta) = \frac{1}{2m_{test}} \sum_{i=1}^{m_{test}} \left( h_\theta(x_{test}^{(i)}) - y_{test}^{(i)} \right) ^ 2$

## Bias and Variance

- High bias (underfit): $J_{train}(\theta)$ will be high and $J_{CV}(\theta) \approx J_{train}(\theta)$
- High variance (overfit): $J_{train}(\theta)$ will be low and $J_{CV}(\theta) \gg J_{train}(\theta)$

## Learning Curves

plot(1:m, $J_{train}(\theta)$, 1:m, $J_{CV}(\theta)$)

- Experiencing high bias:
  - Low training set size: $J_{train}(\theta)$ will be low and $J_{CV}(\theta)$ will be high
  - Large training set size: both $J_{train}(\theta)$ and $J_{CV}(\theta)$ will be high with $J_{train}(\theta) \approx J_{CV}(\theta)$
- Experiencing high variance:
  - Low training set size: $J_{train}(\theta)$ will be low and $J_{CV}(\theta)$ will be high
  - Large training set size: $J_{train}(\theta)$ increases with training set size and $J_{CV}(\theta)$ continues to decrease without leveling off,
    also $J_{train}(\theta) < J_{CV}(\theta)$ but the difference between them remains significant

## Deciding What to Do Next

- Getting more training examples: Fixes high variance
- Trying smaller sets of features: Fixes high variance
- Adding features: Fixes high bias
- Adding polynomial features: Fixes high bias
- Decreasing $\lambda$: Fixes high bias
- Increasing $\lambda$: Fixes high variance

## Error Analysis

- Start with a simple algorithm, implement it quickly, and test it early on your cross validation data
- Plot learning curves to decide if more data, more features, etc. are likely to help
- Manually examine errors on examples in cross validation set and try to spot a trend where most of errors were made

## Precision and Recall

|                 |       actual 1 |       actual 0 |
| --------------- | -------------- | -------------- |
| **predicted 1** |  true positive | false positive |
| **predicted 0** | false negative |  true negative |

$\text{accuracy} = \dfrac{tp + tn}{tp + tn + fp + fn}$

$\text{precision} = \dfrac{tp}{tp + fp}$

$\text{recall} = \dfrac{tp}{tp + fn}$

$F_1 = \dfrac{2 \cdot precision \cdot recall}{precision + recall}$

---

- <https://www.coursera.org/learn/machine-learning/supplement/7BHrF/lecture-slides>
- <https://www.coursera.org/learn/machine-learning/supplement/gFC7y/lecture-slides>
