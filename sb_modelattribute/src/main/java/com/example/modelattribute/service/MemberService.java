package com.example.modelattribute.service;

import com.example.modelattribute.dto.MemberDTO;

import java.util.List;

public interface MemberService {
    
    // 회원 등록
    void registerMember(MemberDTO memberDTO);
    
    // 회원 정보 수정
    void updateMember(MemberDTO memberDTO);
    
    // 회원 삭제
    void deleteMember(Long id);
    
    // 회원 ID로 조회
    MemberDTO getMemberById(Long id);
    
    // 회원 이름으로 조회
    MemberDTO getMemberByUsername(String username);
    
    // 모든 회원 조회
    List<MemberDTO> getAllMembers();
} 