package com.example.project.service;

import com.example.project.model.Problem;
import com.example.project.repository.ProblemRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class ProblemService {
    private final ProblemRepository problemRepository;

    public ProblemService(ProblemRepository problemRepository) {
        this.problemRepository = problemRepository;
    }

    public List<Problem> getAllProblems() {
        return problemRepository.findAll();
    }

    public Optional<Problem> getProblemById(Long id) {
        return problemRepository.findById(id);
    }

    @Transactional
    public Problem createProblem(Problem problem) {
        return problemRepository.save(problem);
    }

    @Transactional
    public void deleteProblem(Long id) {
        problemRepository.deleteById(id);
    }
}
