<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="200" alt="Nest Logo" /></a>
</p>

[circleci-image]: https://img.shields.io/circleci/build/github/nestjs/nest/master?token=abc123def456
[circleci-url]: https://circleci.com/gh/nestjs/nest

  <p align="center">A progressive <a href="http://nodejs.org" target="_blank">Node.js</a> framework for building efficient and scalable server-side applications.</p>
    <p align="center">
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/v/@nestjs/core.svg" alt="NPM Version" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/l/@nestjs/core.svg" alt="Package License" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/dm/@nestjs/common.svg" alt="NPM Downloads" /></a>
<a href="https://circleci.com/gh/nestjs/nest" target="_blank"><img src="https://img.shields.io/circleci/build/github/nestjs/nest/master" alt="CircleCI" /></a>
<a href="https://coveralls.io/github/nestjs/nest?branch=master" target="_blank"><img src="https://coveralls.io/repos/github/nestjs/nest/badge.svg?branch=master#9" alt="Coverage" /></a>
<a href="https://discord.gg/G7Qnnhy" target="_blank"><img src="https://img.shields.io/badge/discord-online-brightgreen.svg" alt="Discord"/></a>
<a href="https://opencollective.com/nest#backer" target="_blank"><img src="https://opencollective.com/nest/backers/badge.svg" alt="Backers on Open Collective" /></a>
<a href="https://opencollective.com/nest#sponsor" target="_blank"><img src="https://opencollective.com/nest/sponsors/badge.svg" alt="Sponsors on Open Collective" /></a>
  <a href="https://paypal.me/kamilmysliwiec" target="_blank"><img src="https://img.shields.io/badge/Donate-PayPal-ff3f59.svg"/></a>
    <a href="https://opencollective.com/nest#sponsor"  target="_blank"><img src="https://img.shields.io/badge/Support%20us-Open%20Collective-41B883.svg" alt="Support us"></a>
  <a href="https://twitter.com/nestframework" target="_blank"><img src="https://img.shields.io/twitter/follow/nestframework.svg?style=social&label=Follow"></a>
