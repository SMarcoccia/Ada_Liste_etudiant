package body traitment is

  BAD_CHOICE : constant integer := -1;  -- Si l'utilisateur rentre un mauvais choix, on retourne -1.
        QUIT : constant integer :=  0;  -- Si l'utilisateur veut quitter le programme, on retourne 0.
         RAS : constant integer :=  1;  -- Si l'utilisateur rentre un autre choix on retourne 1.

--==================================================================================================  

-- - Fonction :

  function traitment_choice (student : in out rStudents) return integer is
    bError : boolean := false;
    rChoiceUser : rKeyboardInput; -- Teste la validité de la saisie.
    nChoiceUser : positive;       -- Choix du menu
  begin

    rChoiceUser.uInput := keyboard_keyboardInput(To_unbounded_String("Entrez votre choix : "));
    while not traitment_VerifChoiceUserMenu(rChoiceUser.uInput) loop
      messages_error("Merci de rentrer un choix valide.");
      rChoiceUser.uInput := keyboard_keyboardInput(To_unbounded_String("Entrez votre choix : "));
    end loop;

    nChoiceUser := positive'value(to_string(rChoiceUser.uInput));
    -- if nChoiceUser > 6 then
    --   nChoiceUser := 0;
    -- end if;
    
    case nChoiceUser is
      when 1 => display_students(student); return RAS;
      when 2 => display_oneStudent(student); return RAS;
      when 3 => math_averageSchool; display_averageSchool; return RAS;
      when 4 => students_insert(student); return RAS;
      when 5 => admin_main; return RAS;
      when 6 => return QUIT;
      when others => return BAD_CHOICE;
    end case;
  end traitment_choice;

--===================================================================================================

  function traitment_VerifChoiceUserMenu(uRecup : in out unbounded_string) return boolean is
  begin
    if not keyboard_VerifPositive(uRecup) then
      return false;
    elsif  positive'value(to_string(uRecup)) > 6 then
      uRecup := To_unbounded_String("0");
      return false;
    else
      return true;
    end if;
  end traitment_VerifChoiceUserMenu;

end traitment;