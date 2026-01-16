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