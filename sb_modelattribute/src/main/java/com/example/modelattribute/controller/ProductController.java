package com.example.modelattribute.controller;

import com.example.modelattribute.dto.ProductDTO;
import com.example.modelattribute.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/products")
@RequiredArgsConstructor
@SessionAttributes("productDTO") // 세션에 productDTO를 저장하는 예시
public class ProductController {

    private final ProductService productService;
    
    // 모든 상품 목록 조회
    @GetMapping
    public String getAllProducts(Model model) {
        List<ProductDTO> products = productService.getAllProducts();
        model.addAttribute("products", products);
        return "product/list";
    }
    
    // 상품 등록 폼 - 세션에 저장될 productDTO 초기화
    @GetMapping("/register")
    public String registerForm(Model model) {
        model.addAttribute("productDTO", new ProductDTO());
        return "product/registerForm";
    }
    
    // 상품 등록 처리 - @ModelAttribute와 @SessionAttributes 사용
    @PostMapping("/register")
    public String register(@ModelAttribute("productDTO") ProductDTO productDTO, RedirectAttributes redirectAttributes) {
        productService.registerProduct(productDTO);
        redirectAttributes.addFlashAttribute("message", "상품 등록이 완료되었습니다.");
        return "redirect:/products";
    }
    
    // 상품 상세 정보 조회
    @GetMapping("/{id}")
    public String getProductDetail(@PathVariable Long id, Model model) {
        ProductDTO product = productService.getProductById(id);
        model.addAttribute("product", product);
        return "product/detail";
    }
    
    // 상품 수정 폼
    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable Long id, Model model) {
        ProductDTO product = productService.getProductById(id);
        model.addAttribute("productDTO", product);
        return "product/editForm";
    }
    
    // 상품 수정 처리 - @ModelAttribute 사용
    @PostMapping("/{id}/edit")
    public String edit(@PathVariable Long id, @ModelAttribute ProductDTO productDTO, RedirectAttributes redirectAttributes) {
        productDTO.setId(id);
        productService.updateProduct(productDTO);
        redirectAttributes.addFlashAttribute("message", "상품 정보가 수정되었습니다.");
        return "redirect:/products/" + id;
    }
    
    // 상품 삭제
    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        productService.deleteProduct(id);
        redirectAttributes.addFlashAttribute("message", "상품이 삭제되었습니다.");
        return "redirect:/products";
    }
    
    // 가격 범위로 상품 검색
    @GetMapping("/search")
    public String searchByPriceRange(@RequestParam(required = false, defaultValue = "0") double minPrice,
                                    @RequestParam(required = false, defaultValue = "1000000") double maxPrice,
                                    Model model) {
        List<ProductDTO> products = productService.getProductsByPriceRange(minPrice, maxPrice);
        model.addAttribute("products", products);
        model.addAttribute("minPrice", minPrice);
        model.addAttribute("maxPrice", maxPrice);
        return "product/searchResult";
    }
    
    // 모든 요청에 공통적으로 사용되는 모델 속성 추가 - @ModelAttribute 메서드 사용
    @ModelAttribute("categories")
    public List<String> getCategories() {
        return List.of("전자제품", "의류", "식품", "가구", "도서");
    }
} 