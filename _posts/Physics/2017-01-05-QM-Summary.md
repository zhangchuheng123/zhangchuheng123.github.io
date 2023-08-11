---
layout: post
title: "【Physics】Advanced Quantum Mechanics Summary"
description: ""
category: Physics
tags: [Academics, Physics]
---
{% include JB/setup %}

# 高等量子力学考点总结

[PDF version](/assets/files/2017-01-06-QM-Summary.pdf) 

## 第一章 基本概念
* S-G实验：已知$$S_z$$推算$$S_y$$、$$S_z$$
* 推导不确定关系
* 平移算符和生成算符之间的关系（eg. 证明$$\hat{T}(\vec{dx})=1-i\frac{\hat{p}}{\hbar}\vec{dx}$$）
* 动量和坐标表象转换关系
* $$\hat{x}$$和$$\hat{p}$$的对易关系
* 最小不确定态满足的条件和动量-位置最小不确定态的形式
* 能量和时间的不确定关系

## 第二章 量子动力学
* 推导薛定谔方程
* Dyson级数（从时间演化算符满足的微分方程出发）
* 电子自旋进动
* Ehrenfest定律证明/包含电磁相互作用时的Ehrenfest定律的证明
* 一维线性谐振子的全部推导（$$\hat{H}$$写成升降算符的形式、$$n>0$$、$$n$$为整数、基态、升降算符作用于本征态）
* Casimir效应（$$E = 2\times \int \frac{d^3k}{(2\pi)^3} \hbar \omega_k$$）
* 谐振子的相干态
* 从薛定谔方程到坐标表象的薛定谔方程和定态薛定谔方程
* WKB近似（假设：$$\varphi(x,t)=e^{\frac{i}{\hbar}(s(x)-Et)}$$，$$s(x)=s_0(x)+(\frac{i}{\hbar})s_1(x)+\cdots$$）
* 传播子及其满足的动力学方程 $$K(x,t;x_0,t_0) = \langle x | e^{-\frac{i}{\hbar} H (t-t_0)} |x_0\rangle$$
* Feynman路径积分的推导（$$K = \int_{x_1}^{x_N} dx(t) \exp (\frac{i}{\hbar}\int_{t_0}^{t} L_c dt )$$）
* 用定义和Feynman路径积分计算自由粒子/谐振子的传播子
* 常数势导致量子相干（$$V\rightarrow V+\Delta V$$）
* 电磁场中的常数势导致量子相干（$$A \rightarrow A + \nabla \Lambda$$）
* AB效应（磁通量子化、干涉现象）
* Dirac弦（电荷量子化方案）

## 第三章 角动量理论
* 量子转动下各角动量平均值的变化（eg. $$\langle J_x \rangle \rightarrow \langle e^{\frac{i}{\hbar}J_z \varphi} J_x e^{-\frac{i}{\hbar}J_z \varphi}\rangle$$）
* 泡利矩阵的代数性质
* 由$$S_{z \uparrow}$$转动生成任意自旋态
* Euler转动（在下面一条的计算中用到）
* $$R_n(\varphi)$$在$$|j,m\rangle$$表象下的矩阵表示（$$R_n(\varphi)=\exp(-i\frac{\varphi}{2}\sigma_n)$$）
* 自旋轨道角动量耦合
* 两电子角动量耦合
* 量子力学条件下定域性原理的冲突
* 自旋$$\frac{1}{2}$$粒子的密度矩阵表示
* 密度矩阵随时间的演化

## 第四章 近似方法
* 定态微扰的公式推导
* 带电粒子在谐振子势+电场中的运动（定态微扰论的应用）
* Stark效应（定态微扰论的应用）（分裂为三个能级$$\Delta E = 3e\epsilon a$$）
* 氢原子的相对论修正（定态微扰论的应用）
* 氢原子的自旋轨道耦合
* 变分法求解氦原子的基态波函数（变分法的应用）
* 强耦合方法求解汤川势（$$V(r) = g^2 \frac{\exp(-\alpha r)}{r}$$，$$\phi(r) = \exp(-S(r))$$）
* 含时微扰的推导/费米黄金规则的推导
* 基态氢原子的跃迁（含时微扰的应用）
* 相互作用绘景中算符和态的演化规则
* 相互作用绘景中演化算符的展开

## 第五章 散射理论
* 散射微分截面与散射振幅（$$dN = J_n \sigma(\theta,\varphi)d\Omega$$，$$\psi=e^{ikz}+f(\theta,\varphi) \frac{e^{ikr}}{r}$$，$$\sigma(\theta,\varphi)=|f(\theta,\varphi)|^2$$）
* Green函数方法求解、与渐进解比较得出散射振幅
* Born级数
* Lippmann-Schwinger方程（Green方法的算符表达形式）
* Dyson方程
* 光学定理（$$\text{Im }f(0,\varphi) = \frac{k}{4\pi}\sigma_{tot}$$）
* 分波法（$$f(\theta) = \frac{1}{k}(2l+1)e^{i\delta_l} \sin\delta_l$$）

## 第六章 对称性与全同粒子
* 全同性原理的观察效应：两自由粒子出现在距离$$r$$附近的概率（非全同离子、全同波色子、全同费米子）
* 全同性质对氦原子中电子的限制
* 零温下费米子的压强

## 第七章 二次量子化
* Fock表象下产生湮灭算符的对易关系的推导
* 证明$$\hat{n}_i=\hat{a}_i^\dagger\hat{a}_i$$
* 求$$\hat{a}_i|\cdots, n_i, \cdots\rangle$$，$$\hat{a}_i^\dagger|\cdots, n_i, \cdots\rangle$$
* 可加单粒子算符和可加双粒子算符的表示
* 单粒子连续谱中的产生湮灭算符（波函数的量子化）
* 量子化波函数自洽（从海森堡绘景和薛定谔绘景中来看$$\hat{\psi}_\sigma(\vec{r})$$，$$\hat{\psi}_\sigma^\dagger(\vec{r})$$)
* 无相互作用费米子的密度平均值、密度矩阵、密度-密度关联函数
* 无相互作用波色子的密度-密度关联函数
* 有相互作用费米子体系的平均场方法/Particle-hole Excitation Energy

## 第八章 相对论量子力学
* KG方程的推导和流守恒方程
* Dirac方程的推导和流守恒方程
* Dirac方程的中微子（$$m=0$$）情形
* 一般Lorentz不变性/连续Lorentz变换/空间反演变换/时间反演变换
* 电磁相互作用/电荷共轭变换
* 自由粒子的Dirac方程平面波解

## 常用公式
* $$\int_0^\infty e^{-x^2} dx = \dfrac{\sqrt{\pi}}{2}$$
* $$\exp(\lambda \hat{A}) \hat{B} \exp(-\lambda \hat{A}) = \hat{B} + \lambda [\hat{A},\hat{B}]+\dfrac{\lambda^2}{2!} [\hat{A},[\hat{A},\hat{B}]] + \cdots$$
* $$\int_{-\infty}^{+\infty} \dfrac{1}{k'+k} e^{ik'r} dk' = 2\pi i \text{ Res }f(-k) = 2\pi i e^{-ikr}$$
* $$\int_0^\pi \cos^2(kr\cos\theta) d\theta = \dfrac{\pi}{2} (1+\dfrac{\sin (2kr)}{2kr})$$
