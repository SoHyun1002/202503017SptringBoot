package com.example.modelattribute.controller;

import com.example.modelattribute.dto.BoardDTO;
import com.example.modelattribute.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/boards")
@RequiredArgsConstructor
public class BoardController {

    private final BoardService boardService;
    
    // 모든 게시글 목록 조회
    @GetMapping
    public String getAllBoards(Model model) {
        List<BoardDTO> boards = boardService.getAllBoards();
        model.addAttribute("boards", boards);
        return "board/list";
    }
    
    // 게시글 등록 폼
    @GetMapping("/write")
    public String writeForm(Model model) {
        // ModelAttribute를 사용하여 빈 BoardDTO 객체를 모델에 추가
        model.addAttribute("boardDTO", new BoardDTO());
        // 게시판 종류 목록 추가
        model.addAttribute("boardTypes", Arrays.asList("일반", "공지사항", "질문", "자료실"));
        return "board/writeForm";
    }
    
    // 게시글 등록 처리 - @ModelAttribute 사용
    @PostMapping("/write")
    public String write(@ModelAttribute BoardDTO boardDTO, RedirectAttributes redirectAttributes) {
        boardService.registerBoard(boardDTO);
        redirectAttributes.addFlashAttribute("message", "게시글이 등록되었습니다.");
        return "redirect:/boards";
    }
    
    // 게시글 상세 정보 조회
    @GetMapping("/{id}")
    public String getBoardDetail(@PathVariable Long id, Model model) {
        // 조회수 증가
        boardService.incrementViewCount(id);
        
        BoardDTO board = boardService.getBoardById(id);
        model.addAttribute("board", board);
        return "board/detail";
    }
    
    // 게시글 수정 폼
    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable Long id, Model model) {
        BoardDTO board = boardService.getBoardById(id);
        model.addAttribute("boardDTO", board);
        // 게시판 종류 목록 추가
        model.addAttribute("boardTypes", Arrays.asList("일반", "공지사항", "질문", "자료실"));
        return "board/editForm";
    }
    
    // 게시글 수정 처리 - @ModelAttribute 사용
    @PostMapping("/{id}/edit")
    public String edit(@PathVariable Long id, @ModelAttribute BoardDTO boardDTO, RedirectAttributes redirectAttributes) {
        boardDTO.setId(id);
        boardService.updateBoard(boardDTO);
        redirectAttributes.addFlashAttribute("message", "게시글이 수정되었습니다.");
        return "redirect:/boards/" + id;
    }
    
    // 게시글 삭제
    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        boardService.deleteBoard(id);
        redirectAttributes.addFlashAttribute("message", "게시글이 삭제되었습니다.");
        return "redirect:/boards";
    }
    
    // 작성자로 게시글 검색
    @GetMapping("/search/writer")
    public String searchByWriter(@RequestParam String writer, Model model) {
        List<BoardDTO> boards = boardService.getBoardsByWriter(writer);
        model.addAttribute("boards", boards);
        model.addAttribute("searchType", "writer");
        model.addAttribute("keyword", writer);
        return "board/searchResult";
    }
    
    // 제목으로 게시글 검색
    @GetMapping("/search/title")
    public String searchByTitle(@RequestParam String keyword, Model model) {
        List<BoardDTO> boards = boardService.searchBoardsByTitle(keyword);
        model.addAttribute("boards", boards);
        model.addAttribute("searchType", "title");
        model.addAttribute("keyword", keyword);
        return "board/searchResult";
    }
    
    // 모든 요청에 공통적으로 사용되는 모델 속성 추가 - @ModelAttribute 메서드 사용
    @ModelAttribute("boardTypes")
    public List<String> getBoardTypes() {
        return List.of("공지사항", "자유게시판", "질문과답변", "자료실");
    }
} 