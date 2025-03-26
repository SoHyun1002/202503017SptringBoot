package com.example.sb0319;

import com.example.sb0319.entity.Memo;
import com.example.sb0319.repository.MemoRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Transactional
public class Sb0319ApplicationTests {

    @Autowired
    private MemoRepository memoRepository;

    @Test
    void memo추가() {
        // given
        Memo memo = new Memo();
        memo.setContent("테스트");
        // when
        memoRepository.save(memo);
        // then
//        System.out.println("입력성공!");

    }
}
