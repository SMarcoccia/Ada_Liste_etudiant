package body traitment is

  BAD_CHOICE : constant integer := -1; -- Si l'utilisateur rentre un mauvais choix, on retourne -1.
        QUIT : constant integer :=  0;  -- Si l'utilisateur veut quitter le programme, on retourne 0.
         RAS : constant integer :=  1;  -- Si l'utilisateur rentre un autre choix on retourne 1.

  procedure traitment_messageError is -- a revoir pour le nom de la procedure.

  begin
    put_line("Merci de rentre un choix valide.");
  end traitment_messageError;
   
  function traitment_choice (student : in out rStudents) return integer is
    bError : boolean := false;
    choiceUser : natural;
    index : natural := 1;
    DisplayStudent : rKeyboardInput; -- A revoir préfère mettre dans .ads.
  begin

    begin
      get(choiceUser); 
      exception
        when Data_Error => traitment_messageError; bError := true;
        when constraint_Error => traitment_messageError; bError := true;
    end; skip_line; new_line; 
    
    case choiceUser is
      when 1 => display_students(student); return RAS;
      when 2 => 
        keyboard_keyboardInput(DisplayStudent, "Entre le nom de l'eleve");
        algorithmes_sequentialResearch_Str(DisplayStudent, student, index);       
        display_oneStudent(student, index); return RAS;
      when 3 => math_averageSchool; display_averageSchool; return RAS;
      when 4 => students_insert(student); return RAS;
      when 5 => return QUIT;
      when others =>
        if not bError and (choiceUser > 5 or choiceUser = 0) then 
          traitment_messageError; new_line;
        end if; 
        return BAD_CHOICE;
    end case;
  end traitment_choice;

end traitment;