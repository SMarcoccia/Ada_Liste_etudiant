
package body keyboard is

  -- Function :
  function keyboard_keyboardInput(uStr : in unbounded_string) return unbounded_string is
    uTmp : unbounded_string;
  begin
    put_line(to_string(uStr)); new_line; 
    return get_line;
  end keyboard_keyboardInput;
  
  --=================================================================================================
  
  -- 

  function keyboard_VerifPositive(uRecup : in out unbounded_string) return boolean is
    nNum : positive;
  begin
    begin
      nNum := positive'value(to_string(uRecup));
      exception
        when constraint_Error => return false; 
    end; new_line;  
    return true; 
  end keyboard_VerifPositive;

  function keyboard_VerifNatural(uRecup : in out unbounded_string) return boolean is
    nNum : natural;
  begin
    begin
      nNum := natural'value(to_string(uRecup));
      exception
        when constraint_Error => return false; 
    end; new_line;  
    return true; 
  end keyboard_VerifNatural;
  
  function keyboard_VerifFloat(uRecup : in out unbounded_string) return boolean is
  begin
    put("keyboard_VerifFloat");
    return true;
  end;
  
  function keyboard_VerifInteger(uRecup : in out unbounded_string) return boolean is
  begin
    put("keyboard_VerifInteger");
    return true;
  end;

  function keyboard_VerifFloatUnsigned(uRecup : in out unbounded_string) return boolean is
    nNum : types_noteStudent;
  begin
    begin
      nNum := float'value(to_string(uRecup));
      exception
        --when data_error => return false;
        when constraint_Error => return false; 
    end; 
    return true; 
  end keyboard_VerifFloatUnsigned;

  function keyboard_VerifNum(uRecup : in out unbounded_string) return boolean is
    nNum : float;
  begin
    begin
      nNum := float'value(to_string(uRecup));
      exception
        when constraint_Error => return false; 
    end;  
    return true; 
  end keyboard_VerifNum;

end keyboard;

