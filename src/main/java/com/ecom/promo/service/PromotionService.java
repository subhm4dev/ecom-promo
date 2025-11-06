package com.ecom.promo.service;

import com.ecom.promo.model.request.CouponRequest;
import com.ecom.promo.model.request.CouponValidationRequest;
import com.ecom.promo.model.request.PriceCalculationRequest;
import com.ecom.promo.model.request.PromotionRequest;
import com.ecom.promo.model.response.CouponResponse;
import com.ecom.promo.model.response.PriceCalculationResponse;
import com.ecom.promo.model.response.PromotionResponse;

import java.util.List;
import java.util.UUID;

/**
 * Service interface for promotion operations
 */
public interface PromotionService {
    
    /**
     * Create a new promotion
     */
    PromotionResponse createPromotion(UUID userId, UUID tenantId, List<String> roles, PromotionRequest request);
    
    /**
     * Get active promotions for a product
     */
    List<PromotionResponse> getActivePromotions(UUID productId, UUID tenantId);
    
    /**
     * Calculate final price with promotions applied
     */
    PriceCalculationResponse calculatePrice(UUID tenantId, PriceCalculationRequest request);
    
    /**
     * Create a coupon
     */
    CouponResponse createCoupon(UUID userId, UUID tenantId, List<String> roles, CouponRequest request);
    
    /**
     * Validate coupon code
     */
    CouponResponse validateCoupon(UUID tenantId, CouponValidationRequest request);
}

