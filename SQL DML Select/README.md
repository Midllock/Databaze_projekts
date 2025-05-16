
# Výsledky SQL dotazů k databázi `vehicles`

## 1. Selekce všech vlastníků z tabulky `owners` seřazených vzestupně podle příjmení

```sql
SELECT * FROM owners
ORDER BY last_name ASC;
```

**Výstup:**

| id | first_name | last_name    | birthday   | city     | street   | house_number | zip_code |
|----|------------|--------------|------------|----------|----------|---------------|----------|
| 4  | Josef      | Král         | 1968-04-17 | Plzeň    | Kratká   | 8             | 30100    |
| 1  | Jan        | Novák        | 1980-05-15 | Praha    | Dlouhá   | 12            | 11000    |
| 5  | Eva        | Procházková  | 1985-09-02 | Liberec  | Střední  | 14            | 46001    |
| 2  | Petr       | Svoboda      | 1975-11-21 | Brno     | Široká   | 3             | 60200    |
| 3  | Anna       | Veselá       | 1990-08-10 | Ostrava  | Nová     | 45            | 70030    |

---

## 2. Selekce všech vlastníků, kteří se narodili po roce 1980

```sql
SELECT * FROM owners
WHERE birthday > '1980-12-31';
```

**Výstup:**

| id | first_name | last_name   | birthday   | city     | street   | house_number | zip_code |
|----|------------|-------------|------------|----------|----------|---------------|----------|
| 3  | Anna       | Veselá      | 1990-08-10 | Ostrava  | Nová     | 45            | 70030    |
| 5  | Eva        | Procházková | 1985-09-02 | Liberec  | Střední  | 14            | 46001    |

---

## 3. Selekce všech vlastníků z města začínajícího na „P“

```sql
SELECT * FROM owners
WHERE city LIKE 'P%';
```

**Výstup:**

| id | first_name | last_name | birthday   | city  | street | house_number | zip_code |
|----|------------|-----------|------------|-------|--------|---------------|----------|
| 1  | Jan        | Novák     | 1980-05-15 | Praha | Dlouhá | 12            | 11000    |
| 4  | Josef      | Král      | 1968-04-17 | Plzeň | Kratká | 8             | 30100    |

---

## 4. Selekce počtu všech jedinečných modelů z tabulky `models`

```sql
SELECT COUNT(DISTINCT model_name) AS unique_model_count
FROM models;
```

**Výstup:**

| unique_model_count |
|--------------------|
| 10                 |

---

## 5. Selekce všech VIN kódů z tabulky `cars`

```sql
SELECT vin_code FROM cars;
```

**Výstup:**

| vin_code           |
|--------------------|
| 1HGCM82633A123456  |
| 2HGFB2F50DH123456  |
| 3VWFE21C04M000001  |
| 4T1BG22K51U123456  |
| 1FAFP404X1F123456  |

---
