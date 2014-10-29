#!/bin/sh

OIFS=$IFS

IFS=" " read -a array < students.csv

#matches first line with grade label and returns index
index=0

###will not work if element is last. fix later.##########
var=$1","

for element in "${array[@]}"
do
    if [ $var = $element ]
    then
	break
    elif [ $1 = $element ]
    then
	break
    fi
    index=$(( $index + 1 ))
done


fileLineCount=`wc -l < students.csv`
fileLineCount=$(( $fileLineCount + 1 ))

echo $fileLineCount
for ((currentLine=3; currentLine<$fileLineCount; ++currentLine))
do
    lineGrades="`sed -n ${currentLine}p students.csv`"
    lineArray=($lineGrades)
    
    pennkey=$(echo ${lineArray[0]} | tr "," " ")
    echo "Please enter a grade for student ${pennkey}"

    read input

    lineArraySize=${#lineArray[@]}
    indexMinusOne=$(( $index - 1 ))
    lineArraySizeMinusOne=$(( $lineArraySize - 1 ))

#special case-when we are adding grade last element
    if [ $index = $lineArraySizeMinusOne ]
    then
	lineArray[$index]="$input"
#special case-when we are adding one past the last
    elif [ $index = $lineArraySize ]
    then
	lineArray[$indexMinusOne]=${lineArray[$indexMinusOne]}","
	lineArray[$index]="$input"
#normal case
    else
	lineArray[$index]="$input","" 
    fi

    sed -i "${currentLine}i ${lineArray[*]}" students.csv
    currentLinePlusOne=$(( $currentLine + 1 ))
    sed -i "${currentLinePlusOne}d" students.csv
done

