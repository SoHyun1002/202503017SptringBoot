package com.example.modelattribute.mapper;

import com.example.modelattribute.dto.MemberDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {
    
    // 회원 등록
    void insertMember(MemberDTO memberDTO);
    
    // 회원 정보 수정
    void updateMember(MemberDTO memberDTO);
    
    // 회원 삭제
    void deleteMember(Long id);
    
    // 회원 ID로 조회
    MemberDTO selectMemberById(Long id);
    
    // 회원 이름으로 조회
    MemberDTO selectMemberByUsername(String username);
    
    // 모든 회원 조회
    List<MemberDTO> selectAllMembers();
} 