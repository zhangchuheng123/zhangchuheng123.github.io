---
layout: page
title: 欢迎您！
tagline: 学术 吉他 旅行 摄影 生活
---
{% include JB/setup %}

![](/assets/images/2016-11-26-homepage.jpg)

### Welcome to My Warehouse!

#### About Me

* Born in **Jingzhou** - a historic and cultural city and a stronghold in histroy
* Moved to **Chengdu** at the age of ten
* Junior and Senior High School in **Chengdu Foreign Language School(CDFLS)**
* Undergraduate in Department of Physics, **Nanjing University**
* Graduate in Center of Quantum Information (CQI), Institute for Interdisciplinary Information Sciences (IIIS), **Tsinghua University**
* [This](https://github.com/zhangchuheng123) is my Github homepage

#### Fields of Interest

* Quantum Computing
* Computational Physics
* Digital Image Processing
* Machine Learning
* Programming
* Guitar
* Traveling
* Photography

#### Features of Warehouse

* Summary of My Result of Work
* Quick Retrieving of Academic Resources
* Guitar TAB Abstract and Lyrics of the Songs
* Memos of My Life

### 欢迎来到我的仓库！

#### 关于我

* 我是湖北荆州人，也是四川成都人
* 初高中就读于**成都外国语学校**
* 本科就读于**南京大学**-物理学院
* 博士研究生于**清华大学**-交叉信息研究院(IIIS)-量子信息研究中心(CQI)
* [这里](https://github.com/zhangchuheng123) 是我的Github主页

#### 兴趣方向

* 量子计算与量子通讯
* 计算物理
* 数字图像处理
* 机器学习
* 码代码
* 吉他
* 旅行
* 摄影

#### 仓库的功能

* 工作成果的汇总
* 学术资源的快速检索
* 吉他谱和弦进行和歌词
* 个人生活备忘

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

#### 快速通道

[SIL Fabrication]({% post_url /Experiment/2016-11-19-Experiment-SIL %})

### 本站的一些最新文章

<ul class="posts">
  {% for post in site.posts limit:5 %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
