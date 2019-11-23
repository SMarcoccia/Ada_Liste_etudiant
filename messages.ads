with  ada.text_io;                    use ada.text_io;
with  ada.integer_text_io;            use ada.integer_text_io;
with  ada.float_text_io;              use ada.float_text_io;
with  Text_IO.Unbounded_IO;           use Text_IO.Unbounded_IO;
with  ada.strings.unbounded;          use ada.strings.unbounded;

package messages is

  -- Procedure :

  -- messages_error :
  --  - Affiche le message d'erreur que l'on souhaite.
  procedure messages_error(str : in string); 

end messages;