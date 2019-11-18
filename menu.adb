with ada.text_io;
use  ada.text_io;

package body menu is

   procedure menu_choice is
  
   begin
      put_line ("Entre votre choix : ");
      put_line("1 - Affiche les eleves.");
      put_line("2 - Affiche un eleve.");
      put_line("3 - Calculer la moyenne de la classe.");
      put_line("4 - Entre un nouvel eleve.");
      put_line("5 - Quitter."); new_line;
   end menu_choice;

end menu;