# cs3110-finalproject

To run our program, open the zip file containing our project in a new directory. Navigate to this directory in your terminal and type "make".
This will open a command line interface in utop that will prompt a menu with various CMS database operations. 

Some headups and pointers:
- We have not fully implemented bounds checking, so it is important to make the id's that are asked for are correct
- The type of netids and professor id's are strings
- The type of course id, and assignment id are integers
- The type of assignment weight are integers
- The type of grades when assigning them are integers

Failure to enter the proper type when prompted to enter a value may result in the termination of the program. We apologize for this
inconvenience, but we will implement a fix. 

**ADD ALL STUDENTS BEFORE ADDING ASSIGNMENTS** 

Here is are possible routes you can take in our program to test some of our new features in MS2:

Route 1: 
Add Course (1)
Add Student (9)
Add Student to Course (15)
Add Assignment (6)
Give a student a Grade (19)
Add Assignment (6)
Give a student a Grade (19)
Compute a student’s course grade (21)

Route 2: 
Add Course (1)
Add Student (9)
Add Student (9)
Add student to Course (15)
Add student to Course (15)
Add Assignment (6)
Give a student a Grade (19)
Give a student a Grade (19)
Compute a student’s course grade (21)
Compute mean and median grade of an assignment (22)


