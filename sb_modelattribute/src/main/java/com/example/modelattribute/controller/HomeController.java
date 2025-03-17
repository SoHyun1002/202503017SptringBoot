package com.example.modelattribute.controller;

import com.example.modelattribute.dto.BoardDTO;
import com.example.modelattribute.dto.MemberDTO;
import com.example.modelattribute.dto.ProductDTO;
import com.example.modelattribute.service.BoardService;
import com.example.modelattribute.service.MemberService;
import com.example.modelattribute.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final MemberService memberService;
    private final ProductService productService;
    private final BoardService boardService;

    @GetMapping("/")
    public String home(Model model) {
        // 회원 목록 조회
        List<MemberDTO> members = memberService.getAllMembers();
        model.addAttribute("members", members);
        
        // 상품 목록 조회
        List<ProductDTO> products = productService.getAllProducts();
        model.addAttribute("products", products);
        
        // 게시글 목록 조회
        List<BoardDTO> boards = boardService.getAllBoards();
        model.addAttribute("boards", boards);
        
        return "index";
    }
} 