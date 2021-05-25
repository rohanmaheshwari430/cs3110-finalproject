# cs3110-finalproject

To run our program, open the zip file containing our project in a new directory. Navigate to this directory in your terminal and type "make".
This will open a command line interface in utop that will prompt a menu with various CMS database operations. 

Some headups and pointers:
- To use all features, **please use our Admin Login**. Due to time constraints, we were unable to fully integrate the Students and People UI. Fortunately, those two UI's do not hinder the functionality of the overall software.
- It is important to make the id's that are asked for are correct
- The type of netids and professor id's are strings
- The type of course id, and assignment id are integers
- The type of assignment weight are integers
- The type of grades when assigning them are integers

Failure to enter the proper type when prompted to enter a value may result in the termination of the program. We apologize for this
inconvenience.

**Please add all students to the course before creating an assignment for the course* 

*We want to mimic the real CMS environment where assignments are assigned after all students have joined the class. We did not implement functionality to create an assignment before enrolling students. This may cause unforseen behavior in the software.*

Load and Save: 
  - We were successfully able to create a load/save feature for students and professors
  - We were not able to create a load/save feature for courses due to time constraints. With more time, it was definitely doable since it follows the same algorithm as our load/save for people.
  - **To see the load/save functionality, we have already loaded a JSON file with some student data. It is automatically loaded into the program when booted up. To view it, you can go print all students right after booting up the program. To test save, you can create a student or professor, and then click save. Afterwards, view the students.json file to see your updated JSON file with the new person.**


Here is are possible routes you can take in our program to test some of our new features in MS2:


Route 1: 
 1. Add Course (1)
 2. Add Student (9)
 3. Add Student to Course (15)
 4. Add Assignment (6)
 5. Give a student a Grade (19)
 6. Add Assignment (6)
 7. Give a student a Grade (19)
 8. Compute a student’s course grade (21)

Route 2: 
 1. Add Course (1)
 2. Add Student (9)
 3. Add Student (9)
 4. Add student to Course (15)
 5. Add student to Course (15)
 6. Add Assignment (6)
 7. Give a student a Grade (19)
 8. Give a student a Grade (19)
 9. Compute a student’s course grade (21)
 10. Compute mean and median grade of an assignment (22)

Route 3: 
1. Print all People (14) *To see load feature in effect*
2. Add a Student (9)
3. Add a Professor (10)
4. Save People Data (6) 
5. Go View the students.json *To see save feature in effect*




