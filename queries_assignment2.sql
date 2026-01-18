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

INSERT INTO hc.sub_categories
(category_id, sub_category_name, description, price)
SELECT
    category_id,
    'Full Home Cleaning',
    'Complete home cleaning service',
    2999
FROM hc.categories
WHERE category_name = 'Cleaning';

INSERT INTO hc.sub_categories
(category_id, sub_category_name, description, price)
SELECT
    category_id,
    'Full Home Cleaning',
    'Complete home cleaning service',
    2999
FROM hc.categories
WHERE category_name = 'Cleaning';

ALTER TABLE hc.categories
DROP CONSTRAINT fk_categories_service_type;
ALTER TABLE hc.categories
ADD CONSTRAINT fk_categories_service_type
FOREIGN KEY (service_type_id)
REFERENCES hc.service_types(service_type_id)
ON DELETE CASCADE;

INSERT INTO hc.categories (service_type_id, category_name, description)
SELECT service_type_id, 'Cleaning', 'House cleaning services'
FROM hc.service_types
WHERE service_type_name = 'Home Services';

SELECT c.category_name, s.service_type_name
FROM hc.categories c
JOIN hc.service_types s
ON c.service_type_id = s.service_type_id;

INSERT INTO hc.categories (service_type_id, category_name, description)
SELECT service_type_id, 'Salon for Women', 'Women salon services'
FROM hc.service_types
WHERE service_type_name = 'Beauty Services';

INSERT INTO hc.categories (service_type_id, category_name, description)
SELECT service_type_id, 'AC Repair', 'Air conditioner services'
FROM hc.service_types
WHERE service_type_name = 'Repair & Maintenance';

INSERT INTO hc.categories (service_type_id, category_name, description)
SELECT service_type_id, 'Plumbing', 'Plumbing services'
FROM hc.service_types
WHERE service_type_name = 'Repair & Maintenance';