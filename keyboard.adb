
package body keyboard is

  procedure keyboard_keyboardInput(kbdInput : in out rKeyboardInput; str : in string) is

  begin
    put_line(str); new_line; 
    kbdInput.studentInput := get_line; new_line;
  end keyboard_keyboardInput;
  
end keyboard;

  ----------------------------------------------------------------------------------------------------  
  -- Procedure obsolète.
  -- procedure keyboard_keyboardInput(RKbdInput : in out rKeyboardInput; str : in string) is

  -- begin
  --   put_line(str); new_line; 
  --   get_line(RKbdInput.studentInput, RKbdInput.last); 
  --   keyboard_SkipLine(RKbdInput.last); new_line;  
  -- end keyboard_keyboardInput;


  -- procedure keyboard_SkipLine(size : in natural) is
  -- begin
  --   if size = MAXLENGTH_STRING then
  --     skip_line;
  --   end if;    
  -- end keyboard_SkipLine;

  ----------------------------------------------------------------------------------------------------  