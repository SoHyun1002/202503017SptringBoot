package com.example.modelattribute.service.impl;

import com.example.modelattribute.dto.MemberDTO;
import com.example.modelattribute.mapper.MemberMapper;
import com.example.modelattribute.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;
    
    @Override
    public void registerMember(MemberDTO memberDTO) {
        memberMapper.insertMember(memberDTO);
    }

    @Override
    public void updateMember(MemberDTO memberDTO) {
        memberMapper.updateMember(memberDTO);
    }

    @Override
    public void deleteMember(Long id) {
        memberMapper.deleteMember(id);
    }

    @Override
    public MemberDTO getMemberById(Long id) {
        return memberMapper.selectMemberById(id);
    }

    @Override
    public MemberDTO getMemberByUsername(String username) {
        return memberMapper.selectMemberByUsername(username);
    }

    @Override
    public List<MemberDTO> getAllMembers() {
        return memberMapper.selectAllMembers();
    }
} 