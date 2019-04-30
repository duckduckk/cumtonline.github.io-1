---
title: 2018年第三月总结
date: 2018-03-31 10:27:35
tags: [Web技术交流群,翔工作室]
---
阳春三月,已过含苞待放,矿大-开花了。

**工作室新域名备案成功** [https://atcumt.com](https://atcumt.com)

>这个季节同时也是工作室换届传统选定的日子。
工作室会又迎来一波新迹象,趁着换届之际
首先就来综述一下目前工作室的情况
然后再写一下最近工作室讨论的一些技术方面的东西

## 翔工作室

首先工作室目前的组成为:

![翔工作室](https://s1.ax1x.com/2018/04/01/9zpZrj.png)

工作室简单开发流程是: 

![开发流程](https://s1.ax1x.com/2018/04/01/9zpfFP.png)

### 一些制度

>- 工作室事务方面将会加强管理
- 为避免技术组交流尴尬,增加大例会之后技术组交流会
- 办公运营每次大例会分享固定增加互联网最新事件播报
- 加大奖励,实施金币制度,技术组和非技术组每学期初步最低各预支**6000**元
- 加班制度改革,固定加班工资
- 小组值班增强开放性,不限制仅组别人员参与值班
- 大招新之后的试用期尽量实例化,筛选部分不合适人员

PS: 
1. 其中技术组交流会不强制参加
交流会不采用一人讲的形式,针对会前提出的问题可以自由结合讨论
对于普遍问题,可以采用一人讲形式,提出的问题在群里可以采取匿名的形式
2. 金币制度定期奖励一段时间内排名靠前选手
**并且金币！=人民币,只能兑换等额实物**

![礼物](https://s1.ax1x.com/2018/04/01/9zi5As.png)

## 日常干货

针对昨天技术组交流会内容
都是基础内容

### 什么是前后端分离??

#### 我们为什么要前后端分离呢？

这些东西再写也是瞎扯,不如贴几篇经典文章

[淘宝FED团队-前后端分离的思考和实践](http://webcache.googleusercontent.com/search?q=cache:http://taobaofed.org/blog/2014/04/05/practice-of-separation-of-front-end-from-back-end/&gws_rd=cr)
[Web研发模式演变](https://github.com/lifesinger/blog/issues/184)

>然后再白话式的说一下:
就是前端后端工作分为两个团队来做,比如我们工作室的前端组和后端组
前端组主要负责图片,文字,颜色布局搭配,还有后端数据的接受和处理至显示
后端组主要负责数据的操作,把前端需要的数据通过商定好的形式发给前端
这样的一点好处很明显了,各执其责

#### 前后端的实践例子？？

有人可能会问：你讲了这么多，我也看了很多，但是真正做东西的时候
前后端长什么样呢？

>就拿昨天我举得例子来说==最近的工作室首页的项目
我们打开 [https://atcumt.com/](https://atcumt.com/)会发现大例会的模块
有几个链接的分享,这些链接并不是前端直接嵌死到代码中的,而是处理的后端接口
我们再来看一个链接 [https://homeapi.atcumt.com/share](https://homeapi.atcumt.com/share)
这个链接打开之后你会发现正是刚才提到的那几个链接,而这个url就正是所谓的后端接口
**前端是如何处理这个后端接口来实现前端显示的呢？**

>如果你懂点前端知识，你查看源码会发现存在这样一段js代码
这段代码就是前端所做的工作,通过get的方式获取后端接口的内容转化为需要的数据格式
然后通过jq选择器'加载到'前端某个标签里(也就是我们首页看到的例会图片旁)

```
$(document).ready(function () {
    $.get("https://homeapi.atcumt.com/share", function (datas) {
        for (var i = 1; i <= 4; i++) {
            var title = 'title' + i;
            var url = 'url' + i;
            $("ul.shareurls").append(
                '<li><a href="'
                + datas[url]
                + '" class="family">'
                + datas[title]
                + '</a></li>')
        }
    });
})
```

**后端是如何些的呢？？**

>后端部分是通过定期爬取工作室博客获取最新的四个文章链接存入一个文本
然后在提供服务的代码中加入一个路由,也就是前端获取数据的那个链接 https://homeapi.atcumt.com/share
我们通过下面的代码可以发现jsonify函数,这个函数在flask中供用户处理返回的序列化json数据
也就是把我们要传给前端的数据格式化成json的函数,最后形成的数据就是我们刚才看到的那个后端接口形成的内容

```
#  首页分享链接部分更新接口
@api.route("/share", methods=['GET'])
def share():
    try:
        with open('data/share_urls.txt') as f:
            share_dict = eval(f.readline())
    except:
        with open('data/share_urls.txt',encoding='gbk') as f:
            share_dict = eval(f.readline())
    return add_head(jsonify(share_dict))
```

PS：我们也会发现jsonify前面有add_head
这个函数是为了解决我们前后端分离经常遇到的一个问题-跨域

[什么是跨域？如何跨域？](http://www.cnblogs.com/hustskyking/archive/2013/03/31/CDS-introduce.html)
[解决跨域](https://blog.flywinky.top/2018/01/31/Ajax%E4%B8%8EFlask%E4%BC%A0%E5%80%BC%E7%9A%84%E8%B7%A8%E5%9F%9F%E9%97%AE%E9%A2%98/)

URL | 说明 | 是否允许通信 
- | :-: | -: 
http://www.a.com/a.js    http://www.a.com/b.js |同一域名下|允许
http://www.a.com/lab/a.js  http://www.a.com/script/b.js | 同一域名下不同文件夹 | 允许
http://www.a.com:8000/a.js  http://www.a.com/b.js |同一域名，不同端口 | 不允许
http://www.a.com/a.js  https://www.a.com/b.js |同一域名，不同协议|不允许
http://www.a.com/a.js  http://70.32.92.74/b.js	| 域名和域名对应ip|不允许
http://www.a.com/a.js  http://script.a.com/b.js | 主域相同，子域不同 |不允许
http://www.a.com/a.js  http://a.com/b.js |同一域名，不同二级域名（同上）|不允许(cookie这种情况下也不允许访问)
http://www.cnblogs.com/a.js  http://www.a.com/b.js	|不同域名|不允许

>同时移动互联组做app也是需要后端提供接口的哦~

### 分享摘要

#### 邢组实习分享

>注意要每次写完代码记得格式化，常用的ide都有
平时写代码，要注意一些大公司的开发文档
写代码多思考冗余度和代码的复用
如果可以 可以使用一些常用的库来简化代码或让代码更加优雅
思考性能,感觉有时候对代码的性能要求其实还是挺高的,能用单例模式实现的,尽量减少使用多个对象

#### 莫组设计趋势分享

![moji](https://s1.ax1x.com/2018/04/01/9zC5rQ.png)

2018设计趋势盘点(**好多好看的图**):

- 镭射彩虹渐变 Color-gel Laser Gradient 荧光 / 流体 / 梦幻感
- 赛博故障风格 Cyberpunk-glitch Art 霓虹 / 错位拉伸 / 未来感
- 图形通感化解构 Synesthetic Graphic Deconstruction 解构 / 反逻辑 / 通感体验
- 三维纯色渲染 3D Solid Color Rendering 去材质 / 纯色系 / 平面感
- 极简化设计 Complexion Reduction Design 大字号 / 信息优先 / 去风格化
- 光感透气叠加 Light Sensation Superimposition 光感 / 渐变 / 氤氲感

### PS

#### 一些安全问题

>最近再次遇到了用户鉴权问题,比如Flask,如果我们使用第三方库
应该要关注下这个第三方库是不是一直更新？尽量使用一直维护的第三方
比如Flask-Jwt已经两年多没人维护了
同时在进行Password加密储存时应舍弃hash加密而采用hamc避免一些安全隐患

然后如果你使用了PyJwt这个第三方库或者某些其他的鉴权库,一定要注意JWT里面
对payload的加密是否是Base64的简单加密,所以要注意不要把隐秘信息填写到这里面

#### python开发调试问题

>在平常的python开发中,可能很多人不用重型IDE
这个时候就可以使用**pdb**进行断点调试
```
import pdb;pdb.set_trace()
```

#### 关于局域网调试技巧

>前后端分离的时候,如果两个人在同一个局域网,可以通过局域网IP进行通信
在命令行查询ipconfig查看局域网IP就行了
同时也适用于前端开发的时候真实测试手机端显示

![局域网](https://s1.ax1x.com/2018/04/01/9zP2w9.md.png)

#### 一些链接分享

[python装饰器-讲的非常非常好](http://www.wklken.me/posts/2013/07/19/python-translate-decorator.html)
[关于 *args and \**kwargs in Python](https://www.saltycrane.com/blog/2008/01/how-to-use-args-and-kwargs-in-python/)

#### 某位小翔子Android面试经验

面试Android可能会问到的问题：
>- 腾讯视频
1.	项目介绍
2.	eventbus什么原理，优缺点
3.	你比较了解哪些库，然后就说了asynctask，说了它串行执行，线程池，然后问了它的工作队列有哪些？
4.	int、char、float、double、指针在64位机器上进行sizeof的结果5.struct { int， char， char*， char [32] }，求其sizeof
5.	虚函数和纯虚函数的区别：纯虚函数后面加上=0，还有呢？ 
6.	构造函数是虚函数可以吗？为什么？ 
7.	你有什么想问的吗？。。。

>- 支付宝
1.	自我介绍
2.	安卓四大组件
Activity、Service、BrocastReceiver、ContentProvider
3.	安卓启动模式
Standard  singletop  singletask  singleinstancce
4.	fragment生命周期
onAttach  onCreate  onCreateView  onViewCreated  onStart  onResume  onPause onStop  onDestoryView  onDestory  onDetach
5.	activity生命周期
onCreate  onStart  onResume  onPasuse  onStop  onDestory  onRestart
6.	你用过哪些库，看过源码吗
Asynctask看过源码，Okhttp、glide、gson、fastjson、eventbus等用过，但没看过源码
7.	asynctask流程
8.	计算机网络的七层模型
9.	dp和px的区别
Dp和像素无关，和像素密度有关，px和像素有关
px = dp * (dpi / 160)
Density-independent pixel (dp)独立像素密度。标准是160dip.即1dp对应1个pixel，，屏幕密度越大，1dp对应 的像素点越多。 上面的公式中有个dpi，dpi为DPI是Dots Per Inch（每英寸所打印的点数），也就是当设备的dpi为160的时候1px=1dp；
10.	你在做项目遇到了什么困难
11.	常用的排序算法有哪些，相应的时间复杂度
12.	对1到100求素数
13.	MVC、MVP、MVVM 
14.	你有什么想问的。。。

>- 腾讯在线教育
1.	Context的理解
2.	Hashmap怎么存储，内部结构，
3.	排序，冒泡排序、二分查找
4.	Java的集合
5.	Final的使用final：使用final修饰的类不可继承，final修饰的方法不可重写，final修饰的变量只能赋值一次
6.	Activity的布局实际放到哪里了
7.	项目遇到的难题
8.	你有什么想问的

>- 腾讯某个部门
1.	Recyclerview和listview的区别以及回收机制
2.	消息机制
3.	View事件分发机制
4.	Looper.Prepare可以放在子线程吗
5.	Gc算法、gc对app的影响
6.	Okhttp为什么要用它，底层实现原理
7.	Fastjson和gson的区别，底层原理
8.	Activity和fragment的区别
9.	Service怎样保活
10.	Kotlin知道吗
11.	Int和integer的区别
12.	项目难题
13.	用过哪些框架
14.	Mvp、mvvm以及vm的实现原理
15.	反射，怎样获取private成员
16.	Eventbus实现原理
17.	内存泄露，如果在其他地方非要获取context，除了applicationcontext外还能怎么做

## 最后

>有一点想提一下: [提问的艺术](https://blog.csdn.net/danky/article/details/1370632)
有时候很多东西不是别人告诉你你就能记住的
而是需要你自己通过搜索引擎先自己摸索一下
当然也有一些东西通过问有经验的人能很快解决(当然也是很熟的情况下,比如你们的组长)