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
