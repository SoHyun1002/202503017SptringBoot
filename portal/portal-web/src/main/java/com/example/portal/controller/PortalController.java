package com.example.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.view.RedirectView;
import com.example.common.util.CommonUtil;

@Controller
public class PortalController {

    @GetMapping
    public String index(Model model) { return "index"; }
    

} 