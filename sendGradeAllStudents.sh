#!/bin/sh

for file in `ls $1`
do
	pennkey=`echo $file | cut -f 1 -d '_'`;
	EMAIL="${pennkey}@seas.upenn.edu"
	cat $1/$file | mailx -s "$1 Grade" $EMAIL ;
done
exit 0;

