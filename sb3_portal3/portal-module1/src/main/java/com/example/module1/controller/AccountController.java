package com.example.module1.controller;

import com.example.module1.entity.Account;
import com.example.module1.service.AccountService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AccountController {
    @Autowired
    private AccountService accountService;

    @GetMapping("/")
    public String home() {
        return "login";
    }

    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String id,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {
        Account account = accountService.login(id, password);
        if (account != null) {
            session.setAttribute("name", account.getName());
            return "redirect:http://localhost:8087";  // 로그인 성공 시 포털로 이동
        }
        model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
        return "login";
    }


    @GetMapping("/register")
    public String registerForm(Model model) {
        model.addAttribute("account", new Account());
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute Account account, Model model) {
        // id가 이미 존재하는지 확인
        if (accountService.isIdExists(account.getId())) {
            model.addAttribute("error", "이미 사용 중인 아이디입니다.");
            return "register";  // 중복된 아이디가 있으면 다시 회원가입 화면으로 돌아감
        }
        // 회원가입 처리
        accountService.register(account);
        return "redirect:/login";  // 회원가입 성공 후 로그인 페이지로 리디렉션
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}