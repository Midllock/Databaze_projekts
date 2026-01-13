-- Active: 1764434348789@@127.0.0.1@3306@mysql
-- 1. SELECT: Zobrazení všeho s názvem kategorie
SELECT p.id_polozka, p.nazev, k.nazev AS kategorie, p.datum_expirace, p.pocet_kusu
FROM polozka p
JOIN kategorie k ON p.id_kategorie = k.id_kategorie;

-- 2. INSERT: Přidání nové položky
INSERT INTO polozka (nazev, id_kategorie, datum_expirace, pocet_kusu) 
VALUES ('Hrášek', 4, '2026-12-31', 3);

-- 3. UPDATE: Změna počtu kusů
UPDATE polozka SET pocet_kusu = 10 WHERE id_polozka = 1;

-- 4. UPDATE: Změna data expirace
UPDATE polozka SET datum_expirace = '2026-12-24' WHERE id_polozka = 2;

-- 5. DELETE: Odstranění podle ID
DELETE FROM polozka WHERE id_polozka = 15;

-- 1. JOIN + WHERE: Expirace do 30 dnů (bráno od 9.1.2026 dle zadání)
SELECT p.nazev, p.datum_expirace
FROM polozka p
WHERE p.datum_expirace <= DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY);

-- 2. Agregace: Celkový počet kusů v mrazáku
SELECT SUM(pocet_kusu) AS celkem_kusu FROM polozka;

-- 3. GROUP BY + COUNT: Počet položek v kategoriích
SELECT k.nazev, COUNT(p.id_polozka) AS pocet_polozek
FROM kategorie k
LEFT JOIN polozka p ON k.id_kategorie = p.id_kategorie
GROUP BY k.nazev;

-- 4. MIN / MAX: Nejbližší a nejvzdálenější expirace
SELECT MIN(datum_expirace) AS nejblizsi, MAX(datum_expirace) AS nejvzdalenejsi 
FROM polozka;

-- 5. UNION: Expirace do 14 dnů NEBO méně než 2 kusy
SELECT nazev, 'Blízká expirace' AS duvod FROM polozka 
WHERE datum_expirace <= DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY)
UNION
SELECT nazev, 'Málo kusů' AS duvod FROM polozka 
WHERE pocet_kusu < 2;