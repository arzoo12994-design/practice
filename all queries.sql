select first_name,last_name,email from hc.users;
SELECT *
FROM hc.users
WHERE first_name LIKE 'A%i';
SELECT *
FROM hc.users
WHERE is_active IS FALSE;
SELECT *
FROM hc.users
WHERE email LIKE '%@example%';
SELECT *
FROM hc.users
WHERE first_name ILIKE 'A%';
SELECT *
FROM hc.users
ORDER BY created_date DESC;
SELECT *
FROM hc.users
ORDER BY created_date DESC
LIMIT 5;
SELECT COUNT(*)
FROM hc.users;
SELECT
    MIN(birth_date) AS earliest_birth_date,
    MAX(birth_date) AS latest_birth_date
FROM hc.users;
SELECT COUNT(*)
FROM hc.users
WHERE is_active IS TRUE;

SELECT
    AVG(EXTRACT(YEAR FROM age(CURRENT_DATE, birth_date))) AS average_age
FROM hc.users
WHERE birth_date IS NOT NULL;

