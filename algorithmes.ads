with  students,
      ada.text_io,
      ada.integer_text_io,
      keyboard,
      Text_IO.Unbounded_IO, 
      Ada.Strings.Unbounded,
      ada.containers.generic_array_sort;

use   students,
      ada.text_io,
      ada.integer_text_io,
      keyboard,
      Text_IO.Unbounded_IO, 
      Ada.Strings.Unbounded;
      

package algorithmes is

  procedure algorithmes_sequentialResearch_Str(
    kbdInput : in out rKeyboardInput; 
    student : in out rStudents; 
    idx : in out natural    
  );


  procedure algorithmes_triName(student : in out rStudents);
    -- - A mettre dans le memo fc° sort : 
    -- - 1er paramètre : la taille doit être non contrainte ici le type positive à été mis.
    -- - 2e    //      : le type qui doit être comparé (ici des record de person). 
    -- - 3e    //      : le type de tableau qui contiendra les éléments à comparer.
    -- - 4e    //      : l'opérateur de comparaison.
    -- - Ex. : unbsort devra contenir le tableau de type person. unbsort(arrayStudent).

end algorithmes;