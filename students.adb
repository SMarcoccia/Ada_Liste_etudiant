

package body students is


-- Procedure :


-----------------------------------------------------------------------------------------------------
  
  procedure algorithmes_sortName(student : in out rStudents) is
    
    function "<" (L, R : person) return Boolean is
    begin
      return L.name < R.name;
    end "<";    
    
    -- Pas obligé de mettre "<" si la fc° est déclarer. La fc° ce met dans la déclaration de la fc°.
    -- Si la fc° n'est pas déclaré alors obligé de mettre "<" et c'est la fc° de la classe ada.string.unbounded qui sera utilisé.
    procedure unbsort is new ada.containers.generic_array_sort(positive, person, arrayStudent); 
  
  begin
    unbsort(student.array_student);
  end algorithmes_sortName;  

-----------------------------------------------------------------------------------------------------
  
  procedure students_initTabRecordPerson(array_students : out arrayStudent) is
  begin
    for i in array_students'range loop
      array_students(i).notePhys := 0.0;
      array_students(i).noteMath := 0.0;
      array_students(i).used := false;
    end loop;
  end students_initTabRecordPerson;

  procedure students_initRecordStudents(student : out rStudents) is
  begin
    student.nNbStudent := 0; 
    students_initTabRecordPerson(student.array_student);
  end students_initRecordStudents;

-----------------------------------------------------------------------------------------------------

  procedure students_insert(student : in out rStudents) is
    -- Todo :
    -- Créer un record ? C'est juste pour afficher les indications à rentrer. faire une fonction
    -- rajout note qui évite d'avoir a tous modifier dans le code.
    
    type kbdInput is array(NBMAX) of rKeyboardInput;

       aStudentInput : kbdInput;  -- On met toutes les valeurs entrées par l'utilisateur dans 
                                  -- la struct aStudentInputs.
    bExitLoop : boolean := true;  -- Sert à arrêter la boucle while quand on a trouvé un slot vide.
              i : positive := 1;  -- Sert dans la boucle while pour trouver un slot vide.
      uRecup : Unbounded_string;  -- Pour récupéré la saisie clavier dans aStudentInput(i).uInput.
  begin

    -- Todo : mettre dans une procedure.
    for i in aStudentInput'range loop
      if i = 1 then 
      -- Saisie du nom de l'élève.
      -- Todo : mettre ici un regex pour que seule des lettre soit tapé dans le nom.
        aStudentInput(i).uInput := keyboard_keyboardInput(fields(i));
        while algorithmes_dichotomousResearchArray(student, aStudentInput(i).uInput) loop
          messages_error("Ce nom existe deja. Merci de rentre un autre nom.");
          aStudentInput(i).uInput := keyboard_keyboardInput(fields(i));
        end loop;
      else
        aStudentInput(i).uInput := keyboard_keyboardInput(fields(i));
        while not keyboard_VerifFloatUnsigned(aStudentInput(i).uInput) loop
          messages_error("Merci de rentre une note valide.");
          aStudentInput(i).uInput := keyboard_keyboardInput(fields(i));
        end loop;
      end if;
    end loop;
    
    --algorithmes_sortName(student);

    -- Todo : mettre dans une procedure.
    -- On cherche un slot vide.
    -- On copie les valeurs de aStudentInputs dans la struct student.
    while i < STUDENTS_ARRAY_NBMAX_SLOT and bExitLoop loop
      if not student.array_student(i).used then
        student.nNbStudent := student.nNbStudent + 1;
        student.array_student(i).used := true;
        for j in aStudentInput'range loop
          uRecup := aStudentInput(j).uInput;
          case j is
            when 1 => student.array_student(i).name := uRecup;
            when 2 => student.array_student(i).notePhys := float'value(To_String(uRecup));
            when 3 => student.array_student(i).noteMath := float'value(To_String(uRecup));
            when 4 => student.array_student(i).noteChim := float'value(To_String(uRecup));
          end case;
        end loop;
        bExitLoop := false;
      end if;
      i := i+1;
    end loop;
    algorithmes_sortName(student); -- On place le nom à la bonne place.
  end students_insert;

-----------------------------------------------------------------------------------------------------

procedure students_insertManually(student : in out rStudents; sName : in Unbounded_string; notePhys, noteMath : in types_noteStudent; bUsed : in boolean) is
begin
  student.nNbStudent := student.nNbStudent + 1;
  student.array_student(student.nNbStudent).used := true;
  student.array_student(student.nNbStudent).name := sName;
  student.array_student(student.nNbStudent).notePhys := notePhys;
  student.array_student(student.nNbStudent).noteMath := noteMath;
end students_insertManually;

--==================================================================================================

