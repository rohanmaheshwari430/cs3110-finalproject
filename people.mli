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

(** [pp_person id c ] will print the information of the person with id
    [id]. Prints "Not a student or a professor" if no person has id [id] *)
val pp_person : string -> t ref -> unit

val pp_professor : professor -> unit

val pp_student : student -> unit

(** [pp_people c ] will print the information of all the people
    currently enrolled in CMS *)
val pp_people : t ref -> unit
