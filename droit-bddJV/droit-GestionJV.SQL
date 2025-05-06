--Activation de la sortie serveur
SET SERVEROUTPUT ON;

--Ajout de la permition de consultation et modification à GestionJV
BEGIN
  FOR tab IN (SELECT table_name FROM user_tables) LOOP
    DBMS_OUTPUT.PUT_LINE(tab.table_name);
    EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE, DELETE ON ' || tab.table_name || ' TO GestionJV';
  END LOOP;
END;
/
