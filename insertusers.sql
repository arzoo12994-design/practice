INSERT INTO users (
    first_name,
    last_name,
    email,
    password,
    created_by,
    created_date,
    is_active,
    is_deleted,
    birth_date,
    address,
    mobile_number
)
VALUES
('Amit', 'Sharma', 'amit.sharma@example.com',
 crypt('Password@123', gen_salt('b,
 NULL, CURRENT_TIMESTAMP, TRUE, FALSE,
 '1992-04-15', 'Delhi, India', '9876543210'),

('Priya', 'Verma', 'priya.verma@example.com',
 crypt('Password@123', gen_salt('bf')),
 NULL, CURRENT_TIMESTAMP, TRUE, FALSE,
 '1995-08-21', 'Mumbai, India', '9123456789'),

('Rahul', 'Mehta', 'rahul.mehta@example.com',
 crypt('Password@123', gen_salt('bf')),
 NULL, CURRENT_TIMESTAMP, TRUE, FALSE,
 '1990-01-10', 'Ahmedabad, India', '9988776655'),

('Sneha', 'Patel', 'sneha.patel@example.com',
 crypt('Password@123', gen_salt('bf')),
 NULL, CURRENT_TIMESTAMP, TRUE, FALSE,
 '1996-06-05', 'Surat, India', '9090909090'),

('Arjun', 'Singh', 'arjun.singh@example.com',
 crypt('Password@123', gen_salt('bf')),
 NULL, CURRENT_TIMESTAMP, TRUE, FALSE,
 '1989-12-19', 'Jaipur, India', '9012345678'),

('Neha', 'Kapoor', 'neha.kapoor@example.com',
 crypt('Password@123', gen_salt('bf')),
 NULL, CURRENT_TIMESTAMP, TRUE, FALSE,
 '1993-03-30', 'Chandigarh, India', '9345678901'),

('Vikas', 'Gupta', 'vikas.gupta@example.com',
 crypt('Password@123', gen_salt('bf')),
 NULL, CURRENT_TIMESTAMP, TRUE, FALSE,
 '1988-11-11', 'Noida, India', '9567890123'),

('Pooja', 'Iyer', 'pooja.iyer@example.com',
 crypt('Password@123', gen_salt('bf')),
 NULL, CURRENT_TIMESTAMP, TRUE, FALSE,
 '1994-09-09', 'Chennai, India', '9789012345'),

('Rohit', 'Kumar', 'rohit.kumar@example.com',
 crypt('Password@123', gen_salt('bf')),
 NULL, CURRENT_TIMESTAMP, TRUE, FALSE,
 '1991-07-17', 'Patna, India', '9898989898'),

('Ananya', 'Bose', 'ananya.bose@example.com',
 crypt('Password@123', gen_salt('bf')),
 NULL, CURRENT_TIMESTAMP, TRUE, FALSE,
 '1997-02-25', 'Kolkata, India', '9678901234');
