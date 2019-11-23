

package body algorithmes is

--==================================================================================================
  
  procedure algorithmes_sequentialResearch_Str(
    kbdInput : in out rKeyboardInput; 
    student : in out rStudents; 
    idx : in out natural
  ) is
 
  exist : boolean := false;
  
  begin
    while (not exist) and then idx <= STUDENTS_ARRAY_NBMAX_SLOT loop
      exist := student.array_student(idx).name = kbdInput.uInput;
      idx := idx + 1;
    end loop;
    
    if exist then 
      idx := idx - 1;
    else 
      idx := 0;
    end if;

  end algorithmes_sequentialResearch_Str;

--==================================================================================================

end algorithmes;