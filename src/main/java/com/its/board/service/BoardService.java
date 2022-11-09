package com.its.board.service;

import com.its.board.commons.PagingConst;
import com.its.board.dto.BoardDTO;
import com.its.board.dto.PageDTO;
import com.its.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    BoardRepository boardRepository;
    public void boardSave(BoardDTO boardDTO) {
         boardRepository.boardSave(boardDTO);
    }

    public List<BoardDTO> boardList() {
        List<BoardDTO> result = boardRepository.boardList();
        return result;
    }

    public BoardDTO detailPage(Long id) {
        return boardRepository.detailPage(id);
    }

    public BoardDTO updatePage(Long id) {
        return  boardRepository.updatePage(id);
    }

    public void boardUpdate(BoardDTO boardDTO) {
        boardRepository.boardUpdate(boardDTO);
    }

    public void boardDelete(Long id) {
        boardRepository.boardDelete(id);
    }

    public void boardHit(Long id) {
        boardRepository.boardHit(id);
    }

    public List<BoardDTO> pagingList(int page) {
        int pagingStart = (page-1) * PagingConst.PAGE_LIMIT;
        Map<String,Integer> pagingParams = new HashMap<>();
        pagingParams.put("start",pagingStart);
        pagingParams.put("limit",PagingConst.PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParams);
        return  pagingList;
    }

    public PageDTO pagingParam(int page) {
        int boardCount =boardRepository.boardCount();
        int maxPage = (int) (Math.ceil((double) boardCount / PagingConst.PAGE_LIMIT));
        int startPage = (((int)(Math.ceil((double) page / PagingConst.BLOCK_LIMIT))) - 1) * PagingConst.BLOCK_LIMIT + 1;
        int endPage = startPage + PagingConst.BLOCK_LIMIT - 1;
        if(endPage>maxPage){
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);


        return  pageDTO;
    }

    public void save_board2(BoardDTO boardDTO) {
        boardRepository.save_board2(boardDTO);
    }

    public List<BoardDTO> search(String type, String q) {
        Map<String,String> searchParams = new HashMap<>();
        searchParams.put("type",type);
        searchParams.put("q",q);
        List<BoardDTO> searchList = boardRepository.search(searchParams);
        return searchList;
    }
}
