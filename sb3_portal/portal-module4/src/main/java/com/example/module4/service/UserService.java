package com.example.module4.service;

import com.example.module4.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.module4.util.PasswordEncoder;
import com.example.module4.entity.User;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public User register(User user) {
        // 비밀번호 암호화
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        return userRepository.save(user);
    }

    public User login(String username, String password) {
        return userRepository.findByUsername(username)
                .filter(member -> passwordEncoder.matches(password, member.getPassword()))
                .orElse(null);
    }

    public boolean isUsernameExists(String username) {
        return userRepository.existsByUsername(username);
    }
}
