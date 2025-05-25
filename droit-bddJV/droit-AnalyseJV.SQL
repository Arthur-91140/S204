--Activation de la sortie serveur
SET SERVEROUTPUT ON;

--Ajout de la permition de consultation à AnalyseJV
BEGIN
  FOR ma_table IN (SELECT table_name FROM user_tables) LOOP
    DBMS_OUTPUT.PUT_LINE(ma_table.table_name);
    EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE, DELETE ON ' || ma_table.table_name || ' TO GestionJV';
  END LOOP;
END;
/