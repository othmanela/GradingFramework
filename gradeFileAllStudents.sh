#!/bin/sh


#put line1 into string 
line1="`sed -n 1p students.csv`"
#eliminate commas in string
line1=$(echo $line1 | tr "," " ")
#place each word into array
line1Array=($line1)

index=0
gradeLabel=$1
mkdir $gradeLabel

for element in "${line1Array[@]}"
do
    if [ $gradeLabel = $element ]
    then
	break
    fi
    index=$(( $index + 1 ))
done

lineMax="`sed -n 2p students.csv`"
lineMax=$(echo $lineMax | tr "," " ")
lineMaxArray=($lineMax)

fileLineCount=`wc -l < students.csv`
fileLineCount=$(( $fileLineCount + 1 ))

for ((currentLine=3; currentLine<$fileLineCount; ++currentLine))
do

#create array of grades from pennkey
    lineGrades="`sed -n ${currentLine}p students.csv`"
    lineGrades=$(echo $lineGrades | tr "," " ")
    lineGradesArray=($lineGrades)


    total=0
    maxTotal=0
#calculate totals
    for ((i=3; i<${#lineGradesArray[@]}; ++i))
    do
	total=$(( ${total} + ${lineGradesArray[$i]} ))
	maxTotal=$(( ${maxTotal} + ${lineMaxArray[$i]} ))
    done

    
#loop through all students and print first last (pennkey)
    echo ${lineGradesArray[2]} ${lineGradesArray[1]} "(${lineGradesArray[0]})"  > $gradeLabel"/"${lineGradesArray[0]}"_"$gradeLabel"_"${lineGradesArray[$index]}
    echo $gradeLabel >> $gradeLabel"/"${lineGradesArray[0]}"_"$gradeLabel"_"${lineGradesArray[$index]} 
    echo "Grade: ${lineGradesArray[$index]}/${lineMaxArray[$index]}" >> $gradeLabel"/"${lineGradesArray[0]}"_"$gradeLabel"_"${lineGradesArray[$index]}

done


