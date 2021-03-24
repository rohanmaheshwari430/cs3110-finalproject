(** Representation of courses in the CMS database


    This module represents the data stored in a list of courses, including
    the assignments and students. It handles loading of that data from JSON as
    well as querying the data. *)

(** The abstract type of values representing courses. *)
type t 

(** [empty ()] is the empty t list *)
val empty: t

(** [add_course i t c] modifies [c] by adding a new course 
    with id [i], title [t], and empty students, professors, 
    and assignments lists. The rest of the elements are
    unchanged.
*)
val add_course: int -> string -> t ref -> unit

(** [delete_course i c] modifies [c] by removing the course
    with id [i]. The rest of the element are unchanged.
*)
val delete_course: int -> t ref -> unit

(** [edit_course i f v] modifies the field [f] in course
    with id [i] with new value [v]. The rest of the elements
    are unchanged.
    Requires: [f] can only be either 'title' or 'id'
*)
val edit_course: int -> string -> string -> t ref -> unit

(** [print_course i] will print the information of the 
    course with id [i]. Prints "Course not found" if no
    course has id [i]
*)
val print_course: int -> t ref -> unit

(** [print_all_courses] will print the information for
    all courses.
*)
val print_all_courses: t ref -> unit















