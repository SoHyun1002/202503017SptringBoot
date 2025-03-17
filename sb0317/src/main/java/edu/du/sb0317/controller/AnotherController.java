package edu.du.sb0317.controller;

import edu.du.sb0317.spring.RegisterRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/another")
public class AnotherController {

    @GetMapping
    public String home() {
        return "another/form1";
    }

    @PostMapping("/step3")
    public String post(RegisterRequest registerRequest, Model model) {
        System.out.println(registerRequest);
//      modle.addAttribute("registerRequest", registerRequest);
        return "another/result2";
    }

//    @PostMapping("/step3")
//    public String post(@RequestParam String name, @RequestParam String email,
//                       @RequestParam String password, @RequestParam String confirmpassword, Model model) {
//        System.out.println(email);
//        System.out.println(name);
//        System.out.println(password);
//        System.out.println(confirmpassword);
//        return "another/form2";
//    }
}
