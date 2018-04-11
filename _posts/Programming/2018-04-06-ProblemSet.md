---
layout: post
title: "【CS】Algorithm Problem Set"
description: ""
category: CS
tags: [Algorithms]
---
{% include JB/setup %}


This is an incomplete solution to a very interesting [problem set](/assets/files/2018-04-06-problemset.pdf) regarding cute algorithm problems. If you have (better) ideas about these problems or you find any mistake here, you can discuss with me by [issue on github](https://github.com/zhangchuheng123/zhangchuheng123.github.io/issues).

## Useful Resources

https://www.cs.princeton.edu/courses/archive/spring13/cos423/lectures.php

## 1. Longest path in a DAG

### Description

We are given a directed acyclic graph G and two specific vertices s and t in G. Each edge in the graph has a length. Design a polynomial time algorithm that finds the longest path from s to t. (if there is no path from s to t, your algorithm should be able to detect the fact.)

### Solution (DP on graph)

```
(V, E) = sort G in topological order

for each node x in V:
    x.dist = -inf
    x.pred = null
    
ind_s = index of s in V
V[ind_x].dist = 0

for each node x in V[ind_x:]:
    for each edge e = (y, x) in E:
        if (x.dist < y.dist + e.weight):
            x.dist = y.dist + e.weight
            x.pred = y

ind_t = index of t in V
if V[ind_t].dist > 0:
    return V[ind_t].dist, path tracked by V[ind_t].pred
else:
    return no-path-from-s-to-t
```

Theorem: Topological order can be found in any DAG in linear time $O(\|V\|)$, e.g. remove node with no incoming edge repeatedly from V.

## 2. Finding the maximum area polygon

### Description

We are given a unit circle and n points on the circle. Design a polynomial time algorithm that, given a number m < n, finds m points (out of n points) such that the area of the polygon formed by the m points is maximized.

### Solution (DP)

Points are labeled 1, 2, ..., n. A[j, k] is the maximum area if we choose k points among points 1, 2, ..., j, where point 1 and j are chosen and fixed.

We have

$$
A[j, k] = \max\_{1<i<j} (A[i, k-1] + S(1, i, j)) \,\, k \ge 3, j \ge 3
$$

Where $S(x, y, z)$ are the area of the triangle whose vertices are x, y and z. Initially we have $A[i, 2] = 0, \, \forall 2\le i \le n$.

In case point 1 is not necessarily be chosen, we have to repeat this process $n-m+1$ times chosing different starting points.

Complexity $O((n-m)n^2)$

## 3. Longest palindrome subsequence

### Description

A palindrome is a nonempty string over some alphabet that reads the same forward and backward. For example, aaaabaaaa, 00000, abcddcba are all palindrome. Give an efficient algorithm to find the longest palindrome that is a subsequence of a given input string. Your algorithm should run in time better than $O(n^3)$.

### Solution (DP)

Define $A[i,j]$ as the length of longest palindrome subsequence in substring $[i,j]$. 

We have

```
if x[i] == x[j]:
    A[i, j] = A[i+1, j-1] + 2
else:
    A[i, j] = max(A[i+1, j], A[i, j-1])
```

Notice: pay attention to the definition of subsequence. e.g. 'ale' is subsequence of 'apple'.

## 4. Matrix-chain multiplication

### Description

We state the matrix-chain multiplication problem as follows:

given a chain of matrices $A\_1 A\_2 \cdots A\_n$, where $A\_i$ has dimension $p\_{i−1} \times p\_i$. (Note that the number of columns of $A\_i$ must be the same as the number of rows of $A\_{i+1}$.) Assume multiplying a $x\times y$ matrix with a $y\times z$ matrix takes $xyz$ scalar multiplications. Design a polynomial time algorithm to find a fully parenthesization of the product $A\_1 A\_2 \cdots A\_n$ in a way that minimizes the number of scalar multiplications.

For example, consider $A\_1A\_2A\_3$ of three matrices with the dimensions of 10 × 100, 100 × 5, and 5 × 50, respectively. If we multiply according to the parenthesization $((A\_1A\_2)A\_3)$, we perform 5000 + 2500 = 7500 scalar multiplications. However, if instead we multiply according to the $A\_1(A\_2A\_3)$, we perform 25000 + 50000 = 75000 scalar multiplications. Clearly, the first one is much better.

### Solution (DP)

Define $A[i, j]$ as the minimum number of scalar multiplications from $p\_i$ to $p\_j$. Each $A[i, j]$ corresponds to a parenthesization plan from $A\_{i+1}$ to $A\_j$.

We have 

```
if j - i <= 2:
    A[i, j] = min(A[i+1, j] + p[i] * p[i+1] * p[j], A[i, j-1] + p[i] * p[j-1] * p[j])
elif j - i == 2:
    A[i,j] = p[i] * p[i+1] * p[j]
```


## 5. Viterbi algorithm

### Description

We can use dynamic programming on a directed graph $G(V; E)$ for speech recognition. Each edge $(u, v) \in E$ is labeled with a sound from a finite set $\Sigma$ of sounds. The labeled graph is a formal model of a person speaking a restricted language. Each path in the graph starting from a distinguished vertex $v\_0 \in V$ corresponds to a possible sequence of sounds produced by the model. We define the label of a directed path to be the concatenation of the labels of the edges on that path.

1. Describe a polynomial time algorithm that, given an edge-labeled graph G with distinguished vertex $v\_0$ and a sequence $s = \langle \sigma\_1, \cdots, \sigma\_k \rangle$ of sounds from $\Sigma$, returns a path in $G$ that begins at $v\_0$ and has $s$ as its label, if any such path exists. Otherwise, the algorithm should return ``NO-SUCH-PATH``.

2. Now, suppose that every edge $(u,v)$ has an associated nonnegative probability $p(u,v)$ of traversing the edge. And thus producing the corresponding sound. The sum of the probabilities of the edges leaving any vertex equals 1. The probability of a path is defined to be the product of the probabilities of its edges. We can view the probability of a path beginning at $v\_0$ as the probability that a random walk beginning at $v\_0$ will follow the specified path, where we randomly choose which edge to take leaving a vertex $u$ according to the probabilities of the available edges leaving $u$. Extend your answer to part 1 so that if a path is returned, it is a most probable path starting at $v\_0$ and having label $s$. Analyze the running time of your algorithm.

### Solution (DP)

(1)

Define $T[i,m]$ as the feasibility of sequence $\langle \sigma\_1, \cdots, \sigma\_m \rangle$ with node $v\_i$ labeling $\sigma\_m$. If it is feasible, $T[i,m] = 1$, else, $T[i,m] = 0$.

We have

$$
T[i,m] = \max\_{j \in S(G, i, m)} T[j, m-1]
$$

where $S(G, i, m) = \{j \| v\_j \in V, (v\_j, v\_i) \in E, label[(v\_j, v\_i)] = \sigma\_m \}$, if $S(G, i, m) = \emptyset$, the term is zero.

Initially set $T[\cdot, 1] = 0$ and $\forall v\_i \in V,\, (v\_0, v\_i) \in E,\, label[(v\_0, v\_i)] = \sigma\_1$, we set $T[i, 1] = 1$. At last if $\exists v\_i \in V, \, s.t. T[i, k] = 1$, we can return a sequence traced back from a record of the corresponding $arg\max$. If there does not exist such a node, return ``NO-SUCH-PATH``.

The equation are evaluated m times, in each time at most \|V\| points are tested. Thus, $O(m\|V\|)$. If we use adjacency list instead of adjacency matrix, tighter bound may be obtained, I guess.

(2) 

This time it is the common form of Viterbi algorithm. Use $T[i, m]$ to represent the probability of observing sequence $\langle \sigma\_1, \cdots, \sigma\_m \rangle$ with node $v\_i$ labeling $\sigma\_m$. Use $P[i, m]$ to record the corresponding $j$ chosen by $T[i, m]$, $s.t. v\_j = \sigma\_{m-1}$.

Define transition matrix $A\in \mathbb{R}^{\|V\|\times\|V\|}$ to record the traversing probability from nodes to nodes. i.e. $A[i,j] = p(v\_i, v\_j)$. Define emission matrix $B\in\mathbb{R}^{\|V\|\times\|\Sigma\|}$ to denote the label of each node. e.g. node $v\_i$ is with label $\sigma\_m$, thus 
$$B[i, n] = \begin{cases} 1 & \sigma\_n = \sigma\_m \\ 0 & \sigma\_n \neq \sigma\_m \end{cases}$$

(notations here a bit imprecise)

We have

$$
T[i,m] = \max\_j (T[j, m-1] \cdot A[j, i] \cdot B[j, m])
$$
$$
P[i,m] = arg\max\_j (T[j, m-1] \cdot A[j, i] \cdot B[j, m])
$$

Similarily, if $\exists v\_i \in V ,\, T[i, k] > 0$ it is feasible and there exists a path. The path is given by tracing $P[i, m]$ back. Running time is at most $O(m\|V\|)$.

## 6. Edit distance

### Description

In order to transform one string x to a target string y, we can perform various edit operations. Our goal is, given x and y, to produce a series of edits that change x to y. We may choose from among edit operations:

1. Insert a letter, (e.g., changing 100 to 1001 takes one insertion)
1. Delete a letter, (e.g., changing 100 to 10 takes one deletion)
1. Replace a letter by another (e.g., you need do one replacement to change 100 to 000).

Design an efficient algorithm that finds a series of edit operations that change x to y and the total number of edits is minimized.

### Solution (DP)

Also a DP problem. Defind A[i,j] as the number of edit operation need to take to change x[1:i] to y[1:j].

We have

```
A[i, j] = min(
    A[i-1, j] + 1,                           # delete
    A[i, j-1] + 1,                           # insert
    A[i-1, j-1] + I(x[i] != y[j])            # match or replace
)
```

where $I(\cdot)$ is indicator function. DP is running from $i+j = 2$ to len(x) + len(y).

## 7. Four Russians Speedup

### Description

In this problem, we explore an interesting trick to speed up a dynamic program. We use the edit distance problem as an example (See the last problem). We assume the size of the alphabet is constant. Suppose the two strings are $S\_1$ and $S\_2$, both of length $n$. To start with, your solution for the last problem must run in $O(n^2)$ time. If it is so, in the dynamic program for the problem, you need to fill a two dimensional table $M$. In fact, we can fill out this table in a more clever way such that the running time can be improved to $O(n^2/ \log n)$ (I know, it is a small improvement and of little practical interests for this particular problem. But the same trick has been used somewhere else to make a huge difference). In this trick, we need to a bit preprocessing to make many small tables. Then we fill only a subset of entries of the dynamic program table. The value of a table entry we are filling depends on the values of some entries we have already filled and the list we made in the beginning.

To make it a little bit more formal. We define a t-block to be a $t \times t$ squares in the dynamic programming table. Let $t = \dfrac{\log n}{4}$. We first observe that the distance values in a t-block starting in position $(i,j)$ are a function of the values of its first row and first colum and substrings $S\_1[i,\cdots ,i+t−1]$ and
$S\_2[i,\cdots,i+t−1]$.

Now, let us observe another interesting fact: In any row or column, the values of two adjacent cells differ by at most 1.

* Please prove this fact.

We say two t-blocks $B\_1$, $B\_2$ are offset-equivalent if there is a number $c$, such that $B\_1[i, j] = B\_2[i, j]+c$ for all $i$, $j$.

* There are C types of t-blocks (up to offset-equivalence). Show how large C is.

It is obvious we can fill a t-block in $O(t^2)$ times. Therefore, filling all C types of blocks takes $O(Ct^2)$ times. These are the small tables we produce for preprocessing. How, we start to fill up the dynamic table $M$. We are going to fill up only $O(n^2/ \log n)$ entries.

* We have given you enough hints. Now, it is up to you to develop the entire algorithm which should run in $O(n^2/ \log n)$ time. In particular, you need to describe which entries of M that need to be filled and how to compute their values.

### Solution (DP optimization)

(0) 

Draw grids on the big DP table and divide it into blocks. The objective is to obtain $M[n,n]$, which means we do not care the values within the table. We can compute the table block by block. Input for each block is 1) the upper left value A; 2) the first column B; 3) the first row C; 4) the corresponding $S\_1[i, \cdots, i+t-1]$ and $S\_2[i, \cdots, i+t-1]$. The output of the block is 1) the last column D; 2) the last row E; 3) the lower right value F.

