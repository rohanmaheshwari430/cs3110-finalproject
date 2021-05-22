open Courses
open People

(** This file contains the control flow for a Command Line Interface. It
    will contain a main menu where a client can enter numerical values
    to choose an operation within the CMS database. The CLI will run
    until the client chooses to exit the program. *)
let cms_courses = ref Courses.empty

let people_init = ref People.init

(* type json_type = { students: People.student list; professors:
   People.professor list; courses: Courses.t

   }

   type course_type = Courses.t

   let cms_json = Yojson.Basic.from_file "cms.json"

   let course_of_json j = { students = []; professors = []; assignments
   = []; title = j |> member "title" |> to_string; id = j |> member "id"
   |> to_int; }

   let p_c_json j = { students = j |> member "people" |> to_list;
   professors = j |> member "professors" |> to_list; courses = j |>
   member "courses" |> to_list |> List.map course_of_json;

   } *)

let load_data = assert true

let save_data = assert true

let admin_printed_menu () = 
  print_newline ();
  print_string "What would you like to do: ";
  print_newline ();
  print_newline ();
  print_string "Exit CMS (0)";
  print_newline ();
  print_newline ();
  print_string "COURSES OPERATIONS";
  print_newline ();
  print_newline ();
  print_string "Add a Course (1)";
  print_newline ();
  print_string "Edit a Course (2)";
  print_newline ();
  print_string "Delete a Course (3)";
  print_newline ();
  print_string "Print a Course (4)";
  print_newline ();
  print_string "Print all Courses (5)";
  print_newline ();
  print_newline ();
  print_string "COURSE ASSIGNMENTS OPERATIONS";
  print_newline ();
  print_newline ();
  print_string "Add Assignment to Course (6)";
  print_newline ();
  print_string "Remove Assignment from Course (7)";
  print_newline ();
  print_string "Edit Assignment in Course (8)";
  print_newline ();
  print_newline ();
  print_string "PEOPLE OPERATIONS";
  print_newline ();
  print_newline ();
  print_string "Add a student (9)";
  print_newline ();
  print_string "Add a professor (10)";
  print_newline ();
  print_string "Edit a person (11)";
  print_newline ();
  print_string "Delete a person (12)";
  print_newline ();
  print_string "Print a Person (13)";
  print_newline ();
  print_string "Print all people (14)";
  print_newline ();
  print_newline ();
  print_string "COURSE STAFF AND ENROLL/DROP OPERATIONS";
  print_newline ();
  print_newline ();
  print_string "Add Student to Course (15)";
  print_newline ();
  print_string "Add Professor to Course (16)";
  print_newline ();
  print_string "Remove Student from Course (17)";
  print_newline ();
  print_string "Remove Professor from Course (18)";
  print_newline ();
  print_newline ();
  print_string "GRADING OPERATIONS";
  print_newline ();
  print_newline ();
  print_string "Give a student a grade (19)";
  print_newline ();
  print_string "Print a students grade (20)";
  print_newline ();
  print_string "Compute a student's course grade (21)";
  print_newline ();
  print_string "Compute mean and median grade of an assignment (22)";
  print_newline ();
  print_newline ()

let professor_printed_menu () = 
  print_newline ();
  print_string "What would you like to do: ";
  print_newline ();
  print_newline ();
  print_string "Exit CMS (0)";
  print_newline ();
  print_newline ();
  print_string "COURSES OPERATIONS";
  print_newline ();
  print_newline ();
  print_string "Print a Course (4)";
  print_newline ();
  print_string "Print all Courses (5)";
  print_newline ();
  print_newline ();
  print_string "COURSE ASSIGNMENTS OPERATIONS";
  print_newline ();
  print_newline ();
  print_string "Add Assignment to Course (6)";
  print_newline ();
  print_string "Remove Assignment from Course (7)";
  print_newline ();
  print_string "Edit Assignment in Course (8)";
  print_newline ();
  print_newline ();
  print_string "PEOPLE OPERATIONS";
  print_newline ();
  print_newline ();
  print_string "Add a student (9)";
  print_newline ();
  print_string "Print a Person (13)";
  print_newline ();
  print_string "Print all people (14)";
  print_newline ();
  print_newline ();
  print_string "COURSE STAFF AND ENROLL/DROP OPERATIONS";
  print_newline ();
  print_newline ();
  print_string "Add Student to Course (15)";
  print_newline ();
  print_string "Remove Student from Course (17)";
  print_newline ();
  print_newline ();
  print_string "GRADING OPERATIONS";
  print_newline ();
  print_newline ();
  print_string "Give a student a grade (19)";
  print_newline ();
  print_string "Print a students grade (20)";
  print_newline ();
  print_string "Compute a student's course grade (21)";
  print_newline ();
  print_string "Compute mean and median grade of an assignment (22)";
  print_newline ();
  print_newline ()

