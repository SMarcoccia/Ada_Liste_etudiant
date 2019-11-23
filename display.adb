package body display is

  nNbCol : constant Positive_Count := 5;

  procedure display_students(student : in out rStudents) is
--set colonne pour nom matière physique.
  begin
    set_col(Positive_Count(students_cmpSizeNameStudent(student))+nNbCol); put(" __________ "); put("__________ "); put("__________ "); new_line;
    set_col(Positive_Count(students_cmpSizeNameStudent(student))+nNbCol); put("|          "); put("|          "); put("|          ");put("|"); new_line;
    set_col(Positive_Count(students_cmpSizeNameStudent(student))+nNbCol); put("|");  put("|"); new_line;
    for i in student.array_student'range loop
      if student.array_student(i).used then
        display_studentAux(student, i);
      end if;
    end loop;

    set_col(Positive_Count(students_cmpSizeNameStudent(student))+nNbCol); put("|__________");put("|__________");put("|__________"); put("|"); new_line;
    
    if student.nNbStudent = 0 then
      put_line("Il n'y a pas d'eleve."); new_line;
    else
      new_line; put("Le nombre d'eleve est de :" & student.nNbStudent'image); new_line; new_line;
    end if;

  end display_students;

---------------------------------------------------------------------
  
  procedure display_studentAux(student : in out rStudents; idx : in natural) is
  begin
    -- A revoir.
    if idx > 0 then
      set_col(Positive_Count(students_cmpSizeNameStudent(student))+nNbCol); put("|__________");put("|__________");put("|__________"); put("|"); new_line;
      put(student.array_student(idx).name); put(" :  ");
      set_col(Positive_Count(students_cmpSizeNameStudent(student))+nNbCol); put("|   "); put(student.array_student(idx).notePhys, exp => 0, aft=>2); put("  |  ");
      put(student.array_student(idx).noteMath, exp => 0, aft=>2); put("   |  "); put(student.array_student(idx).noteChim, exp => 0, aft=>2); put("   |"); new_line; 
    else
      put_line("l'eleve n'existe pas."); new_line;
    end if;    
  end display_studentAux;
---------------------------------------------------------------------

  procedure display_oneStudent(student : in out rStudents) is
    --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
    
    rKbdInputName : rKeyboardInput; -- On récupère la saisie clavier du nom de l'élève à afficher.
    
    --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
    
    -- Phrase d'intro. qui invite l'utilisateur à entré le nom de l'élève à afficher.
    uIntroSentence : unbounded_string := to_unbounded_string("Entre le nom de l'eleve. 1 pour quitter.");
    
    -- Caractère à taper pour quitter le menu affiche un élève.
    u1 : unbounded_string := to_unbounded_string("1");
    
    --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
    
    -- index du nom de l'élève à récupéré.
    idx : natural := 0;     
    -- Condition de la boucle while de recherche de l'élève. Si false on quitte.
    nExit : boolean := true;  
    
    --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
  begin

    rKbdInputName.uInput := keyboard_keyboardInput(uIntroSentence);
    while not algorithmes_dichotomousResearchArray(student, rKbdInputName.uInput, idx) and then not (rKbdInputName.uInput = u1) loop
      messages_error("L'eleve n'existe pas.");
      rKbdInputName.uInput := keyboard_keyboardInput(uIntroSentence); 
    end loop;

    if idx > 0 then
      put(" __________ __________ __________ "); new_line;
      put("| Physique |   Math   |  Chimie  |"); new_line;
      put("|__________|__________|__________|"); new_line;
      put("|  "); put(student.array_student(idx).notePhys, exp => 0, aft=>2); put("   |  ");
      put(student.array_student(idx).noteMath, exp => 0, aft=>2); put("   |          |"); new_line; 
      put("|__________|__________|__________|"); new_line; new_line;
    else
      put_line("L'eleve n'existe pas."); new_line;
    end if;    

  end display_oneStudent;

----------------------------------------------------------------------------------------------------

  procedure display_averageSchool is

  begin
    put_line("La moyenne."); new_line;
  end display_averageSchool;

  end display;