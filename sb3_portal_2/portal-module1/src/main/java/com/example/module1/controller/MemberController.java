package com.example.module1.controller;

import com.example.module1.entity.Member;
import com.example.module1.service.MemberService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String login      (@RequestParam String username,
                       @RequestParam String password,
                       HttpSession session,
                       Model model) {
        Member member = memberService.login(username, password);
        if (member != null) {
            session.setAttribute("memberId", member.getId());
            session.setAttribute("username", member.getUsername());
            session.setAttribute("email", member.getEmail());

            return "redirect:/dashboard";
        }
        model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
        return "login";
    }

    @GetMapping("/register")
    public String registerForm(Model model) {
        model.addAttribute("member", new Member());
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute Member member,
                          Model model) {
        if (memberService.isUsernameExists(member.getUsername())) {
            model.addAttribute("error", "이미 사용 중인 아이디입니다.");
            return "register";
        }
        memberService.register(member);
        return "redirect:/login";
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session,
                          Model model) {
        String username = (String) session.getAttribute("username");
        String email = (String) session.getAttribute("email");
        model.addAttribute("username", username);
        model.addAttribute("email", email);

        return "dashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
} 