CREATE TABLE hc.service_types (
    service_type_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    service_type_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,

    is_active BOOLEAN DEFAULT TRUE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
