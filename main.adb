with  ada.text_io, 
      ada.integer_text_io, 
      ada.float_text_io,
      Ada.Strings.Unbounded,
      Ada.Text_IO.Unbounded_IO,
      Ada.Containers.Generic_Array_Sort,
      menu, 
      traitment,
      students,
      algorithmes,
      keyboard;
      

use   ada.text_io, 
      ada.integer_text_io, 
      ada.float_text_io,
      Ada.Strings.Unbounded,
      Ada.Text_IO.Unbounded_IO,
      menu, 
      traitment,
      students,
      algorithmes,
      keyboard;

procedure Main is
  student : rStudents;
  nLoop : integer := 0;
begin

  students_initRecordStudents(student);
  students_insertManually(student, to_unbounded_string("robert"), 12.0, 13.5, true);
  students_insertManually(student, to_unbounded_string("jean"), 15.0, 10.0, true);
  students_insertManually(student, to_unbounded_string("albert"), 8.0, 15.5, true);
  students_insertManually(student, to_unbounded_string("sebastien"), 10.0, 10.0, true);
  students_insertManually(student, to_unbounded_string("christine"), 9.0, 6.5, true);
  students_insertManually(student, to_unbounded_string("norbert"), 1.0, 7.5, true);
  students_insertManually(student, to_unbounded_string("clementine"), 7.0, 13.5, true);
  students_insertManually(student, to_unbounded_string("mylene"), 19.5, 0.0, true);
  students_insertManually(student, to_unbounded_string("jean-hubert"), 14.0, 12.5, true);
  students_insertManually(student, to_unbounded_string("clement"), 13.0, 1.0, true);
  students_insertManually(student, to_unbounded_string("amelie"), 8.0, 3.0, true);
  students_insertManually(student, to_unbounded_string("laurie"), 2.5, 8.0, true);
  students_insertManually(student, to_unbounded_string("dark vador"), 2.0, 9.5, true);
  students_insertManually(student, to_unbounded_string("sybeline"), 9.0, 7.0, true);
  students_insertManually(student, to_unbounded_string("madeline"), 10.0, 2.0, true);
  students_insertManually(student, to_unbounded_string("jean du arnay"), 20.0, 19.5, true);
  students_insertManually(student, to_unbounded_string("evans"), 5.0, 7.5, true);
  students_insertManually(student, to_unbounded_string("petit jean"), 6.0, 10.5, true);
  students_insertManually(student, to_unbounded_string("thierry la fronde"), 17.5, 19.5, true);
  students_insertManually(student, to_unbounded_string("mathieux"), 13.5, 14.5, true);

  main_loop : loop
    menu_choice;
    nLoop := traitment_choice(student);
    algorithmes_triName(student);
    if nLoop = 0 then
      exit;
    end if;
  end loop main_loop;

end Main;
