
with ada.integer_text_io;         use ada.integer_text_io;
with ada.float_text_io;           use ada.float_text_io;
with ada.text_io;                 use ada.text_io;
with Text_IO.Unbounded_IO;        use Text_IO.Unbounded_IO;
with ada.Strings.Unbounded;       use ada.Strings.Unbounded;
with algorithmes;                 use algorithmes;
with students;                    use students;
with keyboard;                    use keyboard;   
with messages;                    use messages;   


package display is
    
  procedure display_students(student : in out rStudents);
  -- Tab etudiant.
  procedure display_studentAux(student : in out rStudents; idx : in natural);
  procedure display_oneStudent(student : in out rStudents);
  procedure display_averageSchool;

end display;