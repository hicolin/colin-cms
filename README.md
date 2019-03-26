### Colin CMS

#### 介绍
基于Xadmin和Yii2的开源后台管理系统，包含前台用户，后台用户，角色权限，菜单路由，登录日志，操作日志，系统设置模块，可以为您省去很多宝贵的开发时间。

#### 软件架构
Xadmin + Yii2


#### 安装教程

1. 下载项目代码
2. 导入项目根目录下的sql文件
3. 配置域名指向/backend/web/目录下

#### 使用说明

1. 主菜单的图标来自于Xadmin官方，如想自定义，可以修改主菜单出图标代码
2. 操作日志默认不会记录"*/index"， "*/view"结尾的操作，即不记录展示和查看的相关操作。如需记录，可以修改公共控制器中的beforeAction方法，其中 $allowUrl 数组配置不需要权限验证的路由， $allowRoute 数组配置不需要记录日志的路由。
3. 整体结构为主菜单中包含子菜单，子菜单中包含子路由。

#### 界面展示

1. 会员管理
![输入图片说明](https://images.gitee.com/uploads/images/2019/0326/214227_7649c480_1804453.png "member-list.png")
2. 管理员管理
![输入图片说明](https://images.gitee.com/uploads/images/2019/0326/215740_db04503a_1804453.png "user.png")
3. 角色权限配置
![输入图片说明](https://images.gitee.com/uploads/images/2019/0326/214447_07c61eae_1804453.png "role.png")
4. 菜单路由管理
![输入图片说明](https://images.gitee.com/uploads/images/2019/0326/214602_9f537ecc_1804453.png "menu.png")
5. 子路由管理
![输入图片说明](https://images.gitee.com/uploads/images/2019/0326/214707_6686649f_1804453.png "route.png")
6. 登录日志
![输入图片说明](https://images.gitee.com/uploads/images/2019/0326/215042_2ad6bfb8_1804453.png "login.png")
7. 操作日志
![输入图片说明](https://images.gitee.com/uploads/images/2019/0326/215551_34320f61_1804453.png "log.png")
8. 系统设置
![输入图片说明](https://images.gitee.com/uploads/images/2019/0326/215648_8d79791e_1804453.png "sys.png")
