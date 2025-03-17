package com.example.demo.model;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Task {
    private Long id;
    private String title;
    private String description;
    private String status;
    private String dueDate;
}
