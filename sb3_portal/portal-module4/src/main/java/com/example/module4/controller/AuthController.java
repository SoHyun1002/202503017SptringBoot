package com.example.module4.controller;

import com.example.module4.entity.User;
import com.example.module4.service.UserService;
import com.example.module4.util.PasswordEncoder;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/module4")

public class AuthController {
    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {
        User user = userService.login(username, password);
        if (user != null) {
            session.setAttribute("userId", user.getId());
            session.setAttribute("username", user.getUsername());
            return "redirect:/dashboard";
        }
        model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
        return "login";
    }

    @GetMapping("/register")
    public String registerForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute User user,
                           Model model) {
        if (userService.isUsernameExists(user.getUsername())) {
            model.addAttribute("error", "이미 사용 중인 아이디입니다.");
            return "register";
        }
        userService.register(user);
        return "redirect:/login";
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session,
                            Model model) {
        String username = (String) session.getAttribute("username");
        model.addAttribute("username", username);
        return "dashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

}