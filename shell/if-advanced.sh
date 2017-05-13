#!/bin/bash
# learn the advanced peculiarity of if-then
# if-then 高级特性：逻辑或、逻辑与
# [ commond1 ] || [ commond2 ] 、[ commond1 ] && [ commond2 ]
if [ -s "file.txt" ] && [ -w "file.txt" ]; then
	echo "file.txt is exists and i can write it"
else
	echo "i don't known"
fi

# advanced arithmetical operation

# if-then 高级特性：双括号内高级数学表达式
# (( expression ))
# var++ 后增
# var-- 后减
# ++var 先增
# --var 先减
# ! 	逻辑求反
# ~		位求反
# ** 	幂运算
# <<	左位移
# >> 	右位移
# &		与运算
# |		或运算
# &&	逻辑与
# || 	逻辑或

int1=10
if  (( $int1 ** 2 > 90 )); then
	(( int2 = $int1 ** 2 ))
	echo "The squqre of $int1 is $int2"
fi

# if-ten 高级特性：双中括号字符串比较高级特性
# [[ expression ]]
# 双方括号里的expression使用了test命令中采用的标准字符串进行比较，但是它提供了test命令未提供的另一个特性——模式匹配（pattern matching）
# 在模式匹配中你可以定义一个正则表达式来匹配字符串值

if [[ $USER == r* ]]; then
	echo "Hell $USER"
fi




