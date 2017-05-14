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
