with  ada.integer_text_io,
      ada.text_io,
      keyboard,
      Ada.Strings.Unbounded;

use   ada.integer_text_io,
      ada.text_io,
      keyboard,
      Ada.Strings.Unbounded;

package students is

  STUDENTS_ARRAY_NBMAX_SLOT  : constant natural := 40;
  
  type person is record
    name : Unbounded_string; -- Ici mettre tableau de unbounded.
    noteMath, notePhys, noteChim : float; -- Ici mettre tableau de float ?
    used : boolean;
  end record;
  
  type arrayStudent is array (positive range <>) of person;  

  type rStudents is record 
    count : natural;
    array_student : arrayStudent(1..STUDENTS_ARRAY_NBMAX_SLOT); -- objets de type T_Tableau devront toujours être contraints et ce, dès la déclaration
  end record;

--------------------------------------------------------------
-- Procedure :

  procedure students_initRecordStudents(student : out rStudents);
  procedure students_initTabRecordPerson(array_students : out arrayStudent);
  procedure students_insert(student : in out rStudents) ;
  procedure students_insertManually(student : in out rStudents; sName : in Unbounded_string; notePhys, noteMath : in float; bUsed : in boolean);

--------------------------------------------------------------
-- function :
  --Pour l'affichage des notes dans le tableau.
  function students_cmpSizeNameStudent(student : in out rStudents) return natural;

end students;