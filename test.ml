open OUnit2
open Courses
open People

let courses_a = ref Courses.empty
let courses_b = ref Courses.empty
let courses_c = ref Courses.empty
let courses_d = ref Courses.empty
let courses_e = ref Courses.empty
let courses_f = ref Courses.empty
let courses_g = ref Courses.empty



let courses_a_add = Courses.add_course 1 "first" courses_a
let courses_a_edit = Courses.edit_course 1 "title" "new first" courses_a
let courses_a_title = Courses.get_title 1 courses_a
let courses_a_edit_2 = Courses.edit_course 1 "title" "new new first" courses_a
let courses_a_title_2 = Courses.get_title 1 courses_a
let courses_b_add = Courses.add_course 1 "first" courses_b; Courses.add_course 2 "second" courses_b

let courses_c_add_assignment = 
  Courses.add_course 1 "first" courses_c;
  Courses.add_assignment_to_course courses_c 1 "hw1" 1 1

let courses_c_edit_assignment = 
  Courses.edit_assignment_in_course courses_c 1 "title" "new hw1" 1
  
let courses_c_assignment_title =  Courses.get_assignment_title 1 1 courses_c
let courses_c_edit_assignment_2 = Courses.edit_assignment_in_course  courses_c 1 "id" "2" 1
let courses_c_assignment_id = Courses.get_assignment_id 1 2 courses_c

let people = People.init

let courses_tests = [
  ("add course" >:: fun _ -> assert_equal 1 (Courses.len courses_a));
  ("add courses 2" >:: fun _ -> assert_equal 2 (Courses.len courses_b));
  ("edit course" >:: fun _ -> assert_equal "new first" courses_a_title);
  ("edit course 2" >:: fun _ -> assert_equal "new new first" courses_a_title_2);
  ("delete course" >:: fun _ -> 
    assert_equal 0 (Courses.delete_course 1 courses_a; Courses.len courses_a));
  ("delete course 2" >:: fun _ -> 
    assert_equal 1 (Courses.delete_course 1 courses_b; Courses.len courses_b));
  ("add assignment 1" >:: fun _ -> 
    assert_equal 1 (Courses.assignments_len 1 courses_c));
  ("edit assignment 1" >:: fun _ -> 
    assert_equal 2 courses_c_assignment_id);
  ("delete assignment 1" >:: fun _ -> 
    assert_equal 0 (Courses.remove_assignment_from_course courses_c 2 1; Courses.assignments_len 1 courses_c))
]

let people_tests = []


let suite = 
  "test suite for CMS project"
  >::: List.flatten [courses_tests; people_tests]

let _ = run_test_tt_main suite