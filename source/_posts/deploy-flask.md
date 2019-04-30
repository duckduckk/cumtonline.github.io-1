---
title: 在Linux下部署flask应用
date: 2017-02-21 16:38:13
tags: Linux服务器
---



# 前言

虽然flask是Python两大web框架之一,但中文的资料还是比较少的，基本上一个常见问题就一两个版本的解决办法。

flask官方文档也介绍了部署方法，但那几乎只是告诉你有个工具叫XXX能部署flask。



flask应用内直接通过`python myflaskapp.py`运行,但实际上内部用了一个低性能的服务器,所以要另外选择。



## 登入服务器前

相信大部分人都是使用virtualenv开发的。

在上服务器前，先确保当前应用的virtualenv环境没有不必要的包，删除他。

使用命令`pip freeze>requriments.txt`把包的列表输出到文件。



# 部署



一般的linux都自带了python,python3可能没有python3,需要自行安装。在linux中运行python2 使用命令`python`,python3是`python3`

## pip 安装

有了python后,第一时间就是找pip一类的安装工具,如果用python3,通过`apt-get install python3-pip`进行安装,更多详见[知乎上的回答](https://www.zhihu.com/question/21653286/answer/95532074)



**补充:pip源的设置**

一般的云服务器已经帮你配置好了他自己的镜像源,除非你安装的系统不是官方提供的。

可以通过修改`~/.pip/pip.conf` （windows是``C:\Users\Recod\AppData\Roaming` 

`)来配置源,格式如下

```
[global]
index-url = http://pypi.douban.com/simple
[install]
trusted-host = pypi.douban.com
```

上面设置了pip下载豆瓣镜像的包。



## virtualenv环境搭建

1. 安装`pip install virtualenv`
2. `virtualenv -p python3 envname` 创建环境
3. 切换环境 ..... linux上我不会,因为我再这里用了virtualenvwrapper



**virtualenvwrapper**

是virtualenv工具包,方便对环境的管理.

使用前需配置virtualenv的工作区 `WORKON_HOME`,即以后创建的virtualenv都会在这个地方

在linux下修改相关的环境变量文件(/etc/bash.bashrc ,这里能设置环境变量,用户启动时都会运行这个文件)

在末尾添加

```
export WORKON_HOME=$HOME/.virtualenvsexport PROJECT_HOME=$HOME/DevelVIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'source /usr/local/bin/virtualenvwrapper.sh
```

`/etc/bash.bashrc`如果配置后没效果试试`~/.profile`

再不行设置这个,这可是全局的`/etc/profile`,这几个文件区别自行查资料.



使用:

- mkvirtualenv venvname
- lsvirtualenv #列出环境
- workon venvname #激活环境
- cdvirtualenv #进入当前虚拟环境目录
- cdsitepackages
- lssitepackages
- deactivate #退出环境
- rmvitualenv venvname



相关资料:

