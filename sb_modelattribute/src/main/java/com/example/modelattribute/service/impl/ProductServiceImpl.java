package com.example.modelattribute.service.impl;

import com.example.modelattribute.dto.ProductDTO;
import com.example.modelattribute.mapper.ProductMapper;
import com.example.modelattribute.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ProductMapper productMapper;
    
    @Override
    public void registerProduct(ProductDTO productDTO) {
        productMapper.insertProduct(productDTO);
    }

    @Override
    public void updateProduct(ProductDTO productDTO) {
        productMapper.updateProduct(productDTO);
    }

    @Override
    public void deleteProduct(Long id) {
        productMapper.deleteProduct(id);
    }

    @Override
    public ProductDTO getProductById(Long id) {
        return productMapper.selectProductById(id);
    }

    @Override
    public List<ProductDTO> getProductsByName(String name) {
        return productMapper.selectProductsByName(name);
    }

    @Override
    public List<ProductDTO> getAllProducts() {
        return productMapper.selectAllProducts();
    }

    @Override
    public List<ProductDTO> getProductsByPriceRange(double minPrice, double maxPrice) {
        return productMapper.selectProductsByPriceRange(minPrice, maxPrice);
    }
} 