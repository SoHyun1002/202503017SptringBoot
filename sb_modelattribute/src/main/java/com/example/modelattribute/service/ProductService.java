package com.example.modelattribute.service;

import com.example.modelattribute.dto.ProductDTO;

import java.util.List;

public interface ProductService {
    
    // 상품 등록
    void registerProduct(ProductDTO productDTO);
    
    // 상품 정보 수정
    void updateProduct(ProductDTO productDTO);
    
    // 상품 삭제
    void deleteProduct(Long id);
    
    // 상품 ID로 조회
    ProductDTO getProductById(Long id);
    
    // 상품명으로 조회
    List<ProductDTO> getProductsByName(String name);
    
    // 모든 상품 조회
    List<ProductDTO> getAllProducts();
    
    // 가격 범위로 상품 조회
    List<ProductDTO> getProductsByPriceRange(double minPrice, double maxPrice);
} 