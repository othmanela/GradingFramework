#!/bin/sh

#remove a student based on pennkey.
# 1) search through list until pennkey match.
# 2) remove entire line when found
# 3) ask user to confirm deletion

echo "Are you sure you wish to delete '"$1"'. Please Confirm (y/n)"

while read input
do
    if [ $input = y ]
    then
	sed -i "/$1/d" students.csv
	break
    elif [ $input = n ]
    then
	break
    else 
	echo "Please type '"y"' or '"n"' "
    fi
done

