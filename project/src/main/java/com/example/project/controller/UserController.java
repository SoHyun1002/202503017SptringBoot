package com.example.project.controller;

import com.example.project.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/auth")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/join")
    public String showJoinForm() {
        return "join";
    }

    @PostMapping("/join")
    public String registerUser(@RequestParam String username, @RequestParam String password, Model model) {
        boolean isRegistered = userService.registerUser(username, password);
        if (isRegistered) {
            return "redirect:/auth/login";
        } else {
            model.addAttribute("error", "이미 존재하는 아이디입니다.");
            return "join";
        }
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String username, @RequestParam String password, HttpSession session, Model model) {
        boolean isAuthenticated = userService.authenticateUser(username, password);
        if (isAuthenticated) {
            session.setAttribute("user", username);
            return "redirect:/";
        } else {
            model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logoutUser(HttpSession session) {
        session.invalidate();
        return "redirect:/auth/login";
    }
}