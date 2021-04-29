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

let menu n =
  let quit_loop = ref false in
  while not !quit_loop do
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

    print_string "Choose an option: ";
    let option = read_int () in
    if option = 1 then (
      print_string "Enter a Course title: ";
      let title = read_line () in
      print_newline ();
      print_string "Enter a Course ID: ";
      let id = read_int () in
      print_newline ();
      Courses.add_course id title cms_courses)
    else if option = 2 then (
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
        Courses.edit_course id field (string_of_int new_id) cms_courses))
    else if option = 3 then (
      print_string "Enter a Course ID: ";
      let id = read_int () in
      print_newline ();
      Courses.delete_course id cms_courses)
    else if option = 4 then (
      print_string "Enter a Course ID: ";
      let id = read_int () in
      print_newline ();
      Courses.print_course id cms_courses)
    else if option = 5 then Courses.print_all_courses cms_courses
    else if option = 6 then (
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
      Courses.add_assignment_to_course cms_courses id title weight
        course_id)
    else if option = 7 then (
      print_string "Enter an Assignment ID: ";
      let id = read_int () in
      print_newline ();
      print_string "Enter the course id for this assignment: ";
      let course_id = read_int () in
      Courses.remove_assignment_from_course cms_courses id course_id)
    else if option = 8 then (
      print_string "Enter an Assignment ID: ";
      let id = read_int () in
      print_newline ();
      print_string "Enter the field to edit (title, id, weight): ";
      let field = read_line () in
      print_newline ();
      print_string "Enter the course id for this assignment: ";
      let course_id = read_int () in
      if field = "title" then (
        print_string "Enter a new title: ";
        let title = read_line () in
        Courses.edit_assignment_in_course cms_courses id field title
          course_id)
      else if field = "id" then (
        print_string "Enter a new id: ";
        let new_id = read_int () in
        Courses.edit_assignment_in_course cms_courses id field
          (string_of_int new_id) course_id)
      else if field = "weight" then (
        print_string "Enter a new weight: ";
        let new_weight = read_int () in
        Courses.edit_assignment_in_course cms_courses id field
          (string_of_int new_weight)
          course_id))
    else if option = 9 then (
      print_string "Enter your netid: ";
      let id = read_line () in
      print_newline ();
      print_string "Enter the name: ";
      let n = read_line () in
      print_newline ();
      print_string "Enter the grad year: ";
      let gy = read_int () in
      print_newline ();
      People.add_student id n gy people_init)
    else if option = 10 then (
      print_string "Enter your netid: ";
      let id = read_line () in
      print_newline ();
      print_string "Enter the name: ";
      let n = read_line () in
      print_newline ();
      People.add_prof id n people_init)
    else if option = 11 then (
      print_string "Enter your netid: ";
      let id = read_line () in
      print_newline ();
      print_string "Enter the new name: ";
      let value = read_line () in
      print_newline ();
      People.edit_person id value people_init)
    else if option = 12 then (
      print_string "Enter the netid of the person to be deleted: ";
      let id = read_line () in
      print_newline ();
      People.del_person id people_init)
    else if option = 13 then (
      print_string "Enter the netid of the person: ";
      let id = read_line () in
      print_newline ();
      People.pp_person id people_init)
    else if option = 14 then People.pp_people people_init
    else if option = 15 then (
      print_string "Enter the netid of the student: ";
      let netid = read_line () in
      print_newline ();
      print_string "Enter the id of the course: ";
      let course_id = read_int () in
      print_newline ();
      Courses.add_student_to_course cms_courses people_init netid
        course_id)
    else if option = 16 then (
      print_string "Enter the netid of the professor: ";
      let netid = read_line () in
      print_newline ();
      print_string "Enter the id of the course: ";
      let course_id = read_int () in
      print_newline ();
      Courses.add_professor_to_course cms_courses people_init netid
        course_id)
    else if option = 17 then (
      print_string "Enter the netid of the student: ";
      let netid = read_line () in
      print_newline ();
      print_string "Enter the id of the course: ";
      let course_id = read_int () in
      print_newline ();
      Courses.remove_student_from_course cms_courses people_init netid
        course_id)
    else if option = 18 then (
      print_string "Enter the netid of the professor: ";
      let netid = read_line () in
      print_newline ();
      print_string "Enter the id of the course: ";
      let course_id = read_int () in
      print_newline ();
      Courses.remove_professor_from_course cms_courses people_init netid
        course_id)
    else if option = 19 then (
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
      Courses.assign_grade cms_courses course_id assign_id netid grade)
    else if option = 20 then (
      print_string "Enter the id of the course: ";
      let course_id = read_int () in
      print_string "Enter the assignment id in the course: ";
      let assign_id = read_int () in
      print_newline ();
      print_string "Enter the student id in the course: ";
      let netid = read_line () in
      print_newline ();
      Courses.print_grade cms_courses netid course_id assign_id)
    else if option = 21 then (
      print_string "Enter the id of the course: ";
      let course_id = read_int () in
      print_string "Enter the student id in the course: ";
      let netid = read_line () in 
      print_newline ();
      Courses.final_course_grade cms_courses netid course_id)
    else if option = 0 then quit_loop := true
  done
