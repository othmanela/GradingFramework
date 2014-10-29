University of Pennsylvannia
CIS 191 Project

			Grading Framework
By: 
Josh Willis 
Othmane Laousy

There are thirteen scripts in this project that handle several fonctionalities manupilating the CSV file stored this way:
Line 1 
PENNKEY, LAST_NAME, FIRST_NAME, GRADE1_LABEL, GRADE2_LABEL, GRADE3_LABEL, ..., GRADEN_LABEL 
Line 2 
PENNKEY, LAST_NAME, FIRST_NAME, GRADE1_MAX, GRADE2_MAX, GRADE3_MAX, ..., GRADEN_MAX 
Line 3 to Line n 
STUDENT_PENNKEY, STUDENT_LAST_NAME, STUDENT_FIRST_NAME, GRADE1, GRADE2, GRADE3, ..., GRADEN 

If you already have the grades in an excel file, just save as students.csv but please make sure it is in the above format

Here are the scripts: 
1-Adding a student (addstudent.sh)
This script adds a student's pennkey, last name, first name to the existing students.csv file. Ths script while automatically input zeros to the student grade
To use this script just type the following line into your command line: ./addstudent.sh tux the penguin

2-Removing a student (removeStudent.sh)
This script removes the student specified as input. 
Here is an example on how to use the script: ./removeStudent.sh tux

3-Adding an assignment (addAssignment.sh)
This scipt adds an assignment inputing the name (exam, homework, quiz...) and the maximum score for this assignement to the CSV file. 
To call this script type into the command line:  ./addAssignment.sh exam1

4-Add student grade (addGrade.sh) 
This script adds a grade for a specific student. 
The way you use it is: ./addGrade.sh othmanel exam1

5-Get student grade (getStudentGrade.sh)
This script outputs an organized list of assignements and grades as well as the total of grades for a specific student.Type into the command line: ./getStudentGrade.sh othmanel 
and the output will be:

Laousy Othmane (othmanel) 
Quiz 1: 10/10
Homework 1: 7/10
Quiz 2: 5/10
Homework 2: 9/10
Project 1: 50/50
Final: 90/100
Total: 171/190

6-Get all student grades (getAllStudentGrades.sh)
This script outputs all the student's grades sumed up and does this for all students in the file.

You run it by typing: ./getAllStudentGrades.sh

The output looks like: 
tux: 267/300
bux: 110/300
dux: 299/300
hux: 0/300
lux: 231/300

7-Generate grade file for one student (gradeFileOnestudent.sh)
This script generate a .txt file with the student's information, the assignment information and the student's grade for this assignement.

Willis Josh (jmwillis)
project1
Grade: 50/50

To run the script use: ./gradeFileOneStudent.sh jmwillis project1 

8-Generate grade file for all students (gradeFileAllStudents.sh)

Generates grade files for all students and puts them all in a folder with the name of the assignment. 
Example on how to run the script: ./gradeFileAllStudents.sh exam1

9-Send Grade via email to 1 student (sendGradeStudent.sh)
This script sends an email to a specific student, the body of the email containing:
othmane laousy (othmanel)
exam1
Grade: 45/100
and the object is: exam1 grade

to run this script make sure that you have the file for the student already generated using the previous gradeFileOneStudent script and then run: ./sendGradeStudent.sh othmanel exam1

10-Send Grade All students (sendGradeAllStudents.sh)
This script sends an email to all the students with their grades for a specified assignment.
To run it make sure that the folder was already generated using the gradeFileAllStudents.sh scipt and then run: ./sendGradeAllStudents.sh 

11-Archiver (archive.sh)
This script takes all the directories that contain student grades and archive them into .tar
The script take as input the semester(spring, fall, summer) and the year in the YYYY format 
Here is an example on how to run it: ./archive.sh spring 2013

12-Extra Credit 1: Add all Students grades for one assignment (addGradeAllIntercative.sh):
Changes grades for all students for one assignement. After you run it, it will prompt you to enter a grade for each student
To run it type: ./addGradeAllInteractive.sh exam1

13-Extra Credit 2: Changes one student grades interactively ( addAllGradesOneStudent.sh)
Changes all the grades for one student given as input. After you run it, the script will prompt you to enter a grade for each assignment.
To run it, type the following command: ./addAllGradesOneStuent.sh othmanel
