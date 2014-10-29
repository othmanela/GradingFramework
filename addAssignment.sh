#!/bin/sh

#takes a name then add it to the end of the first line.
#then asks user to input max score and adds that to end of the second line
# sed is a cool utility for manipulating data.
# 1 s means sub first line. -i says write to file do not echo output 
# /&, &new- & is first line then we sub what we want

new=$1
sed -i "1 s/.*/&, $new/" students.csv

echo "Please input the max score for this assignment"

read input

sed -i "2 s/.*/&, $input/" students.csv
