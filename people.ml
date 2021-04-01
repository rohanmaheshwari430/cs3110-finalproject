(** Develop a person signature and implement it as a 'student' and a
    'teacher' in two separate structs below. *)

exception NotAStudent

exception NotAProfessor

type student = {
  mutable name : string;
  s_netid : string;
  mutable grad_year : int;
  mutable courses : (string * int) list; (* (course title, course id) *)
}

type professor = {
  mutable name : string;
  p_netid : string;
  mutable courses : (string * int) list; (* (course title, course id) *)
}

type t = {
  mutable students : student list;
  mutable professors : professor list;
}

type person =
  | Student of student
  | Professor of professor

let init = { students = []; professors = [] }

(** [pp_student] will pretty print the high-level fields of a student *)
let pp_student (p : student) =
  print_string ("Name: " ^ p.name);
  print_string " | Netid: ";
  print_string p.s_netid;
  print_string " | Grad Year: ";
  print_int p.grad_year;
  print_newline ()

(** [pp_professor] will pretty print the high-level fields of a
    professor *)

let pp_professor (p : professor) =
  print_string ("Name: " ^ p.name);
  print_string " | Netid: ";
  print_string p.p_netid;
  print_newline ()

let add_student id n gy c =
  let new_student =
    { name = n; s_netid = id; grad_year = gy; courses = [] }
  in
  c :=
    {
      students = new_student :: !c.students;
      professors = !c.professors;
    }

let add_prof id n c =
  let new_prof = { name = n; p_netid = id; courses = [] } in
  c :=
    { students = !c.students; professors = new_prof :: !c.professors }

let del_person id c =
  let new_professors =
    List.filter (fun x -> x.p_netid <> id) !c.professors
  in
  let new_students =
    List.filter (fun y -> y.s_netid <> id) !c.students
  in
  c := { students = new_students; professors = new_professors }

let edit_student id value c =
  let rec find_student_helper id s_list =
    match s_list with
    | [] -> raise NotAStudent
    | h :: t ->
        if h.s_netid = id then h.name <- value
        else find_student_helper id t
  in
  find_student_helper id !c.students

let edit_professor id value c =
  let rec find_prof_helper id p_list =
    match p_list with
    | [] -> raise NotAProfessor
    | h :: t ->
        if h.p_netid = id then h.name <- value
        else find_prof_helper id t
  in
  find_prof_helper id !c.professors

(* You can only change the name of the student/professor *)
let edit_person id value c =
  try edit_professor id value c
  with NotAProfessor -> edit_student id value c

let print_professor id c =
  let rec print_prof_helper id p_list =
    match p_list with
    | [] -> raise NotAProfessor
    | h :: t ->
        if h.p_netid = id then pp_professor h
        else print_prof_helper id t
  in
  print_prof_helper id !c.professors

let print_student id c =
  let rec print_stud_helper id p_list =
    match p_list with
    | [] -> failwith "Not a astudent or a professor"
    | h :: t ->
        if h.s_netid = id then pp_student h else print_stud_helper id t
  in
  print_stud_helper id !c.students

let pp_person id c =
  try print_professor id c with NotAProfessor -> print_student id c

let pp_people c =
  let rec pp_students s_list =
    match s_list with
    | [] -> print_string " "
    | h :: t ->
        pp_student h;
        pp_students t
  in
  let rec pp_professors p_list =
    match p_list with
    | [] -> print_string " "
    | h :: t ->
        pp_professor h;
        pp_professors t
  in
  pp_students !c.students;
  pp_professors !c.professors



let find_student nid c =
  let students = !c.students in 
  let rec find_student_helper nid s =
    match s with 
    | [] -> None
    | h::t -> 
      if h.s_netid = nid then Some h
      else find_student_helper nid t 
    in
  find_student_helper nid students