let professor_printed_menu () = 
print_newline ();
print_string "What would you like to do: ";
print_newline ();
print_newline ();
print_string "Exit CMS (0)";
print_newline ();
print_newline ();
print_string "COURSES OPERATIONS";
print_newline ();
print_newline ();
print_string "Print a Course (4)";
print_newline ();
print_string "Print all Courses (5)";
print_newline ();
print_newline ();
print_string "COURSE ASSIGNMENTS OPERATIONS";
print_newline ();
print_newline ();
print_string "Add Assignment to Course (6)";
print_newline ();
print_string "Remove Assignment from Course (7)";
print_newline ();
print_string "Edit Assignment in Course (8)";
print_newline ();
print_newline ();
print_string "PEOPLE OPERATIONS";
print_newline ();
print_newline ();
print_string "Add a student (9)";
print_newline ();
print_string "Print a Person (13)";
print_newline ();
print_string "Print all people (14)";
print_newline ();
print_newline ();
print_string "COURSE STAFF AND ENROLL/DROP OPERATIONS";
print_newline ();
print_newline ();
print_string "Add Student to Course (15)";
print_newline ();
print_string "Remove Student from Course (17)";
print_newline ();
print_newline ();
print_string "GRADING OPERATIONS";
print_newline ();
print_newline ();
print_string "Give a student a grade (19)";
print_newline ();
print_string "Print a students grade (20)";
print_newline ();
print_string "Compute a student's course grade (21)";
print_newline ();
print_string "Compute mean and median grade of an assignment (22)";
print_newline ();
print_newline ()


let student_printed_menu () = 
  print_newline ();
  print_string "What would you like to do: ";
  print_newline ();
  print_newline ();
  print_string "Exit CMS (0)";
  print_newline ();
  print_newline ();
  print_string "COURSES OPERATIONS";
  print_newline ();
  print_newline ();
  print_string "Print a Course (4)";
  print_newline ();
  print_string "Print all Courses (5)";
  print_newline ();
  print_newline ();
  print_string "PEOPLE OPERATIONS";
  print_newline ();
  print_newline ();
  print_string "Print a Person (13)";
  print_newline ();
  print_newline ();
  print_string "GRADING OPERATIONS";
  print_newline ();
  print_newline ();
  print_string "Print a students grade (20)";
  print_newline ();
  print_string "Compute a student's course grade (21)";
  print_newline ();
  print_newline ()
    
  

let option_1 () = 
  print_string "Enter a Course title: ";
  let title = read_line () in
  print_newline ();
  print_string "Enter a Course ID: ";
  let id = read_int () in
  print_newline ();
  Courses.add_course id title cms_courses

let option_2 () =  
  print_string "Enter a Course ID: ";
  let id = read_int () in
  print_newline ();
  print_string "Enter a field to edit (title or id): ";
  let field = read_line () in
  print_newline ();
  if field = "title" then (
  print_string "Enter a new title: ";
  let new_title = read_line () in
  print_newline ();
  Courses.edit_course id field new_title cms_courses)
else if field = "id" then (
  print_string "Enter a new id: ";
  let new_id = read_int () in
  print_newline ();
  Courses.edit_course id field (string_of_int new_id) cms_courses)

let option_3 () = 
  print_string "Enter a Course ID: ";
  let id = read_int () in
  print_newline ();
  Courses.delete_course id cms_courses


let option_4 () =  
  print_string "Enter a Course ID: ";
  let id = read_int () in
  print_newline ();
  Courses.print_course id cms_courses
