#!/bin/sh


#put line1 into string 
line1="`sed -n 1p students.csv`"
#eliminate commas in string
line1=$(echo $line1 | tr "," " ")
#place each word into array
line1Array=($line1)

lineMax="`sed -n 2p students.csv`"
lineMax=$(echo $lineMax | tr "," " ")
lineMaxArray=($lineMax)

pennkey=$1
#find line # of pennkey
linenum=$(awk "/$pennkey/ {print FNR}" students.csv)

#create array of grades from pennkey
lineGrades="`sed -n ${linenum}p students.csv`"
lineGrades=$(echo $lineGrades | tr "," " ")
lineGradesArray=($lineGrades)

#print first last (pennkey)
echo ${lineGradesArray[2]} ${lineGradesArray[1]} "(${lineGradesArray[0]})"

total=0
maxTotal=0
#print all grades
for ((i=3; i<${#lineGradesArray[@]}; ++i))
do
    echo ${line1Array[$i]}":" ${lineGradesArray[$i]}"/"${lineMaxArray[$i]} 
    total=$(( ${total} + ${lineGradesArray[$i]} ))
    maxTotal=$(( ${maxTotal} + ${lineMaxArray[$i]} ))
done

echo "Total: ${total}/${maxTotal}"