We do the computation for all possible blocks in advance and use the result to fill the big DP table.

(1)

In any row or column, the values of two adjacent cells differ by at most 1. It is written as $M[i, j-1] - 1 \le M[i, j] \le M[i, j-1] + 1$.

The second part is easy to prove by the transition equation $M[i,j] = \min(M[i,j-1]+1, \cdots)$. For the first part, consider the value of $M[i,j]$ comes from the path ``M[i-k, j-1] -> M[i-k+1, j] -> M[i, j] ``. The first transition at least costs zero, and the second transition costs at least $k-1$. Thus, $M[i,j] \ge M[i-k, j-1] + (k-1)$. Considering another route ``M[i-k, j-1] -> M[i, j-1]`` costs at most $k$, we have $M[i-k] + k \ge M[i, j-1]$. Combining the two, we have $M[i, j-1] - 1 \le M[i, j]$.

(2)

Considering offset equivalence, different A does not incur different types of blocks. Considering the property in (1), the absolute values in B and C does not matter, and we can use incremental sequence to denote B and C, e.g. B=$\{+1, -1, +1, 0, -1, \cdots \}$. Each of $S\_1[i, \cdots, i+t-1]$ and $S\_2[i, \cdots, i+t-1]$ has $\|V\|^t$ different possibilities.

