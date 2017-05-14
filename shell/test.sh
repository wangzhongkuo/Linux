#!/bin/bash
#learn the test statement

# -eq 等于
# -ge 大于等于
# -gt 大于
# -le 小于等于
# -lt 小于
# -me 不等

param=$1

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
	echo "# compare numerical value: "
	echo "# -eq 等于"
	echo "# -ge 大于等于"
	echo "# -gt 大于"
	echo "# -le 小于等于"
	echo "# -lt 小于"
	echo "# -ne 不等"
	echo "========================="
	echo "# compare varchar value: "
	echo "# warning: there are spaces in front and at the back of the \"=\"."
	echo "# warning: you must escape the \">\" with \\, e.g. \"\\>\"."
	echo "# = 等于"
	echo "# != 不等于"
	echo "# < 小于"
	echo "# > 大于"
	echo "# -n 检查字符串长度是否为0"
	echo "========================="
	echo "# compare files"
	echo "# -d file 检查file是否存在并是一个目录"
	echo "# -e file 检查file是否存在"
	echo "# -f file 检查file是否存在并是一个文件"
	echo "# -r file 检查file是否存在并可读"
	echo "# -s file 检查file是否存在并非空"
	echo "# -w file 检查file是否存在并可写"
	echo "# -x file 检查fiie是否存在并可执行"
	echo "# -O file 检查file是否存在并属于当前用户"
	echo "# -G file 检查file是否存在并且默认组与当前用户相同"
	echo "# file1 -nt file2 检查file1是否别file2新"
	echo "# file2 -ot file2 检查file1 是否比file2旧"
	exit 0
fi

# test compare numerical value
if test 1 -le 5; then
	echo "1 is less than 5"
else
	echo "1 is greater than 5"
fi

if [ 1 -eq 1 ]; then
	echo "1 is equals 1"
else
	echo "1 is not equals 1"
fi

# test compare varchar value
var1=aaa
var2=AAA

if [ $var1 = $var2 ]; then
	echo 'var1=var2'
else
	echo 'var1!=var2'
fi

if [ $var1 \> $var2 ]; then
	echo "var1>var2"
else
	echo "var1<var2"
fi

# test empty varchar
var3=""

if [ -n $var3 ]; then
	echo "var3 is empty"
else
	echo "var3 is $var3"
fi

if [ -n $var4 ]; then
	echo "var4 is empty"
else
	echo "var4 is $var4"
fi
# advanced peculiarity || &&
if [ -d $HOME ] && [ -w "if.sh" ]; then
	echo "I can write it"
else
	echo "I can't write it"
fi
