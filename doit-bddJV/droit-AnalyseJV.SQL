--Activation de la sortie serveur
SET SERVEROUTPUT ON;

--Ajout de la permition de consultation à AnalyseJV
BEGIN
  FOR tab IN (SELECT table_name FROM user_tables) LOOP
    DBMS_OUTPUT.PUT_LINE(tab.table_name);
    EXECUTE IMMEDIATE 'GRANT SELECT ON ' || tab.table_name || ' TO AnalyseJV';
  END LOOP;
END;
/