open People

type assignment = {
  title : string;
  id : int;
  weight : int;
      (* student_grades: int * int list *)
      (*To be implemented in MS2*)
}

(* type student = { name: string; netid: int; grad_year: int; courses:
   string * int list; (* (course title, course id) *) }

   type professor = { name: string; netid: int; courses: string * int
   list (* (course title, course id) *) } *)

type course = {
  mutable students : student list;
  mutable professors : professor list;
  mutable assignments : assignment list;
  mutable title : string;
  mutable id : int;
}

type t = course list

(* Helper functions *)

(** [find_courses] will find a course by id [i]. Returns an optional
    course *)
let find_course i c =
  try Some (c |> List.filter (fun x -> x.id = i) |> List.hd)
  with Failure hd -> None

(** [pp_student] will pretty print the high-level fields of a student *)

(* let pp_student (p : People.student) = print_string ("Name: " ^
   p.name); print_string " | Netid: "; print_int p.netid; print_string "
   | Grad Year: "; print_int p.grad_year; print_newline () *)

(** [pp_professor] will pretty print the high-level fields of a
    professor *)

(* let pp_professor (p : professor) = print_string ("Name: " ^ p.name);
   print_string " | Netid: "; print_int p.netid; print_newline () *)

(** [pp_professor] will pretty print the high-level fields of a course *)
let pp_c c =
  print_string ("Title: " ^ c.title);
  print_string " | ID: ";
  print_int c.id;
  print_newline ();
  List.iter People.pp_professor c.professors;
  print_newline ();
  List.iter People.pp_student c.students;
  print_newline ()

let add_course i t c =
  let new_course =
    {
      students = [];
      professors = [];
      assignments = [];
      title = t;
      id = i;
    }
  in
  c := new_course :: !c

let delete_course i c = c := List.filter (fun x -> x.id <> i) !c

let edit_course i f v c =
  let course = find_course i !c in
  match course with
  | Some course ->
      if f = "title" then course.title <- v
      else course.id <- int_of_string v
  | None ->
      print_string "Course not found.";
      print_newline ();
      print_newline ()

let print_course i c =
  let course = find_course i !c in
  match course with
  | Some course -> pp_c course
  | None ->
      print_string "Course not found.";
      print_newline ();
      print_newline ()

let print_all_courses c =
  print_newline ();
  print_string "Courses: ";
  print_newline ();
  print_newline ();
  List.iter pp_c !c

let empty = []
