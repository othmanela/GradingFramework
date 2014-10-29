#!/bin/sh
#$1 is the semester
#$2 is the the year

#List all the direcotries names

DirNames=`ls -d */`;

#Archive the direcotories as YYYY_semester_backup.tar.gz

tar czf $2_$1_backup.tar.gz ${DirNames};
