---
title: 第6-7周总结
date: 2016-11-14  20:36:37
tags: 单元测试
category: Web技术交流群
---

# 测试

****

## 单元测试

简单地说用代码测试代码

每种语言都有自己的测试框架,功能大同小异



C#中的单元测试

单元测试往往会配合一些工具使用,VS就内置了C#测试的工具

1.创建一个工程,和一个(类库/包)项目

![image2016-11-14 13-11-2](https://s1.ax1x.com/2017/12/28/zkGUx.png)

2.写一个简单的方法

``` csharp
namespace TestObject
{
  public class FirstObject
  {
    public int Sum(int a,int b)
    {
        return a + b;
    }
  }
}
```



3.编写测试代码

不用的语言用的测试框架,测试工具不同

下面被TestMethod标记的方法则是测试方法,VS的测试工具(测试资源管理器)会自动扫描你写的带TestMethod的代码并显示出来

![image2016-11-14 13-12-27](https://s1.ax1x.com/2017/12/28/zkmCT.png)

![image2016-11-14 13-16-42](https://s1.ax1x.com/2017/12/28/zkEEq.png)

``` csharp
[TestClass()]
public class FirstObjectTests
{
  [TestMethod()]
  public void SumTest()
  {
    FirstObject obj = new FirstObject();
    int num1 = 2;
    int num2 = 3;
     //断言,obj.Sum的返回值是等于5,否则就测试失败
     Assert.AreEqual(5,obj.Sum(num1, num2));
     }
  }
}
```





可以通过VS的工具来执行一个或多个的测试

![image2016-11-14 13-18-16](https://s1.ax1x.com/2017/12/28/zkZ5V.png)



4. 测试结果

![image2016-11-14 13-18-31](https://s1.ax1x.com/2017/12/28/zkVU0.png)


测试框架中有专门的代码用于测试,比如上面的Assert类,该类除了断言相当还有

看名字就知道什么意思

| **方法**                                   | **描述**            |
| ---------------------------------------- | ----------------- |
| AreEqual(T,T) AreEqual(T,T,string)       | 断言两个类型T的对象有相同的值   |
| AreNotEqual(T,T) AreNotEqual(T,T,string) | 断言两个类型T的对象的值不相等   |
| AreSame(T,T) AreSame(T,T,string)         | 断言两个变量指向相同的对象     |
| AreNotSame(T,T) AreNotSame(T,T,string)   | 断言两个变量指向不同的对象     |
| Fail() Fail(string)                      | 失败断言 －无条件检查       |
| Inconclusive() Inconclusive(string)      | 指示最终不能建立单元测试的结果   |
| IsTrue(bool) IsTrue(bool,string)         | 断言一个返回结果的值为True   |
| IsFalse(bool) IsFalse(bool,string)       | 断言一个返回结果的值为false  |
| IsNull(object) IsNull(object,string)     | 断言一个变量未被分配一个对象的引用 |

 

下面是从其他地方抄过来的一段话

 

> ### 1.单元测试的好处
>
> （1）单元测试帮助设计
>
> 单元测试迫使我们从关注实现转向关注接口，编写单元测试的过程就是设计接口的过程，使单元测试通过的过程是我们编写实现的过程。我一直觉得这是单元测试最重要的好处，让我们关注的重点放在接口上而非实现的细节。
>
> （2）单元测试帮助编码
>
> 应用单元测试会**使我们主动消除和减少不必要的耦合**，虽然出发点可能是为了更方便的完成单元测试，但结果通常是类型的职责更加内聚，类型间的耦合显著降低。这是已知的提升编码质量的有效手段，也是提升开发人员编码水平的有效手段。
>
> （3）单元测试帮助调试
>
> 应用了单元测试的代码在调试时**可以快速定位问题的出处**。
>
> （4）单元测试**帮助重构**
>
> 对于现有项目的重构，从编写单元测试开始是更好的选择。先从局部代码进行重构，提取接口进行单元测试，然后再进行类型和层次级别的重构。
>
> 单元测试在设计、编码和调试上的作用足以使其成为软件开发相关人员的必备技能。

 

[为什么要单元测试](https://www.zhihu.com/question/20120168)

[怎么单元测试](https://www.zhihu.com/question/27313846)

## 网站压力测试

**WebTest特性质量开发平台**

**(个人认为最好用的)**

- 支持服务器测试和App测试,
- 服务器压力测试操作简单,看完文档就会(建议全看完)
- 最高支持30000并发测试 (测试时请关闭DDos防御机制,因为测试机器人都是同一个IP一定会被监测到的)
- 支持配置测试场景



**测试场景**

一个网站不止一个页面,进行压力测试也不能局限于一个页面.为了尽可能模拟真实的用户使用,应配置多个页面的请求动作,

比如登入场景:

- xxx.com/login
- xxx.com/userindex

配置这个场景后,机器人就能按这个顺序访问网站,注意网站一般通过cookie来识别用户是否登入,如果没有这个cookie访问第二个链接则可能够会自动跳转到登入页,所以在第二个请求中要加上这个cookie(你可以先手动到网站上登入后获得这个cookie).

一个测试能配置多个场景,多个场景能配置访问量的比例

 

****

**其他测试工具**

官方地址[http://www.ikende.com/httptest](http://www.ikende.com/httptest)

其实就是一个简单地自动请求url的工具,不需要写任何代码,只要是windows系统装了.Net Framework就能使用,操作简单,功能少.

[阿里性能测试服务](https://pts.aliyun.com/lite/index.htm?spm=5176.2020520153.0.0.5wrV7N)

使用这个测试要在服务器上额外安装东西,所以我就没用

# 分享

 

[前端](http://gold.xitu.io/entry/581fea735bbb500059ebfb2b)[新手能看的网站](http://gold.xitu.io/entry/581fea735bbb500059ebfb2b)

[前端教程与工具](http://wiki.flyingstudio.online/blog.thankbabe.com/collection/?hmsr=toutiao.io&utm_medium=toutiao.io&utm_source=toutiao.io)

[中文OJ LintCode](http://www.lintcode.com/zh-cn)

[在线全栈学习网站](https://www.freecodecamp.cn/)

[程序猿绘图工具](http://www.draw.io/)

[汇智网](http://www.hubwiz.com/) 类似实验楼,个人觉得很好用