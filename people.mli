(** Representation of people in the CMS database

    This module represents the data stored in a list of students, and a
    list of professors. It handles loading of that data from JSON as
    well as querying the data. *)

(** The abstract type of values representing people. *)
type t

(*This is a variant which is either student or professor .*)
type person

type student

type professor

(** [init ()] is the empty t list *)
val init : t

(** [add_student id n gy c] modifies [c] by adding the student with
    netid = [id], name = [n], and grad year = [gy] *)
val add_student : string -> string -> int -> t ref -> unit

(** [add_prof id n gy c] modifies [c] by adding the professor with netid
    = [id], name = [n] *)
val add_prof : string -> string -> t ref -> unit

(** [delete_course id c] modifies [c] by removing the person with id
    [i]. The rest of the element are unchanged. *)
val del_person : string -> t ref -> unit

(** [edit_person id value] modifies the name of student/professor with
    id [id] with new value [value]. Prints "Not a student or a
    professor" if no person has id [id] *)
val edit_person : string -> string -> t ref -> unit

(** [pp_person id c] will print the information of the person with id
    [id]. Prints "Not a student or a professor" if no person has id [id] *)
val pp_person : string -> t ref -> unit

val pp_professor : professor -> unit

val pp_student : student -> unit

val create_json : t ref -> unit

(** [pp_people c ] will print the information of all the people
    currently enrolled in CMS *)
val pp_people : t ref -> unit

(** [find_student nid s] will find student with netid [nid] in people
    [s]. returns Some student if found, None otherwise *)
val find_student : string -> t ref -> student option

(** [find_professor nid p] will find professor with netid [nid] in
    people [p]. returns Some professor if found, None otherwise *)
val find_professor : string -> t ref -> professor option

(** [populate_students json p] will find popualate p with the fields in
    json *)
val populate_students : Yojson.Basic.t -> t ref -> unit

(** [add_student_json student p] will add student [student] to p *)
val add_student_json : student -> t ref -> unit

(** [student_list_of_json t] will create a list of students from [t]
    stored inside a people record *)
val student_list_of_json : Yojson.Basic.t -> t

(** [find_professor nid p] will find professor with netid [nid] in
    people [p]. returns Some professor if found, None otherwise *)
val find_professor : string -> t ref -> professor option

(** [populate_students json p] finds popualate [p] with the fields in
    [json] *)
val populate_students : Yojson.Basic.t -> t ref -> unit

(** [add_student_json student p] adds student [student] to p *)
val add_student_json : student -> t ref -> unit

(** [student_list_of_json t] creates a list of students from [t] stored
    inside a people record *)
val student_list_of_json : Yojson.Basic.t -> t

(** [students json] returns a student given the fields in [json] *)
val students : Yojson.Basic.t -> student

(** [student_len p] returns a the number of students in [p] *)
val student_len : t ref -> int

(** [professor_len p] returns a the number of professors in [p] *)
val professor_len : t ref -> int

(** [get_student_title netid] returns the name of a student with netid
    [netid] *)
val get_student_title : string -> t ref -> string

(** [get_professor_title netid] returns the name of a professor with
    netid [netid] *)
val get_professor_title : string -> t ref -> string

(** [get_title netid] returns the name of a person with netid [netid] *)
val get_title : string -> t ref -> string
