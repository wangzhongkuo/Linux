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
