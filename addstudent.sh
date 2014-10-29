#!/bin/sh

if [ -z $1 ] || [ -z $2 ] || [ -z $3 ] 
then
echo "invalid"
fi

#counts commas in first line. lets us know how many command line args expected.
num=`(head -1 | cat) < students.csv | tr -cd , | wc -c`

counter=0

#loops through adding grade to file. Shift basically shifts command line
#arguments to the left by 1.
while [ $# -gt 0 ]
do
    echo -n "$1, " >> students.csv
    shift
    counter=$(( $counter + 1 ))
done

#while commands args are less than expected

while [ $counter -lt $num ] 
do
    echo -n "0, " >> students.csv
    counter=$(( $counter + 1 ))
done

#used to put file on last line.
echo -n "0" >> students.csv
echo "" >> students.csv