let option_5 () = 
  Courses.print_all_courses cms_courses

let option_6 () = 
  print_string "Enter an Assignment ID: ";
  let id = read_int () in
  print_newline ();
  print_string "Enter an Assignment title: ";
  let title = read_line () in
  print_newline ();
  print_string "Enter the weight of this assignment: ";
  let weight = read_int () in
  print_newline ();
  print_string "Enter the course id for this assignment: ";
  let course_id = read_int () in
  Courses.add_assignment_to_course cms_courses id title weight course_id

let option_7 () = 
  print_string "Enter an Assignment ID: ";
  let id = read_int () in
  print_newline ();
  print_string "Enter the course id for this assignment: ";
  let course_id = read_int () in
  Courses.remove_assignment_from_course cms_courses id course_id

let option_8 () = 
  print_string "Enter an Assignment ID: ";
  let id = read_int () in print_newline ();
  print_string "Enter the field to edit (title, id, weight): ";
  let field = read_line () in print_newline ();
  print_string "Enter the course id for this assignment: ";
  let course_id = read_int () in
  if field = "title" then (
    print_string "Enter a new title: "; 
    let title = read_line () in
    Courses.edit_assignment_in_course cms_courses id field title course_id)
  else if field = "id" then (
    print_string "Enter a new id: ";
    let new_id = read_int () in
    Courses.edit_assignment_in_course cms_courses id field
      (string_of_int new_id) course_id)
  else if field = "weight" then (
    print_string "Enter a new weight: ";
    let new_weight = read_int () in
    Courses.edit_assignment_in_course cms_courses id field
      (string_of_int new_weight) course_id)
let option_9 () = 
  print_string "Enter your netid: ";
  let id = read_line () in
  print_newline ();
  print_string "Enter the name: ";
  let n = read_line () in
  print_newline ();
  print_string "Enter the grad year: ";
  let gy = read_int () in
  print_newline ();
  People.add_student id n gy people_init

let option_10 () = 
  print_string "Enter your netid: ";
  let id = read_line () in
  print_newline ();
  print_string "Enter the name: ";
  let n = read_line () in
  print_newline ();
  People.add_prof id n people_init

let option_11 () = 
  print_string "Enter your netid: ";
  let id = read_line () in
  print_newline ();
  print_string "Enter the new name: ";
  let value = read_line () in
  print_newline ();
  People.edit_person id value people_init

let option_12 () = 
  print_string "Enter the netid of the person to be deleted: ";
  let id = read_line () in
  print_newline ();
  People.del_person id people_init

let option_13 () = 
  print_string "Enter the netid of the person: ";
  let id = read_line () in
  print_newline ();
  People.pp_person id people_init

let option_14 () = 
  People.pp_people people_init

let option_15 () = 
  print_string "Enter the netid of the student: ";
  let netid = read_line () in
  print_newline ();
  print_string "Enter the id of the course: "; 
  let course_id = read_int () in
  print_newline ();
  Courses.add_student_to_course cms_courses people_init netid course_id

let option_16 () = 
  print_string "Enter the netid of the professor: ";
  let netid = read_line () in
  print_newline ();
  print_string "Enter the id of the course: ";
  let course_id = read_int () in
  print_newline ();
  Courses.add_professor_to_course cms_courses people_init netid course_id

let option_17 () = 
  print_string "Enter the netid of the student: ";
  let netid = read_line () in
  print_newline ();
  print_string "Enter the id of the course: ";
  let course_id = read_int () in
  print_newline ();
  Courses.remove_student_from_course cms_courses people_init netid course_id

let option_18 () = 
  print_string "Enter the netid of the professor: ";
  let netid = read_line () in
  print_newline ();
  print_string "Enter the id of the course: ";
  let course_id = read_int () in
  print_newline ();
  Courses.remove_professor_from_course cms_courses people_init netid course_id

let option_19 () = 
  print_string "Enter the id of the course: ";
  let course_id = read_int () in
  print_string "Enter the assignment id in the course: ";
  let assign_id = read_int () in
  print_newline ();
  print_string "Enter the student id in the course: ";
  let netid = read_line () in
  print_newline ();
  print_string "Enter the grade to be assigned: ";
  let grade = read_int () in
  print_newline ();
  Courses.assign_grade cms_courses course_id assign_id netid grade

