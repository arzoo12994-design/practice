CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE hc.Users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password TEXT NOT NULL,
    created_by UUID,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_by UUID,
    modified_date TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,
    birth_date DATE,
    address TEXT,
    mobile_number VARCHAR(20)
);
