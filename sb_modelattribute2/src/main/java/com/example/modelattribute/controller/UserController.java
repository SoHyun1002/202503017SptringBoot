package com.example.modelattribute.controller;

import com.example.modelattribute.model.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Slf4j
@Controller
@RequestMapping("/users")
public class UserController {

    // 예제 1: @ModelAttribute를 메서드 레벨에서 사용
    @ModelAttribute("occupations")
    public String[] occupations() {
        return new String[] {"개발자", "디자이너", "기획자", "마케터", "영업"};
    }

    // 예제 2: Form 표시 (GET)
    @GetMapping("/register")
    public String showRegistrationForm(@ModelAttribute User user) {
        return "register";
    }

    // 예제 3: Form 제출 처리 (POST)
    @PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute User user, 
                             BindingResult result,
                             RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "register";
        }
        
        log.info("등록된 사용자: {}", user);
        redirectAttributes.addFlashAttribute("message", "사용자가 성공적으로 등록되었습니다!");
        return "redirect:/users/success";
    }

    // 예제 4: 성공 페이지
    @GetMapping("/success")
    public String showSuccess() {
        return "success";
    }

    // 예제 5: 사용자 상세 정보 표시
    @GetMapping("/details/{email}")
    public String showUserDetails(@PathVariable String email, Model model) {
        // 실제 애플리케이션에서는 데이터베이스에서 조회
        User user = new User();
        user.setEmail(email);
        user.setName("테스트 사용자");
        user.setOccupation("개발자");
        model.addAttribute("user", user);
        return "details";
    }
} 