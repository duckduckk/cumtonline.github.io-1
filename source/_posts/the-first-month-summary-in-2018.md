---
title: 2018年第一月总结
date: 2018-01-31 17:58:06
category: 翔工作室技术交流群
---

首先是写总结的时候发现博客变慢了
一开始以为是解析和github仓库的问题
查看控制台发现加载了google字体.......
大概主题作者在国外....

>把fonts.googleapis.com配置直接删掉.....
或者在[这里搜一下](https://cdn.baomitu.com/index/fonts)
360维护的前端静态资源库

**还有就是工作室.online没有备案,现在转移到了cumt.me**

这个月份是学校的考试周,工作室绝大部分人都在复习考试
都把手中的事情放到了寒假

工作室也并没有很多新的活动
额...截一下工作室技术交流群吧

## 如何分多次PR

```
17-web-渣渣飞(328588917) 11:35:14
那个github我PR一次，然后再在自己的库修改，PR也会自动增加版本？？？？
17-web-渣渣飞(328588917) 11:35:30
怎么分成多次PR的？
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 11:35:38
不知道
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 11:35:56
开多分支可以
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 11:36:25
以不同的分支提交pr
17-web-渣渣飞(328588917) 11:36:31
想起来。。。老组长当时让我开多分支。。。难道就是为了这个
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 11:36:46
哈哈哈哈哈
```

## 直接git add .会被打？？？？

```
17-web-渣渣飞(328588917) 11:51:40
刚才看到个文章。git add . 会被打
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 11:54:01
为啥啊
17-web-渣渣飞(328588917) 11:55:16
说是要配置好ignore
17-web-渣渣飞(328588917) 11:55:21
才能这样做
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 11:55:28
那肯定啊
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 11:55:48
第一件事就是配ignore
17-web-渣渣飞(328588917) 11:56:02
没注意过
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 11:58:35
不配打死
17-web-渣渣飞(328588917) 12:10:21
学到了学到了
13-webgis-李杨<masakulayou@163.com> 12:18:51
肯定啊
13-webgis-李杨<masakulayou@163.com> 12:19:09
Node_modules上传上去
```

## 换了电脑,hexo炸了怎么办？？？

```
....(省略学叔在一个个改遇到的问题)

17-web-渣渣飞(328588917) 12:57:54
 这个时候如果是我，我会直接备份post和theme。重新init
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 12:58:13
那我也重新init试试
17-web-渣渣飞(328588917) 12:59:07
我已经重新init好多次了，移植工作室的hexo也是这么干的

...

10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 13:06:22
重新init管用

```

## 循环引用？？

```
14-.Net-Py-老组长(378280323) 20:23:14
run.py->phonebook.py->test.py->phonebook.py
14-.Net-Py-老组长(378280323) 20:24:52
如果phonebook没初始化完,Ui_Student怎么被别人使用
14-.Net-Py-老组长(378280323) 20:28:49
phonebook 在执行第8行的时候发现他需要test的东西然后跑去找test(此时还没扫描到UI_Student),test执行第一行时发现需要phonebook的UI_Student

...

然后移动各位大佬

16-Android-web-运维-搜狐远(1285085637) 22:26:44
tkinter欢迎你
14-Android安全-web渗透-包子哥(1661175532) 22:27:50
飞爷入坑IDS吧！
15- 后端&&安卓 -滴滴普(572807239) 22:33:09
学android吧
14-Android安全-web渗透-包子哥(1661175532) 22:33:50
我也觉得Android靠谱
```

## 碰到几天解决不了的问题怎么办？？

```
15-钱端工程师-航爷(865605793) 22:49:20
时间紧就先放一边，时间不紧，偶尔死磕一下也没什么。
可能是因为我太菜了，已经习惯解决不了问题的状态了
```

## 答题抢红包怎么赚钱??

```
15-钱端工程师-航爷(865605793) 14:35:50
这个就是撒钱赚用户
15-钱端工程师-航爷(865605793) 14:36:00
一群人一起玩賊有意思
15-后端-李明灿(1163147549) 14:40:06
我舍友错过了一场700RMB的不过已经转了1,2百了。。。 我玩了几天 小赚50,60 万恶的资本家真是撒钱不当回事 
16-前端-李驰<ilichi@qq.com> 15:10:44
流量+用户+消费时间
15-钱端工程师-航爷(865605793) 15:16:38
其实只是把钱从其他运营的方式，直接送到用户手里了，反正那些钱都是要用的

15-javaweb-进爷(785404906) 21:58:44
没有，我只看蜡笔小新
```

## 工作不爽怎么办？？？

```
14-.Net-Py-老组长(378280323) 9:53:47
30秒办离职，同事还在目瞪口呆
15-钱端工程师-航爷(865605793) 10:15:02
裸辞？？
14-.Net-Py-老组长(378280323) 10:19:54
是已找到B公司，到A公司实习
```

## 某某SS慢????

```
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 22:00:00
端口号是有可能被封的

14-.Net-Py-老组长(378280323) 23:41:16
装加速器
```

## docker?？

```
真好用
```

## 编译Android????

```
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 16:44:17
你竟然用mac编译android
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 16:45:18
要是你自己的劝你别编译了
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 16:45:31
小心硬盘过早报废

...

10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 17:17:17
卡了就可能是编过了
14-Android安全-web渗透-包子哥(1661175532) 17:17:28
啊
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 17:18:00
有可能而已
14-Android安全-web渗透-包子哥(1661175532) 17:18:46
我上次在我ubuntu上编译很顺利
14-Android安全-web渗透-包子哥(1661175532) 17:18:52
mac上各种bug
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 17:20:14
java环境变量不能只设置java和javac的
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 17:20:43
也得确认javadoc的
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 17:20:51
版本不一致会导致编译失败
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 17:22:36
用apt-get安装的会自己设置好
14-Android安全-web渗透-包子哥(1661175532) 17:23:52
 这个问题问先记一下，有的版本编译需要oracle 的jdk，这样就需要javadoc环境了
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 17:24:11
应该是5.0以前的版本了吧
14-Android安全-web渗透-包子哥(1661175532) 17:24:22
对，4.4
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 17:24:27
后来的都用openjdk了
14-Android安全-web渗透-包子哥(1661175532) 17:24:56
啊
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 17:28:15
android官方有编译指南啊
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 17:28:21
你看的是官方的吗
10-Java-C-Py-卡基猫<jay@darkerthanblack.org> 17:35:24
jack出错的话就把~/.jack里的端口号的进程杀掉 
14-Android安全-web渗透-包子哥(1661175532) 18:41:15
看的官方的
```

## 谁是工作室移动组历史最强？

```
16-Android-web-运维-搜狐远(1285085637) 22:19:11
下学期请两周假准备
16-Android-web-运维-搜狐远(1285085637) 22:19:19
其他时间应该不了
15-钱端工程师-航爷(865605793) 22:19:50
估计能实习五六周吧
15-钱端工程师-航爷(865605793) 22:22:58
可以了
15- 后端&&安卓 -滴滴普(572807239) 22:23:19
可以吹半年了
16-Android-web-运维-搜狐远(1285085637) 22:24:09
我可以吹一辈子
16-Android-web-运维-搜狐远(1285085637) 22:24:33
签到7.9号
15- 后端&&安卓 -滴滴普(572807239) 22:25:20
移动史上最强，工作室因你而骄傲
15- 后端&&安卓 -滴滴普(572807239) 22:25:38
母室以你为荣
16-Android-web-运维-搜狐远(1285085637) 22:26:10
别吹
15- 后端&&安卓 -滴滴普(572807239) 22:27:36
双击查看原图实话实说
16-Android-web-运维-搜狐远(1285085637) 22:30:38
你这么强 工作室谁不知道 你吹我 只是为了凸显你
16-Android-web-运维-搜狐远(1285085637) 22:30:44
更强
15- 后端&&安卓 -滴滴普(572807239) 22:32:07
双击查看原图再吹，我就退移动群了
```

## 太宅找不到女朋友....

```
14-.Net-Py-老组长(378280323) 19:21:43
学叔,太宅会找不到女朋友
```

链接:

[github多彩表情包代码](https://www.webpagefx.com/tools/emoji-cheat-sheet/)
[COVERITY个人完整版-代码分析](http://qschecker.com/?utm_source=qq&utm_medium=social)
[Bootstrap主题模板](https://startbootstrap.com/)

>最后祝各位工作室程序猿寒假愉(mei)快(bug)

![orz](https://s1.ax1x.com/2018/01/31/9iYLIx.jpg)