-- Active: 1747390466446@@127.0.0.1@3306

SELECT * FROM owners
ORDER BY last_name ASC;


SELECT * FROM owners
WHERE birthday > '1980-12-31';


SELECT * FROM owners
WHERE city LIKE 'P%';

SELECT COUNT(DISTINCT model_name) AS unique_model_count
FROM models;

SELECT vin_code FROM cars;
