## Let's learn the bash shell
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
- warning: there are spaces in around the =
- warning: you must escape the > with \, e.g. \>
- = 等于
- != 不等于
- < 小于
- \> 大于
- -n 检查字符串长度是否不为0(未定义的字符串也为0)
- -z 检查字符串长度是否为0
```shell
#!/bin/bash
var=""
if [ -z $var ]; then
        echo "var is empty"
fi
if [ -n $var ]; then
        echo "var is not empty"
fi
echo "=================="
if [ -z "$var" ]; then
        echo "var is empty"
fi
if [ -n "$var" ]; then
        echo "var is not empty"
fi
#条件测试[ -n ]相当于test -n，bash的内建命令test在只有一个参数的情况下，只要参数不为空就返回真。
if test -n
then
        echo "true"
fi
echo "-----------------"
if test -n ""
then
        echo "true"
else
        echo "false"
fi
```

  ```
  [root@zhongkuo shell]# sh nz.sh
  var is empty
  var is not empty
  ==================
  var is empty
  true
  -----------------
  false
  [root@zhongkuo shell]# vim nz.sh
  [root@zhongkuo shell]# sh nz.sh
  var is empty
  var is not empty
  ==================
  var is empty
  true
  -----------------
  false
  ````

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

### replace the if-then with case-in

#### e.g.

```shell
#!/bin/bash
# convert if-then to case in

var=$1
if [ -z "$var" ]; then
        echo "your param is empty"
fi

if [ -n "$var" ]; then
        echo "your param is $var"
fi

echo "====if-then===="
if [ "$var" = "a" ]; then
        echo "it's upercase is A"
elif [ "$var" = "b" ]; then
        echo "it's upercase is B"
elif [ "$var" = "c" ]; then
        echo "it's upercase is C"
else
        echo "but the param is required to be a or b or c"
fi

echo "====case-in===="
# case in
case "$var" in
"a")
        echo "it's upercase is A";;
"b")
        echo "it's upercase is B";;
"c")
        echo "it's upercase is C";;
*)
        echo "but the param is required to be a or b or c";;
esac
```
```console
[root@zhongkuo shell]# sh case.sh a
your param is a
====if-then====
it's upercase is A
====case-in====
it's upercase is A

[root@zhongkuo shell]# sh case.sh
your param is empty
====if-then====
but the param is required to be a or b or c
====case-in====
but the param is required to be a or b or c
```

## looping

### for-in
```shell
for var in list
do
    commond
done
```
```shell
#!/bin/bash
# testing then for variable after the looping

# for var in list
# do
#       commond
# done

for var in a b c d
do
        echo "The next state is $var"
done
echo "=========================="

for var in i don't know if this'll work
do
        echo "The next state is $var"
done
echo "=========================="

for var in "i don't know if this'll work"
do
        echo "The next state is $var"
done
echo "=========================="

for var in i "don't" know if "this'll" work
do
        echo "The next state is $var"
done
echo "========================="

list="a b c d e"
list=$list" f"

for var in $list
do
        echo "The next state is $var"
done
```
```console
$ sh for.sh
The next state is a
The next state is b
The next state is c
The next state is d
==========================
The next state is i
The next state is dont know if thisll
The next state is work
==========================
The next state is i don't know if this'll work
==========================
The next state is i
The next state is don't
The next state is know
The next state is if
The next state is this'll
The next state is work
=========================
The next state is a
The next state is b
The next state is c
The next state is d
The next state is e
The next state is f
```
### for-in like C
```shell
#!/bin/bash
# another pattern of for-in from C

for (( i=1; i<10; i++ ))
do
        echo "i is $i"
done
echo "==================="

for (( i=1,j=10; i<6,j>5; i++,j-- )); do
        echo "i is $i, j is $j"
done
```
```console
$ sh for3.sh
i is 1
i is 2
i is 3
i is 4
i is 5
i is 6
i is 7
i is 8
i is 9
===================
i is 1, j is 10
i is 2, j is 9
i is 3, j is 8
i is 4, j is 7
i is 5, j is 6
```
### while loop

```shell
while test commond
do
  other commond
done
```
```shell
#/bin/bash
# while commond test
count=10
while [ $count -gt 0 ]
do
        echo "$count"
        count=$[ $count -1 ]
done
#双圆括号
count=10
while (($count > 0))
do
        echo "$count"
        count=$[ $count -1 ]
done
#双尖括号
count=10
while [[ $count -gt 0 ]]
do
        echo "$count"
        count=$[$count-1]
done
#多个测试命令
count=10
while echo $count
          [ $count -ge 0 ]
do
        echo "this is inside the loop"
        count=$[ $count - 1 ]
done
```
### until loop

```shell
until test commond
do
  other commond
done
```
```shell
#/bin/bash
# using the until commod
count=100
until [ $count -eq 0 ]
do
        echo "$count"
        count=$[$count - 25]
done
```
```console
$ sh until.sh
100
75
50
25
```

### control loop with continue n, break n

```shell
for (( i=1; i<=2; i++))
do
        echo "inner begin ..."
        for (( j=6; j>=0; j-- ))
        do
                value=$(( j % 2 ))
                if [ $value -eq 0 ]; then
                        echo "i=$i, j=$j discard following clauses"
                        continue
                else
                        echo "i=$i, j=$j"
                fi
                echo "last inner clause"
        done
        echo "inner end ..."
        echo ""
done
```
```console
inner begin ...
i=1, j=6 discard following clauses
i=1, j=5
last inner clause
i=1, j=4 discard following clauses
i=1, j=3
last inner clause
i=1, j=2 discard following clauses
i=1, j=1
last inner clause
i=1, j=0 discard following clauses
inner end ...

inner begin ...
i=2, j=6 discard following clauses
i=2, j=5
last inner clause
i=2, j=4 discard following clauses
i=2, j=3
last inner clause
i=2, j=2 discard following clauses
i=2, j=1
last inner clause
i=2, j=0 discard following clauses
inner end ...
```

```shell
echo "if no break, will echo 5*5 square, but 3*3"
for outv in 1 2 3 4 5
do
        for innv in 1 2 3 4 5
        do
                if [ $outv -eq 4 ]; then
                        break 2
                fi
                echo -n " $innv "
                if [ $innv -eq 3 ]; then
                        break
                fi
        done
        echo ""
done
```
```console
if no break, will echo 5*5 square, but 3*3
 1  2  3
 1  2  3
 1  2  3
```

### behind the done

```shell
# behind the done
echo "behind the done"
echo ""
echo "done > done.txt"
for var in a b c d
do
        echo "$var"
done > done.txt
echo ""
echo "done | sort"
for var in a d b c
do
        echo "$var"
done | sort
echo "cat done.txt"
cat done.txt
```
```console
behind the done

done > done.txt

done | sort
a
b
c
d
cat done.txt
a
b
c
d
```

