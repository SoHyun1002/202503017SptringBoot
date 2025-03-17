package edu.du.sb0317.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

//  @RequestMapping(value = "/", method = RequestMethod.GET)
    @GetMapping
    public String home() {
        return "success";
    }

    @RequestMapping("/register/step1")
    public String handleStep1() {
        return "register/step1";
    }

}
