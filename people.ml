(** Representation of students and professors in the CMS database *)
open Yojson.Basic.Util

exception NotAStudent

exception NotAProfessor


type student_course = {
  name : string;
  id : int;
}

(* The representation of students with fields name, netid, grad year, enrolled courses*)
type student = {
  mutable name : string;
  s_netid : string;
  mutable grad_year : int;
  mutable courses : student_course list; (* (course title, course id) *)
}

(* The representation of students with fields name, netid, teaching courses*)
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

let student_len c = List.length !c.students

let professor_len c = List.length !c.professors

(** [pp_student] will pretty print the high-level fields of a student *)
let pp_student (p : student) =
  print_string "|-------------------------------------------------|";
  print_newline ();
  print_newline ();
  print_string (" Name: " ^ p.name);
  print_string " | Netid: ";
  print_string p.s_netid;
  print_string " | Grad Year: ";
  print_int p.grad_year;
  print_newline ();
  print_string "|-------------------------------------------------|"

(** [pp_professor] will pretty print the high-level fields of a
    professor *)

let pp_professor (p : professor) =
  print_string "|-------------------------------------------------|";
  print_newline ();
  print_newline ();
  print_string (" Name: " ^ p.name);
  print_string " | Netid: ";
  print_string p.p_netid;
  print_newline ();
  print_newline ();
  print_string "|-------------------------------------------------|"

let courses_of_person students_json =
  {
    name = students_json |> member "cname" |> to_string;
    id = students_json |> member "course_id" |> to_int;
  }

let students students_json =
  {
    name = students_json |> member "name" |> to_string;
    s_netid = students_json |> member "netid" |> to_string;
    grad_year = students_json |> member "grad_year" |> to_int;
    courses =
      students_json |> member "courses" |> to_list
      |> List.map courses_of_person;
  }

let student_list_of_json student_json =
  {
    students =
      student_json |> member "students" |> to_list |> List.map students;
    professors = [];
  }

let add_student_json student c =
  let new_student = student in
  c :=
    {
      students = new_student :: !c.students;
      professors = !c.professors;
    }

let populate_students student_json (c : t ref) =
  let student_list = student_list_of_json student_json in
  let stud_list = student_list.students in
  let rec populate_helper stud_list c =
    match stud_list with
    | [] -> print_string ""
    | h :: tail ->
        add_student_json h c;
        populate_helper tail c
  in
  populate_helper stud_list c

let rec students_list_builder (s : student list) acc =
  match s with
  | [] -> `List acc
  | h :: t ->
      students_list_builder t
        (`Assoc
           [
             ("name", `String h.name);
             ("netid", `String h.s_netid);
             ("grad_year", `Int h.grad_year);
           ]
        :: acc)

let rec professors_list_builder (p : professor list) acc =
  match p with
  | [] -> `List acc
  | h :: t ->
      professors_list_builder t
        (`Assoc
           [ ("name", `String h.name); ("netid", `String h.p_netid) ]
        :: acc)

let create_json c =
  (* `Assoc [("students", `List [`Assoc [ ("name", `String "Anil");
     ("grad_year", `Int 2024); ("netid", `String "a123"); ("courses",
     `List [`Assoc [("name", `String "calc"); ("id", `Int 1910)]])]])] *)
  let student_list = students_list_builder !c.students [] in
  let professor_list = professors_list_builder !c.professors [] in
  let value_students = student_list in
  let value_professors = professor_list in
  let string_json =
    Yojson.to_string
      (`Assoc
        [
          ("students", value_students); ("professors", value_professors);
        ])
  in
  (* Write message to file *)
  let oc = open_out "studentss_json.json" in
  (* create or truncate file, return channel *)
  Printf.fprintf oc "%s\n" string_json;
  (* write something *) close_out oc

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
    | h :: t ->
        if h.s_netid = nid then Some h else find_student_helper nid t
  in
  find_student_helper nid students

let find_professor nid c =
  let professors = !c.professors in
  let rec find_professor_helper nid p =
    match p with
    | [] -> None
    | h :: t ->
        if h.p_netid = nid then Some h else find_professor_helper nid t
  in
  find_professor_helper nid professors

let get_student_title id c =
  let students = !c.students in
  let rec find_student id s =
    match s with
    | [] -> "No studnet found"
    | h :: t -> if h.s_netid = id then h.name else find_student id t
  in
  find_student id students

let get_professor_title id c =
  let professors = !c.professors in
  let rec find_prof id s =
    match s with
    | [] -> "No studnet found"
    | h :: t -> if h.p_netid = id then h.name else find_prof id t
  in
  find_prof id professors

let get_title id c =
  try get_professor_title id c
  with NotAProfessor -> get_student_title id c
