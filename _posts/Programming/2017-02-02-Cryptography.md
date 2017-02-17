---
layout: post
title: "【CS】Cryptography"
description: ""
category: CS
tags: [Cryptography]
---
{% include JB/setup %}

# 1. 引言
![](/assets/images/2017-02-02-保密通信示意图.jpg)


## 1.1 对称算法与非对称算法

### 对称算法 

加密密钥和解密密钥可以互推，也叫“单钥算法”。如DES、IDEA、AES

### 非对称算法

加密密钥和解密密钥不可以通过对方计算处理，也叫”公钥算法“。如RSA、椭圆曲线。

## 1.2 保密通讯系统安全性要求

1. 系统即使达不到理论上是不可破的，也应当为实 际上不可破的。就是说，从截获的密文或某些已知 的明文密文对，要决定密钥或任意明文在计算上是 不可行的。



## 1.3 密码算法要满足以下两条准则之一:
1. 破译密文所花的时间超过信息的有用期。 

## 1.4 密码方案
1. 无条件安全的(不可破译的)：一次一密方案(一次一密乱码本) 
1. 计算上安全的：流密码、分组密码、公钥密码

# 2. 流密码
![](/assets/images/2017-02-02-流密码.jpg)

# 3. 分组密码

分组密码是许多系统安全的一个重要组成部分。可用于构造


![](/assets/images/2017-02-02-分组密码.jpg)

## 3.1 美国数据加密标准DES（Data Encryption Standard）

发展史： DES -> DEA -> (EES) -> AES

分组长度为64 bits (8 bytes)


![](/assets/images/2017-02-02-DES.jpg)

我写的代码在[这里](https://github.com/zhangchuheng123/Python_Practice/tree/master/DES)

## 3.2 