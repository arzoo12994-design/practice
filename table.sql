
CREATE TABLE hc.users (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    first_name VARCHAR(100) NOT NULL,
    last_name  VARCHAR(100) NOT NULL,

    email VARCHAR(255) UNIQUE NOT NULL,

    password TEXT NOT NULL, -- store encrypted/hashed password

    created_by UUID,
    created_date TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    modified_by UUID,
    modified_date TIMESTAMP WITHOUT TIME ZONE,

    is_active  BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,

    birth_date DATE,

    address TEXT,

    mobile_number VARCHAR(15)
);
SELECT COUNT(*)
FROM hc.users
WHERE is_active IS TRUE;
SELECT COUNT(*)
FROM hc.users;

SELECT
    MIN(birth_date) AS earliest_birth_date,
    MAX(birth_date) AS latest_birth_date
FROM hc.users;

SELECT
    AVG(EXTRACT(YEAR FROM age(CURRENT_DATE, birth_date))) AS average_age
FROM hc.users
WHERE birth_date IS NOT NULL;

SELECT
    EXTRACT(YEAR FROM birth_date) AS birth_year,
    COUNT(*) AS total_users
FROM hc.users
WHERE birth_date IS NOT NULL
GROUP BY EXTRACT(YEAR FROM birth_date)
ORDER BY birth_year;

SELECT
    EXTRACT(YEAR FROM birth_date) AS birth_year,
    COUNT(*) AS total_users
FROM hc.users
WHERE birth_date IS NOT NULL
GROUP BY EXTRACT(YEAR FROM birth_date)
HAVING COUNT(*) > 5
ORDER BY birth_year;

SELECT
    c.category_id,
    c.category_name,
    st.service_type_name
FROM hc.categories c
INNER JOIN hc.service_types st
    ON c.service_type_id = st.service_type_id
ORDER BY st.service_type_name, c.category_name;

SELECT
    r.role_id,
    r.role_name
FROM hc.roles r
WHERE EXISTS (
    SELECT 1
    FROM hc.users u
    WHERE u.role_id = r.role_id
);

ALTER TABLE hc.users
ADD CONSTRAINT uq_users_email UNIQUE (email);

SELECT
    constraint_name,
    constraint_type
FROM information_schema.table_constraints
WHERE table_schema = 'hc'
  AND table_name = 'users'
  AND constraint_type = 'UNIQUE';

  ALTER TABLE hc.users
DROP CONSTRAINT uq_users_email;

SELECT
    tc.constraint_name,
    tc.table_name,
    kcu.column_name,
    ccu.table_name AS referenced_table
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu
  ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage ccu
  ON ccu.constraint_name = tc.constraint_name
WHERE tc.table_schema = 'hc'
AND tc.constraint_type = 'FOREIGN KEY';

ALTER TABLE hc.users
ADD CONSTRAINT chk_users_mobile_length
CHECK (
    mobile_number IS NULL
    OR length(mobile_number) = 10
);

ALTER TABLE hc.users
ADD CONSTRAINT chk_users_birth_date_past
CHECK (
    birth_date IS NULL
    OR birth_date < CURRENT_DATE
);

SELECT
    user_id,
    first_name,
    last_name,
    mobile_number
FROM hc.users
WHERE length(mobile_number)=10;


SELECT
    user_id,
    first_name,
    last_name,
    mobile_number
FROM hc.users
WHERE mobile_number IS NULL
   OR mobile_number !~ '^[0-9]{10}$';

UPDATE hc.users
SET mobile_number = '9876543211'
WHERE first_name = 'Arzoo';

UPDATE hc.users
SET birth_date = '12/09/2000'
WHERE first_name = 'Arzoo';
UPDATE hc.users
SET birth_date = '12/05/1999'
WHERE first_name = 'System';



SELECT
    user_id,
    first_name,
    last_name,
    birth_date
FROM hc.users
WHERE birth_date IS NULL
   OR birth_date >= CURRENT_DATE;



