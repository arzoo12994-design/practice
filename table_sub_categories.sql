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
        REFERENCES categories (category_id)
        ON DELETE CASCADE
);
