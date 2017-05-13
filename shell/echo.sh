#!/bin/bash
#this is my first shell scritpt
#show the date in a line
set -x
echo "#show the date in a line"
echo 'hell wanghzongkuo'
echo -n 'The time and date are: '
date

#test math 2 * 3 =
echo "#test math 2 * 3 ="
var1=2
var2=3
var3=$[$var1 * $var2]
echo $var3
# exit status:
# 0: success
# 1: unknown error
# 2: wrong shell commond
# 126: permission denied
# 127: commond not found
# 128: invalid exit params
# 128+x: serious error of linux signal "x"
# 130: the commond has been terminated by "ctrl c"
# 255: exit status out of bounds
#exit 257
set +x
echo "is there \"+\" ?"
