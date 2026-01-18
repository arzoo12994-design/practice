CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TABLE hc.categories (
    category_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

    service_type_id UUID NOT NULL,

    category_name VARCHAR(100) NOT NULL,
    description TEXT,

    is_active BOOLEAN DEFAULT TRUE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_categories_service_type
        FOREIGN KEY (service_type_id)
        REFERENCES hc.service_types (service_type_id)
        ON DELETE CASCADE
);
INSERT INTO hc.categories (service_type_id, category_name)
SELECT
    service_type_id,
    'Cleaning'
FROM hc.service_types
WHERE service_type_name = 'Home Services';

INSERT INTO hc.categories (service_type_id, category_name)
SELECT service_type_id, 'Repair'
FROM hc.service_types
WHERE service_type_name = 'Home Services';

INSERT INTO hc.categories (service_type_id, category_name)
SELECT service_type_id, 'Beauty'
FROM hc.service_types
WHERE service_type_name = 'Personal Care';

SELECT
    st.service_type_name,
    COUNT(c.category_id) AS total_categories
FROM hc.service_types st
LEFT JOIN hc.categories c
    ON st.service_type_id = c.service_type_id
GROUP BY st.service_type_name
ORDER BY st.service_type_name;

SELECT
    c.category_name,
    COUNT(sc.sub_category_id) AS total_sub_categories
FROM hc.categories c
LEFT JOIN hc.sub_categories sc
    ON c.category_id = sc.category_id
GROUP BY c.category_name
ORDER BY c.category_name;

INSERT INTO hc.categories (service_type_id, category_name)
SELECT
    st.service_type_id,
    c.category_name
FROM hc.service_types st
JOIN (
    VALUES
        ('Home Services', 'Cleaning'),
        ('Home Services', 'Repair'),
        ('Home Services', 'Electrician'),
        ('Home Services', 'Plumbing'),
        ('Personal Care', 'Beauty'),
        ('Personal Care', 'Salon'),
        ('Personal Care', 'Spa')
) AS c(service_type_name, category_name)
ON st.service_type_name = c.service_type_name;


SELECT
    st.service_type_name,
    c.category_name
FROM hc.categories c
JOIN hc.service_types st
ON st.service_type_id = c.service_type_id
ORDER BY st.service_type_name;

INSERT INTO hc.categories (category_name) VALUES
('Cleaning'),
('Beauty'),
('Repair');

SELECT
    st.service_type_id,
    st.service_type_name,
    COUNT(c.category_id) AS total_categories
FROM hc.service_types st
JOIN hc.categories c
    ON c.service_type_id = st.service_type_id
GROUP BY
    st.service_type_id,
    st.service_type_name
HAVING COUNT(c.category_id) > 3;
