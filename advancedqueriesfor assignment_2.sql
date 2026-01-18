CREATE UNIQUE INDEX idx_users_email
ON hc.users (email);

SELECT *
FROM hc.users
WHERE DATE(created_date) = CURRENT_DATE;

SELECT *
FROM hc.users
WHERE created_date >= CURRENT_DATE - INTERVAL '30 days';

SELECT
    user_id,
    first_name,
    last_name,
    EXTRACT(YEAR FROM birth_date) AS birth_year
FROM hc.users
WHERE birth_date IS NOT NULL;

SELECT
    user_id,
    first_name,
    last_name,
    birth_date,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, birth_date)) AS age
FROM hc.users
WHERE birth_date IS NOT NULL;

SELECT
    EXTRACT(YEAR FROM birth_date) AS birth_year,
    COUNT(*) AS total_users
FROM hc.users
WHERE birth_date IS NOT NULL
GROUP BY birth_year
ORDER BY birth_year;

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    r.role_name,
    u.created_date,
    ROW_NUMBER() OVER (
        PARTITION BY r.role_id
        ORDER BY u.created_date
    ) AS row_num
FROM hc.users u
JOIN hc.roles r
    ON u.role_id = r.role_id
ORDER BY r.role_name, row_num;

SELECT
    r.role_id,
    r.role_name,
    COUNT(u.user_id) AS user_count,
    RANK() OVER (ORDER BY COUNT(u.user_id) DESC) AS role_rank
FROM hc.roles r
LEFT JOIN hc.users u
    ON u.role_id = r.role_id
GROUP BY r.role_id, r.role_name
ORDER BY role_rank;

SELECT
    u.user_id,
    u.first_name,
    u.role_id,
    u.created_date,
    LAG(u.created_date) OVER (
        PARTITION BY u.role_id
        ORDER BY u.created_date
    ) AS previous_created_date
FROM hc.users u
ORDER BY u.role_id, u.created_date;

SELECT
    u.user_id,
    u.first_name,
    u.role_id,
    u.created_date,
    LEAD(u.created_date) OVER (
        PARTITION BY u.role_id
        ORDER BY u.created_date
    ) AS next_created_date
FROM hc.users u
ORDER BY u.role_id, u.created_date;

SELECT
    user_id,
    first_name,
    last_name,
    role_id,
    birth_date
FROM (
    SELECT
        u.*,
        ROW_NUMBER() OVER (
            PARTITION BY role_id
            ORDER BY birth_date ASC
        ) AS rn
    FROM hc.users u
    WHERE birth_date IS NOT NULL
) ranked_users
WHERE rn = 2;

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    r.role_name,
    u.birth_date
FROM (
    SELECT
        u.user_id,
        u.role_id,
        u.birth_date,
        ROW_NUMBER() OVER (
            PARTITION BY u.role_id
            ORDER BY u.birth_date ASC
        ) AS rn
    FROM hc.users u
    WHERE u.birth_date IS NOT NULL
) ranked_users
JOIN hc.users u ON u.user_id = ranked_users.user_id
JOIN hc.roles r ON r.role_id = u.role_id
WHERE ranked_users.rn = 2
ORDER BY r.role_name;




