package body admin is

  -- Fonction :
  function admin_mdp(uMdp : in unbounded_string) return boolean is
  begin
    put("Mdp : "); put(uMdp); new_line; new_line;
    return true;
  end admin_mdp;

  -- Procedure :
    Procedure admin_main is
      uMdp : unbounded_string := null_unbounded_string;
      bool : boolean := true;
    begin
      uMdp := keyboard_keyboardInput(to_unbounded_string("Entre votre mot de passe."));
      bool := admin_mdp(uMdp);
    end admin_main;
  
end admin;