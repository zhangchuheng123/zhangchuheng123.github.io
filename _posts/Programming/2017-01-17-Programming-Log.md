---
layout: post
title: "【Programming】Programming Log"
description: ""
category: Programming
tags: [Python, Programming]
---
{% include JB/setup %}

#Programming Log

##2017-01-16
实现微信公众平台接口和SAE绑定

微信公众平台实现信息自动回复

##2017-01-17
搭建本地PyCharm调试环境 解决web模块无法在本地安装的问题
	
	原因：import web使用的package是web.py 不是web
	
解决了python Class中method需要增加self传入参数的问题

	method的第一个参数必须为self，调用的时候略去不写	
	
解决了一个编码问题

	微信text类型传入的文字为Unicode编码，
	进来之后应该用encode('utf-8')变为utf-8编码，这样才能进行urlencode
	
解决了从PyCharm上面直接commit和push到SAE的问题

	terminal中的命令为 git push sae master:1
	在PyCharm的配置里面应该写作master  -> sae: 1
	
编码问题解决了一部分 但是还是不清楚 持续困扰中

解决MacOS El Captain不允许升级python six包，导致wechat_sdk安装失败的问题
	
	sudo -H pip2 install --ignore-installed wechat_sdk

用github page（硬）编码了通讯录，然后再服务器端抓取写好的通讯录XML文件