---
layout: page
title: 欢迎您！
tagline: 吉他 旅行 摄影 生活
---
{% include JB/setup %}

![Minion](/assets/images/2016-08-18-photo.jpg)

### Welcome to my Homepage!

I was born in a famous historic and cultural city, **Jingzhou**, which, in history, is a stronghold. I moved to **Chengdu** with my family at the age of ten, and had my junior and senior high school life in **Chengdu Foreign Language School(CDFLS)**. In 2016, I obtained a bachelor's degree of science in department of Physics, **Nanjing University**. Now, I'm a PhD student in Institute for Interdisciplinary Information Sciences (IIIS), **Tsinghua University**.

I'm interested in so many fields currently which include (surely, but not only include) computational physics, quantum computing, digital image processing, machine learning, programming, playing guitar and traveling.

### 欢迎来到我的个人主页！

我出生于**湖北荆州**（嗯，是的，刘备借荆州的那个荆州），10岁随父母搬至**四川成都**（天府之国，也是刘备他们蜀国的地盘），初中和高中就读于**成都外国语学校**（外国语学校听起来就比较高端~），大学本科就读于**南京大学物理学院**。现在**清华大学交叉信息研究院**攻读博士学位。

目前感兴趣的方向有：计算物理、量子计算、数字图像处理、机器学习、码代码、弹吉他、旅游………

### 关于老站点

访问老站点请点击[这里](http://zhangchuheng.sinaapp.com)（目前老站点已不能访问），目前正在陆陆续续搬迁。由于本人时间有限，搬迁可能会持续很久……

### 本站的一些固定页面

#### 清单与列表

[我的书单](/my_pages/list-of-books)

[我的影单](/my_pages/list-of-movies)

[我的歌单](/my_pages/list-of-songs)

[我吃过的餐馆](/my_pages/list-of-restaurants)

[我去过的地方](/my_pages/list-of-trips)

#### 学习与工作

[本科期间工作成果](/my_pages/undergraduate-works)

[研究生期间工作成果](/my_pages/graduate-works)

[学术资料](/my_pages/academic-resources)

### 最近写的东西

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
