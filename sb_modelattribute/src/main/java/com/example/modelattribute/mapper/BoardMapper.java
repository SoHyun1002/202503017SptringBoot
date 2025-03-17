package com.example.modelattribute.mapper;

import com.example.modelattribute.dto.BoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    
    // 게시글 등록
    void insertBoard(BoardDTO boardDTO);
    
    // 게시글 수정
    void updateBoard(BoardDTO boardDTO);
    
    // 게시글 삭제
    void deleteBoard(Long id);
    
    // 게시글 ID로 조회
    BoardDTO selectBoardById(Long id);
    
    // 게시글 조회수 증가
    void incrementViewCount(Long id);
    
    // 모든 게시글 조회
    List<BoardDTO> selectAllBoards();
    
    // 작성자로 게시글 조회
    List<BoardDTO> selectBoardsByWriter(String writer);
    
    // 제목으로 게시글 검색
    List<BoardDTO> searchBoardsByTitle(String keyword);
} 