Combined, we have $C = 3^t 3^t \|V\|^t \|V\|^t = 3^{2t}\|V\|^{2t}$

(3)

In the preprocessing step, we need to compute results for $C$ blocks. Each takes $O(t^2)$ time. Combined, we need $O[(3\|V\|)^{2t} t^2]$ time.

In the computation step, there are $O[(\dfrac{n}{t})^2]$ blocks should be fill in the large table. The input and output size of each block is $O(t)$, therefore we need $O(t)$ time to look for a block. Combined we need $O(\dfrac{n^2}{t})$ time. 

By taking $t = \dfrac{\log\_{3\|V\|} n}{2}$, the total running time $O[\dfrac{n^2}{t} + (3\|V\|)^{2t} t^2] = O(n^2 / \log n)$.

```
# do the preprocessing
for c in (all types of the block):
    result = compute the result for the block c
    B[c] = result
    
# do the computation
for i = 1 to ceil(n/t):
    for j = 1 to ceil(n/t):
        M[i+t-1, j+t-1], M[i+1:i+t-1, j+t-1], M[i+t-1, j+1:j+t-1] \
            = B(M[i, j], M[i, j+1:j+t-1], M[i+1:i+t-1, j], incr(S1[i:i+t-1]), incr(S2[j:j+t-1]))
          
return M[n,n]
```

### Reference

* http://cs.au.dk/~cstorm/courses/AiBS\_e12/slides/FourRussians.pdf

## 8. Solve the following two recurrences

### Description

(a) $T(n)=2T(\dfrac{n}{2})+n\log n$

(b) $T(n)=2T(\sqrt{n})+\log n$

### Methods

Methods to solve recurrences are 

1. Guess and confirm (can be used in all cases): guess and replace to prove it's true; unrolling to find the rule
2. Recurrence tree (solve $T(n) = aT(\frac{n}{b}) + f(n)$ like recurrences): $T(n) = \sum\_{k=0}^L a^k f(\dfrac{n}{b^k})$
3. Master therem

![](figures/fig20180320\_master\_theorem.png)

Something useful:
* $\sum\_{i=1}^n \dfrac{1}{i} = \Theta(\log n)$


### Solution

(a)

Use recurrence tree formula

$$
\begin{aligned}
T(n) & = \sum\_{k=0}^L 2^k f(\dfrac{n}{2^k}) = \sum\_{k=0}^L 2^k \dfrac{n}{2^k} \log(\dfrac{n}{2^k}) \\
& = \sum\_{k=0}^L n (\log n - k) \\
& = n \sum\_{j=0}^{\log n} j \\
& = \Theta(n \log n \log n)
\end{aligned}
$$

(b)

By drawing the recurrence tree, we find the numbers of calculation on each layer are the same, $2^k \log(n^{\dfrac{1}{2^k}}) = \log n$. Easily we get, $T(n) = \Theta(\log n \log n)$

## 9. Maximal Common Subsequence

### Description

String C is a subsequence of string A if C can be obtained by deleting some letters from A. For example, ``ade`` is a substring of ``abcde``. We are given two string $A = a\_1a\_2 \cdots a\_m$ and $B = b\_1b\_2 \cdots b\_n$. Design an algorithm that finds a common subsequence of A and B using $O(mn)$ time and $O(m + n)$ space. (You will get half of the points if you can find a polynomial time algorithm, but the running time (and/or) the space are worse that the stated.)

### Solution (DP and space optimization)

Define ``P[i, j]`` to be the length of longest common subsequence (LCS), ``Q[i,j]`` to trace the path of this LCS. A DP formula can be easily written as

$$
P[i,j] = \max(P[i-1, j], P[i,j-1], P[i-1, j-1] + I(A[i] == B[j]))
$$

This takes $O(mn)$ time and $O(mn)$ space. Further investigation shows that only the adjacent DP matrix is useful, thus we can have the following algorithm running in $O(mn)$ and using $O(m+n)$ space to obtain the length of LCS.

```
X = [0] * (m+n)
Y = [0] * (m+n)
Z = [0] * (m+n)

for i = 1 to n:
    for j = 1 to m:
        X[j] = max(Y[j], X[j-1], Y[j-1] + 1 * (A[i] == B[j]))
        if i == floor(n/2):
            Z[j] = which term is taken in the above max function
    Y = X
```

Notice that we cannot trace what the LCS is. By Dan Hirschberg (1975), we can use another 1D array to note down one trace in the middle (the ``Z`` in the above) and find the crossing point k. Later solve recursively LCS(A[1:n/2], B[1:k]) and LCS(A[n/2+1:n], B[k+1:m]). Though much more computation to be done, running time is still $O(mn)$.

### Reference

* https://www.ics.uci.edu/~eppstein/161/960229.html

## 10. Stick Game

### Description

There is a pile of n sticks. Two players A and B take turns removing 1 or 4 sticks. A starts first. The players who removes the last stick wins. Design a polynomial time algorithm (polynomial in n) that decides which player has a winning strategy (i.e., no matter how the opponent plays, the player can take certain moves to win the game.)

### Solution (induction)

Just simply find patterns when n = 1, 2, 3, ...

We found that when n = 5, 10, 15, ..., A has no winning strategy, i.e. if B has a winning strategy. In other cases, A has winning strategy. We guess when ``n mod 5 == 0`` B has winning strategy, otherwise A has winning strategy.

Next, we are going to prove it. When ``n mod 5 == 0``, no matter how many sticks A removes, B can remove 1 to 4 sticks to make A face a number that can be devided by 5 again. At last, when n = 5, the number of sticks after A's action is 1 to 4. B wins by remove all the remaining sticks. When ``n mod 5 != 0``, on the other hand, A can always let B face the 'dead' numbers (numbers that can be devided by 5) and wins.

Thus

```
if n mod 5 == 0:
    return B
else:
    return A
```

which is an $O(1)$ algorithm.

## 11. Monge Matrix

### Description

![](figures/fig20180320\_monge\_matrix.png)

### Solution (divide and conquer)

(a)

