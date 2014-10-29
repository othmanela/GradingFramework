#!/bin/sh

OIFS=$IFS

IFS=" " read -a array < students.csv

#matches first line with grade label and returns index
index=0

###will not work if element is last. fix later.##########
assignment=$1

var=$2","

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

echo "index = $index"
echo "array size = ${#array[@]}"

while [ ${#array[@]} -gt 0 ]
do
    j=$(( $i + 1 ))
    echo "line $i = ${array[$i]}"
    temp={array[$i]}
    array[$j]=$temp
done
#for ((i=$index; i<${#array[@]}; ++i))
#do
    
    
    
    
#done    
#array[$index]=$assignment


sed -i "1i ${array[*]}" students.csv
linenum=$(( $linenum + 1 ))
sed -i "2d" students.csv


#returns linenum at pennkey
#linenum=$(awk "/$pennkey/ {print FNR}" students.csv)

#returns line where the given pennkey is
#line2="`sed -n ${linenum}p students.csv`"
#organizes the string into an array
#lineArray=($line2)


#echo "Please enter a grade"

#read input

#lineArraySize=${#lineArray[@]}
#echo "lineArraySize = $lineArraySize"
#indexMinusOne=$(( $index - 1 ))
#echo "indexMinusOne = $indexMinusOne"
#lineArraySizeMinusOne=$(( $lineArraySize - 1 ))
#echo "lineArraySizeMinusOne = $lineArraySizeMinusOne"

#echo "index = $index"
#if [ $index = $lineArraySizeMinusOne ]
#then
#    lineArray[$index]="$input"
#elif [ $index = $lineArraySize ]
#then
#    lineArray[$indexMinusOne]=${lineArray[$indexMinusOne]}","
#    lineArray[$index]="$input"
#else
#    lineArray[$index]="$input","" 
#fi




#IFS=$OIFS

