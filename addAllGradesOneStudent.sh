#!/bin/sh

OIFS=$IFS

IFS=" " read -a array < students.csv

#matches first line with grade label and returns index
index=0

###will not work if element is last. fix later.##########

index=${#array[@]}

pennkey=$1

#returns linenum at pennkey
linenum=$(awk "/$pennkey/ {print FNR}" students.csv)

#returns line where the given pennkey is
line2="`sed -n ${linenum}p students.csv`"
#organizes the string into an array
lineArray=($line2)
lineArraySize=${#lineArray[@]}
indexMinusOne=$(( $index - 1 ))
lineArraySizeMinusOne=$(( $lineArraySize - 1 ))

for ((i=3; i<$index; ++i))
do

    echo "Please enter a grade for assignment ${array[$i]}"
    read input

    if [ $i = $lineArraySizeMinusOne ]
    then
	lineArray[$i]="$input"
    elif [ $i = $lineArraySize ]
    then
	lineArray[$(( $i - 1))]=${lineArray[$(( $i - 1)) ]}","
	lineArray[$i]="$input"
    else
	lineArray[$i]="$input","" 
    fi
done

sed -i "${linenum}i ${lineArray[*]}" students.csv
linenum=$(( $linenum + 1 ))
sed -i "${linenum}d" students.csv


