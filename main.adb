with ada.text_io;                         use ada.text_io;
with ada.integer_text_io;                 use ada.integer_text_io; 
with ada.float_text_io;                   use ada.float_text_io;
with ada.Strings.Unbounded;               use Ada.Strings.Unbounded;
with ada.Text_IO.Unbounded_IO;            use Ada.Text_IO.Unbounded_IO;
with ada.Containers.Generic_Array_Sort;
with menu;                                use menu; 
with traitment;                           use traitment;
with students;                            use students;
with algorithmes;                         use algorithmes;
with keyboard;                            use keyboard;
with subjects;                            use subjects;
with admin;                               use admin;
with messages;                            use messages;
with types;                               use types;




procedure Main is
  student : rStudents;
  nLoop : integer := 1;
  pListSubjects : pSubjects;
begin

  subjects_insert(pListSubjects, to_unbounded_string("Physique"));
  subjects_insert(pListSubjects, to_unbounded_string("Mathematique"));
  subjects_insert(pListSubjects, to_unbounded_string("Chimie"));
  
  subjects_displayAllSubjects(pListSubjects); new_line;
  subjects_remove(pListSubjects, to_unbounded_string("Mathematique"));
  subjects_displayAllSubjects(pListSubjects); new_line;

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

-- declare
-- uRecup: Unbounded_string;
-- nChoice : integer;
-- begin
--     begin
--       put("Je suis dans integer'value."); new_line;
--       --get(nChoice);
--       nChoice := integer'value("-1");
--       exception
--         when data_error => put("data_error, Ceci est la valeur recupere : "); 
--         when constraint_error => put("constraint_error, Ceci est la valeur recupere : ");
--     end;


    -- begin
    --   --float'value(to_string(uRecup));
    --   put("Je suis dans get_line.");
    --   uRecup := get_line;
    --   exception
    --     when Data_Error => messages_error("Merci de rentre un choix valide."); 
    --     when constraint_Error => messages_error("Merci de rentre un choix valide."); 
    -- end; new_line;  
-- end;
  algorithmes_sortName(student); -- On trie par les étudiants par ordre lexichographique.
  main_loop : while nLoop /= 0 loop
    menu_choice;
    nLoop := traitment_choice(student);
  end loop main_loop;

end Main;
