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

let course_h = ref Courses.empty

let people_h = ref People.init

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

let rec course_adder cr c =
  match cr with
  | [] -> print_string " "
  | h :: t ->
      Courses.add_course (snd h) (fst h) c;
      course_adder t c


let add_courses_to_d = course_adder course_roster courses_d

let course_e_1_class = Courses.add_course 1 "calc" courses_e

let student_for_e1 = ref People.init
let create_student = People.add_student "aa123" "Rohan" 2024 student_for_e1

let create_second_student = People.add_student "bb123" "Sam" 2023 student_for_e1

let create_third_student = People.add_student "cc123" "Bill" 2023 student_for_e1

let add_student_to_e1 = Courses.add_student_to_course courses_e student_for_e1 "aa123" 1

let add_student_2_to_e1 = Courses.add_student_to_course courses_e student_for_e1 "bb123" 1

let add_student_3_to_e1 = Courses.add_student_to_course courses_e student_for_e1 "cc123" 1

let add_assignment_e1 = Courses.add_assignment_to_course courses_e 1 "hw1" 1 1

let assign_grade_in_e1 = Courses.assign_grade courses_e 1 1 "aa123" 90

let assign_grade_2_in_e1 = Courses.assign_grade courses_e 1 1 "bb123" 80

let assign_grade_3_in_e1 = Courses.assign_grade courses_e 1 1 "cc123" 100

let get_student_mean = Courses.get_course_grade courses_e "aa123" 1

let get_student_2_mean = Courses.get_course_grade courses_e "bb123" 1

let get_student_3_mean = Courses.get_course_grade courses_e "cc123" 1

let edit_courses_d_1910 = Courses.edit_course 1910 "title" "new calc" courses_d

let courses_d_1910_new_title = Courses.get_title 1910 courses_d

let edit_courses_d_1090 = Courses.edit_course 1090 "title" "new music" courses_d

let courses_d_1090_new_title = Courses.get_title 1090 courses_d

let edit_courses_d_1111 = Courses.edit_course 1111 "title" "new engl" courses_d

let courses_d_1111_new_title = Courses.get_title 1111 courses_d

let edit_courses_d_3110 = Courses.edit_course 3110 "title" "new cs" courses_d

let courses_d_3110_new_title = Courses.get_title 3110 courses_d






let people_a = ref People.init

let people_a_add = People.add_student "ss2742" "Sukriti" 2023 people_a

let people_ah_add_new =
  People.add_student "ss2742" "Sukriti" 2023 people_h

let people_ah_add_new_prof = People.add_prof "vc333" "vacilis" people_h

let people_a_add_prof = People.add_prof "vc333" "vacillis" people_a

let courses_tests =
  [
    ("add course 1" >:: fun _ -> assert_equal 1 (Courses.len courses_a));
    ("add courses 2" >:: fun _ -> assert_equal 2 (Courses.len courses_b));
    ("add courses 3" >:: fun _ -> assert_equal 4 (Courses.len courses_d));
    ("edit course 4" >:: fun _ -> assert_equal "new first" courses_a_title);
    ("edit course 5" >:: fun _ -> 
      assert_equal "new calc" courses_d_1910_new_title);
    ( "edit course 6" >:: fun _ ->
      assert_equal "new music" courses_d_1090_new_title);
    ( "edit course 7" >:: fun _ ->
      assert_equal "new engl" courses_d_1111_new_title);
    ( "edit course 8" >:: fun _ ->
      assert_equal "new cs" courses_d_3110_new_title);
    ( "delete course 6" >:: fun _ ->
      assert_equal 0
        (Courses.delete_course 1 courses_a;
         Courses.len courses_a) );
    ( "delete course 7" >:: fun _ ->
      assert_equal 1
        (Courses.delete_course 1 courses_b;
         Courses.len courses_b) );
    ( "delete course 8" >:: fun _ ->
      assert_equal 3
        (Courses.delete_course 1090 courses_d;
         Courses.len courses_d) );
    ( "add assignment 9" >:: fun _ ->
      assert_equal 1 (Courses.assignments_len 1 courses_c));
    ( "add assignment 10" >:: fun _ ->
      assert_equal 1 (Courses.assignments_len 1 courses_e));
    ( "edit assignment 11" >:: fun _ ->
      assert_equal 2 courses_c_assignment_id_2 );
    ( "edit assignment 12" >:: fun _ ->
      assert_equal 3 courses_c_assignment_id_3 );
    ( "delete assignment 13" >:: fun _ ->
      assert_equal 0
        (Courses.remove_assignment_from_course courses_c 3 1;
         Courses.assignments_len 1 courses_c) );
    ( "delete assignment 14" >:: fun _ ->
    assert_equal 0
      (Courses.remove_assignment_from_course courses_a 3 1;
        Courses.assignments_len 1 courses_c) );
    ( "adding student to course" >:: fun _ ->
      assert_equal 1
        (Courses.add_course 1 "first" course_h;
         Courses.add_student_to_course course_h people_h "ss2742" 1;
         Courses.student_len 1 course_h) );
    ( "adding professor to course" >:: fun _ ->
      assert_equal 1
        (Courses.add_course 1 "first" course_h;
         Courses.add_professor_to_course course_h people_h "vc333" 1;
         Courses.professor_len 1 course_h) );
    ( "remove professor to course" >:: fun _ ->
      assert_equal 0
        (Courses.add_course 1 "first" course_h;
         Courses.remove_professor_from_course course_h people_h "vc333"
           1;
         Courses.professor_len 1 course_h) );
    ( "remove student to course" >:: fun _ ->
      assert_equal 0
        (Courses.add_course 1 "first" course_h;
         Courses.remove_student_from_course course_h people_h "ss2742" 1;
         Courses.professor_len 1 course_h) );
    ( "adding multiple students to a course" >:: fun _ ->
      assert_equal 2
        (People.add_student "snh44" "Samiksha" 2023 people_h;
         Courses.add_course 1 "first" course_h;
         Courses.add_student_to_course course_h people_h "ss2742" 1;
         Courses.add_student_to_course course_h people_h "snh44" 1;
         Courses.student_len 1 course_h) );
    ( "adding multiple professor to a course" >:: fun _ ->
      assert_equal 2
        (People.add_prof "abc123" "David" people_h;
         Courses.add_course 1 "first" course_h;
         Courses.add_professor_to_course course_h people_h "vc333" 1;
         Courses.add_professor_to_course course_h people_h "abc123" 1;
         Courses.professor_len 1 course_h) );
  ]

