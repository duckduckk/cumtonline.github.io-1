---
title: 第4-5周总结
date: 2016-10-31 20:29:23
tags: 单点登入
category: Web技术交流群
---

# 单点登入

工作室要弄一个用户中心,以后所有开发的应用用户都集中到这个用户中心里.以前工作室用的是UCenter,discuz同一家公司开发的,discuz的用户就是集成到这个UCenter,而且UCenter能独立运行并支持其他应用集成到上面.当该项目自从2011后就不更新了,用的数据传输格式还是XML,而且官方不提供非PHP的SDK,大都是第三方开发的,而[.Net版的SDK](https://github.com/dozer47528/UCenter-API-For-DotNet)就是由工作室10级站长开发



作为喜新厌旧的程序狗,我尝试着换新的开源单点登入系统,后来找到国外著名的开源项目CAS,然后开始折腾.....最后放弃了,网站已经运行起来了,但是那并不适合工作室(反正我很讨厌),那就是在子应用登入时必须跳转到CAS提供的登入页面中登入,再跳转回来.而且这个默认的登入页面定制起来还颇为麻烦,html代码是混在jsp中的.虽然网上有一两篇博文介绍了解决方案,但我知(ying)难(yu)而(bu)退(hao)了准备转回UCenter

 

所为单点登入简单地说所以应用都与一个系统关联,用户在其中一个应用中登入,到其他的应用中也是处于登入状态.比如在百度搜索首页登入,在百度百科与百度贴吧中就已经是登入状态.

 

# 简单的单点案例

![image2016-10-31 9-52-31](https://s1.ax1x.com/2017/12/28/zkJ56.png)





# CAS的单点

![image2016-10-31 1-24-28](https://s1.ax1x.com/2017/12/28/zktPK.png)




该流程中有两个Cookie,第一个是CAS的Cookie,是为了当用户第二次请求CAS登入页面时候让这个用户不在需要输入用户名密码.第二个Cookie是当前网站应用用的Cookie,用于标示该用户已经在这个网站中登入了.

下面介绍一个常见的情景. 
用户直接先再CASLogin中登入,再到子应用网站中登入,同样的当在子应用中点击登入按钮时也会跳转到CASLogin当此时CASLogin从用户的Cookie得知已经登入了所以就立即返回ticket给子应用.

# UCenter的单点登入

![image2016-10-31 1-24-59](https://s1.ax1x.com/2017/12/28/zkN8O.png)





下面的这个script标签组的范例,图中可以看到有两个标签,能让客户的隐式地访问其他子应用并登入到其他子应用 

![image2016-10-31 1-25-11](https://s1.ax1x.com/2017/12/28/zkU2D.png)


# 参考资料

[细说SSO单点登录](http://www.cnblogs.com/yubaolee/p/sso.html) 
[采用CAS原理构建单点登录](http://www.cnblogs.com/shanyou/archive/2009/08/30/1556659.html) 
[深入研究 UCenter API](http://www.dozer.cc/2011/01/ucenter-api-in-depth-1st.html)

 

在配置CAS时,网站提示必须启用https,为此我花了近5个小时.最后被卡主的地方竟通过降低tomcat版本解决,原因至今不明.

之前对https仅仅是知道他通过应用层与传输层之间的SSL(做了传输层的工作但是处于应用层的)加密,用的是非对称加密,密钥由第三方提供.

经过https 的配置对其产生兴趣,于是开始研究计算机网络中的网络安全一章,量略多,没看完,先放加密部分.见文章尾部

# 分享

- [公众号推荐](https://github.com/jaywcjlove/handbook/blob/master/other/%E5%85%AC%E4%BC%97%E8%B4%A6%E5%8F%B7%E6%8E%A8%E8%8D%90.md#%E5%AE%98%E6%96%B9%E7%BD%91%E7%AB%99)
- [程序员如何提高效率之休息](http://mp.weixin.qq.com/s?__biz=MjM5Mjg4NDMwMA==&mid=2652974188&idx=1&sn=94557eb547551c2329d06395bd830de2&chksm=bd4aff4f8a3d765993ad4640d09eda855a90769e50bfc26bf43d90ae9b04b448e68144361556&scene=0#wechat_redirect)
- [coding在线IDE](https://ide.coding.net/dashboard),一个仓库开一个IDE至少要0.2个码币
- [另一个在线IDE](https://xuanwo.org/2014/08/07/Cloud9/)  注册过程很麻烦
- [免费https证书获取](https://letsencrypt.org/) 无限获取,每次只有3个月的有效期
- [Windows下的证书获取,内含自动获取及部署客户端使用教程](http://http//www.cnblogs.com/silin6/p/5931640.html)
- [从增删改查中突围](http://mp.weixin.qq.com/s?__biz=MzAxOTc0NzExNg==&mid=2665513356&idx=1&sn=3520fe896ad6c20e999458dfec1f3f3b&chksm=80d679cfb7a1f0d9421f558ba29077e59d31f89b76333fc75bf066816a262c6e7fb80e721ad6#rd)