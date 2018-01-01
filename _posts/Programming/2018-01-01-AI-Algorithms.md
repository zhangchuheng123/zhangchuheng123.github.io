---
layout: post
title: "【CS】Artificial Intelligence Algorithms"
description: ""
category: CS
tags: [AI, Algorithms]
---
{% include JB/setup %}

这是人工智能课程的复习提纲，希望也可以作为一个简要的人工智能算法介绍和索引。


$$
\begin{aligned}
& DFS(s): \\
1& \quad \text{if }isTerminate(s) \text{ return } null \\
2& \quad \text{if }isDeadend(s) \text{ return } fail \\
3& \quad S' \leftarrow next(s) \\
4& \quad \text{while:}\\
5& \quad \quad \text{if } empty(S') \text{ return } fail \\
6& \quad \quad s' \leftarrow pop(S') \\
7& \quad \quad path \leftarrow DFS(s') \\
8& \quad \quad \text{if } path \text{ is not } fail: \\
9& \quad \quad \quad \text{return } \{s'\} + path
\end{aligned}
$$