-- Fonction :

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

----------------------------------------------------------------------------------------------------

function algorithmes_dichotomousResearchArray(students: in rStudents; sName: in unbounded_string) return boolean is
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  bool  : boolean  := false;  -- Mis à true si l'étudiant existe.
  bExit : boolean  := true;   -- Pour sortir de la boucle que l'étudiant existe ou pas.
  i, j  : positive := 1;      -- i : index pour parcourir le tableau d'étudiants.
                              -- j : index pour traiter le dernier élément du tableau.

  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  nStart, nEnd : natural; 
  --  - nStart : position du 1er étudiant dans le tableau valeur qui ne changera pas.
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  nLowerCurs, nUpperCurs  : natural; 
  -- 

  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
begin
  -- Est-ce que les étudiants sont positionnés au début ou à la fin du tableau.
  if not students.array_student(i).used then -- Si on est pas au début du tableau.
    nStart := i + STUDENTS_ARRAY_NBMAX_SLOT - students.nNbStudent;
    nEnd := STUDENTS_ARRAY_NBMAX_SLOT;
    nLowerCurs := nStart;
    nUpperCurs := STUDENTS_ARRAY_NBMAX_SLOT;
  else
    nStart := i;
    nEnd   := students.nNbStudent;
    nLowerCurs := i;
    nUpperCurs := students.nNbStudent;
  end if;

  i := students.nNbStudent/2 + nStart-1;  -- On se positionne à la moitié du nb d'étudiants 
                                          -- qui sont dans le tableau.

  while  bExit loop -- On cherche le nom de l'étudiant tant que bool est faux.
    -- Si nLowerCurs > nUpperCurs il n'y a pas de nom.
    if sName >  students.array_student(i).name then
      nLowerCurs := i;
    else
      nUpperCurs := i;
    end if;

    i := nLowerCurs + (nUpperCurs - nLowerCurs)/2;
    j := nUpperCurs - (nUpperCurs - nLowerCurs)/2;

    if sName = students.array_student(i).name or sName = students.array_student(j).name then
      bExit := false; bool := true;
    elsif i = nLowerCurs then -- L'étudiant n'existe pas.
      bExit := false; bool := false; 
    end if;
  end loop;
  return bool;
end algorithmes_dichotomousResearchArray;

----------------------------------------------------------------------------------------------------

function algorithmes_dichotomousResearchArray(students: in rStudents; sName: in unbounded_string; idx : out natural) return boolean is
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  bool  : boolean  := false;  -- Mis à true si l'étudiant existe.
  bExit : boolean  := true;   -- Pour sortir de la boucle que l'étudiant existe ou pas.
  i, j  : positive := 1;      -- i : index pour parcourir le tableau d'étudiants.
                              -- j : index pour traiter le dernier élément du tableau si le nom
                              --     est le dernier élèment.

  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  nStart, nEnd : natural; 
  --  - nStart : position du 1er étudiant dans le tableau valeur qui ne changera pas.
  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  nLowerCurs, nUpperCurs  : natural; 
  -- 

  --~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
begin
  -- Est-ce que les étudiants sont positionnés au début ou à la fin du tableau.
  if not students.array_student(i).used then -- Si on est pas au début du tableau.
    nStart := i + STUDENTS_ARRAY_NBMAX_SLOT - students.nNbStudent;
    nEnd := STUDENTS_ARRAY_NBMAX_SLOT;
    nLowerCurs := nStart;
    nUpperCurs := STUDENTS_ARRAY_NBMAX_SLOT;
  else
    nStart := i;
    nEnd   := students.nNbStudent;
    nLowerCurs := i;
    nUpperCurs := students.nNbStudent;
  end if;

  i := students.nNbStudent/2 + nStart-1;  -- On se positionne à la moitié du nb d'étudiants 
                                          -- qui sont dans le tableau.

  while  bExit loop -- On cherche le nom de l'étudiant tant que bool est faux.
    -- Si nLowerCurs > nUpperCurs il n'y a pas de nom.
    if sName >  students.array_student(i).name then
      nLowerCurs := i;
    else
      nUpperCurs := i;
    end if;

    i := nLowerCurs + (nUpperCurs - nLowerCurs)/2;
    j := nUpperCurs - (nUpperCurs - nLowerCurs)/2;

    if sName = students.array_student(i).name then
      idx := i;
      bExit := false; bool := true;
    elsif sName = students.array_student(j).name then
      idx := j;
      bExit := false; bool := true;
    elsif i = nLowerCurs then -- L'étudiant n'existe pas.
      bExit := false; bool := false; 
    end if;
  end loop;
  return bool;
end algorithmes_dichotomousResearchArray;

end students;