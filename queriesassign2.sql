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

