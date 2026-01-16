INSERT INTO hc.roles (role_name, description)
VALUES
('Admin', 'System administrator'),
('Customer', 'Service customer'),
('Professional', 'Service provider');

INSERT INTO hc.service_types (service_type_name, description)
VALUES
('Home Services', 'All home related services'),
('Beauty Services', 'Salon and beauty services'),
('Repair & Maintenance', 'Repair and maintenance services');


INSERT INTO hc.categories (service_type_id, category_name, description)
VALUES
(
    (SELECT service_type_id FROM hc.service_types WHERE service_type_name = 'Home Services'),
    'Cleaning',
    'House cleaning services'
),
(
    (SELECT service_type_id FROM hc.service_types WHERE service_type_name = 'Beauty Services'),
    'Salon for Women',
    'Women salon services'
),
(
    (SELECT service_type_id FROM hc.service_types WHERE service_type_name = 'Repair & Maintenance'),
    'AC Repair',
    'Air conditioner services'
),
(
    (SELECT service_type_id FROM hc.service_types WHERE service_type_name = 'Repair & Maintenance'),
    'Plumbing',
    'Plumbing services'
);

INSERT INTO hc.sub_categories (category_id, sub_category_name, description, price)
VALUES
(
    (SELECT category_id FROM categories WHERE category_name = 'Cleaning'),
    'Full Home Cleaning',
    'Complete home cleaning service',
    2999.00
),
(
    (SELECT category_id FROM categories WHERE category_name = 'Salon for Women'),
    'Haircut',
    'Professional haircut service',
    499.00
),
(
    (SELECT category_id FROM categories WHERE category_name = 'AC Repair'),
    'AC Gas Refilling',
    'AC gas refill service',
    1999.00
),
(
    (SELECT category_id FROM categories WHERE category_name = 'Plumbing'),
    'Leak Fixing',
    'Fix water leakage issues',
    799.00
);


select * from hc.service_types;
select * from hc.sub_categories;

