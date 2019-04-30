---
title: 第11-12周总结
date: 2016-12-16 21:29:43
tags: [Git,Typora]
category: Web技术交流群
---

# Git

## 加快git clone速度的方法

![getImage](https://s1.ax1x.com/2017/12/28/zCmXn.png)



## 一张图展示所有Git命令

![QQ图片20161216213304](https://s1.ax1x.com/2017/12/28/zCe6s.jpg)



# Markdown编辑器推荐

[typora](http://www.typora.io/)

- 跨平台
- 免费
- 出色的编辑体验



图片插入是大部分Markdown编辑器的问题,某些笔记软件借助自身的存储功能轻松的解决这个问题。但原生的Markdown却是相当麻烦。目前有的解决方案为

- 使用图床，把图片放到云存储（比如七牛云），生成链接再插入Markdown中，有人也写了相关插件，就连QQ截图都能自动保存到云存储中，Ctrl+V就直接是图片链接地址
- 把图片转换成base64，虽然可行，做到了图片与文档一体，但是个相当蹩脚的方法，不仅文本变得冗长，有时编辑器若不给力也会卡出翔。

Typora不提供云存储，但是他尽可能地简化了插入步骤

- 拖拽式

  ![drag-img](https://s1.ax1x.com/2017/12/28/zCK00.gif)

- 截图式

  ![1](https://s1.ax1x.com/2017/12/28/zCM7V.gif)



不管是拖拽式还是截图式生成的路径默认是绝对路径

如果想用相对路径请在Preference设置`Use relative path if possible`

![1482037425302](https://s1.ax1x.com/2017/12/28/zCumq.png)

如果想用截图式,**必须**勾选上图的第二项,**并且**在每次编辑时设置一个文件路径,这个文件路径告诉Typora要把剪贴板中的图片保存到哪里,Windows版的设置选项在Edit->Image Tool->When insert local image->Copy Image File to Folder->选择文件夹



# Typora与Hexo

Hexo3提供`{% asset_img slug [title] %}` 模板语法用于生成图片,但这显然不是我们想要的,我们想"所见即所得",如何在使用普通的Markdown模式下同时能保证博客的正确生成?



药方在这

- https://github.com/CodeFalling/hexo-asset-image

很简单的插件,代码不足50行。

根据README安装插件，并配置`post_asset_folder` 。

他会如他所描述的

```
MacGesture2-Publish
├── apppicker.jpg
├── logo.jpg
└── rules.jpg
MacGesture2-Publish.md
```

把`![logo](logo.jpg)` 渲染成 正确的路径

但这与Typora的风格不一致。

Typora使用传统的Markdown，对于资源文件夹下的图片要求以这种形式`![图片标题](以文章名命名的资源文件夹\图片.jpg)`才能正常在Typora中预览。

所以下面就简单的改写这份插件



打开`你的博客站点文件夹\node_modules\hexo-asset-image\index.js`

从第25行开始修改成这样(其实就把下面的第10行注释掉,改成5~9)

``` javascript
$('img').each(function(){
  var src = $(this).attr('src');
  if(!/http[s]*.*|\/\/.*/.test(src)){
    // is a local file in post_asset_folder
    if (src.indexOf('\\')!=-1){//用于windows
      src = src.split("\\").pop();  
    }else{
      src = src.split("/").pop();	
    }
    //src = src.split("/").pop();
    $(this).attr('src', '/' + link + src);
  }
});
data[key] = $.html();
}
```



重新生成博客,并预览

# 分享

- [PostMan自动化测试](https://testerhome.com/topics/6555)
- [网页设计巅峰之作](https://zhuanlan.zhihu.com/p/24083839)
- [图床,时效性未知,安全性未知](https://sm.ms)
- [Unicode字符](https://unicode-table.com/en/#control-character)
- [一天精通Chrome调试](https://gold.xitu.io/entry/584779bc128fe1006c5dcc1a)
- [Python爬虫实战项目](https://gold.xitu.io/entry/58469472ac502e006b098cc9)
- [设计师与程序猿的10个站点收集](https://gold.xitu.io/entry/58493e8b0ce463005c47743f)
- [如何写好一篇技术博客](https://blog.souche.com/zhong-xue-sheng-jiao-ni-ru-he-xie-hao-yi-pian-ji-zhu-bo-ke/)    
- [一个程序员的顿悟：理想的程序员只比你多了6个一点点](https://buluo.qq.com/p/detail.html?bid=314687&pid=3951568-1481348739&from=grp_sub_obj)
- [湾区日报是如何运作的](https://wanqu.co/b/7/2015-05-24-behind-the-scenes.html?s=about&redirect=1)
- [分享一些自我提升的秘笈网站 by 逻辑炸了](http://www.jianshu.com/p/81520ae118ad)
- [Service Worker, 你到底是个什么东西](http://mp.weixin.qq.com/s?__biz=MjM5MTA1MjAxMQ==&mid=2651224563&idx=1&sn=034a7d7b55055cfd754488e280977afc&chksm=bd49a0778a3e2961806e51d21a5e5d746f03f64ce760e8e6514bb277fa015b296602c9ff59e0&mpshare=1&scene=23&srcid=1214pg6ybR3Acza3XKGQKaZn#rd)
- [正确的坐姿](https://www.zhihu.com/question/23238816/answer/135234635?group_id=791055958888583168)
- [前端程序猿需不需要学Linux](http://www.zhihu.com/question/20914951/answer/16595774)
- [免费PHP空间](http://hostinger.com.hk)





