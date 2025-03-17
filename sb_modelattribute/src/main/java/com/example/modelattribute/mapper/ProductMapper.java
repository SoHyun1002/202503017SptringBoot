package com.example.modelattribute.mapper;

import com.example.modelattribute.dto.ProductDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductMapper {
    
    // 상품 등록
    void insertProduct(ProductDTO productDTO);
    
    // 상품 정보 수정
    void updateProduct(ProductDTO productDTO);
    
    // 상품 삭제
    void deleteProduct(Long id);
    
    // 상품 ID로 조회
    ProductDTO selectProductById(Long id);
    
    // 상품명으로 조회
    List<ProductDTO> selectProductsByName(String name);
    
    // 모든 상품 조회
    List<ProductDTO> selectAllProducts();
    
    // 가격 범위로 상품 조회
    List<ProductDTO> selectProductsByPriceRange(double minPrice, double maxPrice);
} 