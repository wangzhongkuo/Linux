#!/bin/bash
var=""
if [ -z "$var" ]; then
	echo "var is empty"
fi
if [ -n "$var" ]; then
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

