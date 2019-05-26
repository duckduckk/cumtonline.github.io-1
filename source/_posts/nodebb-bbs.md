---
title: nodebb搭建,维护,DZ数据迁移
date: 2018-06-03 23:06:05
tags: [nodebb]
---

>为什么选择了NodeBB?
我也不知道~~~

[NodeBB官方Github](https://github.com/NodeBB)

[NodeBB中文论坛](https://community.nodebb-cn.org)

[NodeBB官方文档](https://docs.nodebb.org/)

[NodeBB中文文档](https://www.kancloud.cn/a632079/nodebb-cn/336022)

## 安装

>此处的方式是Docker安装部署(https://hub.docker.com/r/nodebb/docker/)
不用考虑环境配置问题，但是相应的也会有一些弊端
比如文件的修改等变得麻烦

下方为nodebb镜像的YAML
```bash
cumt:
  image: index.docker.io/nodebb/docker:v1.9.3
  privileged: false
  restart: always
  ports:
  - 4567:4567
  volumes:
  - /bbs/:/usr/src/app/config #为了修改文件方便，加了一个文件夹方便和宿主机文件交换
  - /bbs/public/uploads:/usr/src/app/public/uploads #同步上传的文件到宿主机
```

同时关于docker的管理推荐使用中国的容器管理平台，镜像会直接拉取国内复制来的镜像
工作室目前用的是[https://www.daocloud.io/](https://www.daocloud.io/)

>拉取nodebb镜像并生成容器后，再拉取一个mongodb镜像作为数据库容器
为了维护方便，单独使用一个容器，以后的nodebb论坛的升级可以直接拉取新的版本镜像
安装新版本的时候填写数据库容器内网地址就行啦~

在成功生成mongodb容器后，要首先进入容器创建我们需要的数据库名字和此数据库相应的用户密码
[官方也有介绍](https://docs.nodebb.org/configuring/databases/mongo)

下面是mongo镜像的YAML,我们通过数据卷可以同步更新数据到宿主机
```bash
mongodb:
  image: library/mongo:3.4.15
  privileged: false
  restart: always
  ports:
  - 27017:27017
  volumes:
  - /var/lib/docker/volumes/mongoconfig/_data:/data/configdb
  - /var/lib/docker/volumes/mongodata/_data:/data/db
```

一般国内服务器会配置安全组，为了方便你也可以暂时开放mongodb容器外网端口
在本机远程连接进行配置，这里推荐一款windows可视化工具[Robo 3T](https://robomongo.org/)

然后我们通过nginx代理设置我们需要的域名就行了~

>这样安装之后你就可以配置自己的bbs了，这样的方式会给我们省去很多环境配置的麻烦


### 可能遇到的问题

- 论坛一直显示断开连接
这时候你需要修改容器config.json里面的url为你的自定义域名

## 版本升级

>nodebb并不好升级，按照官方文档的操作我们需要首先备份数据库和用户上传文件
但是我们使用了docker几句可以避免这些问题
然后我们要做的就是更新docker镜像并重新生成容器，配置相应的数据库就行了

- 需要注意的是我们生成新的容器后要停用一切插件以防nodebb系统直接崩溃

```bash
./nodebb reset -a
```


## 数据库维护和备份

>定时备份数据库并迁移到其他机器是件很重要的事情[数据库备份](https://www.kancloud.cn/a632079/nodebb-cn/373544)

由于我们使用的是docker容器，备份命令就需要连接我们相应的内网地址

```bash
mongodump -h 172.22.0.12:27017 -u 用户名 -p 密码 --authenticationDatabase=数据库名 -d 数据库名
```

- 我们需要注意的是如果定时执行的脚本在宿主机，我们需要在宿主机安装mongo以支持mongodump命令
- 同时这个定时备份脚本的成功输出语句并不能正确的反应是否成功备份
我们还是最好定期检查一下

>如果你要恢复数据库文件，我们可以通过我们保存的备份文件上传到新的mongodb外置的数据卷
即比如:

```bash
把备份文件放到宿主机的 /var/lib/docker/volumes/mongodata/_data
容器中直接打开 /data/db
然后解压之后(tar -zxvf xxx.tar.gz)
运行
mongorestore -u nodebb -p yourpassword --authenticationDatabase=nodebb -d nodebb --drop dump/nodebb
即可
```

## discuz!数据迁移到nodebb

>旧的论坛数据库是Mysql,完全不同的数据库类型，也是不可能一样的数据库字段
但是论坛的性质使得他们数据字段部分是相同的，我们只需要过滤筛选我们所需要的数据，然后通过NodeBB接口插件导入我们要用的信息就行了
其实这个过程并不具有技术难度，只是比较复杂和麻烦
我们首先需要熟悉Dz和nodebb数据库各个字段 [DZ数据库字典](http://discuzt.cr180.com/discuzcode-db.html)

### 对于用户的筛选

>我们都知道Mysql数据库外键很方便我们联表或者关联查询，通过这种方式把我们需要的用户信息组成json
通过NodeBB接口post到mongodb(如果不使用api直接导入到mongo，我们还要自己组合mongo字段)

由于nodebb-api用户新建只支持用户名和密码，邮箱的POST,我们可以新建成功后，记录下新建成功的用户uid，然后通过update用户信息来更新用户资料

>关于用户的头像,论坛等cms一般都有自己的用户头像文件命名规则
对于dz论坛自己获取头像的的代码如下,我们可以通过模仿流程来获取头像文件夹的路径

```php
function get_avatar($uid, $size = 'middle', $type = '') {
  $size = in_array($size, array('big', 'middle', 'small')) ? $size : 'middle';
  $uid = abs(intval($uid));
  $uid = sprintf("%09d", $uid);
  $dir1 = substr($uid, 0, 3);
  $dir2 = substr($uid, 3, 2);
  $dir3 = substr($uid, 5, 2);
  $typeadd = $type == 'real' ? '_real' : '';
  return $dir1.'/'.$dir2.'/'.$dir3.'/'.substr($uid, -2).$typeadd."_avatar_$size.jpg";
}

===============================================
# python模仿流程
def get_avatar(uid):
    uid = str(abs(int(uid)))
    uid_length = len(uid)
    if uid_length < 9:
        uid = '0'*(9-uid_length)+uid
    dir1 = uid[0:3]
    dir2 = uid[3:5]
    dir3 = uid[5:7]
    dir4 = uid[7:9]
    old_avatar = os.path.join(
        basedir, 'avatar/'+dir1+'/'+dir2+'/'+dir3+'/'+dir4+'_avatar_middle.jpg')
    return old_avatar

...

if avatarstatus != 0:
    old_avatar = get_avatar(uid)
    new_avatar_address = '/assets/uploads/profile/%a-profileavatar.jpg' % adduser_uid
    new_avatar = os.path.join(basedir, 'profile/%a-profileavatar.jpg' % adduser_uid)
    shutil.copy(old_avatar, new_avatar)
    update_data["picture"] = new_avatar_address
    update_data["uploadedpicture"] = new_avatar_address
```

### 对于帖子和回复的迁移

>理论和以上一样
我们需要先研究清楚DZ数据库字典，比如这样的字典
我们根据相应数据字段来组合我们需要的mongodb字典
我们需要注意的是，在这个表段的组合之后我们也需要update相应的帖子资料
更新帖子的发表时间，以及发表作者(我的脚本里只更新了帖子的作者，没有更新帖子发表字段，因此造成用户没有记录帖子发表数，但是帖子详情页作者显示正确)

![帖子字典](https://s1.ax1x.com/2018/06/04/CTdQVH.md.png)

- 如果导入HTMLParser报错,可以参考下面的文件更新到python相应的Lib/site-packages文件夹中 [HTMLParser报错文件参考](https://gist.github.com/bay1/24ef682e672554b6d8b8ef3d2f32b3a9)

- 如果requests失败，就增加time.sleep减少发送频率

- dz是s级别的时间戳，而nodebb是13位的毫秒级，转换公式 reply_dateline = int(round(reply_dateline*1000))

[迁移脚本完整部分(供参考)](https://gist.github.com/bay1/4f8ad3c2d7a7b8089c0da43d6a9ab807)