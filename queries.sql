ALTER TABLE hc.users
ADD COLUMN role_id UUID;
ALTER TABLE hc.users
ADD CONSTRAINT fk_users_role
FOREIGN KEY (role_id)
REFERENCES hc.roles(role_id);
ALTER TABLE hc.users
ADD CONSTRAINT fk_users_created_by
FOREIGN KEY (created_by)
REFERENCES hc.users(user_id);
SELECT user_id, created_by
FROM hc.users
WHERE created_by IS NOT NULL
AND created_by NOT IN (
    SELECT user_id FROM hc.users
);
UPDATE hc.users
SET created_by = NULL
WHERE created_by IS NOT NULL
AND created_by NOT IN (
    SELECT user_id FROM hc.users
);

SELECT user_id, created_by
FROM hc.users
WHERE created_by IS NOT NULL
AND created_by NOT IN (
    SELECT user_id FROM hc.users
);

ALTER TABLE hc.users
ADD CONSTRAINT fk_users_created_by
FOREIGN KEY (created_by)
REFERENCES hc.users(user_id);

SELECT user_id, modified_by
FROM hc.users
WHERE modified_by IS NOT NULL
AND modified_by NOT IN (
    SELECT user_id FROM hc.users
);

UPDATE hc.users
SET modified_by = NULL
WHERE modified_by IS NOT NULL
AND modified_by NOT IN (
    SELECT user_id FROM hc.users
);

SELECT user_id, modified_by
FROM hc.users
WHERE modified_by IS NOT NULL
AND modified_by NOT IN (
    SELECT user_id FROM hc.users
);
ALTER TABLE hc.users
ADD CONSTRAINT fk_users_modified_by
FOREIGN KEY (modified_by)
REFERENCES hc.users(user_id);
SELECT
    r.role_name,
    COUNT(u.user_id) AS total_users
FROM hc.roles r
LEFT JOIN hc.users u
    ON r.role_id = u.role_id
GROUP BY r.role_name
ORDER BY r.role_name;

SELECT user_id, role_id
FROM hc.users;
SELECT role_id, role_name
FROM hc.roles;

UPDATE hc.users
SET role_id = (
    SELECT role_id
    FROM hc.roles
    WHERE role_name = 'Admin'
)
WHERE email = 'Liyana@gmail.com';

UPDATE hc.users
SET role_id = (
    SELECT role_id
    FROM hc.roles
    WHERE role_name = 'Professional'
)
WHERE email LIKE 'shivani@example.com';


UPDATE hc.users
SET role_id = (
    SELECT role_id
    FROM hc.roles
    WHERE role_name = 'Customer'
);
SELECT
    r.role_name,
    COUNT(u.user_id) AS total_users
FROM hc.roles r
LEFT JOIN hc.users u
    ON r.role_id = u.role_id
GROUP BY r.role_name
ORDER BY r.role_name;


