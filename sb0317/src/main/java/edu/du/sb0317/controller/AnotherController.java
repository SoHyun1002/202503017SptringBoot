package edu.du.sb0317.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller                             // 매우 중요
@RequestMapping("/another")
public class AnotherController {

    @GetMapping
    public String home() {
        return "another/success1";
    }

}
