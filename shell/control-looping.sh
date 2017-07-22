#/bin/bash
# control the looping with break、continue
echo "loop a-g, break at d: "
list="a b c d e f g"
for var in $list
do
	echo "$var"
	if [ "$var" = "d" ]
	then
		echo "break at $var"
		break
	fi
done
echo "===================================================="
echo ""
echo "loop 1-6 break at 3: "
list="1 2 3 4 5 6"
for var in $list
do
	echo "$var"
	if [ "$var" -eq 3 ]; then
			echo "break at $var"
			break
	fi
done
echo "===================================================="
# break n //当前循环n=1(default), 上一层循环n=2
echo ""
echo "break n // 当前循环n=1(default), 向外一层循环n=2: "
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
echo "==================================================="
echo "if no break, will echo 5*5 square, but 3*3"
echo ""
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
echo "==================================================="
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
