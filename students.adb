

package body students is

  type NBMAX is range 1..4;
-----------------------------------------------------------------------------------------------------
-------------------------PROCEDURE PROCEDURE PROCEDURE-----------------------------------------------
-----------------------------------------------------------------------------------------------------


  procedure students_initTabRecordPerson(array_students : out arrayStudent) is
  begin
    for i in array_students'range loop
      array_students(i).notePhys := -1.0;
      array_students(i).noteMath := -1.0;
      array_students(i).used := false;
    end loop;
  end students_initTabRecordPerson;

  procedure students_initRecordStudents(student : out rStudents) is
  begin
    student.count := 0; 
    students_initTabRecordPerson(student.array_student);
  end students_initRecordStudents;

-----------------------------------------------------------------------------------------------------

  procedure students_insert(student : in out rStudents) is

    -- Créer un record ? C'est juste pour afficher les indications à rentrer. faire une fonction
    -- rajout note qui évite d'avoir a tous modifier dans le code.
    type fieldsStudent  is array(NBMAX) of unbounded_string;
    fields : fieldsStudent := (
      To_Unbounded_String("Nom de l'eleve : "), 
      To_Unbounded_String("Note de physique : "), 
      To_Unbounded_String("Note de math : "),
      To_Unbounded_String("Note de chimie : ")
    );
    
    type StudentInput is array(NBMAX) of rKeyboardInput;
    Student_Input : StudentInput; 
    bLoopExit : boolean := true;
    i : positive := 1;

  begin

    -- On met toutes les valeurs entrées par l'utilisateur dans la structure student_inputs.
    for i in NBMAX loop
      keyboard_keyboardInput(Student_Input(i), To_String(fields(i)));
    end loop;
    -- On copie les valeurs de student_inputs dans la structure student.
    -- On chche un slot vide.
    while i < STUDENTS_ARRAY_NBMAX_SLOT and bLoopExit loop
      if not student.array_student(i).used then
        student.Count := student.Count + 1;
        student.array_student(i).used := true;
        student.array_student(i).name := Student_Input(1).studentInput;
        student.array_student(i).notePhys := float'value(To_String(Student_Input(2).studentInput));
        student.array_student(i).noteMath := float'value(To_String(Student_Input(3).studentInput));
        student.array_student(i).noteChim := float'value(To_String(Student_Input(4).studentInput));
        bLoopExit := false;
      end if;
      i := i+1;
    end loop;
  end students_insert;

-----------------------------------------------------------------------------------------------------

procedure students_insertManually(student : in out rStudents; sName : in Unbounded_string; notePhys, noteMath : in float; bUsed : in boolean) is
begin
  student.Count := student.Count + 1;
  student.array_student(student.Count).used := true;
  student.array_student(student.Count).name := sName;
  student.array_student(student.Count).notePhys := notePhys;
  student.array_student(student.Count).noteMath := noteMath;
end students_insertManually;


-----------------------------------------------------------------------------------------------------
-------------------------FONCTION FONCTION FONCTION--------------------------------------------------
-----------------------------------------------------------------------------------------------------

function students_cmpSizeNameStudent(student : in out rStudents) return natural is
  nPivot : natural := length(student.array_student(1).name);
begin
  for i in student.array_student'range loop
    if length(student.array_student(i).name) > nPivot then
      nPivot := length(student.array_student(i).name);
    end if;
  end loop;
  return nPivot;
end students_cmpSizeNameStudent;

end students;