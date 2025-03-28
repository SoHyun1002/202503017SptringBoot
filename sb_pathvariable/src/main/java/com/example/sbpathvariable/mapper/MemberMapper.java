package com.example.sbpathvariable.mapper;

import com.example.sbpathvariable.domain.Member;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface MemberMapper {
    List<Member> findAll();
    Member findById(Long id);
    void insert(Member member);
    void update(Member member);
    void delete(Long id);
} 