--Activation de la sortie serveur
SET SERVEROUTPUT ON;

--Ajout de la permition de consultation et modification à GestionJV
BEGIN
  FOR ma_table IN (SELECT table_name FROM user_tables) LOOP
    DBMS_OUTPUT.PUT_LINE(ma_table.table_name);
    EXECUTE IMMEDIATE 'GRANT SELECT ON ' || ma_table.table_name || ' TO AnalyseJV';
  END LOOP;
END;
/