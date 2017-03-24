---
layout: post
title: "【Experiment】FIB Chipname and Makers"
description: ""
category: Experimental Physics
tags: [Academics, Physics, Experiment]
---
{% include JB/setup %}

# 操作流程

## 基本操作

- 样品准备：只做chip name样品，用C胶固定，结束后用纸蘸丙酮擦拭；做SIL和大面积marker样品，用银胶固定，银胶需110°C >30min，结束后用丙酮超声

- 样品装卸：Vent ~3min，打开CCD窗口，看着CCD窗口拉出样品台，注意不要撞到，若其中有高度不一的其他样品台，应询问后将其取出，以免后续旋转时撞上。固定好样品台，看着CCD窗口推回，pump ~3min，等待图标变绿之后分别在电子束、离子束窗口点开beam on，过程中点击stage—take nav-cam photo拍照。

- 调整水平：点击照片样品左下角，找到样品边缘，stage-XT align feature 将边缘调为水平状态。

- 升台子：右键按边缘粗调节焦距，放大找到表面上找点状物，将台子上升到z=4mm之后开小窗调节焦距，link（link后箭头向下）。

- 焦距与像散：将台子上升link状态到z=4mm，再调节焦距、像散（shift+右键），link。鼠标右键左右移动调整焦距；shift+右键上下左右移动调整像散；控制台Magni左右旋转调整放大倍数，也可在窗口输入HFW值控制放大倍数.

- 修改HFW：点击屏幕下方HFW值，点击custom，双击已有数值，修改，Enter，双击F6检查是否已修改

## 测试并打chipname

- Ion: 30kV  9.3nA; Electron: 20kV 50pA

- 以金刚石边缘做Align X， 左下角附近找一块可做marker的划痕或者脏东西，调整电子束聚焦像散

- 找合适的marker为参考旋转样品台（5°--调节Z--52°--调节Z）

- 附近空地离子束刻蚀一个circle，半径50nm，Z=10um，dwtime=100us，检查离子束形状（圆形）和直径（\<1um），不符合则需要调节离子束（不建议调）

- 确定chip name的位置，一般距左下角X：0.6mm  Y：0.3mm

- 打开NanoBuilder软件，选择合适的文件，一般Z=300nm

常见bug:若圆在电子束窗口偏离过远，需要将台子转回去检查是否是因为z轴变化造成的

## Makers

- Ion: 30kV  2.5nA; Electron: 20kV 50pA

- 以金刚石边缘做Align X，以Chip name中的十字调整电子束聚焦像散和52°倾角
- Ion beam窗口，修改HFW~17.3um，双击F6刷新，将边角移到窗口中心，从边角走到中心X=1.5mm，Y=1.5mm

- 刻蚀一个circle，半径50nm，Z=10um，dwtime=100us，检查离子束形状（圆形）和直径（\<1um），不符合则需要调节离子束（不建议调）

- 台子转到0°，根据上一步的圆点转至52°，调整Z

- 刻蚀Marker，文件位置：
- Nanobuilder软件中先打开Marker_700um_cross 文件，2.5nA，depth 500nm

- 结束后立即开始Marke_700um_dots 文件，2.5nA，depth 1um，中间不要开关离子束窗口

- 打开电子束窗口，将一个700um间距的Align十字移至中心
- Ion: 9.3nA，离子束窗口HFW~65um，双击F6刷新，将十字移到中心，双击F6刷新检查是否在中心
- pattern中新建两个30um\*1um的矩形形成十字，覆盖离子束窗口中的已有十字印记，Z=2um，刻蚀

- 测量深度，没问题后重复9-11步依次完成剩下三个Align十字。

- 样品台转到0°，调整聚焦，根据做的点marker，Align X。测量中心和边缘区域marker间距是否一致和正常
