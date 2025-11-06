-- Create promotions table
CREATE TABLE IF NOT EXISTS promotions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(50) NOT NULL, -- PERCENTAGE, FIXED_AMOUNT, BUY_X_GET_Y
    discount_type VARCHAR(50) NOT NULL, -- PERCENTAGE, FIXED
    discount_value DECIMAL(19, 2) NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    eligibility_criteria TEXT, -- JSON string for product IDs, category IDs, etc.
    priority INTEGER DEFAULT 0, -- Higher priority promotions applied first
    active BOOLEAN DEFAULT true,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes
CREATE INDEX idx_promotions_tenant ON promotions(tenant_id);
CREATE INDEX idx_promotions_active ON promotions(active);
CREATE INDEX idx_promotions_dates ON promotions(start_date, end_date);
CREATE INDEX idx_promotions_priority ON promotions(priority DESC);

-- Add comment
COMMENT ON TABLE promotions IS 'Stores promotional rules for discounts and pricing';

