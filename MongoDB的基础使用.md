# MongoDB的基础使用

标签（空格分隔）： mongo

--------------------
什么是MongoDB ?
MongoDB 是由C++语言编写的，是一个基于分布式文件存储的开源数据库系统。
在高负载的情况下，添加更多的节点，可以保证服务器性能。
MongoDB 旨在为WEB应用提供可扩展的高性能数据存储解决方案。
MongoDB 将数据存储为一个文档，数据结构由键值(key=>value)对组成。MongoDB 文档类似于 JSON 对象。字段值可以包含其他文档，数组及文档数组。

![示例图](http://www.runoob.com/wp-content/uploads/2013/10/crud-annotated-document.png)

---------------------------
##概念解析
```
1.database 数据库
2.table    数据库表的集合
3.row      数据记录行/集合
4.column   数据字段/域
5.index    索引
6.table joins 表连接
7.primary key   主键，mongoDB自动把id字段设置为主键
```
1.数据库
-

```
//show dbs 可以显示所有数据的列表
> show dbs
local  0.078GB
test   0.078GB
>

//执行 "db" 命令可以显示当前数据库对象或集合。
> db
test
> 

//运行"use"命令，可以连接到一个指定的数据库
> use local
switched to db local
> db
local
> 

```

关于关系型数据库（RDBMS）与MongoDB对应的术语：
|RDBMS|	MongoDB|
| --------| :----:  |
|数据库|	数据库|
|表格|	集合|
|行	 |   文档|
|列	 |   字段|
|表联合|	嵌入文档|
|主键 |	主键 (MongoDB 提供了 key 为 _id )|
|数据库服务和客户端|
|Mysqld/Oracle|	mongod|
|mysql/sqlplus|	mongo|