</p>
  <!--[![Backers on Open Collective](https://opencollective.com/nest/backers/badge.svg)](https://opencollective.com/nest#backer)
  [![Sponsors on Open Collective](https://opencollective.com/nest/sponsors/badge.svg)](https://opencollective.com/nest#sponsor)-->

## Description

[Nest](https://github.com/nestjs/nest) framework TypeScript starter repository.

## Installation

```bash
$ npm install
```

## Running the app

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```
详细文档请看document/Nest.js 从零到壹系列 --- Liar出品.pdf,demo是对《Nest.js 从零到壹系列 --- Liar出品.pdf》的内容进行验证
## 三、新增模块
通过上文，应该熟悉了 NestJS 的设计模式，主要就是 Controller 、 Service 、 Module 共同努力，形成了一个模块。
- `Controller` : 传统意义上的控制器，提供 api 接口，负责处理路由、中转、验证等一些简洁 的业务；
- `Service`: 又称为 `Provider`， 是一系列服务、repo、工厂方法、helper 的总称，主要 负责处理具体的业务，如数据库的增删改查、事务、并发等逻辑代码；
- `Module`: 负责将 `Controller` 和 `Service` 连接起来，类似于 `namespace` 的概念；

使用 nest-cli 提供的指令可以快速创建文件，语法如下：
```cmd
$ nest g [文件类型] [文件名] [文件目录（src目录下）]
```
### 1. Service
我们输入：
```cmd
 $ nest g service user logical
```
就会发现 src 目录下多了 logical/user/ 文件夹（个人喜欢将业务逻辑相关的文件放入 logical）
### 2. Controller
现在，我们来写控制器，输入下列命令：
```cmd
$ nest g controller user logical
```
### 3. Module
```cmd
$ nest g module user logical
```
```sql
CREATE TABLE `admin_user` (
  `user_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `account_name` varchar(24) NOT NULL COMMENT '用户账号',
  `real_name` varchar(20) NOT NULL COMMENT '真实姓名',
  `password` char(32) NOT NULL COMMENT '密码',
  `password_salt` char(6) NOT NULL COMMENT '密码盐',
  `mobile` varchar(15) NOT NULL DEFAULT '0' COMMENT '手机号码',
  `role` tinyint(4) NOT NULL DEFAULT '3' COMMENT '用户角色：0-超级管理员|1-管理 员|2-开发&测试&运营|3-普通用户（只能查看）',
  `user_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0-失效|1-有效|2-删 除',
  `create_by` smallint(6) NOT NULL COMMENT '创建人ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` smallint(6) NOT NULL DEFAULT '0' COMMENT '修改人ID',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`user_id`), KEY `idx_m` (`mobile`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='后台用户表';
```
市面上有很多连接数据库的工具，笔者这里使用的是 Sequelize ，先安装依赖包：
```cmd
$ npm i sequelize sequelize-typescript mysql2 -S
或
$ yarn add sequelize sequelize-typescript mysql2 -S
```

## 三、JWT 的配置与验证
### 1. 安装依赖包
```cmd
$ yarn add passport passport-jwt passport-local @nestjs/passport @nestjs/jwt -S
```

### 创建 Auth 模块
```cmd
$ nest g service auth logical
$ nest g module auth logical
```
## 使用中间件、拦截器、过 滤器打造日志系统
### 日志系统

```cmd
$ yarn add log4js stacktrace-js -S
```
### 制作中间件
```cmd
$ nest g middleware logger middleware
```
### 初探拦截器

```cmd
$ nest g interceptor transform interceptor
```
### 初探过滤器

```cmd
 $ nest g filter http-exception filter
```
### 其他错误的捕获
```cmd
$ nest g filter any-exception filter
```
## 管道
### 2. 创建管道
```cmd
$ nest g pipe validation pipe
```
```cmd
$ yarn add class-validator class-transformer -S
```
## RBAC

RBAC：基于角色的权限访问控制（Role-Based Access Control），是商业系统中最常见的权限管 理技术之一。在 RBAC 中，权限与角色相关联，用户通过成为适当角色的成员而得到这些角色的权 限。

### 拦截器逻辑编写
还记得第三篇签发 Token 的时候，有个 role 字段么？那个就是用户角色，下面我们针对 Token 的 role 字段进行展开。先新建文件：
```cmd
$ nest g interceptor rbac interceptor
```

```SQL
CREATE TABLE `commodity` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
	`ccolumn_id` smallint(6) NOT NULL COMMENT '商品_栏目ID',
	`commodity_name` varchar(10) NOT NULL COMMENT '商品_名称',
	`commodity_desc` varchar(20) NOT NULL COMMENT '商品_介绍',
	`market_price` decimal(7,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
	`sale_money` decimal(7,2) NOT NULL DEFAULT '0.00' COMMENT '销售价',
	`c_by` varchar(24) NOT NULL COMMENT '创建人',
	`c_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`u_by` varchar(24) NOT NULL DEFAULT '0' COMMENT '修改人',
	`u_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
	PRIMARY KEY (`id`),
	KEY `idx_ccid` (`ccolumn_id`),
	KEY `idx_cn` (`commodity_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';
```

## 使用 Guard 守卫控制权限
```cmd
$ nest g guard rbac guards
```

## 初始化 Swagger
```cmd
$ yarn add @nestjs/swagger swagger-ui-express -S
```
## Support

Nest is an MIT-licensed open source project. It can grow thanks to the sponsors and support by the amazing backers. If you'd like to join them, please [read more here](https://docs.nestjs.com/support).

## Stay in touch

- Author - [Kamil Myśliwiec](https://kamilmysliwiec.com)
- Website - [https://nestjs.com](https://nestjs.com/)
- Twitter - [@nestframework](https://twitter.com/nestframework)

## License

Nest is [MIT licensed](LICENSE).