It can be proved by contradiction. Suppose there exists some $i < j$, s.t. $f(i)>f(j)$. Observe that ``A[i, f(j)] > A[i, f(i)]`` and ``A[j, f(i)] >= A[j, f(j)]``. We have ``A[i, f(j)] + A[j, f(i)] > A[i, f(i)] + A[j, f(j)]`` and ``i<j`` and ``f(j) < f(i)``, which is a violation of property of the matrix.

(b)

A divide and conquer solution.

```
def find\_min(i, j, m, n):
    """ returns [f(i), f(i+1), ..., f(j)] """
    mid = floor((i + j) / 2)
    f(mid) = argmin(A[mid, m:n])
    return find\_min(i, mid-1, m, f(mid)) + [f(mid))] + find\_min(mid+1, j, f(mid), n)
```

We have recurrence ``T(m, n) = T(m/2, n1) + T(m/2, n - n1 + 1) + n`` - $O(n)$ on each level, with $O(\log m)$ levles. Considering at leat m entries should be written. We have $O(m + n \log m)$ running time.

### Reference

http://www.cs.tau.ac.il/~haimk/adv-alg-2012/smawk-and-applications5.3.2012.pdf

## 12. Unit tasks scheduling

### Description

We are given a set of unit-time tasks. Each task $i$ is supposed to finish by time $d\_i$ ($d\_i$ is an integer). Each task $i$ is also associated with a penalty $w\_i$ if $i$ is not finished by time $d\_i$. There is no penalty if we finish task $i$ by its deadline. Design a polynomial time that find a schedule that minimizes the total penalty.

### Methods

This belongs to a category of problems called **Matroid**. Matroid is a tuple $(S, I)$, where $S$ is a finite ground set, and $I$ is a family of *independent* subset of $S$, which has following properties

1. Hereditary property: $B\in I, A\subset B \Rightarrow A\in I$
2. Exchange property: $A\in I, B\in I, \|A\|<\|B\| \Rightarrow \exists x \in B-A, s.t. A\cup \{ x \} \in I$

A **Weighted Matriod Problem** is a matroid where each element in $S$ assigned by a weight $w\_i$ and the total weight of a independent subset of $S$ is maximized. This problem can be solved greedy algorithm.

```
Greedy(S, I, w):
A = {}
sort S decreasingly by w
for x in S:
    if A + {x} in I:
        A = A + {x}
```

Many greedy problems can be interpreted as matroid.

* minimum spanning tree: subset of edges to connect all vertices with minimum weight sum
    - Kruskal algorithm greedily pick smallest weight
* interval scheduling: given start time, end time, find maximum compatible intervals
    - greedily pick the task with earliest finish time that is compatible with the previous
    - optimality proved by exchange argument
* interval partitioning: given start time, end time, find maximum of m/c to finish all the tasks
    - greedily pick the task in order of increasing start time, if the task cannot be allocated, open a new m/c
    - property: #m/c can never be less than maximum depth, depth is number of overlapping tasks at a given time
* schedule to minimize maximum lateness: earliest ddl first
    - inversion: two adjacent jobs - latter one has earlier ddl
    - swap on inversion does not increase lateness 
    - optimal has no idle time; there's optimal strategy with no inversion
    - earliest-ddl-first greedy is optimal
* optimal offline caching: farthest-in-future
    - reduced schedule: only insert an item to cache when it is requested
    - every strategy can transform to reduced version with no more eviction
* Huffman coding: merge from least frequent node
    - 合并叶子节点为一个节点，节点的频率为叶子节点频率之和，这样做新树和旧树的代价只相差一个常数，因此具有意义的最优结构
    - 通过把频率最小换到最深的位置，可以证明不增加总体代价，由此证明最优解中最小频率的两个节点一定是最深的兄弟
    
Methods used to prove optimal:
1. Show that after each step of the greedy algorithm, its solution is at least as good as any other algorithm's.
1. Discover a simple "structural" bound asserting that every possible solution must have a certain value. Then show that your algorithm always achieves this bound. 
1. Gradually transform any solution to the one found by the greedy algorithm without hurting its quality.
1. Show it is a matroid

### Solution (greedy)

$N\_t(A)$ is the number of tasks in set A whose ddl is no later than t. If $N\_t(A) \le t, \, \forall t$, A is a independent set, i.e. a set of tasks can be done with no penalty. $S$ to be the set of all tasks, $I$ to be the family of all independent subsets, it can be proved that $M=(S, I)$ is a matriod (by illustrating heredity and exchange property), and can be solved by a greedy algorithm.

```
Greedy(S, I, p):
A = {}
sort S decreasingly by penalty value p
for x in S:
    if N(t, A + {x}) <= t for all t:
        A = A + {x}
```

It is a $O(n^2)$ algorithm.

### Reference

https://www.cise.ufl.edu/class/cot5405sp11/slides/greedy\_algo.pdf

## 13. Coin changing

### Description

Suppose that the coins are in the denominations that are powers of c, i.e., $c^0,c^1,c^2,\cdots ,c^k$, for some integers $c > 1$, $k \ge 1$. You are asked to change for n cents using the fewest number of coins. Show that the greedy algorithm yields an optimal solution. (The greedy algorithm first tries the coin with the largest denomination , then the coin with the second largest denomination, and so on).

### Method

```
Greedy-choice property:
    If element x cannot be used immediately by GREEDY, it can never be used later.
```

### Solution (greedy proof)

Denote the solution followed by the greedy algorithm to be $a = (a\_0, a\_1, \cdots, a\_k)$, where $a\_i$ is the number of coins whose denomination is $c^i$. An optimal solution to be $b = (b\_0, b\_1, \cdots, b\_k)$.

Firstly, we discover a property for optimal solution. $b\_i \le c-1,\, \forall 0\le i \le k-1$. Otherwise, if there's a $b\_i \ge c$,  we can change c $c^i$ coins to a $c^{i+1}$ coins without affacting others and decreasing the total number of coins. This contradicts the optimal assumption. 

Next, consider the situation when remaining denomination x is faced. Suppose $c^j \le x < c^{j+1}$. We wanna show that an optimal solution must contain a $c^j$ coin. Suppose in optimal solution $b\_j = 0$. Obviously, $b\_i = 0, i > 0$, or the denomination of coins exceeds the required denomination. Given the previous property, the denomination this optimal solution can present $\sum\_{i=0}^{j-1} b\_i c^i \le \sum\_{i=0}^{j-1} (c-1) c^i = c^j - 1 < c^j \le x$, which is not possible to be a valid solution. Thus, when $c^j \le x < c^{j+1}$ is faced, a $c^j$ coin must be contained in an optimal solution.

By induction, the greedy algorithm is proved to be correct every single step.

## 14. Schedule to minimize completion time

### Description

