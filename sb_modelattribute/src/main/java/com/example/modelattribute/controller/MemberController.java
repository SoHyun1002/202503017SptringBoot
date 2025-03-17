package com.example.modelattribute.controller;

import com.example.modelattribute.dto.MemberDTO;
import com.example.modelattribute.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/members")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;
    
    // 모든 회원 목록 조회
    @GetMapping
    public String getAllMembers(Model model) {
        List<MemberDTO> members = memberService.getAllMembers();
        model.addAttribute("members", members);
        return "member/list";
    }
    
    // 회원 등록 폼
    @GetMapping("/register")
    public String registerForm(Model model) {
        // ModelAttribute를 사용하여 빈 MemberDTO 객체를 모델에 추가
        model.addAttribute("memberDTO", new MemberDTO());
        return "member/registerForm";
    }
    
    // 회원 등록 처리 - @ModelAttribute 사용
    @PostMapping("/register")
    public String register(@ModelAttribute MemberDTO memberDTO, RedirectAttributes redirectAttributes) {
        memberService.registerMember(memberDTO);
        redirectAttributes.addFlashAttribute("message", "회원 등록이 완료되었습니다.");
        return "redirect:/members";
    }
    
    // 회원 상세 정보 조회
    @GetMapping("/{id}")
    public String getMemberDetail(@PathVariable Long id, Model model) {
        MemberDTO member = memberService.getMemberById(id);
        model.addAttribute("member", member);
        return "member/detail";
    }
    
    // 회원 수정 폼
    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable Long id, Model model) {
        MemberDTO member = memberService.getMemberById(id);
        model.addAttribute("memberDTO", member);
        return "member/editForm";
    }
    
    // 회원 수정 처리 - @ModelAttribute 사용
    @PostMapping("/{id}/edit")
    public String edit(@PathVariable Long id, @ModelAttribute MemberDTO memberDTO, RedirectAttributes redirectAttributes) {
        memberDTO.setId(id);
        memberService.updateMember(memberDTO);
        redirectAttributes.addFlashAttribute("message", "회원 정보가 수정되었습니다.");
        return "redirect:/members/" + id;
    }
    
    // 회원 삭제
    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        memberService.deleteMember(id);
        redirectAttributes.addFlashAttribute("message", "회원이 삭제되었습니다.");
        return "redirect:/members";
    }
    
    // 모든 요청에 공통적으로 사용되는 모델 속성 추가 - @ModelAttribute 메서드 사용
    @ModelAttribute("memberCount")
    public int getMemberCount() {
        return memberService.getAllMembers().size();
    }
} 