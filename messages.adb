
package body messages is

  procedure messages_error(str : in string) is 
  
  begin
    put_line(str); new_line;
  end messages_error;

end messages;
