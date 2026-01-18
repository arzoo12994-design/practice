CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TABLE hc.roles (
    role_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    role_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO hc.roles (role_name) VALUES
('Admin'),
('Customer'),
('Professional');

SELECT
    r.role_name,
    COUNT(u.user_id) AS total_users
FROM hc.roles r
LEFT JOIN hc.users u
    ON r.role_id = u.role_id
GROUP BY r.role_name
ORDER BY r.role_name;


INSERT INTO hc.users (
    first_name, last_name, email, password, role_id
)
VALUES (
    'System', 'Admin', 'admin@homecare.com', 'admin123',
    (SELECT role_id FROM hc.roles WHERE role_name = 'Admin')
);

INSERT INTO hc.users (
    first_name, last_name, email, password, role_id, created_by
)
VALUES (
    'Arzoo', 'Customer', 'customer@homecare.com', 'cust123',
    (SELECT role_id FROM hc.roles WHERE role_name = 'Customer'),
    (SELECT user_id FROM hc.users WHERE email = 'admin@homecare.com')
);
SELECT * FROM hc.roles;
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'hc'
  AND table_name = 'users';

ALTER TABLE hc.users
ADD CONSTRAINT fk_users_role
FOREIGN KEY (role_id)
REFERENCES hc.roles(role_id);

UPDATE hc.users
SET role_id = (
    SELECT role_id
    FROM hc.roles
    WHERE role_name = 'Admin'
)
WHERE email = 'admin@gmail.com';

UPDATE hc.users
SET role_id = (
    SELECT role_id
    FROM hc.roles
    WHERE role_name = 'Customer'
)
WHERE email='priya@example.com';

--"rohit.kumar@example.com"
--"pooja.iyer@example.com"
--"neha.kapoor@example.com"
--"arjun.singh@example.com"
--"sneha.patel@example.com"
--"priya@example.com"
--"amit.sharma@example.com"
SELECT
    r.role_name,
    COUNT(u.user_id) AS total_users
FROM hc.roles r
LEFT JOIN hc.users u
    ON r.role_id = u.role_id
GROUP BY r.role_name
ORDER BY r.role_name;

SELECT
    r.role_name,
    COUNT(u.user_id) AS total_users
FROM hc.roles r
JOIN hc.users u
    ON r.role_id = u.role_id
GROUP BY r.role_name
HAVING COUNT(u.user_id) > 2
ORDER BY total_users DESC;




UPDATE hc.users
SET role_id = (
    SELECT role_id
    FROM hc.roles
    WHERE role_name = 'Professional'
)
WHERE email ='vikas.gupta@example.com';

SELECT
    u.user_id,
    u.email,
    r.role_name
FROM hc.users u
LEFT JOIN hc.roles r ON u.role_id = r.role_id;
ananya.bose@example.com


