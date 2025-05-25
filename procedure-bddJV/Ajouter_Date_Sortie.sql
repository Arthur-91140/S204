create or replace PROCEDURE AJOUTER_DATE_SORTIE(
    p_idJeu IN NUMBER,
    p_idPlateforme IN NUMBER,
    p_dateSortie IN DATE,
    p_regionSortie IN VARCHAR2,
    p_statut IN VARCHAR2
) AS
    v_count NUMBER;
    v_newId NUMBER;

BEGIN
    -- Vérifier que le jeu existe
    SELECT COUNT(*) INTO v_count
    FROM JEU
    WHERE IdJeu = p_idJeu;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Jeu inexistant');
    END IF;

    -- Vérifier que la plateforme existe
    SELECT COUNT(*) INTO v_count
    FROM PLATEFORME
    WHERE IdPlateforme = p_idPlateforme;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Plateforme inexistante');
    END IF;

    -- Vérifier que la région est valide
    IF p_regionSortie NOT IN ('north_america', 'europe', 'japan', 'worldwide', 'australia', 'brazil', 'new_zealand', 'asia', 'china', 'korea') THEN
        RAISE_APPLICATION_ERROR(-20003, 'Région inconnue');
    END IF;

    -- Vérifier qu'il n'y a pas déjà une sortie pour cette combinaison
    SELECT COUNT(*) INTO v_count
    FROM DATESORTIE
    WHERE IdJeu = p_idJeu 
      AND IdPlateforme = p_idPlateforme 
      AND RegionSortie = p_regionSortie;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Sortie déjà enregistrée');
    END IF;

    -- Calculer le nouvel ID
    SELECT NVL(MAX(IdDateSortie), 0) + 1 INTO v_newId
    FROM DATESORTIE;

    -- Insérer la nouvelle date de sortie
    INSERT INTO DATESORTIE (
        IdDateSortie,
        IdJeu,
        IdPlateforme,
        DateSortie,
        RegionSortie,
        StatutSortie,
        DateMAJDateSortie
    ) VALUES (
        v_newId,
        p_idJeu,
        p_idPlateforme,
        p_dateSortie,
        p_regionSortie,
        p_statut,
        SYSDATE
    );

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END AJOUTER_DATE_SORTIE;
/