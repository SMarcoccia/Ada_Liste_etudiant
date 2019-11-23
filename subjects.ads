with  ada.text_io,
      ada.integer_text_io,
      ada.Float_Text_io,
      ada.Strings.Unbounded,
      ada.containers.generic_array_sort, 
      Ada.Unchecked_Deallocation,
      Text_IO.Unbounded_IO;

use   ada.text_io,
      ada.integer_text_io,
      ada.Float_text_io,
      ada.Strings.Unbounded,
      Text_IO.Unbounded_IO; 


package subjects is

  type rSubjects; 
  type pSubjects is access rSubjects; -- pointeur sur le début de la liste des matières enseignés.

  -- structure qui contient le nom de la matière enseignée.
  type rSubjects is record
    uSubjects : unbounded_string; -- Nom de la matière enseignée.
    pNext : pSubjects; -- Pointeur suivant : pointant sur la structure de la matière suivante enseignée.
    pPrevious : pSubjects;
  end record;

  procedure free is new ada.unchecked_deallocation(rSubjects, pSubjects);
  procedure subjects_sortLexichographique(pTDL : in out pSubjects);
  procedure subjects_insert(pTDL : in out pSubjects; uSubjects : in unbounded_string);
  procedure subjects_remove(pTDL : in out pSubjects; uSubjects : in unbounded_string);
  procedure subjects_displayOneSubjects(pTDL : in out pSubjects; uSubjects : in unbounded_string);
  procedure subjects_displayAllSubjects(pTDL : in out pSubjects);
  
end subjects;