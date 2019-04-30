---
title: 第8-9-10周总结
date: 2016-12-16 20:44:22
tags: [GIT,工作流]
category: Web技术交流群

---
# Git历史重写

**修改刚刚提交的日志**

> git commit --amend

该命令进入会进入vim编辑器,vim按'i'进入编辑模式.按esc再输入:wq 可保存并退出


## 修改历史记录

有时候一不小心把隐私信息写到了git中,比如邮箱账号密码,qq 的app id,app secret.

但开发无法避免要使用这些隐私信息,目前我所知道的避免隐私泄露的方法有:

1.把这类配置专门放到一个文件中,再用 ignore文件忽略它,使得不被git跟踪

2.把隐私信息保存到系统环境变量中,这样就不会把信息直接硬编码到文件中


使用交互式衍合命令

1. `git rebase -i HEAD~1`

修改上一个版本的历史记录,可改为HEAD~2,或者提交记录的开头编号

交互衍合中可以使用`git rebase --abort`停止

然后进入vim编辑器

``` shell
pick 9a54fd4 我的第2个提交
pick 0d4a808 我的第1个提交
# Rebase 326fc9f..0d4a808 onto d286baa
#
# Commands:
# p, pick = use commit
# r, reword = use commit, but edit the commit message
# e, edit = use commit, but stop for amending
# s, squash = use commit, but meld into previous commit
# f, fixup = like "squash", but discard this commit's log message
# x, exec = run command (the rest of the line) using shell
#
# If you remove a line here THAT COMMIT WILL BE LOST.
# However, if you remove everything, the rebase will be aborted.
#
```





下面是提示信息,如果找到你要修改的那个分支,把他的前面改为edit,比如第一个提交

``` shell
pick 9a54fd4 我的第2个提交
edit 0d4a808 我的第1个提交
```

:wq保存并退出 
开始交互式衍合,git会自动停在”我的第1个提交”,此时可以修改本地文件.并输入`git add .`保存本次修改

``` shell
e/Codes/tempcode (master|REBASE-i 1/2) #命令行中REASE表示当前处于交互衍合模式,1/2代表共2步,已经执行到第1步
```



add命令使用后再使用`git rebase --continue`此时再次跳入vim界面



``` shell
Stopped at d286baa... 我的第1个提交
You can amend the commit now, with
git commit --amend
Once you are satisfied with your changes, run
git rebase --continue
```



可以在此修改提交信息,并用`:wq`保存退出,衍合继续 
修改历史的过程中常常会出现冲突的情况,记得解决冲突

 

相关资料:

- [Git-工具-重写历史](https://git-scm.com/book/zh/v2/Git-%E5%B7%A5%E5%85%B7-%E9%87%8D%E5%86%99%E5%8E%86%E5%8F%B2)
- [衍合还是合并](http://www.cnblogs.com/sjjg/p/4979417.html)





# Git工作流

 

工作流是对工作流程及其各操作步骤之间业务规则的抽象、概括描述。

比如下课吃饭的工作流是:

收拾书包->下楼->去三食堂->买饭->在三食堂吃饭

 

但这个工作流可以是:

收拾书包->下楼->去二食堂->买饭->打包回宿舍

 

从上述例子，这个工作流是可变的，可定制的，而计算机软件就是为了解决现实世界中的问题，完成某项任务，把任务抽象出工作流，用软件完成工作。

 

git大部分的用途是软件开发，它的基本动作是：推送，拉取，开分支，合并分支，处理冲突。

为了高效管理项目，可以用某种工作流来限制git使用方式。

 

就拿最典型的**Gitflow**工作流举例子

![image2016-12-4 11-27-4](https://s1.ax1x.com/2017/12/28/zFOHI.png)






开发时都在Develop分支上开发，开发时能创建若干个Feature分支，用于项目的某个功能开发。开发到一定阶段时候就能用Release分支发布版本。Release分支上不再有大的变动，一般就是微小的跳转和bug修复。当该版本完善后即可推送到Master上。

在版本发布后如果有bug出现，则创建Hotfix分支进行维护，Hotfix上的修改可以合并到master分支和develop分支。

 

## SourceTree的工作流

 

最好用的Git客户端SourceTree提供了这种工作流的便捷操作

![image2016-12-4 11-37-8.png](https://s1.ax1x.com/2017/12/28/zFHjH.png)

![image2016-12-4 11-36-25](https://s1.ax1x.com/2017/12/28/zFLDA.png)


点击Git工作流，设置分支的名字

![image2016-12-4 11-39-32](https://s1.ax1x.com/2017/12/28/zFjEt.png)



自动创建develop分支并切换到该分支

![image2016-12-4 11-40-17](https://s1.ax1x.com/2017/12/28/zFvUP.png)



在develop下的动作有

![image2016-12-4 11-35-51](https://s1.ax1x.com/2017/12/28/zFqud.png)

一般的流程是,在develop建立新的功能,功能完成后合并到delelop,当合适的时候建立新的发布版本,然后再发布版本,SourceTree会自动的在这次发布上打上标签.



 

相关资料:

[Git 分支 - 分支开发工作流](https://git-scm.com/book/zh/v2/Git-%E5%88%86%E6%94%AF-%E5%88%86%E6%94%AF%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E6%B5%81%E5%88%86%E6%94%AF%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E6%B5%81)

[深入理解学习Git工作流](http://www.jianshu.com/p/91acec85c3a4)

[页面调试小技巧](http://mp.weixin.qq.com/s?__biz=MzI5MjUxNjA4Mw==&mid=2247483863&idx=1&sn=40ea2c761a4fed50e2982ccc6f1676f3&chksm=ec01784bdb76f15dd3d35324c24e1b93ec3b2dd2a438b17dc2cb40c2f44079d9a83a24ad1faf&mpshare=1&scene=1&srcid=1128f0ONiLJZDn8XaliEStpR#rd)

# 分享

 

[怎么花最少的钱提升出租屋的格调](undefined)

[哪里可以找到前端开发的最新资讯？](http://mp.weixin.qq.com/s?__biz=MzAxODE2MjM1MA==&mid=2651551457&idx=1&sn=6939ce7cc0efa82e0fd2c9f00e622471&chksm=8025a120b7522836aff0209e54a2b6af7e06fd52d9b13e091ca57a63c0b29371ecb4c2909760&mpshare=1&scene=1&srcid=1116qeRQpOZV6oke8usMbB0e#rd)

[推荐轻量高效无依赖的开源JS插件和库](https://segmentfault.com/p/1210000007656942)

[在线CSS代码可视化工具](http://enjoycss.com/)