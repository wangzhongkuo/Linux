#!/bin/bash
# testing then for variable after the looping

# for var in list
# do    
# 	commond
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




