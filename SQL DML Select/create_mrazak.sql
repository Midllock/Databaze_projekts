-- Active: 1764434348789@@127.0.0.1@3306@mysql

-- Vytvoření databáze
CREATE DATABASE IF NOT EXISTS mrazak_evidence;
USE mrazak_evidence;

-- Tabulka kategorií
CREATE TABLE kategorie (
    id_kategorie INT AUTO_INCREMENT PRIMARY KEY,
    nazev VARCHAR(50) NOT NULL UNIQUE
);

-- Tabulka položek
CREATE TABLE polozka (
    id_polozka INT AUTO_INCREMENT PRIMARY KEY,
    nazev VARCHAR(100) NOT NULL,
    id_kategorie INT NOT NULL,
    datum_expirace DATE NOT NULL,
    pocet_kusu INT NOT NULL,
    CONSTRAINT fk_kategorie FOREIGN KEY (id_kategorie) REFERENCES kategorie(id_kategorie),
    CONSTRAINT chk_expirace CHECK (datum_expirace >= CURRENT_DATE),
    CONSTRAINT chk_pocet CHECK (pocet_kusu > 0)
);
