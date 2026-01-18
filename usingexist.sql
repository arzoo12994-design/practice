WITH category_count AS (
    SELECT
        service_type_id,
        COUNT(category_id) AS total_categories
    FROM hc.categories
    GROUP BY service_type_id
)
SELECT
    st.service_type_name,
    cc.total_categories
FROM category_count cc
JOIN hc.service_types st
    ON st.service_type_id = cc.service_type_id
ORDER BY st.service_type_name;
