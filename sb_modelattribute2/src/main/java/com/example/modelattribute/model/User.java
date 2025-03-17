package com.example.modelattribute.model;

import lombok.Data;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
public class User {
    @NotBlank(message = "이름은 필수입니다")
    @Size(min = 2, max = 30, message = "이름은 2-30자 사이여야 합니다")
    private String name;

    @NotBlank(message = "이메일은 필수입니다")
    @Email(message = "올바른 이메일 형식이 아닙니다")
    private String email;

    @NotBlank(message = "직업은 필수입니다")
    private String occupation;

    private boolean subscribeNewsletter;
} 