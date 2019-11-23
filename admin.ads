
with ada.text_io;                         use ada.text_io;
with ada.integer_text_io;                 use ada.integer_text_io; 
with ada.float_text_io;                   use ada.float_text_io;
with ada.Strings.Unbounded;               use ada.Strings.Unbounded;
with Text_IO.Unbounded_IO;                use Text_IO.Unbounded_IO;
with keyboard;                            use keyboard;

package admin is

  -- Fonction
  function admin_mdp(uMdp : in unbounded_string) return boolean;

  -- Procedure :
  Procedure admin_main;

end admin;