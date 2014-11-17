RESTful api service

- - -

# 基本信息
## 描述
该项目只有api，通过JSON数据与任意终端进行数据交互。没有session。
## 技术栈
* [NodeJS](http://nodejs.org) nodeJS是本项目基础
* [CoffeeScript](http://coffeescript.org/) 用于server端逻辑编程
* [mongoDB](http://mongodb.org) 使用mongoDB，可以直接使用JSON数据

## 安装
1. 首先请安装node (略)
2. 请安装coffeescript
```
npm install -g coffee-script
```
## 启动
启动需要首先启动mongoDB（略），然后执行
```
coffee server.coffee
```
## 目录和文件
结构如下
```
tree -I '.git|node*|*.js'
.
├── config.coffee
├── controllers
│   ├── topic.coffee
│   └── user.coffee
├── models
│   ├── comment.coffee
│   ├── stand.coffee
│   ├── topic.coffee
│   └── user.coffee
├── package.json
├── readme.md
├── routing.coffee
├── server.coffee
└── utils.coffee
```
入口文件是server.coffee，是服务的引导程序，主要是数据库连接和socket.IO初始化
controllers是直接的api，写法和格式直接copy其他的，请注意在传入对象的时候一定需要router和io，router是路由，io是socket.IO实例
models是mongoDB对象，需要增加可以直接copy已有的，使用者需要以相对路径require，即：
```
User = require "../models/user.coffee"
```
utils.coffee是常用静态方法的集合，用的时候require即可


# 代码编写
## 验证器
验证器使用了 (express-validator)[https://github.com/ctavan/express-validator],具体API请查询网站。
在Utils中抽象了发送错误信息的方法，使用方法如下
```
  router.post "/signup", (req, res)->
    user = new User()
    user.username = req.body.username
    user.from = 'native'
    # validator
    req.checkBody('username', 'Not null').notEmpty().isInt()
    Utils.validate req.validationErrors(), res, ()->
      res.send "ok", 201
```
传入validationErros(), response对象以及验证成功后的回调方法即可