#!/bin/sh
#$1 is pennkey
#$2 is the assignment label

#Email the generated file : pennkey_assignmentlabel_grade to pennkey@seas.upenn.edu

if [ ! -d $2 ]
then 
	EMAILFILE="$1_$2_*"
	EMAIL="$1@seas.upenn.edu"
	cat $EMAILFILE | mailx -s "$2 Grade" $EMAIL ;
else 
	EMAIL="$1@seas.upenn.edu"
	cd $2
	EMAILFILE="$1_$2_*"
	cat $EMAILFILE | mailx -s "$2 Grade" $EMAIL ;
	cd ..
fi

exit 0;
