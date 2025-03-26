package com.example.module1;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootApplication
public class Module1Application {
    public static void main(String[] args) {
        SpringApplication.run(Module1Application.class, args);
    }

//    @Bean
//    public CommandLineRunner commandLineRunner(PasswordEncoder passwordEncoder) {
//        return args -> {
//            String[] passwords = {"admin123", "user123"};
//            System.out.println("\n=== 테스트 계정 비밀번호 ===");
//            for (String password : passwords) {
//                String encodedPassword = passwordEncoder.encode(password);
//                System.out.println("원본 비밀번호: " + password);
//                System.out.println("암호화된 비밀번호: " + encodedPassword);
//                System.out.println("-------------------");
//            }
//            System.out.println("위의 암호화된 비밀번호를 data.sql에 넣어주세요.\n");
//        };
//    }
} 