---
title: git测试
date: 2017-06-03 11:38:30
category: 测试/考核
---

大约是5月中旬对后端、移动组(除了请假的同学)进行了git测试。

前端组尚未测。本学期结束前应该会补上。

## ** 题目整理如下 **

** 1.如何(什么没命令)把一个目录(文件夹)变成git可以管理的仓【初始化仓库】**

<code>git init</code>

** 2.把文件添加到仓库的命令 **

<code>git add</code>

** 3.把文件提交到仓库的命令 **

<code>git commit</code>

** 4.查看当前仓库状态的命令(查看文件是否被修改) **

<code>git status</code>

** 5.查看修改内容的命令 **

<code>git diff</code>

** 6.git中HEAD指针指向的是什么 **

HEAD(大写)是"current branch"(当下的分支)。[更多请戳这儿](https://segmentfault.com/q/1010000000770497)

** 7.查看提交历史的命令 **

<code>git log</code>

** 8.查看命令历史的命令 **

<code>git reflog</code>

** 9.git push origin master的作用是？此处origin是指什么？这个origin是可以修改的吗？**

本地当前分支的内容推送到远程仓库;远程仓库;可以

** 10.git的工作区和暂存区分别是指什么？和git add以及git commit 的关系是？**

** [戳这儿](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/0013745374151782eb658c5a5ca454eaa451661275886c6000) **

** 11.git fetch 和 git pull的区别,谁的安全性更高 **

<code>git fetch</code>不会自动merge。<code>git fetch</code>安全性更高。

** 12.git branch 和 git branch < name > 的区别 **

<code>git branch</code>查看分支

<code>git branch < name > </code> 创建分支

** 13.如何切换分支,如何合并分支 **

<code>git checkout</code>
<code>git merge</code>

*************************

<p style="margin-top: 0.4em; text-align: center">
<b style="font-size: 1.5em;font-weight: 600;">未经授权，禁止转载</b>
 </p>