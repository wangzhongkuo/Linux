## Let's learn the shell
### echo and exit status

- hello world

```shell
#!/bin/bash
#this is my first shell scritpt
#show the date in a line
set -x
echo "#show the date in a line"
echo 'hell wanghzongkuo'
echo -n 'The time and date are: '
date

#test math 2 * 3 =
echo "#test math 2 * 3 ="
var1=2
var2=3
var3=$[$var1 * $var2]
echo $var3
set +x
echo "is there \"+\" ?"

```
### exit status:

- 0: success
- 1: unknown error
- 2: wrong shell commond
- 126: permission denied
- 127: commond not found
- 128: invalid exit params
- 128+x: serious error of linux signal "x"
- 130: the commond has been terminated by "ctrl c"
- 255: exit status out of bounds

### set -x set +x

- set -x : show the processing statment
- set +x : close the output of the processing statment

### e.g.

```
# sh echo.sh
#show the date in a line
+ echo 'hell wanghzongkuo'
hell wanghzongkuo
+ echo -n 'The time and date are: '
The time and date are: + date
2017年 05月 13日 星期六 19:14:35 CST
+ echo '#test math 2 * 3 ='
#test math 2 * 3 =
+ var1=2
+ var2=3
+ var3=6
+ echo 6
6
+ set +x
is there "+" ?
```

## if-then

- pattern one
```shell
if date
then
    echo "it worked"
fi
```
- pattern tow
```shell
if test 1 -le 5; then
    echo "1 is less than 5"
else
    echo "1 is greater than 5"
fi
```
- pattern three
```shell
if [ 1 -eq 1 ]; then
    echo "1 is equals 1"
else
    echo "1 is not equals 1"
fi
```

### compare numerical value:
- -eq 等于
- -ge 大于等于
- -gt 大于
- -le 小于等于
- -lt 小于
- -ne 不等
###  compare varchar value
- warning: there are spaces in front and at the back of the =
- warning: you must escape the > with \, e.g. \>
- = 等于
- != 不等于
- < 小于
- \> 大于
- -n 检查字符串长度是否为0(未定义的字符串也为0)

###  compare files
- -d file 检查file是否存在并是一个目录
- -e file 检查file是否存
- -f file 检查file是否存在并是一个文件
- -r file 检查file是否存在并可读
- -s file 检查file是否存在并非空
- -w file 检查file是否存在并可写
- -x file 检查fiie是否存在并可执行
- -O file 检查file是否存在并属于当前用户
- -G file 检查file是否存在并且默认组与当前用户相同
- file1 -nt file2 检查file1是否别file2新
- file2 -ot file2 检查file1 是否比file2旧

### if-then advanced peculiarity

#### 逻辑与  [commond1] && [ commond2 ]
```shell
if [ -s "file.txt" ] && [ -w "file.txt" ]; then
        echo "file.txt is exists and i can write it"
else
        echo "i don't known"
fi
```

#### 逻辑或 [ commond1 ] || [ commond2 ]
```shell
if [ -s "file1.txt" ] || [ -s "file2.txt" ]; then
        echo "file is exists"
else
        echo "i don't known"
fi
```
### if-then  advanced arithmetical operation

#### if-then 高级特性：双括号内高级数学表达式 (( expression ))
- var++ 后增
- var-- 后减
- ++var 先增
- --var 先减
- !     逻辑求反
- ~             位求反
- **    幂运算
- <<    左位移
- \>>    右位移
- &             与运算
- |             或运算
- &&    逻辑与
- ||    逻辑或
```shell
int1=10
if  (( $int1 ** 2 > 90 )); then
        (( int2 = $int1 ** 2 ))
        echo "The squqre of $int1 is $int2"
fi
```
#### if-ten 高级特性：双中括号字符串比较高级特性 [[ expression ]]
- 双方括号里的expression使用了test命令中采用的标准字符串进行比较，但是它提供了test命令未提供的另一个特性——模式匹配（pattern matching）

- 在模式匹配中你可以定义一个正则表达式来匹配字符串值
```shell
if [[ $USER == r* ]]; then
        echo "Hell $USER"
fi
```
