with  ada.integer_text_io, 
      ada.text_io,
      students,
      math,
      display,
      keyboard,
      algorithmes;

use   ada.integer_text_io, 
      ada.text_io,
      students,
      math,
      display,
      keyboard,
      algorithmes;

package traitment is
  -- Procedure :
  procedure traitment_messageError; -- Si on rentre une valeur numérique > que le nb de choix.
  
  -- Function :
  function traitment_choice(student : in out rStudents) return integer;

end traitment;