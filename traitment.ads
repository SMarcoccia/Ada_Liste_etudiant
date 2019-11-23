
with ada.text_io;                    use ada.text_io;
with ada.integer_text_io;            use ada.integer_text_io;
with Text_IO.Unbounded_IO;           use Text_IO.Unbounded_IO;
with ada.strings.unbounded;          use ada.strings.unbounded;      
with students;                       use students;                                                            
with math;                           use math;                                                         
with display;                        use display;                                                            
with keyboard;                       use keyboard;                                                             
with algorithmes;                    use algorithmes;                                                                
with admin;                          use admin;                                                          
with messages;                       use messages;   
with types;                          use types;   

package traitment is
  -- Procedure :
  
  -- Function :
  function traitment_choice(student : in out rStudents) return integer;
  function traitment_VerifChoiceUserMenu(uRecup : in out unbounded_string) return boolean;
end traitment;