- [http://www.cnblogs.com/welhzh/p/5973815.html](http://www.cnblogs.com/welhzh/p/5973815.html)
- [文档](http://virtualenvwrapper.readthedocs.io)



## 上传,环境还原

可以用xshell的文件->传输或者相关linux命令来传送项目压缩文件,推荐在Linux上搭建ftp环境(vsftpd),这样可以通过pycharm的部署工具方便的发送项目文件,做到随时更新





**安装包**

切换到新建的virtualenv

**注意!!!!!!!!!!!!!!!!!!**

切换环境后绝对不要再用`sudo`了,如果在sudo中运行python,那么那时的环境就是不是再这个virtualenv中,你的程序很可能因为当前环境没有xxx包而报错。

所有的文件权限问题在进入环境前设置好，最无脑的方法是项目文件权限都设置为777

使用pip安装requirement.txt中的包.



然后你可以先试试用python3 来运行你的程序



## 使用Gunicon

```
pip install gunicorn
```

```
(venv) $ gunicorn -w 4 -b 127.0.0.1:8080 runserver:myapp
```
- w 4个工作进程
- runserver一个py文件
- flask app对象,写在这个runserver文件中(好像用manager会报错,我目前还没找到解决办法)

如果gunicorn说找不到明明安装的包,那么gunicorn命令可能是venv外的gunicorn,切换到venv外删除gunicorn



## 使用supervisor

这是一块管理你应用进程的工具,方便启动与关闭,还有出错重启功能

```
apt-get install supervisor
```


总配置文件在 /etc/supervisor/supervisor.conf,可以分应用配置,应用配置保存在/etc/supervisor/conf.d/,最后所有配置都会被加载
```
##新建编辑留言板应用的文件
$ sudo vim /etc/supervisor/conf.d/messageBoard.conf

##文件内容
[program:程序名]
#你应该写当前virtualenv环境中gunicorn命令的位置
command=/home/pyVenvs/flyopen/bin/gunicorn -w 4 -b 127.0.0.1:8080 run:app 
##项目的根目录在/home/wwwroot/flyopen
directory=/home/wwwroot/flyopen
##默认root
user=swing
autostart=false
autorestart=false
##日志文件,确保文件目录存在
stdout_logfile=/home/swing/logs/gunicorn_supervisor.log
stderr_logfile=/home/swing/logs/gunicorn_supervisor.log
```
**启动**
```
sudo service supervisor start
```
注意这里,命令执行后用`service --status-all | grep 'supervisor'`查看服务是否真的启动了
入显示的是[-] supervisor 说明没启动.

尝试直接键入`sudo supervisor`,然后在启动服务,再查看.
另外`supervisorctl`,`supervisor`这两个注意拼写,前者是客户端,需要后者服务,所以后者未运行时会一直报出connect error错误



**使用**

```
##重新读取配置文件
$ sudo supervisorctl reload

##查看 supervisor 管理进程的状态
$ sudo supervisorctl status

##重启服务
$ sudo service supervisor restart

##启动所有/指定 supervisor 管理的程序进程
$ sudo supervisorctl start [all]|[appname]

##关闭所有/指定 supervisor 管理的程序进程
$ sudo supervisorctl stop [all]|[appname]
```




**问题**

运行时候可能报错`unix:///var/run/supervisor.sock no such file`
因为在总的配置文件`/etc/supervisor/supervisord.conf`设置了`file=/var/run/supervisor.sock   ; (the path to the socket file)`

> 遇到这个问题的时候,我的服务还没启动起来,也许服务启动后就没这个问题

该路径下确实没有这文件.解决办法就是创建一个文件出来

```
sudo touch /var/run/supervisor.sock
sudo chmod 777 /var/run/supervisor.sock
sudo service supervisor restart
```





**资料**

- [配置说明](http://www.cnblogs.com/ajianbeyourself/p/5534737.html)




## Nginx

刚刚运行的程序都在8080端口(别问我干嘛不直接80,不想解释,反正以后一定会用nginx),需要用Nginx来监听80端口,转发用户请求到8080

下面是复制的



关于 Nginx 我也就不详细讲了，我们就直奔主题，杀入 Nginx 的默认配置文件

```
sudo nano /etc/nginx/site-avalidable/default
```

暴力修改成为以下的内容

> 建议先备份一下 `default` 文件
> `sudo cp /etc/nginx/site-avalidable/default /etc/nginx/site-avalidable/default.bak`

```
server {
    listen 80;
    server_name example.org; # 这是HOST机器的外部域名，用地址也行

    location / {
        proxy_pass http://127.0.0.1:8080; # 这里是指向 gunicorn host 的服务地址
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

  }
```

记得完成 nginx 需要重新起动 nginx 服务喔！

```
sudo service nginx restart
```



## 部署资料
- [Flask + Gunicorn + Nginx 部署](http://www.cnblogs.com/Ray-liang/p/4837850.html)
- https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-gunicorn-and-nginx-on-ubuntu-14-04
- http://blog.csdn.net/u012675539/article/details/50836775
