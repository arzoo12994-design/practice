CREATE TABLE hc.categories (
    category_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

    service_type_id UUID NOT NULL,

    category_name VARCHAR(100) NOT NULL,
    description TEXT,

    is_active BOOLEAN DEFAULT TRUE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_categories_service_type
        FOREIGN KEY (service_type_id)
        REFERENCES service_types (service_type_id)
        ON DELETE CASCADE
);
