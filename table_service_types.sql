CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TABLE hc.service_types (
    service_type_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    service_type_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,

    is_active BOOLEAN DEFAULT TRUE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO hc.service_types (service_type_name) VALUES
('Home Services'),
('Personal Care');

SELECT
    st.service_type_name,
    c.category_name
FROM hc.categories c
JOIN hc.service_types st
    ON st.service_type_id = c.service_type_id;

SELECT service_type_id, service_type_name
FROM hc.service_types;

SELECT
    st.service_type_id,
    st.service_type_name,
    c.category_id,
    c.category_name
FROM hc.service_types st
LEFT JOIN hc.categories c
    ON st.service_type_id = c.service_type_id
ORDER BY st.service_type_name, c.category_name;

SELECT
    c.category_id,
    c.category_name,
    sc.sub_category_id,
    sc.sub_category_name
FROM hc.sub_categories sc
RIGHT JOIN hc.categories c
    ON sc.category_id = c.category_id
ORDER BY c.category_name, sc.sub_category_name;

SELECT
    st.service_type_id,
    st.service_type_name
FROM hc.service_types st
WHERE EXISTS (
    SELECT 1
    FROM hc.categories c
    WHERE c.service_type_id = st.service_type_id
);
SELECT DISTINCT
    c.category_name
FROM hc.categories c
WHERE EXISTS (
    SELECT 
    FROM hc.sub_categories sc
    WHERE sc.category_id = c.category_id
);

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM hc.users u
WHERE EXISTS (
    SELECT 
    FROM hc.roles r
    WHERE r.role_id = u.role_id
);