let option_20 () = 
  print_string "Enter the id of the course: ";
  let course_id = read_int () in
  print_string "Enter the assignment id in the course: ";
  let assign_id = read_int () in
  print_newline ();
  print_string "Enter the student id in the course: ";
  let netid = read_line () in
  print_newline ();
  Courses.print_grade cms_courses netid course_id assign_id

let option_21 () = 
  print_string "Enter the id of the course: ";
  let course_id = read_int () in
  print_string "Enter the student id in the course: ";
  let netid = read_line () in
  print_newline ();
  Courses.final_course_grade cms_courses netid course_id

let option_22 () = 
  print_string "Enter the course id: ";
  let course_id = read_int () in
  print_newline ();
  print_string "Enter the assignment id: ";
  let assign_id = read_int () in
  print_newline ();
  Courses.print_mean_median cms_courses course_id assign_id

let welcome_message = 
  print_string "Welcome to CMS, command line edition!";
  print_newline ();
  print_newline ();
  print_string "In this program, depending on your user ";
  print_newline ();
  print_string "type you will have options to manage ";
  print_newline ();
  print_string "courses, grades, faculty, students and more. ";
  print_newline ();
  print_newline ();
  print_string "Developed and Maintained by: ";
  print_newline ();
  print_newline ();
  print_string  "Samiksha Hiranandani";
  print_newline ();
  print_string "Sukriti Sudhakar";
  print_newline ();
  print_string "Rohan Maheshwari";
  print_newline ()



let admin_menu n =
  let quit_loop = ref false in
  while not !quit_loop do
    admin_printed_menu ();
    print_string "Choose an option: ";
    let option = read_int () in
    if option = 1 then option_1 () else if option = 2 then option_2 ()
    else if option = 3 then option_3 () else if option = 4 then option_4 ()
    else if option = 5 then option_5 () else if option = 6 then option_6 ()
    else if option = 7 then option_7 () else if option = 8 then option_8 ()
    else if option = 9 then option_9 () else if option = 10 then option_10 ()
    else if option = 11 then option_11 () else if option = 12 then option_12 ()
    else if option = 13 then option_13 () else if option = 14 then option_14 ()
    else if option = 15 then option_15 () else if option = 16 then option_16 ()
    else if option = 17 then option_17 () else if option = 18 then option_18 ()
    else if option = 19 then option_19 () else if option = 20 then option_20 ()
    else if option = 21 then option_21 () else if option = 22 then option_22 ()
    else if option = 0 then quit_loop := true
  done


let professor_menu n = 
  let quit_loop = ref false in
  while not !quit_loop do
    professor_printed_menu ();
    print_string "Choose an option: ";
    let option = read_int () in
    if option = 4 then option_4 ()
    else if option = 6 then option_6 ()
    else if option = 7 then option_7 () else if option = 8 then option_8 ()
    else if option = 9 then option_9 () else if option = 10 then option_10 ()
    else if option = 13 then option_13 () else if option = 14 then option_14 ()
    else if option = 15 then option_15 () else if option = 17 then option_17 () 
    else if option = 19 then option_19 () else if option = 20 then option_20 ()
    else if option = 21 then option_21 () else if option = 22 then option_22 ()
    else if option = 0 then quit_loop := true
  done

  let student_menu n = 
    let quit_loop = ref false in
    while not !quit_loop do
      student_printed_menu ();
      print_string "Choose an option: ";
      let option = read_int () in
      if option = 4 then option_4 ()
      else if option = 20 then option_20 ()
      else if option = 21 then option_21 ()
      else if option = 0 then quit_loop := true
    done
    
  

let user_type () = 
  print_string "Who are you?";
  print_newline ();
  print_string "Admin | Professor | Student";
  print_newline ();
  print_newline ();
  print_string "Enter your role (case sensitive): ";
  let response = read_line () in
  if response = "Admin" then admin_menu ()
  else if response = "Professor" then professor_menu ()
  else if response = "Student" then student_menu ()
  else print_string "Invalid role. Goodbye."


