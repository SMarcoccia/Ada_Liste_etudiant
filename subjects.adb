
  
  package body subjects is
  -- PROCEDURE :
  
  procedure subjects_sortLexichographique(pTDL : in out pSubjects) is
    pTmp : pSubjects := pTDL;
  begin
    -- A voir plus tard. 
    put("Ceci est la fonction subjects_sortLexichographique.");
  end subjects_sortLexichographique;

  --==============================================================================

  procedure subjects_insert(pTDL : in out pSubjects; uSubjects : in unbounded_string) is
    pTmp : pSubjects := pTDL;
  begin
    -- a revoir.
    -- Vérifier que la matière n'existe pas déjà.
    pTDL := new rSubjects'(uSubjects, pTmp, null);
    if pTmp /= null then
      pTmp.pPrevious := pTDL;
    end if;
  end subjects_insert;

  --==============================================================================

  procedure subjects_remove(pTDL : in out pSubjects; uSubjects : in unbounded_string)  is
    pTmp : pSubjects := pTDL;
  begin
    while pTmp /= null loop
      if pTmp.uSubjects = uSubjects then
        pTmp.pPrevious.pNext := pTmp.pNext;
        pTmp.pNext.pPrevious := pTmp.pPrevious;
        free(pTmp);
      else
        pTmp := pTmp.pNext;
      end if;
    end loop;
  end subjects_remove;

  --==============================================================================

  procedure subjects_displayOneSubjects(pTDL : in out pSubjects; uSubjects : in unbounded_string) is
    pTmp : pSubjects := pTDL;
  begin
    while pTmp /= null loop
      if pTmp.uSubjects = uSubjects then
        put(pTmp.uSubjects);
      else
        pTmp := pTmp.pNext;
      end if;
    end loop;
  end subjects_displayOneSubjects;

  --==============================================================================

  procedure subjects_displayAllSubjects(pTDL : in out pSubjects) is
    pTmp : pSubjects := pTDL;
  begin
    while pTmp /= null loop
      put("Ceci esu un cours de "); put(pTmp.uSubjects); new_line;
      pTmp := pTmp.pNext;
    end loop;    
  end subjects_displayAllSubjects;

  --==============================================================================

  end subjects;