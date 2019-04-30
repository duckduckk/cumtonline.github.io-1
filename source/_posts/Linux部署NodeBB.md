---
title: Linux下部署开源论坛Nodebb
date: 2017-01-01 21:57:13
category: Linux服务器
---
# [工作室内部论坛FlyingForum](http://forum.flyingstudio.online/)

# 为什么使用nodebb
1. 工作室需要一个论坛，交流平台作为QQ群的补充，以及需要一个收集反馈的地方等。
2. 之前想使用原来的discuz，通过模板开发之后再重新推广。但开发失败
3. 暑假接触到开源软件的概念，并在自己的服务器上部署了一两个开源服务:Ghost，nodebb等。
4. nodebb好看以及响应式设计，移动友好性等


# 准备

- ### 安装Node  
参照肖神的安装方法，使用包管理器安装：[Nodejs官方包管理器安装方法](https://nodejs.org/en/download/package-manager/)
> 少了很多配置，能否安装成功全看网速了（学校的校内网对国外的网速限制特别厉害）
> 附上[肖神博客](http://blog.xgy666.cn/)

- ### 安装Nginx
为了使用最新版的Nginx，参照[官方的下载安装教程] (http://nginx.org/en/linux_packages.html#stable) 找到相应的系统版本下载就行

- ### 安装Git *root下yum安装*
```
yum install git
```
- ### 安装redis3.2.6
> 原本考虑使用mongodb的，但下载速度太慢、也比较大200+M及莫名失败，所以选择了redis，
> 附上[mongodb"centos"官方安装教程](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/)

  1. 下载Redis参考[官方下载教程](https://redis.io/download)
    > 我实在受不了学校的下载速度，所以是先下载到本地，然后通过‘FileZilla’上传到服务器**源代码只有不到2MB！**

  2. 设置redis
  > - [CentOS 7 上安装 Redis 服务器](https://linux.cn/article-6719-1.html)  
  > - [centos6安装redis](https://segmentfault.com/a/1190000002685224)

预想到学校的网速问题，在使用这个方法之前，尝试过使用[中科大镜像](http://mirrors.ustc.edu.cn/)的[EPEL](http://blog.chinaunix.net/uid-2469966-id-3916408.html)。使用` yum install redis`来安装redis，这样安装真的少了很多手动配置，方便很多。
但是中科大centos6的EPEL很久没更新了（最近更新在2010年左右）,导致Redis版本太低，nodebb启动失败，最后采用了上述手动安装的方法

----------


# 开始安装Nodebb

### 1.  下载Nodebb到相应的目录
`git clone https://github.com/NodeBB/NodeBB.git `
### 2. 参照[官方教程](https://docs.nodebb.org/en/latest/installing/os/centos.html)安装NodeBB
> 如果`npm install` 速度比较慢的话，可以使用淘宝的国内镜像
`npm install --registry=https://registry.npm.taobao.org`
> ``` shell
 //安装依赖包
 npm install
 //配置nodebb 管理员，数据库等
 ./nodebb setup
```

### 3. 安装完成后，启动NodeBB
在nodebb的根目录下
终端执行 ` ./nodebb start `或者`node app`
  > - 前者是只要服务器不关机就可以一直后台运行
  > - 后者必须保持终端打开状态，终端一断开或者一按‘CTRL+C’,nodebb就会停止，而且后者会显示启动状态及启动失败问题

运行成功后，可以通过你设置的端口号来访问了，在nodebb根目录‘config.js’文件修改
> - 本地  http://localhost:你的端口号（默认4567） 如果是服务器没有图形界面可以使用  `curl i localhost:4567` 来检验nodebb是否启动成功
> - 外网访问 http://你的Ip地址:端口（默认4567）这个前提是：你要开放相应的端口

### 4. 设置nginx  
参照[Nodebb官方Nginx配置](https://docs.nodebb.org/en/latest/configuring/proxies/nginx.html)
> **设置nginx的目的是只开放80端口，不用开放所有端口，就可以访问一个服务器里的多个网站，更方便和更安全**   
> 更多资料,Nginx相关。请百度“Nginx” 或者看[工作室wiki](http://wiki.flyingstudio.online/)

------------

# 问题解决  SElinux导致Nginx转发失败
做完上述工作后，根据我在自己的腾讯云服务器配置nodebb的经验，是可以通过域名访问的 http://forum.flyingstudio.online/ ，但这次出现了“502”错误。

刚开始还以为Nginx配置错误，又重复弄了几次：配置文件名字 *.conf，默认配置文件中是否 include 了配置文件夹，配置文件的内容等

最后只好百度关键词“502” “nodebb 启动” “nodebb 502”等。，找到了读取nginx日志的命令：
`sudo tail /var/log/nginx/error.log`

在日志中发现了原因：这是部分关键字“failed (13: Permission denied)”  百度了之后发现是：SeLinux设置问题。[搜到的结果](http://www.hpboys.com/827.html)

然后我尝试了 `setenforce 0 ` 临时设置Selinux为Permissive,域名访问nodebb后，发现没有出现，所以问题解决成功

为了安全考虑，我又把selinux设置为“Enforcing”，想着能不能只开放一个端口即nodebb使用的端口（默认4567），想起[安装mongodb](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/)曾经提到过selinux
在里面找到:
> If SELinux is in enforcing mode, enable access to the relevant ports that the MongoDB deployment will use (e.g. 27017). See Default MongoDB Port for more information on MongoDB’s default ports. For default settings, this can be accomplished by running
`semanage port -a -t mongod_port_t -p tcp 27017`

仿照搜到的教程[selinux教程](http://os.51cto.com/art/201105/265956.htm)里Apache的解决方法
> 可以看出 SELinux 根据三种不同情况分别给出了对应的解决方法。在这里，第一种情况是我们想要的，于是按照其建议输入：
`semanage port -a -t http_port_t -p tcp 888`
之后再次启动 Apache 服务就不会有问题了。
这里又可以见到 semanage 这个 SELinux 管理配置工具。它第一个选项代表要更改的类型，然后紧跟所要进行操作。

最后写了这个命令:`semanage port -a -t http_port_t -p tcp 4567`，nodebb能通过域名访问了
> 期间出现了没有找到"semanage"问题，找到的解决方案有：
- https://www.cyberciti.biz/faq/redhat-install-semanage-selinux-command-rpm/
- http://sharadchhetri.com/2014/10/07/semanage-command-found-centos-7-rhel-7/

百度到的相关Selinux资料：
> [selinux入门](http://os.51cto.com/art/201105/265956.htm)
> [Centos看Selinux状态](http://www.hpboys.com/824.html)

# nodebb插件安装
因为方便用户登录，使用了第三方登录插件和安全插件(防垃圾帖子和机器注册)
1. 直接在后台按照
2. 在nodebb根目录下 npm install <你需要的插件>
> 相关插件可以在npm，GitHub上寻找，也可以在nodebb插件市场上找

# 将来可能出现的问题
> 这次是这几年来，工作室第一次使用Linux服务器，从技术上，人员上是个挑战。


1. 安全问题
- 工作室服务器是学校的虚拟机，是对外，为用户服务的,Linux服务器如何管理，如何保证安全是一个问题。
- 现在**https**越来越普遍，工作室也应该尽快进入https阶段了

2. 性能问题
- 这个服务器配置不太好，将来很有可能出现性能瓶颈。
- redis是基于内存的服务器，不知道会消耗掉多少服务器资源。
- 如何和网络中心协商升级服务器。

3. 后期维护问题
- 这个nodebb采用的nodeJS+redis技术，后面的人才培养，进行二次开发，也是个挑战。
- 从挂上去（1.3）到今天（1.4），一天之内，这个论坛就已经莫名其妙挂掉两次了。


这次部署负责人： Seven


# 链接收集：
工作室：
[工作室内部论坛FlyingForum](http://forum.flyingstudio.online/)
[工作室wiki](http://wiki.flyingstudio.online/)
Node相关：
[Nodejs官方包管理器安装方法](https://nodejs.org/en/download/package-manager/)
Nginx相关：
[Nginx下载安装教程] (http://nginx.org/en/linux_packages.html#stable)
MongoDB：
[mongodb"centos"官方安装教程](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/)
Redis相关：
[Redis官方下载](https://redis.io/download)
[CentOS 7 上安装 Redis 服务器](https://linux.cn/article-6719-1.html)  
[centos6安装redis](https://segmentfault.com/a/1190000002685224)
NodeBB相关：
[官方安装教程](https://docs.nodebb.org/en/latest/installing/os/centos.html)
[Nodebb官方Nginx配置](https://docs.nodebb.org/en/latest/configuring/proxies/nginx.html)
SELinux相关：
[selinux入门](http://os.51cto.com/art/201105/265956.htm)
[Centos看Selinux状态](http://www.hpboys.com/824.html)