You are given a set $S = \{a\_1, a\_2, \cdots , an\}$ tasks. Task $a\_i$ is released at time $r\_i$ and requires $p\_i$ units of time to process. You machine can process one task at each time. Assume preemption is allowed, so that you can suspend a task and resume it at a later time. For a particular schedule $S$, we denote the completion time of task $a\_i$ to be $c\_S(a\_i)$. Give a polynomial time algorithm that finds a schedule $S$ of all tasks and minimizes the total completion time  $\sum^n\_{i=1} c\_S(a\_i)$.

### Solution (greedy)

```
# num of unit time since start
t = 0  
# remaining time of tasks
r = p

while there's task unfinished:
    i = None
    rmin = inf
    for j in tasks start before t:
        if r[j] < rmin:
            i = j
            rmin = r[j]

    t\_closest = closest start time of unfinished task

    if i is None:
        t = t\_closest
    elif t + rmin < t\_closest:
        finish task i
        r[i] = 0
        t = t + rmin
    else:
        do task i till t\_closest
        r[i] -= (t\_closest - t)
        t = t\_closest
```

Running time: main loop either jump to a start time or finish a job, at most $O(n)$ runs. Finding shortest remaining time and find closest start time each takes $O(n)$. Thus $O(n^2)$.

I cannot prove it.... tell me (zhangchuheng123@qq.com) if you can.

## 15. Matching in graph

### Description

We are given an unweighted undirected graph G. Let $M$ be a matching in G that has no
augmenting path of length smaller than $2t + 1$. Let $M^∗$ be the maximum matching in G. Show that
$\|M\|\ge \dfrac{t}{t+1} \|M^∗\|$.

### Methods

* matching: 不共点的边集M
* matching number: 不共点边集的边的数量
* maximum matching: matching number最大的
* perfect matching: 能够覆盖所有点的
* M-alternating path: $G=(V, E)$中一条交替出现在$M$和$E\setminus M$中的路径
* M-augmenting path: 路径中两端没有被覆盖

### Solution (graph)

假设$\|M^*\|-\|M\|=m$，边集$P$定义为存在于$M^*$中但是不在$M$中的集合。由于$M$和$M^*$都是合法的matching，所以$P$的中的边都互不相接。假设$P$中的边能够和$M$构成n条M-augmenting path，那么这些path也互不相接。定义这些path的长度为$2p\_i + 1$。由于互不相接，每条path的替换都能够使得$M$增长一条边，即$n=m$。同时观察到$M$中的边只可能出现在一条path中，$ \|M\| \le \sum\_i p\_i $；最短的path也有$2t+t$，$\sum\_i p\_i \ge n t$。

得到 
$$
\dfrac{\|M^*\|-\|M\|}{\|M\|} = \dfrac{m}{\|M\|} \le \dfrac{n}{\sum\_i p\_i}\le \dfrac{n}{nt}\le \dfrac{1}{t}
$$


### Reference

http://www-sop.inria.fr/members/Frederic.Havet/Cours/matching.pdf

## 16.

### Description

We are given n jobs and one server. Each job $j$ is associated with a profit $p\_j$, a release time $r\_j$ and completion time $c\_j$. If we decide to schedule job $j$, the server has to process it continuously from time $r\_j$ to $c\_j$ and we can get a profit $p\_j$. No partial profit can be obtained if the job is not finished. The server can process at most $k$ jobs at any time. Design a polynomial time algorithm that finds a feasible schedule such that the total profit we can get is maximized.

### Solution

定义A[s,t,w]为在时间[s,t]区间里面，最多进行w个任务能取到的最大值。$A[s,t,w] = max\_i(A[s, r\_i, w]+p\_i+A[c\_i,t,w], p\_i + A[s,t,w-1])\ \ \forall i, s<r\_i<c\_i<t$，按照t-s从小到大，w从小到大的顺序更新，同时按照任务完成时间从小到大排序的方式更新A，s轮，s为落在此区间内任务的数目。注意，这仍然是多项式时间，不是很有效率的方法但是符合题意。

## 17.

### Description

Given an undirected graph G(V,E), a feedback set is a set X ⊆ V with the property that G − X has no cycles. The undirected feedback set problem asks whether G contains a feedback set of size at most k. Show that the problem is NP-complete.

### Solution

从顶点覆盖问题转化：对于一个顶点覆盖问题G，每个顶点和每条边都变为一个顶点，每条边连接相关的顶点和边。一个顶点覆盖对应转化之后图的feedback set。

## 18. Rearrangable Matrix

### Description

通过行交换和列交换能够把对角元都变为1的，称为RM。

1. 给一个每行每列都有1元素但是不是RM的例子
2. 给一个多项式算法判断给定矩阵是不是RM

### Solution

1.

```
1 0 0 
1 0 0
0 1 1
```

2.

转化为二分图匹配，二分图左边顶点每个代表一行，右边每个代表一列，如果有一个元素等于1，就连一条边从左边到右边。如果存在一个完全匹配（perfect matching）就代表是RM。

## 19. Turan's Bound

### Description

证明Independent set的下界为$\sum\_{v \in V} \dfrac{1}{deg(v)+1}$

### Solution

把顶点排成一排，考虑一个独立集，包含顶点v，如果这个顶点所有的相邻顶点都在它的后面。那么对于每个被选的顶点，它和它相邻的顶点平均贡献的独立集长度为$\dfrac{1}{deg(v)+1}$。有的未被选择的顶点其实应该被count多次，但是我们这里只count一次，得到上面那个下界。因此这个独立集的大小的下界为$\sum\_{v \in V} \dfrac{1}{deg(v)+1}$，这还不是最大的独立集，因此一个最大的独立集比这个还大。

## 20. Multiple Interval Scheduling

### Description

In this problem, we have a single processor which can only work on one job at any single point in time. We are also given a set of jobs, each of them requiring a set of disjoint intervals of time during which it needs to be processed on the processor. For example, a job could require the processor form 10am to 11am and 1pm to 2pm. We would like to answer the following question: For a set of jobs and a given number k, is it possible to process at least k jobs in the processor. Show that the problem is NP-complete. (Hint: Maximum Independent Set is a possible candidate for the reduction.)

### Solution

转化为Independent Set。每个任务是一个节点，如果两个任务不能同时进行，就把他们连一条边。如果有大小为k的Independent set，那么这k个任务就可以都被处理。

## 21.

### Description

You have m slow machines and k fast machines. You are given a set of n jobs. Job i takes time ti to process on a slow machine and time ti/2 to process on a fast machine. Assign each job to a machine such that the makespan is minimized. (The makespan is the maximum load of any machine.) Design a polynomial time approximation algorithm that produces an assignment with a makespan at most 3 times the optimum.

