-- Create coupons table
CREATE TABLE IF NOT EXISTS coupons (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id UUID NOT NULL,
    code VARCHAR(50) NOT NULL UNIQUE,
    discount_type VARCHAR(50) NOT NULL, -- PERCENTAGE, FIXED
    discount_value DECIMAL(19, 2) NOT NULL,
    usage_limit INTEGER, -- NULL means unlimited
    used_count INTEGER DEFAULT 0,
    expiry_date TIMESTAMP NOT NULL,
    min_order_value DECIMAL(19, 2), -- Minimum order value to apply coupon
    active BOOLEAN DEFAULT true,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes
CREATE INDEX idx_coupons_tenant ON coupons(tenant_id);
CREATE INDEX idx_coupons_code ON coupons(code);
CREATE INDEX idx_coupons_active ON coupons(active);
CREATE INDEX idx_coupons_expiry ON coupons(expiry_date);

-- Add comment
COMMENT ON TABLE coupons IS 'Stores coupon codes for discounts';

