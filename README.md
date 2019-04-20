# MYLIBRARY图书管理系统

[![License](https://img.shields.io/badge/SpringBoot-v1.5.17.RELEASE-green.svg)](https://github.com/luhailiang98/book)
[![License](https://img.shields.io/badge/Mybatis-v3.4.6-blue.svg)](https://github.com/luhailiang98/book)
[![License](https://img.shields.io/badge/AdminLTE-v2.4.10-blue.svg)](https://github.com/luhailiang98/book)
[![License](https://img.shields.io/badge/EasyUI-v1.7.5-green.svg)](https://github.com/luhailiang98/book)


MYLIBRARY图书管理系统 是基于Spring Boot + Mybatis 开发的图书管理系统, 系统具有用户管理、角色管理、应用管理、图书分类管理、图书信息管理、借书管理、还书管理、图书检索、借还记录等功能。

演示地址：[library.luhailiang.top](http://library.luhailiang.top/)

- 账号密码：管理员 admin-123456
- 账号密码：借阅者 luhailiang-123456



## 技术架构

#### 后端
- 基础框架：Spring Boot 1.5.17.RELEASE

- 持久层框架：Mybatis 3.4.6

- 数据库连接池：Druid 1.1.10

- 模板引擎：jsp

- 其他：gson，guava，lombok（简化代码）等。


#### 前端
- 基于Bootstrap的前端框架：[AdminLTE](https://adminlte.io/)

- 数据表格及其他组件：[EasyUI](http://www.jeasyui.com/)

- 弹出层插件：[Layer](http://layer.layui.com/)

- 树插件：[zTree](http://www.treejs.cn/v3/main.php#_zTreeInfo)

- 富文本编辑器：[CKEditor 4](https://ckeditor.com/)

- 手势验证码：[VAPTCHA](https://www.vaptcha.com/)


#### 开发环境

- JDK：1.8

- 开发工具：IDEA

- 数据库：MySQL5.7


## 功能模块
```
├─系统管理
│  ├─用户管理
│  ├─角色管理
│  ├─应用管理
├─图书管理
│  ├─图书分类管理
│  ├─图书信息管理
│  ├─借书管理
│  ├─还书管理
│─借阅者
│  ├─图书检索
│  └─借还记录
└─其他模块
   └─更多功能开发中。。。 
```

## 系统效果
### 系统登录页
![](https://ws1.sinaimg.cn/large/aeead39fly1g29egyiqa3j228017uhdu.jpg)
### 管理员
#### 用户管理
![](https://ws1.sinaimg.cn/large/aeead39fly1g29ehtpqoej228017uk1c.jpg)
#### 角色管理
![](https://ws1.sinaimg.cn/large/aeead39fly1g29eitu0haj228017uwn6.jpg)
#### 应用管理
![](https://ws1.sinaimg.cn/large/aeead39fly1g29ejewym5j228017salf.jpg)
#### 图书分类管理
![](https://ws1.sinaimg.cn/large/aeead39fly1g29ejy46mkj228017salm.jpg)
#### 图书信息管理
![](https://ws1.sinaimg.cn/large/aeead39fly1g29ekabr34j228017odsy.jpg)
#### 借书管理
![](https://ws1.sinaimg.cn/large/aeead39fly1g29f7csvb8j228017ojxy.jpg)
#### 还书管理
![](https://ws1.sinaimg.cn/large/aeead39fly1g29el2wsxkj228017otew.jpg)


### 借阅者
#### 图书检索
![](https://ws1.sinaimg.cn/large/aeead39fly1g29elz9yc3j228017w7gs.jpg)

#### 借还记录
![](https://ws1.sinaimg.cn/large/aeead39fly1g29emhrkh4j228017sn40.jpg)