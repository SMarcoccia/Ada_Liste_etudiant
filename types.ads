  
  package types is

     -- type qui n'acceptera que les valeurs explicitées.
    subtype types_noteStudent is float range 0.0..20.0;
     -- type qui n'acceptera que les valeurs explicitées.
    subtype type_menuChoice is positive range 1..6;
  end types;