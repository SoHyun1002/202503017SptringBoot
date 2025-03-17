package com.example.modelattribute.service.impl;

import com.example.modelattribute.dto.BoardDTO;
import com.example.modelattribute.mapper.BoardMapper;
import com.example.modelattribute.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

    private final BoardMapper boardMapper;
    
    @Override
    public void registerBoard(BoardDTO boardDTO) {
        boardMapper.insertBoard(boardDTO);
    }

    @Override
    public void updateBoard(BoardDTO boardDTO) {
        boardMapper.updateBoard(boardDTO);
    }

    @Override
    public void deleteBoard(Long id) {
        boardMapper.deleteBoard(id);
    }

    @Override
    public BoardDTO getBoardById(Long id) {
        return boardMapper.selectBoardById(id);
    }

    @Override
    public void incrementViewCount(Long id) {
        boardMapper.incrementViewCount(id);
    }

    @Override
    public List<BoardDTO> getAllBoards() {
        return boardMapper.selectAllBoards();
    }

    @Override
    public List<BoardDTO> getBoardsByWriter(String writer) {
        return boardMapper.selectBoardsByWriter(writer);
    }

    @Override
    public List<BoardDTO> searchBoardsByTitle(String keyword) {
        return boardMapper.searchBoardsByTitle(keyword);
    }
}