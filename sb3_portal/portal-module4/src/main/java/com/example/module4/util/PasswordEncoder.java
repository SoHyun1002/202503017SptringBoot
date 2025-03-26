package com.example.module4.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class PasswordEncoder {
    private final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(10);

    public String encode(String password) {
        return encoder.encode(password);
    }

    public boolean matches(String rawPassword, String encodedPassword) {
        try {
            return encoder.matches(rawPassword, encodedPassword);
        } catch (Exception e) {
            return false;
        }
    }
} 