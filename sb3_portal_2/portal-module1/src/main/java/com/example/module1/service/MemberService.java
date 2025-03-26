package com.example.module1.service;

import com.example.module1.entity.Member;
import com.example.module1.repository.MemberRepository;
import com.example.module1.util.PasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public Member register(Member member) {
        // 비밀번호 암호화
        member.setPassword(passwordEncoder.encode(member.getPassword()));
        return memberRepository.save(member);
    }

    public Member login(String username, String password) {
        return memberRepository.findByUsername(username)
                .filter(member -> passwordEncoder.matches(password, member.getPassword()))
                .orElse(null);
    }

    public boolean isUsernameExists(String username) {
        return memberRepository.existsByUsername(username);
    }
} 