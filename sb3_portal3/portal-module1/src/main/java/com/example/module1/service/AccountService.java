package com.example.module1.service;

import com.example.module1.entity.Account;
import com.example.module1.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@Transactional
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;

    // 로그인 기능
    public Account login(String id, String password) {
        Optional<Account> optionalAccount = accountRepository.findById(id);  // id로 Account 찾기

        if (optionalAccount.isPresent()) {
            Account account = optionalAccount.get();
            if (password.equals(account.getPassword())) {  // 비밀번호 확인
                return account;  // 로그인 성공 시 Account 반환
            }
        }
        return null;  // 로그인 실패 시 null 반환
    }

    // 회원가입 기능
    public void register(Account account) {
        accountRepository.save(account);  // Account 저장
    }

    // ID 중복체크 기능
    public boolean isIdExists(String id) {
        return accountRepository.existsById(id);
    }


}