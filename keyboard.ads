with ada.text_io;                    use ada.text_io;
with ada.integer_text_io;            use ada.integer_text_io;
with ada.float_text_io;              use ada.float_text_io;
with Text_IO.Unbounded_IO;           use Text_IO.Unbounded_IO;
with ada.strings.unbounded;          use ada.strings.unbounded;
with messages;                        use messages;             
with System.Unsigned_Types;          use  System.Unsigned_Types;
with types;                          use types;                                                                                                    

package keyboard is

  type rKeyboardInput is record
    uInput : unbounded_string;
  end record;
--==================================================================================================
  -- Fonction :
  
  -- keyboard_keyboardInput :
  --    - Définition : 
  --          - Récupère la saisie utilisateur.
  --    - Paramètre :
  --          - uStr : Phrase entré par le programmeur : elle sert à indiquer les consignes
  --                   à l'utilisateur.
  function keyboard_keyboardInput(uStr : in unbounded_string) return unbounded_string;

  function keyboard_VerifPositive(uRecup : in out unbounded_string) return boolean;
  function keyboard_VerifNatural(uRecup : in out unbounded_string) return boolean;
  -- function keyboard_VerifFloat(uRecup : in out unbounded_string) return boolean;
  function keyboard_VerifFloatUnsigned(uRecup : in out unbounded_string) return boolean;
  -- function keyboard_VerifInteger(uRecup : in out unbounded_string) return boolean;

  -- keyboard_VerifNum : 
  --    - Définition : 
  --        - Vérifie si une chaîne est un nombre. 
  --        - Retourne true si c'est un nombre, sinon false.
  --    - Paramètre :
  --        - uRecup : reçois la chaîne à traiter.   
  --    - Note :
  --        - Float a été pris pour englober toutes les valeurs numériques.
  function keyboard_VerifNum(uRecup : in out unbounded_string) return boolean;


--==================================================================================================
  -- Procedure :

  --Obsolète.
  --procedure keyboard_SkipLine(size : in natural);

end keyboard;