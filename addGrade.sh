#!/bin/sh

OIFS=$IFS

IFS=" " read -a array < students.csv


index=0
var=$2","
#matches first line with grade label and returns index
for element in "${array[@]}"
do
    if [ $var = $element ]
    then
	break
    elif [ $2 = $element ]
    then
	break
    fi
    index=$(( $index + 1 ))
done

pennkey=$1

#returns linenum at pennkey
linenum=$(awk "/$pennkey/ {print FNR}" students.csv)

#returns line where the given pennkey is
line2="`sed -n ${linenum}p students.csv`"
#organizes the string into an array
lineArray=($line2)


echo "Please enter a grade"

read input

lineArraySize=${#lineArray[@]}
indexMinusOne=$(( $index - 1 ))
lineArraySizeMinusOne=$(( $lineArraySize - 1 ))

#special case-when we are adding the last grade. There is no comma
if [ $index = $lineArraySizeMinusOne ]
then
    lineArray[$index]="$input"
#special case- we are adding one past the last element. add comma to previous and no comma for new last.
elif [ $index = $lineArraySize ]
then
    lineArray[$indexMinusOne]=${lineArray[$indexMinusOne]}","
    lineArray[$index]="$input"
#normal case add grade with comma
else
    lineArray[$index]="$input","" 
fi

#insert array into line before line we are replacing
sed -i "${linenum}i ${lineArray[*]}" students.csv
linenum=$(( $linenum + 1 ))
#delete old line
sed -i "${linenum}d" students.csv


