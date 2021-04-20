(** Representation of courses in the CMS database

    This module represents the data stored in a list of courses,
    including the assignments and students. It handles loading of that
    data from JSON as well as querying the data. *)

(** The abstract type of values representing courses. *)

type course 

type t

(** [empty ()] is the empty t list *)
val empty : t

(** [add_course i t c] modifies [c] by adding a new course with id [i],
    title [t], and empty students, professors, and assignments lists.
    The rest of the elements are unchanged. *)
val add_course : int -> string -> t ref -> unit

(** [delete_course i c] modifies [c] by removing the course with id [i].
    The rest of the element are unchanged. *)
val delete_course : int -> t ref -> unit

(** [edit_course i f v] modifies the field [f] in course with id [i]
    with new value [v]. The rest of the elements are unchanged.
    Requires: [f] can only be either 'title' or 'id' *)
val edit_course : int -> string -> string -> t ref -> unit

(** [print_course i] will print the information of the course with id
    [i]. Prints "Course not found" if no course has id [i] *)
val print_course : int -> t ref -> unit

(** [print_all_courses] will print the information for all courses. *)
val print_all_courses : t ref -> unit

(** [add_student_to_course c s nid cid] will add student from student list [s] 
    with net id [nid] to course with id [cid] in courses [c] *)
val add_student_to_course: t ref -> People.t ref -> string -> int -> unit

(** [remove_student_from_course c s nid cid] remove student from student list [s] 
    with net id [nid] from course with id [cid] in courses [c]*)
val remove_student_from_course : t ref -> People.t ref -> string -> int -> unit

(** [add_professor_to_course c p nid cid] will add professor from professor list [p] 
    with net id [nid] to course with id [cid] in courses [c] *)
val add_professor_to_course: t ref -> People.t ref -> string -> int -> unit

(** [remove_professor_from_course c p nid cid] remove professor from professor list [p] 
    with net id [nid] from course with id [cid] in courses [c] *)
 val remove_professor_from_course : t ref -> People.t ref -> string -> int -> unit

(** [add_assignment_to_course c aid t w cid] will add assignment with id [aid], title [t],
    and weight [w] to course with id [cid] in courses [c] *)
 val add_assignment_to_course: t ref -> int -> string -> int -> int -> unit

(** [remove_assignment_from_course c aid cid] will remove assignment with id [aid] from 
    course with id [cid] in courses [c] *)
 val remove_assignment_from_course: t ref -> int -> int -> unit

 
 (** [edit_assignment_in_course c aid f v cid] will edit field [f] with new value [v] of 
    assignment with id [aid] in course with id [cid]in courses [c] *)
 val edit_assignment_in_course: t ref -> int -> string -> string -> int -> unit

 

