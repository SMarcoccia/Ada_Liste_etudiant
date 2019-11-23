with students;                              use students;
with ada.text_io;                           use ada.text_io;
with ada.integer_text_io;                   use ada.integer_text_io;
with keyboard;                              use keyboard;
with Text_IO.Unbounded_IO;                  use Text_IO.Unbounded_IO; 
with Ada.Strings.Unbounded;                 use Ada.Strings.Unbounded;


package algorithmes is

  -- Procedure :

  -- algorithmes_sequentialResearch_Str : 
  -- - Définition :
  --      - Procédure qui cherche un étudiant dans le tableau étudiants.
  -- - Paramètres :
  --      - kbdInput : struct. pour récupèrer la saisie clavier de l'utilisateur (dans keyboard.ads).
  --      -  student : struct. étudiants (dans students.ads).
  --      -      idx : récupère la position de l'étudiant dans le tableau d'étudiant. 
  procedure algorithmes_sequentialResearch_Str(
    kbdInput : in out rKeyboardInput; 
    student : in out rStudents; 
    idx : in out natural    
  );

--==================================================================================================

  -- Fonction :

end algorithmes;
