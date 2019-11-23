
with ada.text_io;                    use ada.text_io;
with ada.integer_text_io;            use ada.integer_text_io;
with ada.float_text_io;              use ada.float_text_io;
with Text_IO.Unbounded_IO;           use Text_IO.Unbounded_IO;
with ada.strings.unbounded;          use ada.strings.unbounded;
with keyboard;                       use keyboard;
with messages;                        use messages;
with types;                          use types;
with ada.containers.generic_array_sort;

package students is

  -- Taille du tableau qui contiendra les étudiants.
  STUDENTS_ARRAY_NBMAX_SLOT  : constant natural := 40; 

  type person is record
    name : Unbounded_string; -- Ici mettre tableau de unbounded.
    firstname : Unbounded_string;
    noteMath, notePhys, noteChim : types_noteStudent; -- Ici mettre tableau de float ?
    used : boolean;
  end record;
  
  type arrayStudent is array (positive range <>) of person;  

  type rStudents is record 
    nNbStudent : natural;
    -- objets de type arrayStudent devront toujours être contraints et ce, dès la déclaration
    array_student : arrayStudent(1..STUDENTS_ARRAY_NBMAX_SLOT); 
  end record;

  -- NBMAX : Intervalle utilisé pour : 
  --  - créer un tableau de string qui contiendra la liste des champs qui devront être saisie par 
  --    l'utilisateur.
  type NBMAX is range 1..4; 
    
  -- fieldsStudent : 
  --  - créer un tableau de rKeyboardInput pour récupéré la saisie utilisateur.
  type fieldsStudent is array(NBMAX) of unbounded_string;
  fields : fieldsStudent := (
    To_unbounded_String("Nom de l'eleve : "),
    To_unbounded_String("Note de physique : "),
    To_unbounded_String("Note de math : "),
    To_unbounded_String("Note de chimie : "));  

--==================================================================================================

-- Procedure :

  procedure students_initRecordStudents(student : out rStudents);
  procedure students_initTabRecordPerson(array_students : out arrayStudent);
  procedure students_insert(student : in out rStudents) ;
  procedure students_insertManually(student : in out rStudents; sName : in Unbounded_string; notePhys, noteMath : in types_noteStudent; bUsed : in boolean);

----------------------------------------------------------------------------------------------------

  -- algorithmes_sortName : 
  -- - Définition :
  --      - Procédure qui trie les noms des étudiants dans le tableau étudiants dans l'ordre 
  --        lexichographique.
  -- - Paramètres :
  --     - student : struct. étudiant (dans students.ads).
  procedure algorithmes_sortName(student : in out rStudents);

--==================================================================================================

-- function :

----------------------------------------------------------------------------------------------------

  -- Pour l'affichage des notes dans le tableau.
  function students_cmpSizeNameStudent(student : in out rStudents) return natural;

----------------------------------------------------------------------------------------------------

  -- - algorithmes_dichotomousResearchArray :
  -- - Définition :
  --      - Fonction qui recherche un étudiant avec l'algo. dichotomique de recherche. 
  --      - Retourne un booléen : true si on à trouvé l'étudiant sinon false.            
  -- - Paramètres :
  --      - students  : struct. étudiant (dans students.ads).
  --      - sName     : envoi le nom de l'étudiant qui doit être recherché.
  -- - Paramètres suplémentaire :
  --      - idx       : récupère l'index du nom. 0 si aucun nom trouvé.
  function algorithmes_dichotomousResearchArray(students : in rStudents; sName : in unbounded_string) return boolean;
  function algorithmes_dichotomousResearchArray(students : in rStudents; sName : in unbounded_string; idx : out natural) return boolean;
  

end students;