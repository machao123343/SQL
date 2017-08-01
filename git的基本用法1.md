git的基本用法1
------------------------------------
标签（空格分隔）： 基础知识 git

---

###1.将K&R经典文献加入到个人书库当中。
###2.装配GCC环境

基本概念：
-
1. 工作区：就是你在电脑里能看到的目录。
2. 暂存区：英文叫stage, 或index。一般存放在 ".git目录下"下的index文件（.git/index）中，所以我们把暂存区有时也叫作索引（index）。
3. 版本库：工作区有一个隐藏目录.git，这个不算工作区，而是Git的版本库。
[原理图](http://www.runoob.com/wp-content/uploads/2015/02/1352126739_7909.jpg)

=====================================================================

1.git init 在目录中创建一个新的仓库。
```
mkdir runoob
cd runoob/
git init
Initialized empty Git repository in /Users/tianqixin/www/runoob/.git/
#在/www/runoob/.git/目录初始化空Git仓库完毕。
```

```
ls -a//显示所有仓库快照
```

2.git clone拷贝一个Git仓库到本地
```
git clone [url]
eg: fit clone git@github,com:schacon/simplegit.git
```

3.git add将文件添加到缓存
```
touch README
touch hello.php
ls
README         hello.php
git status -s
A README
A hello.php
```

4.git status查看在你上次提交时是否有修改
```
$git status
on branch master
Initial commit

Changes to be committed:
...
```

5.git diff
```
git diff //尚未保存的改动。
git diff -cached //查看以缓存的改动
git diff HEAD//查看以缓存的与未缓存的所有改动
git diff -stat//显示摘要而非整个
```

6.git commit ：git add 命令将内容写入缓冲区，而执行git commit 将缓冲区内容添加仓库中。
```
$git config --global user.name 'runoob'
$git config --global suer.email test@runoob.com
```

事例 
```
$git add hello.php
$git status -s
A README
A hello.php
$git commit -m'第一次版本提交'  //提交版本名字（描述）

$git status
#On Branch master
nothing to commit(working directory clean)
```

git reset HEAD ：命令用于取消缓存的内容（恢复修改前的版本）
```
#Runoob Git 测试
#菜鸟教程
```

```
git status -s
M README
M hello.php
$git add
$git status -s
M README
M hello.pp
$git reset HEAD --hello.php
Unstaged changes after reset:
M      hello.php
$git status -s
M    README
M    hello.php

$ git commit -m'修改'
[master f50cfda] 修改
 1 file changed, 1 insertion(+)
$ git status -s
 M hello.php
```

6.git rm :将条目从缓冲区中移除。
```
$ git rm hello.php
rm 'hello.php'
$ls
README

$ gity rm --cached README
rm 'README'
$ls
README
```

git mv: 命令用于移动或重命名
```
$git add README
$git mv README README.md//重命名
$ls
README.md
```

[文章链接](http://www.runoob.com/git/git-branch.html)


Git 分支管理
----------------------------------
使用分支意味着你可以从开发主线上分离出来，然后在不影响主线同时工作

```
git branch (branchname)//创建分支命令
git checkout(branchname)//切换分支命令
git merge//合并分支命令
git branch//列出分支基本命令

eg: $git branch
    master

$git branch testing //新建分支
$git branch
* master
  testing
  
//新建并切换分支
$ ls
README
$ echo 'runoob.com' > test.txt
$ git add .
$ git commit -m 'add test.txt'
[master 048598f] add test.txt
 2 files changed, 1 insertion(+), 3 deletions(-)
 delete mode 100644 hello.php
 create mode 100644 test.txt
$ ls
README		test.txt
$ git checkout testing
Switched to branch 'testing'
$ ls
README		hello.php
$ git checkout master//切换回原分支
Switched to branch 'master'
$ ls
README		test.txt
```







 
 
















