open People

type assignment = {
  mutable title : string;
  mutable id : int;
  mutable weight : int;
  mutable student_grades : (string * int) list;
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

let pp_a (a : assignment) =
  print_string ("Title: " ^ a.title);
  print_string " | ID: ";
  print_int a.id;
  print_string " | Weight: ";
  print_int a.weight;
  print_newline ()

let pp_c c =
  print_string ("Title: " ^ c.title);
  print_string " | ID: ";
  print_int c.id;
  print_newline ();
  print_string "Professors: ";
  print_newline ();
  List.iter People.pp_professor c.professors;
  print_string "Students: ";
  print_newline ();
  List.iter People.pp_student c.students;
  print_newline ();
  print_string "Assignments: ";
  print_newline ();
  List.iter pp_a c.assignments;
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

let edit_course_assignment id new_assignments c =
  let course = find_course id !c in
  match course with
  | Some course -> course.assignments <- new_assignments
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

let add_student_to_course c s nid cid =
  let student = People.find_student nid s in
  match student with
  | None ->
      print_string "Student not found.";
      print_newline ()
  | Some student -> (
      let course = find_course cid !c in
      match course with
      | Some course -> course.students <- student :: course.students
      | None ->
          print_string "Course not found.";
          print_newline ())

let add_professor_to_course c p nid cid =
  let professor = People.find_professor nid p in
  match professor with
  | None ->
      print_string "Professor not found.";
      print_newline ()
  | Some professor -> (
      let course = find_course cid !c in
      match course with
      | Some course ->
          course.professors <- professor :: course.professors
      | None ->
          print_string "Course not foud.";
          print_newline ())

let remove_student_from_course c s nid cid =
  let student = People.find_student nid s in
  match student with
  | None ->
      print_string "Student not found.";
      print_newline ()
  | Some student -> (
      let course = find_course cid !c in
      match course with
      | Some course ->
          course.students <-
            List.filter (fun x -> x <> student) course.students
      | None ->
          print_string "Course not found.";
          print_newline ())

let remove_professor_from_course c p nid cid =
  let professor = People.find_professor nid p in
  match professor with
  | None ->
      print_string "Professor not found.";
      print_newline ()
  | Some professor -> (
      let course = find_course cid !c in
      match course with
      | Some course ->
          course.professors <-
            List.filter (fun x -> x <> professor) course.professors
      | None ->
          print_string "Course not found.";
          print_newline ())

let add_assignment_to_course c aid t w cid =
  let assignment =
    { title = t; id = aid; weight = w; student_grades = [] }
  in
  let course = find_course cid !c in
  match course with
  | Some course ->
      course.assignments <- assignment :: course.assignments
  | None ->
      print_string "Course not found.";
      print_newline ()

let rec find_assignment aid (a : assignment list) =
  let assignments = a in
  match assignments with
  | h :: t -> if h.id = aid then Some h else find_assignment aid a
  | [] -> None

let remove_assignment_for_real a c =
  match a with
  | Some a ->
      c.assignments <- List.filter (fun x -> x <> a) c.assignments
  | None ->
      print_string "Assignment not found.";
      print_newline ()

let remove_assignment_from_course c aid cid =
  let course = find_course cid !c in
  match course with
  | Some course ->
      remove_assignment_for_real
        (find_assignment aid course.assignments)
        course
  | None -> ()

let edit_assignment_for_real aid f v c =
  let assignment = find_assignment aid c.assignments in
  match assignment with
  | Some assignment ->
      if f = "title" then assignment.title <- v
      else if f = "id" then assignment.id <- int_of_string v
      else assignment.weight <- int_of_string v
  | None ->
      print_string "Assignment not found.";
      print_newline ()

let edit_assignment_in_course c aid f v cid =
  let course = find_course cid !c in
  match course with
  | Some course -> edit_assignment_for_real aid f v course
  | None -> ()

let edit_student_grade lst student_id grade =
  let rec edit_grade lst student_id grade acc =
    match lst with
    | [] -> (student_id, grade) :: acc
    | h :: t -> (
        match h with
        | id, g ->
            if id = student_id then
              edit_grade t student_id grade ((student_id, grade) :: acc)
            else edit_grade t student_id grade ((id, g) :: acc))
  in
  edit_grade lst student_id grade []

let edit_assignment (lst : assignment list) assign_id grades :
    assignment list =
  let rec edit_assignment_helper
      (lst : assignment list)
      assign_id
      (new_ass : assignment)
      acc =
    match lst with
    | [] -> acc
    | h :: t ->
        if h.id = assign_id then
          edit_assignment_helper t assign_id new_ass (new_ass :: acc)
        else edit_assignment_helper t assign_id new_ass (h :: acc)
  in
  edit_assignment_helper lst assign_id grades []

let assign_grade
    (c : course list ref)
    (course_id : int)
    assign_id
    student_id
    grade =
  let course = find_course course_id !c in
  match course with
  | None -> failwith "Course doesn't exist"
  | Some h -> (
      let assignment = find_assignment assign_id h.assignments in
      match assignment with
      | None -> failwith "Assignment does not exist"
      | Some a ->
          let grades =
            edit_student_grade a.student_grades student_id grade
          in
          let new_assignment = { a with student_grades = grades } in
          let new_assignments =
            edit_assignment h.assignments assign_id new_assignment
          in
          edit_course_assignment course_id new_assignments c)

let rec get_grade id (grades : (string * int) list) =
  match grades with
  | [] -> ()
  | h :: t -> (
      match h with
      | k, v ->
          if k = id then print_string (string_of_int v)
          else get_grade id t)

let print_grade c netid course_id assignment_id =
  print_newline ();
  let course = find_course course_id !c in
  match course with
  | None -> failwith "No course"
  | Some course -> (
      let assignment =
        find_assignment assignment_id course.assignments
      in
      match assignment with
      | None -> failwith "Not an assignment"
      | Some assignment ->
          let grades = assignment.student_grades in
          get_grade netid grades)
