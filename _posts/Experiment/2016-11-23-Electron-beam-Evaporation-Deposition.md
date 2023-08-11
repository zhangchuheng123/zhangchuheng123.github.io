---
layout: post
title: "【Experiment】Electron-beam Evaporation Deposition"
description: ""
category: Experimental Physics
tags: [Academics, Physics, Experiment]
---
{% include JB/setup %}

电子束蒸发镀膜

1. 检查水、泵和气压状态，登陆（账号：user 密码：useruser）检查样平台位置
1. 检查Chamber的气压，离开时为3E-6Torr；Vent；开仓取出样品台，用氮气枪吹干净，装好样品之后检查样品不要晃动，金刚石的样品只压一个小角落，装好之后将样品台倒着装入Chamber，放置好之后确实会有一点点晃动；Pump至3E-6Torr
1. 检查各个仓的状态为“target: transfer / offset: 0.0”，冷泵为10K
1. 选择需要蒸镀的金属类型和蒸镀的厚度
1. 传样品：点击Transfer - Oxidation
1. 选择OxidTilt Target>evap Offset>0° 点击Start
1. 开始样品台的转动：点击Oxid Planetart>rotate
1. 打开电子束控制管：Evap Chamber>process
1. 点击：Oxid Chamber>Evap
1. 检查Oxid Chamber中的气压达到e-8之后，点击左边图中的小圆圈变成红色，电压加到9.8kV
1. 加电流（对于Al，200mA）先缓慢加电压，电压达到额定电压的一半不到的时候，打开蒸发仓的观察阀门，观察电子束是否打在金属样品的中央，如果不是，需要调整电子束的位置。快加到预定电压的附近，缓慢增加电流。
1. 等蒸发速率恒定之后，点击start开始蒸镀，蒸镀到预定厚度之后会自动停止。蒸镀完毕之后一定要等5~10min！等待冷却
1. 停止样品台的转动：点击Oxid Planetary>Stop之后，再点击Oxid Planetary>Start（start之后才会再回到0°）
1. 将各仓的状态选择到“transfer 0° ”，将样品台传送到loadlock中
1. loadlock中开始vent，取出样品台，取下样品，然后放回样品台，点击pump抽真空
1. 点击Evap chamber>Stop 然后点击Pump