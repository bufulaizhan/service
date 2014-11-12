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