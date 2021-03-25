open Courses
(** This file contains the control flow for a Command Line Interface.
    It will contain a main menu where a client can enter numerical
    values to choose an operation within the CMS database. The CLI
    will run until the client chooses to exit the program. 
*)
let cms_courses = ref Courses.empty

let menu n = 
  let quit_loop = ref false in
  while not !quit_loop do 
    print_string "What would you like to do: ";
    print_newline ();
    print_newline ();
    print_string "Exit CMS (0)";
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
    print_string "Choose an option: "; let option = read_int () in
    if (option = 1) then 
      (print_string "Enter a Course title: "; let title = read_line () in
      print_newline ();
      print_string "Enter a Course ID: "; let id = read_int () in
      print_newline ();
      Courses.add_course id title cms_courses)
    else if (option = 2) then 
      (print_string "Enter a Course ID: "; let id = read_int () in
      print_newline ();
      print_string "Enter a field to edit (title or id): "; let field = read_line () in
      print_newline ();
      if(field = "title") then 
        (print_string "Enter a new title: "; let new_title = read_line () in
        print_newline ();
        Courses.edit_course id field new_title cms_courses)
      else if(field = "id") then 
        (print_string "Enter a new id: "; let new_id = read_int () in
        print_newline ();
        Courses.edit_course id field (string_of_int new_id) cms_courses)
      )
    else if (option = 3) then 
      (print_string "Enter a Course ID: "; let id = read_int () in
      print_newline (); 
      Courses.delete_course id cms_courses)
    else if (option = 4) then
      (print_string "Enter a Course ID: "; let id = read_int () in
      print_newline (); 
      Courses.print_course id cms_courses)
    else if (option = 5) then
      Courses.print_all_courses cms_courses
      

      

      

      

   
      

    else if (option = 0) then
      quit_loop := true

  done