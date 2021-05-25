open OUnit2
open Courses
open People

let course_roster =
  [ ("calc", 1910); ("engl", 1111); ("cs", 3110); ("music", 1090) ]

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

let courses_a_edit_2 =
  Courses.edit_course 1 "title" "new new first" courses_a

let courses_a_title_2 = Courses.get_title 1 courses_a

let courses_b_add =
  Courses.add_course 1 "first" courses_b;
  Courses.add_course 2 "second" courses_b

let courses_c_add_assignment =
  Courses.add_course 1 "first" courses_c;
  Courses.add_assignment_to_course courses_c 1 "hw1" 1 1

let courses_c_edit_assignment =
  Courses.edit_assignment_in_course courses_c 1 "title" "new hw1" 1

let courses_c_assignment_title =
  Courses.get_assignment_title 1 1 courses_c

let courses_c_edit_assignment_2 =
  Courses.edit_assignment_in_course courses_c 1 "id" "2" 1

let courses_c_assignment_id_2 = Courses.get_assignment_id 1 2 courses_c

let courses_c_assignment_id_3 =
  Courses.edit_assignment_in_course courses_c 2 "id" "3" 1;
  Courses.get_assignment_id 1 3 courses_c

let rec course_adder cr =
  match cr with
  | [] -> print_string " "
  | h :: t ->
      Courses.add_course (snd h) (fst h) courses_d;
      course_adder t

let x = course_adder course_roster

let people_a = ref People.init

let people_a_add = People.add_student "ss2742" "Sukriti" 2023 people_a

let people_a_add_prof = People.add_prof "vc333" "vacillis" people_a

let courses_tests =
  [
    ("add course" >:: fun _ -> assert_equal 1 (Courses.len courses_a));
    ("add courses 2" >:: fun _ -> assert_equal 2 (Courses.len courses_b));
    ("edit course" >:: fun _ -> assert_equal "new first" courses_a_title);
    ( "edit course 2" >:: fun _ ->
      assert_equal "new new first" courses_a_title_2 );
    ( "delete course" >:: fun _ ->
      assert_equal 0
        (Courses.delete_course 1 courses_a;
         Courses.len courses_a) );
    ( "delete course 2" >:: fun _ ->
      assert_equal 1
        (Courses.delete_course 1 courses_b;
         Courses.len courses_b) );
    ( "delete course 3" >:: fun _ ->
      assert_equal 3
        (Courses.delete_course 1090 courses_d;
         Courses.len courses_d) );
    ( "add assignment 1" >:: fun _ ->
      assert_equal 1 (Courses.assignments_len 1 courses_c) );
    ( "edit assignment 1" >:: fun _ ->
      assert_equal 2 courses_c_assignment_id_2 );
    ( "edit assignment 2" >:: fun _ ->
      (*revisit this test case*)
      assert_equal 3 courses_c_assignment_id_3 );
    ( "delete assignment 1" >:: fun _ ->
      assert_equal 0
        (Courses.remove_assignment_from_course courses_c 3 1;
         Courses.assignments_len 1 courses_c) );
  ]

let people_tests =
  [
    ( "add student" >:: fun _ ->
      assert_equal 1 (People.student_len people_a) );
    ( "add professor" >:: fun _ ->
      assert_equal 1 (People.professor_len people_a) );
    ( "delete professor" >:: fun _ ->
      assert_equal 0
        (People.del_person "vc333" people_a;
         People.professor_len people_a) );
    ( "delete professor" >:: fun _ ->
      assert_equal 0
        (People.del_person "vc333" people_a;
         People.professor_len people_a) );
    ( "edit student" >:: fun _ ->
      assert_equal "Samiksha"
        (People.edit_person "ss2742" "Samiksha" people_a;
         People.get_student_title "ss2742" people_a) );
    ( "edit profesor" >:: fun _ ->
      assert_equal "Samiksha"
        (People.add_prof "rm697" "Rohan" people_a;
         People.edit_person "rm697" "Samiksha" people_a;
         People.get_professor_title "rm697" people_a) );
    ( "delete student" >:: fun _ ->
      assert_equal 0
        (People.del_person "ss2742" people_a;
         People.student_len people_a) );
  ]

let suite =
  "test suite for CMS project"
  >::: List.flatten [ courses_tests; people_tests ]

let _ = run_test_tt_main suite
