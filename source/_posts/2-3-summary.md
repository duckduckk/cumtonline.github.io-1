---
title: 第2-3周总结
date: 2016-10-15 15:32:18
tags: BAAS
category: Web技术交流群
---

# BAAS

 

众所周知，近几年前端发展迅速,各种框架层出不穷,以Angular为首的MVVM框架,更是把大量的后端工作搬到了前端中。

传统的"美工出图->前端实现->后端把代码嵌入页面"方式，逐渐淘汰。

后端现在趋近服务化，API化，前端则是多样化，静态化，有些应用只用一个html页就能实现非常复杂的功能。前后端完全分离时代理所当然地到来了。现在前后端开发互相影响小，甚至借助[某些手段](http://wiki.flyingstudio.online/pages/viewpage.action?pageId=5242909)能进行前后端并行开发。

但现在，后端亦可弃。

写过后端的童靴应该知道，后端大部分是增删改查，技术含量低，且工作量大。

BaaS（后端即服务：Backend as a Service）公司为移动应用开发者提供整合云后端的边界服务。

 

下面就介绍国内的一个BaaS（[LeanCloud](https://leancloud.cn/)）的使用demo

到这个网站注册,登入,创建一个应用获得appId和appKey

 

>  LeanCloud的[数据存储服务](https://leancloud.cn/docs/storage_overview.html#数据存储服务总览)
>
> ****
>
> **面向对象的海量数据库** 前后端交互的主体，都是「数据」，不管结果多少，属性具体含义如何，它们都可以抽象成统一的「对象」来处理。LeanCloud 支持存储任意类型的对象，支持对象的增、删、改、查等多种操作，并且开发者无需担心数据规模的大小和访问流量的多少，可以简单将 LeanCloud 云端看成是一个面向对象的海量数据库来使用。
>
> **大文件存储和分发** 任何一款产品，不管是网站、应用还是游戏，都有一些素材或者文件需要存储和分发。与应用内数据不一样，这些文件因为它的体积较大，为了获得更快捷的用户体验，一般都还需要 CDN 服务。LeanCloud 存储系统完整涵盖了大文件存储和分发的需求。
>
> **LeanEngine 完成特定业务逻辑** LeanCloud 提供的数据操作 API 能覆盖大部分业务的需求，但是凡事总有例外，这些标准 API 有时候并不能完全满足某些特定需求，这时候怎么办？LeanCloud 还提供了「LeanEngine」自定义服务端业务逻辑的功能。LeanEngine 与大家熟知的 Google App Engine 相似，允许开发者写很少的一部分代码，来完成业务特有逻辑。这些代码会被部署到 LeanCloud 云端，与 LeanCloud 标准服务一起执行，来实现特殊需求。
>
> **离线数据分析平台** 对于完全构建在 LeanCloud 上的产品来讲，在运行一段时间之后会积累大量的业务数据，这时候产品和运营层面都会产生一些数据挖掘或商业智能分析的需求，此时如何才能简便地操作云端，看到数据背后隐藏的趋势和价值呢？为此我们推出了分布式的「离线数据分析系统」，支持在应用数据集上进行各种处理和操作。离线分析系统是完全的分布式、实时计算系统，其执行效率和处理的数据规模远在 Hadoop MapReduce 之上。

 

一开始有内置的数据对象



![image2016-10-15 15-15-28](https://s1.ax1x.com/2017/12/28/zkcPf.png)

``` javascript
<script type="text/javascript">
    var appId = "H60osxgDyMqRdjGRkPLptpgb-gzGzoHsz"
    var appKey = "0VFjRH4c9hbaJiYs6636pTOc"
    // 初始化
    AV.init({
        appId: appId,
        appKey: appKey
    });
     
    //添加Product类型
    var Product = AV.Object.extend('Product');
     
    //注册用户
    var user = new AV.User();
    user.setUsername("用户名");
    user.setPassword("password");
    user.setEmail("378280323@qq.com");
    user.signUp().then(function(loginedUser) {
        alert("注册成功")
        console.log(loginedUser);
    }, (function(error) {
        alert(JSON.stringify(error));
    }));
    //创建一个商品
    var product = new Product();
    product.set('title', "标题");
    product.set('price', "价格");
    product.set('description', "描述");
    product.set('owner', AV.User.current());
    product.set('image', "图片");
    product.save().then(function() {
        //  发布成功
    }, function(error) {
        alert(JSON.stringify(error));
    });
</script>
```



![image2016-10-15 15-20-21](https://s1.ax1x.com/2017/12/28/zkgG8.png)



[更详细的Demo](https://github.com/leancloud/StorageStarted/tree/master/Web)

 

更多介绍看官方的文档,非常详细!

 

在尝试Js Api的时候我就在想,如果别人拿了我的appid和appkey那么他不就是可以冒充我去修改我的数据库,毕竟纯js的应用,appId,appKey必然会暴露给浏览器(NodeJs除外).

但LeanCloud也提供了相应的举措。首先支持配置white List，允许来自white List中的网站使用api。这样直接杜绝了别人拿着我的appKey干其他事。但还有个问题，如果破坏者在当前网站(abc.com)下使用开发者工具的控制台输入一些js代码进行一些操作也会被LeanCloud视为合法。因为这时发送的数据也是来自(abc.com)。

而LeanCloud有提供了ACL（Access Control List）来限制数据的操作权限，权限能精确到一条数据，官方文档说道，可以设置当前登入用户只访问自己的数据。这样，即使破坏者在命令行中输入查询全部数据的命令也查不到别人的数据，修改也是如此。

![image2016-10-15 15-29-13](https://s1.ax1x.com/2017/12/28/zkyIP.png)



![image2016-10-15 15-29-29](https://s1.ax1x.com/2017/12/28/zksat.png)




不仅如此LeanCloud还提供以下功能，可以满足大部分应用的需求，而且他的免费额度也挺高的。

- 内建的账户系统
  - 无需编写任何代码即可实现用户注册、登录、密码找回和重置等通用的账户维护功能。
- 应用内搜索组件
  - 轻松对应用内数据进行全文检索，并在搜索结果中直接打开应用内的对应页面。
- 应用内社交组件
  - 提供应用内社交的通用解决方案，包括用户间关注（好友）、朋友圈（时间线）、状态、互动（点赞）、私信等常用功能。
- 第三方平台账号登录组件
  - 默认提供新浪微博与 QQ 空间账号授权登录，也支持更多其他平台的 OAuth 方式接入。
- 用户反馈组件
  - 为用户和开发者搭建互动渠道，让开发者能及时了解用户的反馈并做出回复。移动端双向反馈，及时互动。



LeanCloud实现了大部分的后端通用服务，但并不意味着就不需要后端了，复杂的业务逻辑还是不能用Saas替代的。Saas替代的是无聊的增删改查（低级程序猿），如果不想被替代，那么就不要当只会增删改查的程序猿。

 

参考链接：

[https://www.zhihu.com/question/28612733](https://www.zhihu.com/question/28612733)

 

# 本周分享

- [从输入URL到页面加载发生了什么？](https://segmentfault.com/a/1190000006879700)
- [正则表达式神器](http://wiki.flyingstudio.online/pages/viewpage.action?pageId=8683577)