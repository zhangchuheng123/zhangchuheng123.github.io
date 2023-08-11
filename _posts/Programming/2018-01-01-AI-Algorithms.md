---
layout: post
title: "【CS】Artificial Intelligence Algorithms"
description: ""
category: CS
tags: [AI, Algorithms]
---
{% include JB/setup %}

这是人工智能课程的复习提纲，希望也可以作为一个简要的人工智能算法介绍和索引。

## 第一部分：搜索问题

### 深度优先搜索

算法如下，递归调用，每次往后走一步，直到找到解（第1行），或者确定这条路找不到解（第2行）。

$$
\begin{aligned}
& \text{DFS}(s): \\
1& \quad \text{if }isTerminate(s) \text{ return } null \\
2& \quad \text{if }isDeadend(s) \text{ return } fail \\
3& \quad S' \leftarrow next(s) \\
4& \quad \text{while:}\\
5& \quad \quad \text{if } empty(S') \text{ return } fail \\
6& \quad \quad s' \leftarrow pop(S') \\
7& \quad \quad path \leftarrow \text{DFS}(s') \\
8& \quad \quad \text{if } path \text{ is not } fail: \\
9& \quad \quad \quad \text{return } \{s'\} + path
\end{aligned}
$$

其缺点在于

1. 有时候搜索深度太深，接近暴力搜索 -> 可以相应的限制深度；
2. 搜索过的状态会重复搜索，陷入死循环 -> 可以记录访问过的状态，不要重复访问；

可以对其进行相应的改进，每次传入的参数不再是想要搜寻的状态$s$，而是到这个状态所经历的状态列表$s\_list$。
$$
\begin{aligned}
& \text{DFS_improved}(s\_list, max\_depth): \\
1& \quad \text{if }s\_list[0] \text{ in } s\_list[1:] \text{ return } fail \\
2& \quad \text{if }isTerminate(s\_list[0]) \text{ return } null \\
3& \quad \text{if }isDeadend(s\_list[0]) \text{ return } fail \\
4& \quad \text{if } len(s\_list) > max\_depth  \text{ return } fail \\
5& \quad S' \leftarrow next(s) \\
6& \quad \text{while:}\\
7& \quad \quad \text{if } empty(S') \text{ return } fail \\
8& \quad \quad s' \leftarrow pop(S') \\
9& \quad \quad path \leftarrow \text{DFS_improved}(\{s'\} + s\_list, max\_depth) \\
10& \quad \quad \text{if } path \text{ is not } fail: \\
11& \quad \quad \quad \text{return } \{s'\} + path
\end{aligned}
$$
深度优先搜索

1. 是一个通用的与问题无关的方法；
2. 一般不能保证找到最优解；
3. 深度限制不合理的时候可能找不到解；
4. 最坏情况搜索空间等同于暴力搜索；
5. 节省内存，仅储存从初始节点到当前节点的路径；

### 宽度优先搜索

算法框架如下
$$
\begin{aligned}
& \text{BFS}(s_0): \\
1& \quad open \leftarrow [s_0] \\
2& \quad closed \leftarrow [] \\
4& \quad \text{while:}\\
5& \quad \quad \text{if } empty(open) \text{ return } fail \\
6& \quad \quad s \leftarrow open[0] \\
7& \quad \quad \text{if } goal(s) \text{ return } success \\
8& \quad \quad closed \leftarrow closed + \{s\}\\
8& \quad \quad open \leftarrow open - \{s\}\\
8& \quad \quad S' \leftarrow expand(s)\\
9& \quad \quad open \leftarrow open + S' \\
\end{aligned}
$$
宽度优先搜索

1. 是一个与问题无关的方法；
2. 当问题解存在的时候一定能找到解；当解的代价随路径长度单调增加的时候，一定能找到最优解；
3. 内存消耗较大，要记录当前搜索到的所有可能路径；

### 启发式搜索



