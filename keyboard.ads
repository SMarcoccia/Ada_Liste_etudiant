with  ada.text_io, 
      Text_IO.Unbounded_IO,
      ada.strings.unbounded;
      
use   ada.text_io,
      Text_IO.Unbounded_IO,
      ada.strings.unbounded;

package keyboard is

  -- Attention : a voir mettre de vrai valeur note phy note math name.
  type rKeyboardInput is record
    studentInput : unbounded_string;
  end record;

  procedure keyboard_keyboardInput(kbdInput : in out rKeyboardInput; str : in string);

  --Obsolète.
  --procedure keyboard_SkipLine(size : in natural);

end keyboard;