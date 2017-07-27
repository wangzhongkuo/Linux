## 理解 Linux 的硬链接与软链接 [reference](https://www.ibm.com/developerworks/cn/linux/l-cn-hardandsymb-links/ "IBM")
### 语法
```console
ln -[optin] [olderfile] [newfile]
```
### 选项

* -b或--backup：删除，覆盖目标文件之前的备份；
* -d或-F或——directory：建立目录的硬连接；
* -f或——force：强行建立文件或目录的连接，不论文件或目录是否存在；
* -i或——interactive：覆盖既有文件之前先询问用户；
* -n或--no-dereference：把符号连接的目的目录视为一般文件；
* -s或——symbolic：对源文件建立符号连接，而非硬连接；
* -S<字尾备份字符串>或--suffix=<字尾备份字符串>：用"-b"参数备份目标文件后，备份文件的字尾会被加上一个备份字符串，预设的备份字符串是符号“~”，用户可通过“-S”参数来改变它；
* -v或——verbose：显示指令执行过程；
* -V<备份方式>或--version-control=<备份方式>：用“-b”参数备份目标文件后，备份文件的字尾会被加上一个备份字符串，这个字符串不仅可用“-S”参数变更，当使用“-V”参数<备份方式>指定不同备份方式时，也会产生不同字尾的备份字符串；
* --help：在线帮助； --version：显示版本信息。

### 示例
```console
ln -sf feiliucloud.war.1 feiliucloud.war
```
### 扩展知识
- linux数据分为用户数据（user data）和元数据（metadata）
- 用户数据是记录文件真实的地方data blocks, 元数据是文件附加属性如文件名、大小、创建时间等
- 通过文件名打开文件

  ![image1](https://raw.githubusercontent.com/wangzhongkuo/Linux/master/imgs/1.png)
- linux命令可以通过stat或ls -i 查看inode
### 硬链接
- 硬链接即是同一个文件使用了多个别名
- 文件有相同的 inode 及 data block
- 只能对已存在的文件进行创建
- 不能交叉文件系统进行硬链接的创建
- 不能对目录进行创建，只可对文件创建
- 删除一个硬链接文件并不影响其他有相同 inode 号的文件
- inode 是随着文件的存在而存在，因此只有当文件存在时才可创建硬链接，即当 inode 存在且链接计数器（link count）不为 0 时
### 软链接
- 软链接就是一个普通文件
- 用户数据块中存放的内容是另一文件的路径名的指向
- 软链接有着自己的 inode 号以及用户数据块
- 软链接有自己的文件属性及权限等
- 可对不存在的文件或目录创建软链接
- 软链接可交叉文件系统
- 软链接可对文件或目录创建
- 创建软链接时，链接计数 i_nlink 不会增加
- 删除软链接并不影响被指向的文件，但若被指向的原文件被删除，则相关软连接被称为死链接（即 dangling link，若被指向路径文件被重新创建，死链接可恢复为正常的软链接）。
- 通过软链接访问文件数据

  ![image2](https://raw.githubusercontent.com/wangzhongkuo/Linux/master/imgs/2.jpg)
