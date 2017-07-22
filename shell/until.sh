#/bin/bash
# using the until commod
count=100
until [ $count -eq 0 ]
do
	echo "$count"
	count=$[$count - 25]
done
