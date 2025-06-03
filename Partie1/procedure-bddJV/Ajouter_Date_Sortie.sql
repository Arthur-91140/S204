create or replace PROCEDURE AJOUTER_DATE_SORTIE(
    jeu_id IN NUMBER,
    plat_id IN NUMBER,
    date_release IN DATE,
    zone IN VARCHAR2,
    etat IN VARCHAR2
) AS
    compteur NUMBER;
    nouvel_id NUMBER;

BEGIN
    -- le jeu existe ?
    SELECT COUNT(*) INTO compteur FROM JEU WHERE IdJeu = jeu_id;
    IF compteur = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Jeu inexistant');
    END IF;

    -- la plateforme existe ?
    SELECT COUNT(*) INTO compteur FROM PLATEFORME WHERE IdPlateforme = plat_id;
    IF compteur = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Plateforme inexistante');
    END IF;

    -- region ok ?
    IF zone NOT IN ('north_america', 'europe', 'japan', 'worldwide', 'australia', 'brazil', 'new_zealand', 'asia', 'china', 'korea') THEN
        RAISE_APPLICATION_ERROR(-20003, 'Région inconnue');
    END IF;

    -- pas de doublon
    SELECT COUNT(*) INTO compteur 
    FROM DATESORTIE 
    WHERE IdJeu = jeu_id 
      AND IdPlateforme = plat_id 
      AND RegionSortie = zone;

    IF compteur > 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Sortie déjà enregistrée');
    END IF;

    -- prochain id
    SELECT NVL(MAX(IdDateSortie), 0) + 1 INTO nouvel_id FROM DATESORTIE;

    -- on ajoute la nouvelle date
    INSERT INTO DATESORTIE (
        IdDateSortie,
        IdJeu,
        IdPlateforme,
        DateSortie,
        RegionSortie,
        StatutSortie,
        DateMAJDateSortie
    ) VALUES (
        nouvel_id,
        jeu_id,
        plat_id,
        date_release,
        zone,
        etat,
        SYSDATE
    );

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END AJOUTER_DATE_SORTIE;
/