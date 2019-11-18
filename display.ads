
with  ada.integer_text_io,
      ada.float_text_io,
      ada.text_io,
      Text_IO.Unbounded_IO, 
      ada.Strings.Unbounded,
      algorithmes,
      students,
      keyboard;

use   ada.integer_text_io,
      ada.float_text_io,
      ada.text_io,
      Text_IO.Unbounded_IO,
      ada.Strings.Unbounded,
      algorithmes,
      students,
      keyboard;      

package display is

  procedure   display_students(student : in out rStudents);
  -- Tab etudiant.
  procedure display_studentAux(student : in out rStudents; idx : in natural);
  procedure display_oneStudent(student : in out rStudents; idx : in natural);
  procedure display_averageSchool;

end display;