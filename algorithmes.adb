

package body algorithmes is

  procedure algorithmes_sequentialResearch_Str(
    kbdInput : in out rKeyboardInput; 
    student : in out rStudents; 
    idx : in out natural
  ) is
 
  exist : boolean := false;
  
  begin
    while (not exist) and idx <= STUDENTS_ARRAY_NBMAX_SLOT loop
      exist := student.array_student(idx).name = kbdInput.studentInput;
      idx := idx + 1;
    end loop;
    
    if exist then 
      idx := idx - 1;
    else 
      idx := 0;
    end if;

  end algorithmes_sequentialResearch_Str;

  procedure algorithmes_triName(student : in out rStudents) is
    
    function "<" (L, R : person) return Boolean is
    begin
      return L.name < R.name;
    end "<";    
    
    -- Pas obligé de mettre "<" si la fc° est déclarer. La fc° ce met dans la déclaration de la fc°.
    -- Si la fc° n'est pas déclaré alors obligé de mettre "<" et c'est la fc° de la classe ada.string.unbounded qui sera utilisé.
    procedure unbsort is new ada.containers.generic_array_sort(positive, person, arrayStudent); 
  
  begin
    unbsort(student.array_student);
  end algorithmes_triName;

end algorithmes;

