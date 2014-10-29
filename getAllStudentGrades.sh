#!/bin/sh

path=$1
#put line1 into string 
line1="`sed -n 1p $path`"
#eliminate commas in string
line1=$(echo $line1 | tr "," " ")
#place each word into array
line1Array=($line1)

lineMax="`sed -n 2p $path`"
lineMax=$(echo $lineMax | tr "," " ")
lineMaxArray=($lineMax)

###takes path to csv###

fileLineCount=`wc -l < $path`
fileLineCount=$(( $fileLineCount + 1 ))

for ((currentLine=3; currentLine<$fileLineCount; ++currentLine))
do

#create array of grades from pennkey
    lineGrades="`sed -n ${currentLine}p $path`"
    lineGrades=$(echo $lineGrades | tr "," " ")
    lineGradesArray=($lineGrades)
    total=0
    maxTotal=0

    #loop and sum grades
    for ((i=3; i<${#lineGradesArray[@]}; ++i))
    do
	total=$(( ${total} + ${lineGradesArray[$i]} ))
	maxTotal=$(( ${maxTotal} + ${lineMaxArray[$i]} ))
    done
    
    #print pennkey: grade/maxGrade
    echo "${lineGradesArray[0]}: ${total}/${maxTotal}"
done

