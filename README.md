### yii2-admin

#### 介绍
基于X-admin和Yii2的后台管理系统，界面简洁、清新、美观，包含前台用户，后台用户，角色权限，菜单路由，登录日志，操作日志，系统设置模块，可以为您节省很多宝贵的开发时间。

#### 软件架构
X-admin + Yii2


#### 安装教程

1. 下载项目代码
2. 导入项目根目录下的sql文件，修改数据库配置
3. 配置域名指向/backend/web/目录下，并配置伪静态（可选，直接通过目录访问也是可以的）

#### 使用说明

1. 主菜单的图标来自于X-admin官方，如想自定义，可以修改主菜单处图标代码。
2. 操作日志默认不会记录"*/index"， "*/view"结尾的操作，即不记录展示和查看的相关操作。如需记录，可以修改公共控制器中的beforeAction方法，其中 allowUrl 数组配置不需要权限验证的路由， allowRoute 数组配置不需要记录日志的路由。
3. 整体结构为主菜单中包含子菜单，子菜单中包含子路由。
4. 节点的创建，要创建到子路由，只创建到主菜单和子菜单，会在登录后，菜单初始化时，被过滤掉。即一个主菜单下至少要有一个子菜单和一个子路由，否则不会显示出来的。
5. 每次配置角色权限后，需要清除一下缓存，角色菜单路由是存在缓存中的。


#### 界面展示
0. 我的桌面
![输入图片说明](https://images.gitee.com/uploads/images/2019/0701/090848_9e8071ba_1804453.png "desktop.png")
1. 会员管理
![输入图片说明](https://images.gitee.com/uploads/images/2019/0508/183045_dee76696_1804453.png "member.png")
2. 管理员管理
![输入图片说明](https://images.gitee.com/uploads/images/2019/0326/215740_db04503a_1804453.png "user.png")
3. 角色权限配置
![输入图片说明](https://images.gitee.com/uploads/images/2019/0326/214447_07c61eae_1804453.png "role.png")
4. 菜单路由管理
![输入图片说明](https://images.gitee.com/uploads/images/2019/0326/214602_9f537ecc_1804453.png "menu.png")
5. 子路由管理
![输入图片说明](https://images.gitee.com/uploads/images/2019/0326/214707_6686649f_1804453.png "route.png")
6. 登录日志
![输入图片说明](https://images.gitee.com/uploads/images/2019/0508/183108_21f4c652_1804453.png "login-log.png")
7. 操作日志
![输入图片说明](https://images.gitee.com/uploads/images/2019/0326/215551_34320f61_1804453.png "log.png")
8. 系统设置
![输入图片说明](https://images.gitee.com/uploads/images/2019/0326/215648_8d79791e_1804453.png "sys.png")


#### 鸣谢
特别感谢Layui, X-admin, Yii2。
