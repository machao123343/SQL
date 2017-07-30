Docker 的一些常用命令及用法
----------------

标签（空格分隔）： 容器

---

用powershell命令行来连接docker：
-
```
docker-machine env --shell=powershell | Invoke-Expression 
```
这是一条建立 mysql 容器的命令。
-
```
docker run --name zeekodb -e MYSQL_ROOT_PASSWORD=2333 -p 3307:3306 -d mysql
```

-name  ： 名字（容器的名字不可重复）
-e     ： 输入密码
-p     ： 建立端口
-d     ： 根据哪个镜像建立容器

进入你所创建的mysql容器
-
docker exec -it (name) mysql -uroot -p
退出容器
-
quit

mydb >c:\Program Files\MySQL\mydb,sql

右键粘贴已经建好的数据库。

golang 的简单事务处理
-

```
if pro.Status != general.ProductOnsale && pro.Status != general.ProductUnsale {
		err = errors.New("Status unExistence")
		log.Logger.Error("status transformed with error :",err)

		return general.NewErrorWithMessage(errcode.ErrInvalidParams, err.Error())
	}
```
docker 下的 MYSQL 数据库操作
-

1.直接连接在docker里设置的端口以及IP地址就可以进行数据库的内部访问

2.从数据库中查找相应表的数据。
```
select * from （表名）  
```
```
SELECT column_name,column_name
FROM table_name
[WHERE Clause]
[OFFSET M ][LIMIT N
```
3.从数据库根据条件查找表中数据
```
select * from runoob_tbl where runoob_author='lesson';
select * from runoob_tbl where binary runoob_author='RUNOOB.COM';(binary区分大小写字母）
```
4.更新数据 Update

```
update runoob_tbl set runoob_title='learn for C' where runoob_id=3;
```
set 起更新作用。where 条件。

5.插入数据 insert into
```
 >insert into runoob_tbl
->(runoob_title, runoob_author, submission_date)
->values
->("learn for JavaScript", "RUNOOB.COM", '2016-05-06');
```

6.union 选取特定列的所有数据
```
select row from (表1）
union //(all 是否显示重复）
select row from （表2）
```
7.order 排序
```
order by + 列 asc //正序排列
order by + 列 desc // 倒序排列
```
8.Group 分组
```
1. select (列), count(*) from employee_tbl group by （列）//按组分列并统计各个总数

2. select (列), (条件） as signin_count from （表） group by （列） with rollup//在分组基础上在进行相同的统计。

3. coalesce(a, b, c); //如果a==null,  则选择b； 如果b == null, 则选择c； 如果a != null,  则选择a； 如果a b c 都为null， 则返回为null（没意义）
```
这是[示例链接](http://www.runoob.com/mysql/mysql-group-by-statement.html)

9.inner join 获取不同表对应的数据
```
1.SELECT a.runoob_id, a.runoob_author, b.runoob_count FROM runoob_tbl a INNER JOIN tcount_tbl b ON a.runoob_author = b.runoob_author; //INNER JOIN···ON···（内连接,或等值连接）：获取两个表中字段匹配关系的记录。

2.//LEFT JOIN（左连接）：获取左表所有记录，即使右表没有对应匹配的记录。

3.//RIGHT JOIN（右连接）： 与 LEFT JOIN 相反，用于获取右表所有记录，即使左表没有对应匹配的记录。
```
10.mysql的事务处理
[示例链接](http://www.runoob.com/mysql/mysql-alter.html)
```
1.begin 开始一个失误
2.rollabck 事务回滚
3.commit 事务确认
```
    mysql> use RUNOOB;
    Database changed
    mysql> CREATE TABLE runoob_transaction_test( id int(5)) engine=innodb;  # 创建数据表
    Query OK, 0 rows affected (0.04 sec)
     
    mysql> select * from runoob_transaction_test;
    Empty set (0.01 sec)
     
    mysql> begin;  # 开始事务
    Query OK, 0 rows affected (0.00 sec)
 
    mysql> insert into runoob_transaction_test value(5);
    Query OK, 1 rows affected (0.01 sec)
     
    mysql> insert into runoob_transaction_test value(6);
    Query OK, 1 rows affected (0.00 sec)
 
    mysql> commit; # 提交事务
    Query OK, 0 rows affected (0.01 sec)
         
    mysql>  select * from runoob_transaction_test;
    +------+
    | id   |
    +------+
    | 5    |
    | 6    |
    +------+
    2 rows in set (0.01 sec)
     
    mysql> begin;    # 开始事务
    Query OK, 0 rows affected (0.00 sec)
     
    mysql>  insert into runoob_transaction_test values(7);
    Query OK, 1 rows affected (0.00 sec)
     
    mysql> rollback;   # 回滚
    Query OK, 0 rows affected (0.00 sec)
     
    mysql>   select * from runoob_transaction_test;   # 因为回滚所以数据没有插入
    +------+
    | id   |
    +------+
    | 5    |
    | 6    |
    +------+
    2 rows in set (0.01 sec)
     
    mysql>

11.mysql处理重复数据
```
CREATE TABLE person_tbl
(
    first_name CHAR(20),
    last_name CHAR(20),
    sex CHAR(10)
);//无主键，易重复。

CREATE TABLE person_tbl
(
   first_name CHAR(20) NOT NULL,
   last_name CHAR(20) NOT NULL,
   sex CHAR(10),
   PRIMARY KEY (last_name, first_name)
);//双主键，不重复，不为空。

//insert ignore into忽略已有数据再进行插入。
mysql> INSERT IGNORE INTO person_tbl (last_name, first_name)
    -> VALUES( 'Jay', 'Thomas');
Query OK, 1 row affected (0.00 sec)
mysql> INSERT IGNORE INTO person_tbl (last_name, first_name)
    -> VALUES( 'Jay', 'Thomas');
Query OK, 0 rows affected (0.00 sec)

//以上查询语句将返回 person_tbl 表中重复的记录数。 //·一般情况下，查询重复的值，请执行以下操作：
//·确定哪一列包含的值可能会重复。
//·在列选择列表使用COUNT(*)列出的那些列。
//·在GROUP BY子句中列出的列。
//·HAVING子句设置重复数大于1。
mysql> select count(*) as repetions, last_name, first_name
    ->from person_tbl;
    ->group by last_name, first_name
    ->having repetions > 1;


//过滤重复数据
mysql> select distinct last_name, first_name
    ->from person_tbl;
    
//group by
mysql> select last_name, first_name
    -> from person_tbl
    -> group by (last_name, first_name);
    
//删除重复数据
mysql> CREATE TABLE tmp SELECT last_name, first_name, sex
    ->                  FROM person_tbl;
    ->                  GROUP BY (last_name, first_name, sex);
mysql> DROP TABLE person_tbl;
mysql> ALTER TABLE tmp RENAME TO person_tbl;
```