### Solution

一个贪心算法，每次添加一个任务到workload最小的机器上面。

证明？？？李元齐写的没看懂

## 22. Densest k-Subgraph

We are given an undirected graph G(V,E). The densest k-subgraph problem asks for a subset S of k vertices such that the number of edges in the induced graph G[S] is maximized. Formulate the decision version of the problem and show it is NP-Complete.


### Solution

是否存在一个大小为k的子点集S，G(S)内边数目为y？

CLIQUE问题，是否存在包含k个节点的CLIQUE（任两个节点两两相连）；给定一个这个问题，问是否存在k个节点的CLIQUE使得边的数目为k(k-1)/2。

## 23. Maximum Coverage

We are given a ground set U of n element and a collection of subsets S1, . . . , Sm. The goal is to choose k subsets and maximize the cardinality of their union.

1. Formulate the decision version of the problem and show it is NP-Complete.
2. Design a polynomial time approximation algorithm for the problem. Your algorithm should havean approximation ratio of 1 − 1/e in order to get full credit.

### Solution

1.

选择k个subset，包含元素是个数是否能达到y。Set Cover：选择k个set，是否能够包含所有的元素。令y=\|U\|，直接转化

2.

贪心算法，每次挑选包含最多未cover元素的集合。

## 24. Polynomial Multiplication

You are given 2n numbers a1 , b1 , . . . , an , bn . Consider the polynomial P (x) = prod ni=1 (ai x + bi ). Design an algorithm that computes the expansion of P (x). In order to get full credit, your algorithm should run in time o(n2) (Note: small o).

### Solution

分治法，每次拆成两半，合并需要$O(n\log n)$，总共需要$O(n\log n \log n)$。

1. Evaluate p(x) and q(x) at 2n points ω0 , . . . , ω2n−1 using DFT. This step takes time Θ(n log n).

1. Obtain the values of p(x)q(x) at these 2n points through pointwise multiplication

1. Interpolate the polynomial p·q at the product values using inverse DFT to obtain coefficients c0, c1, . . . , c2n−2. This last step requires time Θ(n log n).

## 25. Longest increasing subsequence

You are given a sequence S of n numbers a1 , a2 , . . . , an . A subsequence ai1,ai2,...,aik is increasing if i1 < i2 < ... < ik and ai1 < ai2,... < aik. For example, S = {2, 10, 7, 11, 8, 6, 12} is the given sequence and {2, 10, 11, 12} is an increasing subsequence. Design a polynomial time algorithm that finds an longest increasing subsequence in the given sequence S.

### Solution

动态规划A[i]表示S[:i]中的LIS的长度，状态转移方程``A[i] = max(A[j] + (S[j] < S[i]) * 1) for all j < i``

## 26.

看不懂题目，问李元齐

## 28. Hamitonian cycle

Every graph with n ≥ 3 vertices and minimum degree at least ⌈n/2⌉ has a Hamitonian cycle.

### Solution

问李元齐

## 29. Catch a car

Catch a car without knowing anything. We have an infinite road (i.e., (−∞, +∞)) and a car whose initial position p (at time 0) is some unknown integer. The car is running at a fixed velocity v. v is some unknown but fixed integer. Note that v can be negative which means the car is heading towards −∞. At each time step, you can make at most one query of the following form: Is the car at position x now? (you can choose the integer x). Design a query strategy such that you can guarantee you will get a ”yes” answer in finite time. (HINT: It is easy to see that the position of the car at time t is p + vt.)

### Solution



## 30. Turan's Bound

与19题

## 31. Traveling salesman in the unit square

In this problem, we are considering a very classic problem in computer science - the traveling salesman problem. We are given a set of n points in the unit square ([0, 1] × [0, 1]). For two points v, u, we use \|uv\| to denote the Euclidean distance between u and v. A traveling salesman tour is a tour that starts at some starting point, goes through all points exactly once and ends at the starting point. 

1. Prove that there is a tour {v1, v2, . . . , vn, v1} (i.e., the tour visits v1 first, then v2 and so on) such that \|v1v2\|2 + \|v2v3\|2 + . . . + \|vn−1vn\|2 + \|vnv1\|2 ≤ 4
2. Prove that there is a tour {v1,v2,...,vn,v1} such that \|v1v2\|+\|v2v3\|+...+\|vn−1vn\|+\|vnv1\|≤2 √n

### Solution

1. 不会求解

2. 柯西不等式可以直接从第一问的结果推出第二问的结果 $(\|v\_1v\_2\| + \cdots + \|v\_nv\_1\|)^2 \le n (\|v\_1v\_2\|^2 + \cdots + \|v\_nv\_1\|^2)$

## 32. 

1. Show that a graph with maximum degree ∆ can be colored in ∆ + 1 colors.
2. We are given a 3-colorable graph G(V, E). In other words, it is possible to color the vertices of G using 3 colors such that no edge is incident on two vertices with the same color. Show that 2-coloring the neighbors of any vertex (if possible) can be done in polynomial time.
3. We are given a 3-colorable graph G(V, E). Design a polynomial time algorithm that finds an O(√\|V \|)-coloring of G.

### Solution

1. 显然，由于最大的degree比颜色数目少一个，因此它的顶点都能够分配不同的颜色；从任意顶点开始着色，所有颜色的集合C，与它相连的已经着色的顶点的颜色集合A，未着色的顶点的数目N，\|C \ A\| > N，因此每个未着色的顶点都能够被着不同颜色。
2. 首先证明如果一个图是3-colorable的，那么对于任意一个顶点v，其邻居N(v)中的节点构成一个二分图。如果N(v)中有一个单数环，那么不可能用剩下的两种颜色着色，因此，不存在单数环，因此N(v)是一个二分图。因此对于任意一个节点，它的颜色如果是A，那么在N(v)中，二分图的一边着色B，一边着色C。由此，再找这个节点的一个邻居扩展。可以着色所有的顶点。
3. 对于degree大于$\sqrt(n)$的节点用第二问的方法着色；对于degree小于$\sqrt(n)$的节点就用$\sqrt(n)$个颜色来着色。

问李元齐，为什么不全部都用第二问的方式来着色？难道不是多项式时间么？

## 34. Coupon collector's problem

Initially, we have n empty bins. In each round, we throw a ball into a uniformly random chosen bin. Let T be number of rounds needed such that no bin is empty. Show that $\mathbb{E}[T] = nH\_n$, where$H\_n = \sum\_{i=1}^n \dfrac{1}{n}$.

### Solution

