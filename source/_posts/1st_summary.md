---
title: 第1周总结
date: 2016-9-30 
tags: [微信小程序,htts]
category: Web技术交流群
---

# 主要内容

## 微信小程序

在见到这个东西的第一个想法就是,这与web app有什么区别。经过讨论与相关资料的查阅，小程序能调用系统的api，这是传统web app做不到的，但小程序是通过微信App间接地调用系统api。

小程序所能提供的功能详见官方[api文档](http://wxopen.notedown.cn/api/)

除此之外,小程序还提供了

> 1. WXML
>
> [WXML]([WXML · MINA](http://link.zhihu.com/?target=http%3A//wxopen.notedown.cn/framework/view/wxml/))(WeiXin Markup Language)是微信设计的一套标签语言，结合基础组件、事件系统，可以构建出页面的结构。这句话的描述太技术，翻译成人话就是**WXML使得后端开发同学可以使用熟悉的XML就可以开发出漂亮的页面，每个xml标签就是微信内置的[组件](组件 · MINA)和原生的html标签**。
> 通过这种方式**彻底屏蔽了底层页面和组件的实现方式，后续不管前端技术如何发展，小程序开发者的代码理论上不需要做任何的变化**。如果前端技术发展了，微信需要做的就是开发一个新的转换器，把WXML转换成对应的新技术就行了。**这才是这套框架渲染的真正的意图**。
>
> 2. WXSS
>
> [WXSS]([WXSS · MINA](http://link.zhihu.com/?target=http%3A//wxopen.notedown.cn/framework/view/wxss.html))(WeiXin Style Sheets)是MINA设计的一套样式语言，用于描述WXML的组件样式.这句话意思就是在开发时**只需要描述下组件的样式就行了，页面的布局，响应式不用你管，改个样式，字体大小，颜色，边框，相信这些对你没有任何学习成本**
>
> 作者：张胜利
>
>  链接：[http://www.zhihu.com/question/50900987/answer/123379337](http://www.zhihu.com/question/50900987/answer/123379337)

3.[官方的IDE](http://wxopen.notedown.cn/devtools/download.html)

小程序从技术上并没有什么特别之处,但因为是放在微信上的东西,所以就不能用一两句来评判他的发展和好坏

> [**一定比轻应用更加强大**](http://luochao.baijia.baidu.com/article/633917)
>
> **三年前，人们就在说“轻应用”这个概念，不少浏览器都尝试推出过“轻应用”，即基于H5的所见即所得的WEB App，然而却没有一个成功的**。理论上WEB APP可移植极强，开发门槛低，对用户来说所见即所得，为什么没有成功呢？核心原因有三点，一是用户习惯问题，用户通过浏览器过去是浏览网页现在是消费内容，没有通过浏览器做更多事情的习惯；二是产品体验问题，浏览器基于H5提供的轻应用在底层能力上很弱，而且都要联网使用，体验很差；三是开发者态度问题，浏览器对开发者的吸引能力还不够，大家不支持，不去开发轻应用，最终形成恶性循环。
>
> 现在微信小程序会重蹈覆辙吗？不会。微信小程序不是H5应用，而是嵌入在微信中的本地应用，看上去没有安装，实际上用户添加之后就会在微信里面实现“本地化”，在使用体验上会在WEB App之上，原生App之下。更重要的是微信对用户和开发者的吸引力比任何一个浏览器甚至各大浏览器加起来都要大，用户为了省事顺手使用，开发者为了用户积极开发，会形成一个正循环。
>
> 在小程序之前微信就已形成介于Native App和Web App之间的“微信应用生态”，内容的生产、传播与消费在微信实现，还可在微信实现服务的提供、共享、获取。而这一切与浏览器、与搜索引擎、与豌豆荚什么的没关系，这些都曾被视作不同时代的入口。微信绕过了这些入口，成为一个黑洞，将内容和服务都吸引过去，将用户和开发者吸引过去。现在做“小程序”只是锦上添花而已，不会对应用生态又什么本质改变。
>
> 李孝通:**概念差不多的东西在不同时代产生了不同效果。。**



**相关链接**

- [如何入门微信小程序开发，有哪些学习资料？](http://www.zhihu.com/question/50907897)
- [官方文档](http://wxopen.notedown.cn/)
- [微信小程序，仅仅是 Web App 么？](http://mp.weixin.qq.com/s?__biz=MjM5ODQ2MDIyMA==&mid=2650712679&idx=1&sn=d00033b16097ca890c10951f90b50c88&chksm=bec0643489b7ed225417e8d68e5f125ccfaed7ba6e3c88e14acc3db0034c23be679d8f7728bd&mpshare=1&scene=1&srcid=09309Jjizx6mAGuuoiYXKnrv#rd)
- [微信小程序的出现会给前端开发带来什么？](http://www.zhihu.com/question/50900987)
- [微信“小程序”来了，短期不可高估，长期不可低估](http://luochao.baijia.baidu.com/article/633917)

# Https劫持

李孝通学长的会话劫持演示


<video controls width='100%'>
<source src="https://cumtonline.github.io/MITM.mp4" type="video/mp4">
<source src="movies/movie.ogv" type="video/ogv">
<source src="movies/movie.webm" type="video/webm">
​	Your browser does not support the video tag.
</video> 



# 工具分享

- Listary是一款极为优秀的文件浏览与搜索增强工具
  [http://v.youku.com/v_show/id_XNTYyNDAyNDgw.html](http://v.youku.com/v_show/id_XNTYyNDAyNDgw.html)
- [在线社工库查查你被泄露的密码](http://www.xiumima.com/)
- [密码管理器](http://www.zhihu.com/question/27338793)

