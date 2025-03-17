package com.example.modelattribute.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BoardDTO {
    private Long id;
    private String title;
    private String content;
    private String writer;
    private String boardType;
    private Integer viewCount;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
} 