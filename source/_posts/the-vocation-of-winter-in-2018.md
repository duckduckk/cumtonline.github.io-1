## Django2.1+python3.6+xadmin2.0==在线学习平台
> 创建虚拟环境，安装依赖

## django app设计
> user-用户管理
> courses-课程管理
> organization-机构和教师管理
> operation-用户操作管理

### 数据库
> mysql USER:root
> PASSWORD:Ljp.0123668

### 解决数据库连接问题
> import pymysql
> pymysql.install_as_MySQLdb()
## app models设计
> user models.py编写
-- 自定义userprofile覆盖默认user表
-- EmailVerifyRecord-邮箱验证码
-- PageBanner-轮播图

> Courses models.py编写
-- Courses-基本课程信息
-- Lesson-章节信息
-- Video-视频
-- CoursesResource

> organization models.py编写
-- CourseOrg-课程机构基本信息
-- Teacher-教师基本信息
-- CityDict-城市信息

> operation models.py编写
-- UserAsk-用户咨询
-- CourseComments-用户评论
-- UserFavorite-用户收藏
-- UserMessage-用户消息
-- UserCourse-用户学习的课程

### 解决循环import问题
> 编写operation models.py 解决问题

## 数据表生成
> makemigrations
> migrate

### 后台管理系统
> 权限管理
> 少前端样式 
> 快速开发
> 使用xadmin时，先pip install xadmin(安装依赖),然后启动在settings, urls中配置,
> 把源码放进项目中新建extra_apps并标记为来源根, 然后pip uninstall xadmin, 后台便成功配置

### 注册apps
> createsuperuser--创建超级用户
> 新建adminx.py, 创建类(SimpleAdmin), xadmin.site.register(Simple, SimpleAdmin)
> 配置xadmin, BaseSetting--enable, use_bootswatch; GlobalSettings--site_title, site_footer, menu_style

### 后台Admin添加用户信息出现问题
--- (1452, 'Cannot add or update a child row: a foreign key constraint fails (`mxproject`.`django_admin_log`, CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`))')

--- 解决办法
> 在setting文件的databases中添加以下代码取消外键检查
> 'OPTIONS':{"init_command":"SET foreign_key_checks = 0;",}


## 编写业务逻辑
+ 用户登陆注册views编写, LoginView以及forms.py中django中login_form的应用
> LoginView中首先form验证，然后进行username和password的验证，并跳转到相应界面

+ seesion和cookie自动登录机制
>  user:请求1-->服务器
> 服务器分配id=1-->user
> 请求2带上cookie中id=1-->服务器
> 服务器看到id=1,取出1的信息
> seesion由服务器生成,cookie由浏览器生成



