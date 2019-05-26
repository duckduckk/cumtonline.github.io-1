---
title: 学生在线科普文
date: 2018-09-05 21:00:26
tags: 学生在线
---

这篇文章打算详细的介绍我们到底是什么团队？主要针对每届的新生。

如果你想有个大致的了解，可以移步这个链接：[https://atcumt.com](https://atcumt.com)

# 首先我们以后退休了能干什么？

仅仅以最近的2014和2015届目前已知为例：

- 工作室某汤研究生放弃京东offer加入北京外企汤森路透

- 工作室某谢学长加入小米公司

- 工作室某游学长加入美团公司

- 工作室某包学长加入苏州安全公司通付盾，年薪20w+

- 工作室某肖学长加入作业帮公司

- 工作室某黄学长加入今日头条公司(曾由于工作不合适放弃阿里巴巴)

- 工作室某李学长加入百度公司(现已离职)！


还有很多老学长和鲜肉大佬没有介绍~

>同时，加入工作室，你也获得了很多互联网巨头的内推机会！！！！
有很多往届老学长遍布各个互联网公司

**下面我们来介绍加入我们你能获得什么？**

>新生们最疑惑的应该是技术组的分类，我们先从技术组说起，然后穿插其他组的解释
计算机技术常见的编程语言有C++,C,Python,Java,PHP,Golang,C#等~
应该也有很多人听说过标记性语言HTML，CSS，脚本语言JavaScript,Perl
(Python严格意义上来说应该算作编程语言更合适,JS现在也能走向后端，当然纠结这个不应该是我们关心的重点)
重点来了！
PS：以下解释可能有点局限于Web开发领域

贴下工作室技术组下届计划:[中国矿业大学学生在线技术组初步计划](https://cumtflyingstudio.github.io/flyingstudio/)

# 前端组

前端组平常也是编程工作，它接触到的是什么样的代码呢？HTML,CSS,JS
如果你在电脑旁，你可以打开一个网页，按键F12或者右键查看源代码，如下图所示：很直观的HTML代码

```html
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>学生在线</title>
    <meta name="keywords" content="中国矿业大学，学生在线，翔工作室"/>
    <meta name="description" content="中国矿业大学学生在线招新"/>
    <link rel="icon" href="static/ico/flyingstudio.ico" type="image/x-icon" />
    <link rel="stylesheet" href="static/css/public.css">
</head>

<body>
    <!-- 导航栏 -->
    <header id="header">
        <div class="header-back"></div>
        <div class="center">
            <div class="header_logo">
                <a href="#">
					<img src="static/ico/logo.png" alt="" class="logo">
				</a>
                <a href="#">
					<img src="static/ico/banner-m-logo.png" alt="" class="mlogo">
				</a>
省略....
    <!-- 注脚 -->
    <script src="https://cdn.bootcss.com/jquery/1.10.1/jquery.js"></script>
    <script src="static/js/header.js"></script>
    <script src="static/js/slider.js"></script>
    <script src="static/js/department.js"></script>
    <script src="static/js/shareurls.js"></script>
```

>你可能也注意到了static/css/public.css这个网页像是导入了某路径的文件，你可以点击进去，可以发现下面这样奇奇怪怪的东西，那个就叫做CSS

```css
body,
html
{
    min-width: 1200px;
}
a
{
    text-decoration: none;
}
.center
{
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;

    overflow: hidden;

    width: 1200px;
    margin: 0 auto;
}
```

>再回到HTML段的代码，你可能也注意结尾处static/js/shareurls.js，类似CSS，你可以点击进去，可以发现第二段奇奇怪怪的东西，那个就叫做JS

```js
var new_scroll_position = 0;
var last_scroll_position;
var header = document.getElementById("header");
var btn_joinus = document.getElementById("btn-joinus");
var headerabtn = document.getElementById("header-abtn");
var headerul = document.getElementById("headerurls");

headerabtn.onclick= function(){showurls();}
headerul.onclick= function(){showurls();}

function showurls(){
  if(headerul.className=="headerurls")
    headerul.className += " header-show";
  else
    headerul.className = "headerurls";
}

```

>到此为止，上面的三个奇奇怪怪的东西就组成了我们平常上网最常见的网页，这些东西组成了网站的前端
不过值得注意的是这些代码都是静态的，写“死”的，可能这样比喻有些不太恰当,这个静态是相对于后端语言来说的。后边我们会详细介绍后端代码如何是动态的？
编写他们的人员叫做前端工程师。学会这个，你可以做什么呢？
你可以编写自己的博客网页，你可以做自己喜欢的网页动画(css,js是可以编写动画效果的，具体也可以自己百度)
微信小程序前端也是这么来的！
最后提醒，前端虽然只有这三个基本组成，但是如果深入学习，还有更深的海洋世界~

# 后端组

>刚才已经提到前端组是静态的，后端组是动态的，为什么呢？
因为前端组是不可以和数据库交互的(暂时不考虑JS可以写后端.....),数据库是什么呢？

数据库：比如我们登陆一个网站，我们的用户名，密码，个人信息，发表的说说，这些都是保存到数据库里的

>从上面的解释我们能大概知道，数据库里的用户名，个人信息，我们可能需要更新，数据就发生了变化
这个变化就需要后端语言来进行读取并"发送"给前端，前端接收后，静态的展示给正在刷手机的你~
也就是后端动态的变化某些数据来和前端交互，进行完整网站的组成
后端有哪些语言呢？你应该听说过Java,Python,PHP,JS,这些都可以当作后端语言使用
下面截取atcumt.com后端部分代码做展示，使用的是Python语言
应该能容易看出这是进行用户密码的一个验证

```python
# 登录验证部分
@auth.verify_password
def verify_password(name_or_token, password):
    if not name_or_token:
        return False
    name_or_token = re.sub(r'^"|"$', '', name_or_token)
    admin = Admin.verify_auth_token(name_or_token)
    if not admin:
        admin = Admin.query.filter_by(name=name_or_token).first()
        if not admin or not admin.verify_password(password):
            return False
    g.admin = admin
    return True
```

>你以为会了这些就结束了？不不不。。。。。
后端语言种类复杂，Web框架也多种多样，而且后端语言的运行需要某些特殊的环境，我们需要在我们的服务器上进行配置

服务器：就是存放我们网站以便别人能够自由访问

>也就是网站部署阶段，在工作室也是后端人员的必备技能
学会Nginx，Docker,Linux操作是必要的~
具体的详细解释就自由搜索下吧


# 移动组

>刚才已经说了，前端后端组成了网站部分，那移动。。。还做什么？
首先你要分清网站就是你要在浏览器或者某个内置浏览器输入Url进行访问的~
不要忘了你手机里最多的东西哦=====APP
移动组就是制作这些APP，使用的语言一般是Java

来展示段代码看看Java的样子~
(会不会有人疑问，为什么这三个组我满眼看到的都是奇奇怪怪的东西......所以程序猿头发少啊。。。。。。)

```Java
package com.example.xingy.meizi;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v4.app.Fragment;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.view.MenuItem;

import com.example.xingy.meizi.Adapt.FragAdapter;
import com.example.xingy.meizi.FragmentPager.FragmentPager1;
import com.example.xingy.meizi.FragmentPager.FragmentPager2;
import com.example.xingy.meizi.FragmentPager.FragmentPager3;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {
    private ViewPager viewPager;
    private MenuItem menuItem;
    BottomNavigationView navigation ;
    private BottomNavigationView.OnNavigationItemSelectedListener mOnNavigationItemSelectedListener
            = new BottomNavigationView.OnNavigationItemSelectedListener() {

        @Override
        public boolean onNavigationItemSelected(@NonNull MenuItem item) {
            switch (item.getItemId()) {
                case R.id.navigation_home:
                    viewPager.setCurrentItem(0,true);
                    return true;
                case R.id.navigation_dashboard:
                    viewPager.setCurrentItem(1,true);
                    //mTextMessage.setText(R.string.title_dashboard);
                    return true;
                case R.id.navigation_notifications:
                    viewPager.setCurrentItem(2,true);
                    //mTextMessage.setText(R.string.title_notifications);
                    return true;
            }
            return false;
        }

    };
```

>当然APP也需要前端界面，来展示某些控件，即按钮，图片等

# 视觉组

前面说了这么多网站的事情，你们有没有这样一个问题？
我发现有的网站页面超级好看，天呐！真的超好看呀~
没错，前端页面的样式，各个部分的布局，以及图片设计成什么样子都是视觉组来做的

>所以一般视觉组的人员都是很有艺术气息的人,设计副站是个艺术气息浓重的萌妹子~~


[https://atcumt.com](https://atcumt.com)页面就是视觉组设计的哦！
你们平常见到的招新海报，也都是出自他们之手
来张作品赏赏眼吧

![9bDHkq.jpg](https://s1.ax1x.com/2018/03/23/9bDHkq.jpg)

# 运营组

>页面设计好了，代码也写好了。下一步该宣传了！
下面就要我们的运营组上场了，宣传我们的最新产品，宣传我们的团队，给我们的网站提出自己的想法
管理QQ，微信公众号这些工作都是由运营组的小伙伴来做。

这里能学到什么？在互联网公司是有运营人员的，他们和我们工作室运营所做的工作是差不多的
在这里你学到的经验，在公司里也是可以适用的！

# 视频组

>Pr，AE这些软件你会用嘛？
我们招新宣传视频谁来做？我们产品宣传视频谁来做？

没错，是视频组，顾名思义，视频组就是在不断地鼓捣各种有意思的视频
摄影技术，视频剪辑技术也是一项很强的能力！
目前小组里都是思维活跃，脑洞打开的小伙伴~

来波矿大延时摄影吧： 

<iframe width="400" height="400" align="middle" frameborder="0" src="https://v.qq.com/txp/iframe/player.html?vid=j03306ej9m1" allowFullScreen="true"></iframe>

# 办公组

最后就是我们的办公组了，办公组是干什么呢？
值班，值日，工资表......这些工作看似简单，却是我们学生在线极其重要的一环，如果你熟悉office，那么成为办公组的一员将不再是梦想！
这个组可是掌握着每个成员的生死，权力了得~

# 易班组

易班网是高校教育教学，生活服务，文化娱乐的综合性互动社区
矿大易班总后台的管理，学院各个易班工作室任务安排，易班大厅值班
以及为同学解答易班使用问题就是易班小伙伴的任务
当然，在这样一个互联网氛围的团队，你如果想学习易班相关网站的制作是很方便的
只要你肯努力～

# 彩蛋

>对于很多人不了解编程包括什么？
就矿大目前的情况，这里大致写一下！
(难免有错误请联系改正！)

计算机学院大一就会学习C++基础课程，然后很多人便走向了ACM的道路
这是第一种选择，ACM是干什么的呢？
简单来说就是深入研究各种编程算法，然后来应对各种比赛出的题目。
当然这里需要提一下的是，学习计算机的人才，算法是必修课，无论什么领域，算法肯定是要接触的
只是某些领域研究的比较深，比如算法工程师，机器学习(下面会提到它)
当然做Web开发也是需要算法知识的，以便于简化网站逻辑流程等

>然后，部分同学也会选择信息安全专业，学院也有相应的CTF战队。
信息安全是干嘛的呢？说白点就是黑客，或者称作红客
看过各种电影吧。ennn,和电影里演的不一样。。。。。。。
比如我们工作室做了某个网站，事情都是双面性的，信息安全就是找出网站的漏洞
来正确的报告给网站维护人员，或者是破解某个软件
这就是信息安全，不过，虽然确实很高大上，但是每个方向都不是容易的
不好好努力，信息安全方向很可能最后变成了脚本小子。

其次就是学校新开的人工智能大数据专业，这是最近新型的一个方向
做大数据也需要我们具备编程语言的知识，目前一般使用Python或者Java来进行大数据挖掘和分析
至于机器学习，一般在研究生阶段进行研究，学会了开发网站的Python也是可以学习机器学习的
目前机器学习领域主要使用Python语言，还需要具备高数，概率论，线代等数学知识

>从上面你可能发现，不论选哪个方向都需要我们具备某种或者某些语言的知识
同时，无论哪个方向，不努力或者不感兴趣，你都很难坚持下去！
还是很欢迎你能加入我们~
最后放张合照。嘻嘻嘻~~~~

![i9Mi6K.jpg](https://s1.ax1x.com/2018/09/05/i9Mi6K.jpg)
