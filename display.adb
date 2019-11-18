package body display is

  procedure display_students(student : in out rStudents) is

  begin
  -- ATTENTION : le 5 doit être une constante.
    set_col(Positive_Count(students_cmpSizeNameStudent(student))+5); put(" __________ __________ __________ "); new_line;
    set_col(Positive_Count(students_cmpSizeNameStudent(student))+5); put("|          |          |          |"); new_line;
    set_col(Positive_Count(students_cmpSizeNameStudent(student))+5); put("| Physique |   Math   |  Chimie  |"); new_line;
    for i in student.array_student'range loop
      if student.array_student(i).used then
        display_studentAux(student, i);
      end if;
    end loop;

    set_col(Positive_Count(students_cmpSizeNameStudent(student))+5); put("|__________|__________|__________|"); new_line;
    
    if student.Count = 0 then
      put_line("Il n'y a pas d'eleve."); new_line;
    else
      new_line; put("Le nombre d'eleve est de :" & student.Count'image); new_line; new_line;
    end if;

  end display_students;

---------------------------------------------------------------------
  
  procedure display_studentAux(student : in out rStudents; idx : in natural) is
  begin
    -- A revoir.
    if idx > 0 then
      set_col(Positive_Count(students_cmpSizeNameStudent(student))+5); put("|__________|__________|__________|"); new_line;
      put(student.array_student(idx).name); put(" :  ");
      set_col(Positive_Count(students_cmpSizeNameStudent(student))+5); put("|   "); put(student.array_student(idx).notePhys, exp => 0, aft=>2); put("  |  ");
      put(student.array_student(idx).noteMath, exp => 0, aft=>2); put("   |  "); put(student.array_student(idx).noteChim, exp => 0, aft=>2); put("   |"); new_line; 
    else
      put_line("l'eleve n'existe pas."); new_line;
    end if;    
  end display_studentAux;
---------------------------------------------------------------------

  procedure display_oneStudent(student : in out rStudents; idx : in natural) is
  begin
    -- A revoir.
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

---------------------------------------------------------------------

  procedure display_averageSchool is

  begin
    put_line("La moyenne."); new_line;
  end display_averageSchool;

  end display;