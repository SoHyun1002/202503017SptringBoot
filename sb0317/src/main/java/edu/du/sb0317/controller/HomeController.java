package edu.du.sb0317.controller;

import edu.du.sb0317.spring.RegisterRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {
//    @RequestMapping(value = "/", method = RequestMethod.GET)
    @GetMapping("/")
    public String home() {
        return "success";
    }

    @RequestMapping("/register/step1")
    public String handleStep1() {
        return "register/step1";
    }
    @PostMapping("/register/step2")
    public String handleStep2(
            @RequestParam(value = "agree", defaultValue = "false") Boolean agree,
            Model model) {
        if (!agree) {
            return "register/step1";
        }
        model.addAttribute("registerRequest", new RegisterRequest());
        return "register/step2";
    }
}
