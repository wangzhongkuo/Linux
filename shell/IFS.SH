#/bin/bash
# changing the IFS value

IFS=$'\n'
passwd=$(cat ../files/passwd)
for entry in $passwd
do
	echo "values in $entry"
	IFS=:
	for val in $entry
	do
		echo "$val"
	done
done

