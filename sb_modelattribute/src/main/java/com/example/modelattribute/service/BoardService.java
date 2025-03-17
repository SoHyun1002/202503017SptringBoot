package com.example.modelattribute.service;

import com.example.modelattribute.dto.BoardDTO;

import java.util.List;

public interface BoardService {
    
    // 게시글 등록
    void registerBoard(BoardDTO boardDTO);
    
    // 게시글 수정
    void updateBoard(BoardDTO boardDTO);
    
    // 게시글 삭제
    void deleteBoard(Long id);
    
    // 게시글 ID로 조회
    BoardDTO getBoardById(Long id);
    
    // 게시글 조회수 증가
    void incrementViewCount(Long id);
    
    // 모든 게시글 조회
    List<BoardDTO> getAllBoards();
    
    // 작성자로 게시글 조회
    List<BoardDTO> getBoardsByWriter(String writer);
    
    // 제목으로 게시글 검색
    List<BoardDTO> searchBoardsByTitle(String keyword);
} 