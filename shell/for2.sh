#!/bin/bash
# change the IFS

list=$( cat file.txt )

for var in $list
do
	echo "The next state is $var"
done
echo "===================="

IFS=$"\n"
for var in `cat file.txt`
do
	echo "The next state is $var"
done
echo "===================="

for file in /e/workspace-2017/Linux/shell/*
do
	if [ -d "$file" ]; then
		echo "$file is a directory"
	elif [ -f "$file" ]; then
		echo "$file is a file"
	else
		echo "what is the $file ?"
	fi
done


