package com.example.project.controller;

import com.example.project.model.Problem;
import com.example.project.service.ProblemService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/problems")
public class ProblemController {
    private final ProblemService problemService;

    public ProblemController(ProblemService problemService) {
        this.problemService = problemService;
    }

    @GetMapping
    public String showProblemList(Model model) {
        List<Problem> problems = problemService.getAllProblems();
        model.addAttribute("problems", problems);
        return "problemList";
    }

    @GetMapping("/{id}")
    public String showProblemDetail(@PathVariable Long id, Model model) {
        Optional<Problem> problem = problemService.getProblemById(id);
        if (problem.isPresent()) {
            model.addAttribute("problem", problem.get());
            return "problemView";
        } else {
            return "redirect:/problems";
        }
    }

    @PostMapping("/add")
    public String createProblem(@ModelAttribute Problem problem) {
        problemService.createProblem(problem);
        return "redirect:/problems";
    }

    @PostMapping("/delete/{id}")
    public String deleteProblem(@PathVariable Long id) {
        problemService.deleteProblem(id);
        return "redirect:/problems";
    }
}