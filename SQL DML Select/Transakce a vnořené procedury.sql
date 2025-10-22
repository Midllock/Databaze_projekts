-- Active: 1740732000183@@127.0.0.1@3306
DROP TABLE IF EXISTS hockeyPlayer;

CREATE TABLE hockeyPlayer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(30) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    team VARCHAR(50) NOT NULL
);
DELIMITER $$

CREATE PROCEDURE insert_player(
    IN p_fname VARCHAR(30),
    IN p_lname VARCHAR(50),
    IN p_team VARCHAR(50)
)
BEGIN
    -- handler pro chyby SQL (např. porušení NOT NULL)
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Chyba při vkládání záznamu' AS message;
    END;

    START TRANSACTION;

    INSERT INTO hockeyPlayer (fname, lname, team)
    VALUES (p_fname, p_lname, p_team);

    COMMIT;
END$$

DELIMITER ;

-- Volání procedury
CALL insert_player('David', 'Pastrňák', 'Boston Bruins');
CALL insert_player('Pavel', 'Zacha', NULL);

-- Výpis tabulky
SELECT * FROM hockeyPlayer;

-- Komentář 
-- 1. První volání proběhne úspěšně a vloží hráče Davida Pastrňáka.
-- 2. Druhé volání skončí chybou, protože sloupec "team" nesmí být NULL.
--    Procedura zachytí chybu, provede ROLLBACK a vypíše "Chyba při vkládání záznamu".
--    Do tabulky se nevloží žádný nový záznam.