假设已经有i-1个盒子里面有球了，出现一个新的盒子里面有球的概率是$p = [n-(i-1)]/n$，因此从i-1个盒子里面刚刚有球，到i个盒子里面有球的期望时间为$1/p = n/[n-(i-1)]$。总的时间$\mathbb{E}(T) = n\sum\_{i=1}^n \dfrac{1}{n-i+1} = n\sum\_{i=1}^n \dfrac{1}{n}$

## 35. Bipartite min-cost matching

Show that finding a min-cost matching with exactly k edges in a bipartite graph can be solved in polynomial time.

### Solution

转化为网络流问题，引入源点s，s'，中间的容量为k；s'到左边图连边容量为1；左右相连；右边图到t容量为1。然后使用最大流的算法来解决。

## 36. 

1. In any bipartite graph, the number of edges in a maximum matching equals the number of vertices in a minimum vertex cover.
2. In any bipartite graph, the number of vertices in a maximum independent set equals the total number of vertices minus the number of edges in a maximum matching.

### Solution

1.

Kőnig's theorem: 从一个最大匹配构最小顶点覆盖的方法。注意最大匹配的性质是不能找到更长的alternating path。U: 左边L没有被匹配的节点；Z: 通过alternating path和U相连的节点；$K=(L \backslash Z) \cup (R \cap Z)$是构造出来的顶点覆盖。 

首先，K是一个顶点覆盖。对于在匹配M中的边，如果它在AP中，那么它和$R \cap Z$相接；如果不在AP中，那么和$L\backslash Z$相接。对于不在M中的边，如果它在AP中，那么它和$R \cap Z$相接；如果不在AP中，它的左端点肯定不在Z里面，因此也在K里面。

其次，K的数目和M的数目一样多。每个K中的顶点都与M相接：左边的顶点中不相接的已经被剔除了；右边的顶点就是和Z相交得到的，因此也在AP中，如果不在M中，就能够扩展更长的路径了。M中每条边不可能两个端点都在K中：因为如果这条边在AP中，那么其左端点被去掉了；如果不在AP中，其右顶点不在K中。

最后，K的数目不可能小于M的数目，因此，K是最小的顶点覆盖。因为，M包含互不相接的的\|M\|个边，要保证这\|M\|个边被覆盖，至少需要\|M\|个顶点。

2.

K是最小顶点覆盖 $\Leftrightarrow$ V-K是最大独立集

如果K是顶点覆盖，那么把K和其相关的边去掉那么就没有边了，因此V-K是独立集。如果V-K是独立集，那么它们之间没有任何的边，因此所有的边都和K有关，因此K是顶点覆盖。由于其等价，一个最小的时候，另一个也最大。

## 39.

1. A man finds himself on a riverbank with a wolf, a goat, and a head of cabbage. He needs to transport all three to the other side of the river in his boat. However, the boat has room for only the man himself and one other item (either the wolf, the goat, or the cabbage). In his absence, the wolf would eat the goat, and the goat would eat the cabbage. Show how the man can get all these ”passengers” to the other side.
2. We consider a generalization of the above problem. We are given n objects on a riverbank. We are also given a set of pairs of objects. Each pair of objects means that the two objects cannot stay on either side of the river together without the man’s supervision. For example, in the above problem, the set of pairs is (Wolf, Goat), (Goat, Cabbage). Now, your boat can hold the man and at most k other objects where the input k is smaller than n. Design an algorithm to decide whether it is possible for the man to get all objects to the other side of the river. What is the running time of your algorithm?

### Solution

1. ``G ->;  <-;C ->; G <-; W ->;  <-; G ->``
2. 待验证：每个物品是一个顶点，一个这样的对连接一个边，如果这个图的Vertex Cover的数目不超过k，并且最大度数也不超过k，就可以运输？

## 40.

### Description

Without the help of a computer or calculator, find the total sum of the digits in all integers from 1 to a million, inclusive. Write down the computation details.

### Solution

1到9合起来是45，到100w有6位的数字，每一位都从0~9变化了10w次，所以是$6*100000*45+1=27000001$次，最后那一个是100w中的单出来的1。

## 41. Rumor Spreading

There are n people, each in possession of a different rumor. They want to share all the rumors through a series of bilateral conversations (e.g., via a telephone). Devise an efficient (in terms of the total number of conversations) algorithm for this task. Assume that in every conversation both parties exchange all the rumors they know at the time. (You can assume n is a power of 2 first.)

### Solution

如果图是联通的，那么就找关系网中的一个最小生成树，从叶子节点开始往上，每条边进行一个交流，最后到根节点，这样，每个父节点都知道其叶子节点上面的信息了。然后，再反过来从父节点开始往下传播信息，这样所以的节点都知道所有的信息了。

由于最小生成树的连边数目为n-1，每条边遍历两遍，因此，运行时间为$O(2n-2)$

## 42. 

### Description

We are given a sequence of distinct numbers A1, A2, A3, ,, An. For each number, its position in the sequence and its position in the sorted sequence (in increasing order) differ by at most k, where k is much smaller than n. Design an algorithm that sort the sequence in time less than O(n log n). Of course, the running time of your algorithm should depend on k.

### Solution

```
for i = 1 to k:
    for j = 1 to n-1:
        if A[j] > A[j+1]:
            swap(A[j], A[j+1])
```

运行时间O(kn)，由于k远小于n，也应该认为k远小于logn。

## 46.

### Description

An undirected Eularian graph is a connected graph in which all nodes have even degree. You job is to design an efficient algorithm that traverse an undirected Eularian graph so that each edge is visited exactly once.

### Solution

* 方法一：从任意的一个点开始，每选择一条边之后就把这个边从图里面删除，当有多条边可以选择的时候，要选择删除这条边之后不会破坏图联通性的边。检测图连通性的方式最差可以使用一个DFS在多项式时间里面找出来。对于连通性的检测的次数最多为O(d\|E\|)，其中d为图中最大的度数
* 方法二：从任意的一个点开始，随便走，最后肯定能回到这个点，只不过有些点访问不到。在刚刚的路径里面找一个点，它还有往外面连通的边，然后从这个点再随便走一个环，并且把这个环加到刚刚的环的某个位置上。重复此操作，可以找到最后的环。复杂度O(\|E\|)

## 47.

### Description

A directed Eularian graph is a strongly connected graph in which the indegree of each node is equal to its outdegree. You job is to design an efficient algorithm that traverse a directed Eularian graph so that each edge is visited exactly once.

### Solution

和前一题类似

## 57.

### Description

Given a set $\mathcal{H}$ of halfspaces (in general positions) in $\mathbb{R}^d$, design an efficient algorithm that decides whether $\mathcal{H}$ can cover the whole space $\mathbb{R}^d$. If $\mathcal{H}$ can cover $\mathbb{R}^d$, show there is always a subset of $\mathcal{H}$ with at most d + 1 halfspaces that also covers $\mathbb{R}^d$.