let grades_tests = [
  ("grade student assignment 15" >:: fun _ -> 
    assert_equal 90 
    (Courses.get_student_grade_in_assignment 1 1 "aa123" courses_e));
  ("grade student assignment 16" >:: fun _ -> 
    assert_equal 80 
    (Courses.get_student_grade_in_assignment 1 1 "bb123" courses_e));
  ("grade student assignment 17" >:: fun _ -> 
    assert_equal 100 
    (Courses.get_student_grade_in_assignment 1 1 "cc123" courses_e));
  ("grade student assignment 18" >:: fun _ -> 
    assert_equal 0
    (Courses.get_student_grade_in_assignment 1 1 "aa124" courses_e));
  ("compute course grade 19" >:: fun _ -> 
    assert_equal 90.
    (Courses.get_course_grade courses_e "aa123" 1));
  ("compute course grade 20" >:: fun _ -> 
    assert_equal 80.
    (Courses.get_course_grade courses_e "bb123" 1));
  ("compute course grade 21" >:: fun _ -> 
    assert_equal 100.
    (Courses.get_course_grade courses_e "cc123" 1));
  ("compute mean 22" >:: fun _ -> 
    assert_equal 90. (Courses.get_mean courses_e 1 1));
  ("compute mean 23" >:: fun _ -> 
    assert_equal 0. (Courses.get_mean courses_e 2 1));
  ("compute median 24" >:: fun _ -> 
    assert_equal 90. (Courses.get_median courses_e 1 1));
  ("compute median 25" >:: fun _ -> 
    assert_equal 0. (Courses.get_median courses_e 2 1))

  
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
    ( "get title of a professor" >:: fun _ ->
      assert_equal "Walker White"
        (People.add_prof "wwm123" "Walker White" people_a;
         People.get_professor_title "wwm123" people_a) );
    ( "delete student" >:: fun _ ->
      assert_equal 0
        (People.del_person "ss2742" people_a;
         People.student_len people_a) );
    ( "Adding more than one student" >:: fun _ ->
      assert_equal 2
        (People.add_student "snh44" "Samiksha" 2023 people_a;
         People.add_student "abc12" "Ashley" 2023 people_a;
         People.student_len people_a) );
    ( "Adding more than one professor" >:: fun _ ->
      assert_equal 2
        (People.add_prof "abc123" "Samuel" people_a;
         People.add_prof "def123" "Prof Batten" people_a;
         People.student_len people_a) );
    ( "get title of a professor when multiple professors have been added"
    >:: fun _ ->
      assert_equal "Prof Batten" (People.get_title "def123" people_a) );
  ]

let suite =
  "test suite for CMS project"
  >::: List.flatten [ courses_tests; grades_tests; people_tests ]

let _ = run_test_tt_main suite
