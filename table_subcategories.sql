CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TABLE hc.sub_categories (
    sub_category_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

    category_id UUID NOT NULL,

    sub_category_name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10,2),

    is_active BOOLEAN DEFAULT TRUE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_sub_categories_category
        FOREIGN KEY (category_id)
        REFERENCES hc.categories (category_id)
        ON DELETE CASCADE
);

INSERT INTO hc.sub_categories (category_id, sub_category_name)
SELECT category_id, 'Home Cleaning'
FROM hc.categories
WHERE category_name = 'Cleaning';

INSERT INTO hc.sub_categories (category_id, sub_category_name)
SELECT category_id, 'Bathroom Cleaning'
FROM hc.categories
WHERE category_name = 'Cleaning';

INSERT INTO hc.sub_categories (category_id, sub_category_name)
SELECT category_id, 'Kitchen Cleaning'
FROM hc.categories
WHERE category_name = 'Cleaning';

INSERT INTO hc.sub_categories (category_id, sub_category_name)
SELECT category_id, 'AC Repair'
FROM hc.categories
WHERE category_name = 'Repair';

INSERT INTO hc.sub_categories (category_id, sub_category_name)
SELECT category_id, 'Plumbing'
FROM hc.categories
WHERE category_name = 'Repair';

INSERT INTO hc.sub_categories (category_id, sub_category_name)
SELECT category_id, 'Electrical'
FROM hc.categories
WHERE category_name = 'Repair';

INSERT INTO hc.sub_categories (category_id, sub_category_name)
SELECT category_id, 'Haircut'
FROM hc.categories
WHERE category_name = 'Beauty';

INSERT INTO hc.sub_categories (category_id, sub_category_name)
SELECT category_id, 'Facial'
FROM hc.categories
WHERE category_name = 'Beauty';

INSERT INTO hc.sub_categories (category_id, sub_category_name)
SELECT category_id, 'Makeup'
FROM hc.categories
WHERE category_name = 'Beauty';

SELECT
    c.category_name,
    sc.sub_category_name
FROM hc.sub_categories sc
JOIN hc.categories c
    ON c.category_id = sc.category_id
ORDER BY c.category_name;

INSERT INTO hc.sub_categories (category_id, sub_category_name, price)
SELECT
    c.category_id,
    s.sub_category_name,
    s.price
FROM hc.categories c
JOIN (
    VALUES
        ('Cleaning', 'Full Home Cleaning', 2999),
        ('Cleaning', 'Kitchen Cleaning', 1499),
        ('Beauty', 'Facial', 999),
        ('Beauty', 'Hair Spa', 1299)
) AS s(category_name, sub_category_name, price)
ON c.category_name = s.category_name;