### Solution

Similar to Helly's Theorem but not the same, I have no idea.

## 59.

### Description

There are n players. Each player holds a private 0/1 bit. Player 1 is the coordinator. The coordinator wants to compute the parity (i.e., determine there are even number of 1s or odd number of 1s).

In each round, your protocol can choose a player and let the player to broadcast a bit (depending on your protocol, the bit can be either the player’s own bit, or other encoded information). Upon the broadcast, each other player can receive the bit with probability $1 − \epsilon$ for some small constant $0 < \epsilon < 1/3$, and the flipped bit with probability $\epsilon$ (all flips are independent of each other). Show if every player broadcasts her bits for k = O(log n) times, the coordinator can compute the parity correctly with probability 0.9.

### Solution

题意1：每次广播之后每个人以概率$1-\epsilon$变成这个被广播的bit，以$\epsilon$翻转手中的bit。

题目还有不太清楚的地方就是，coordinator显然不能知道全局信息，但是每个player能不能知道全局信息呢？如果每个player能知道全局信息，那么它就广播目前大家手里面比较少的bit，比如10101时，就广播0，然后持有1的不管怎么着都变成0，持有0的以概率$1-\epsilon$保持0。Claim：这些个一样的bit以后都会保持一样，并且bit一样的数目会越来越多。

假设每一轮广播之前，更多的比特的持有数目为$x\_i$，较少的就为$n-x\_i$，广播较少的比特数之后，持有之前较少比特数的期望为$x+(n-x)(1-\epsilon)$，即$x\_{i+1} = x\_i+(n-x\_i)(1-\epsilon)$，经过k轮之后大概率大家手上的bit都是一样的了，因此能够计算总宇称。

题意二：每个人接收被广播的bit都有$\epsilon$的概率出错，但是每个人手上的bit是固定不变的

那么就要求每个人广播自己的bit 2k+1次，然后coordinator就对每个人广播的bit做majority vote来决定这个人手里面是0还是1，majority vote的胜率是$1-\Phi(\dfrac{k - 2k(1-\epsilon)}{\sqrt{2k\epsilon(1-\epsilon)}})$（Moivre-Laplace-Theorem），最后证明以k=O(log n)就可以大概率得到每个人正确的bit。

## 60.

### Description

There are n straight lines in a $\mathbb{R}^{2}$ plane. 
1. Design an $O(n\log n)$ time algorithm for the following decision problem: Given two vertical slab W bounded by two vertical line x = a and x = b, compute how many intersection points of $\{l\_i\},\ i\in[n]$ are there in W.
2. Given a vertical slab, show how to uniformly sample q intersection points in W in $O(n \log n + q)$ time.

### Solution

1.

1. find intersection points of the n lines with x=a in O(n). 
2. argsort these points in O(nlogn), resulting in a list of the numbering of the lines $[i\_1, i\_2, \cdots, i\_n]$, where $i\_1$ represent the $i\_1$-st line's intersection with x=a hax maximum y. 
3. calculate the lines' intersection with x=b note down $(j, y\_{i\_j})$ if line $i\_j$ intersect at $(x,y)=(b,y\_{i\_j})$ in O(n)
4. argsort these tuple by y in O(n logn), resulting in a list which is a permutation of $[n]$
5. number of intersection points is the number of inversions（逆序对）
6. we can count inversions in a mergesort style during which a counter is added - the counter should add the length of current left-hand-side part when a element in right-hand-side is added to the merging queue. This can be done in O(n log n)

2.

在之前的过程中，每一层的merge都记录下后半部分表内元素和能够和前半部分表内元素产生逆序对的格式，按照前序遍历把这些个数都记录下来。这样我们有一个数组$C\_1, C\_2, \cdots, C\_s$。假设总逆序对个数为$C=\sum C\_i$，那么就按照C个数中随机采样i个点，其中最小一个点的分布依次产生一个随机数（for i=q downto 1)，这样能够在O(q)的时间内产生均匀分布的q个点。我们下一步要在O(q）的时间内计算出这q个数值中的每一个数值$x\_i$对应的$a=\max(\{i: \sum\_{j=1}^i C\_j \le x\})$和$b=x-\sum\_{j=1}^a C\_j$，然后通过这个数组下储存的辅助信息就可以求得到对应的是哪两条直线，从而可以求出交点。要想实现找到a，b的过程，可以使用Van Emde Boas tree。

## 64. Tiling Problem is NPC

### Description

We are given a finite set S of rectangles and a rectangle R in the plane. Is there a way of placing the rectangles of S inside R, so that no pair of the rectangles intersect, and all the rectangles have their edges parallel of the edges of R? Show the problem is NPC.

### Method

* 一般证明步骤：
    1. 证明是NP（给定一个候选的解，能够在多项式时间内检验解是不是合理的解）
    2. 能够把一个现成的NPC问题规约到这个问题上（给定一个NPC问题，把NPC问题的输入在多项式时间内变为这个问题的输入，再将这个问题的输出变化为该NPC问题的输出）
* 常见NPC问题：
    1. 3SAT：给定一堆布尔变量和一堆子句（形如A或者B或者C），是否存在一个布尔变量的赋值是的所有子句为真。
    2. Independent Set：图G中的顶点集合S满足其中的任意两个顶点不共边，则称S为独立集；求解图G的最大独立集。
    3. Vertex Cover：图的顶点覆盖是一组顶点的集合，使得图的每个边缘至少与集合中的一个顶点相连接；求解图G的最大顶点覆盖。
    4. Integer Linear Programming：线性方程组是否存在整数解
    5. Hamiltonian Cycle：一个图是否存在Hamiltonian cycle
    6. Subset Sum：给定一组整数，是否存在一些整数使得其和等于K
    7. Bin Packing：给定一组一维长度小于1的线段，找出这堆线段的一个划分，使得划分的子集数目最小，并且每个子集中线段的和都小于1
    
### Solution

1. 给定一个矩形的分配方案，我们能够在多项式内验证这个方案是否可以，即，逐对检查矩形是否相交，并且是否超出了大矩形，即是NP
2. 我们从Bin Packing规约，给定Bin Packing的一个输入$x\_1, x\_2, \cdots, x\_n$，构造一个Tiling的输入，使得n个矩形的宽度分别为$x\_i$，长度为2（任何大于1的数都可以），大举行的宽度为1，长度为$2k$。我们依次增加k，看看最少k等于多少时，能够把这些矩形都包含进去，返回这个k。这个k的数值就是Bin Packing问题里面最少需要的子集个数。注意到因为小矩形的长大于1，因此没法旋转，只能横向排。

