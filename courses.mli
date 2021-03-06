(** Representation of courses in the CMS database

    This module represents the data stored in a list of courses,
    including the assignments and students. It handles loading of that
    data from JSON as well as querying the data. *)

(** The abstract type of values representing courses. *)

type course

type t

(** [empty ()] is the empty t list *)
val empty : t

(** [len c] finds the amount of courses in  [c] by incremementing
    the argument [acc] through recursive calls *)
val len : t ref -> int 

(** [get_title i c] returns the title of course with id [i] in courses [c]*)
val get_title : int -> t ref -> string

(** [assignments_len c] finds the amount of assignments in [c] using List
    library *)
val assignments_len : int -> t ref -> int

(** [get_assignment_title i aid c] finds the title of assignment [aid] in 
    course [i] in courses [c] *)
val get_assignment_title: int -> int -> t ref -> string

(** [get_assignment_id i aid c] finds the title of assignment [aid] in 
    course [i] in courses [c] *)
val get_assignment_id: int -> int -> t ref -> int

(** [get_assignment_id i aid nid c] finds the grade of student [nid] in 
    assignment [aid] in course [i] in courses [c] *)
val get_student_grade_in_assignment : int -> int -> string -> t ref -> int 

(** [get_course_grade c nid cid] returns the grade value of student [nid] in 
    course [cid] in courses [c] *)
val get_course_grade : t ref -> string -> int -> float

(** [get_mean c cid aid] returns the mean grade value of assignment [aid] in 
    course [cid] in courses [c] *)
val get_mean : t ref -> int -> int -> float

(** [get_median c cid aid] returns the median grade value of assignment [aid] in 
    course [cid] in courses [c] *)
val get_median : t ref -> int -> int -> float

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

(** [add_student_to_course c s nid cid] will add student from student
    list [s] with net id [nid] to course with id [cid] in courses [c] *)
val add_student_to_course :
  t ref -> People.t ref -> string -> int -> unit

(** [remove_student_from_course c s nid cid] remove student from student
    list [s] with net id [nid] from course with id [cid] in courses [c]*)
val remove_student_from_course :
  t ref -> People.t ref -> string -> int -> unit

(** [add_professor_to_course c p nid cid] will add professor from
    professor list [p] with net id [nid] to course with id [cid] in
    courses [c] *)
val add_professor_to_course :
  t ref -> People.t ref -> string -> int -> unit

(** [remove_professor_from_course c p nid cid] remove professor from
    professor list [p] with net id [nid] from course with id [cid] in
    courses [c] *)
val remove_professor_from_course :
  t ref -> People.t ref -> string -> int -> unit

(** [add_assignment_to_course c aid t w cid] will add assignment with id
    [aid], title [t], and weight [w] to course with id [cid] in courses
    [c] *)
val add_assignment_to_course :
  t ref -> int -> string -> int -> int -> unit

(** [remove_assignment_from_course c aid cid] will remove assignment
    with id [aid] from course with id [cid] in courses [c] *)
val remove_assignment_from_course : t ref -> int -> int -> unit

(** [edit_assignment_in_course c aid f v cid] will edit field [f] with
    new value [v] of assignment with id [aid] in course with id [cid] in
    courses [c] *)
val edit_assignment_in_course :
  t ref -> int -> string -> string -> int -> unit

(** [assign_grade c course_id assign_id student_id grade] will assign
    grade [grade] to student with id [student_id] in course with id
    [course_id] and assignment with id [assign_id] in courses [c] *)
val assign_grade : t ref -> int -> int -> string -> int -> unit

(** [print_grade c netid course_id assignment_id] will print the grade
    of student with id [netid] in course with id [course_id] and
    assignment with id [assignment_id] in courses [c] *)
val print_grade : t ref -> string -> int -> int -> unit

(** [final_course_grade c nid cid] will compute the final grade of
    student with id [nid] in course [cid]. The grade is computed by
    multiplying the weight points of each assignment by the points the
    students scored on the assignment (scored points are divided by
    100). The result of this is summed up and divided by the total
    weight points offered in the class *)
val final_course_grade : t ref -> string -> int -> unit

(** [print_mean_median c course_id assign_id] will print the mean and
    the median grade of assignment with id [assignment_id] in course
    with id [course_id] in courses [c] *)
val print_mean_median : t ref -> int -> int -> unit

(** [student_len cid c] will give the number of students in course with id 
[cid] in courses [c] *)
val student_len : int -> t ref -> int 

(** [professor_len cid c] will give the number of professors in course with id 
[cid] in courses [c] *)
val professor_len: int -> t ref -> int

