package com.its.board.repository;

import com.its.board.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    SqlSessionTemplate sql;
    public void boardSave(BoardDTO boardDTO) {
          sql.insert("boardSpace.boardSave",boardDTO);
    }

    public List<BoardDTO> boardList() {
        List<BoardDTO> result= sql.selectList("boardSpace.boardList");
    return result;
    }

    public BoardDTO detailPage(Long id) {
        return sql.selectOne("boardSpace.detailPage",id);
    }

    public BoardDTO updatePage(Long id) {
        return sql.selectOne("boardSpace.updatePage",id);
    }

    public void boardUpdate(BoardDTO boardDTO) {
        sql.update("boardSpace.boardUpdate",boardDTO);
    }

    public void boardDelete(Long id) {
        sql.delete("boardSpace.boardDelete",id);
    }

    public void boardHit(Long id) {
        sql.update("boardSpace.boardHit",id);
    }

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParams) {
        return sql.selectList("boardSpace.pagingList",pagingParams);
    }

    public int boardCount() {
        return sql.selectOne("boardSpace.boardCount");
    }

    public void save_board2(BoardDTO boardDTO) {
        sql.insert("boardSpace.save_board2",boardDTO);
    }

    public List<BoardDTO> search(Map<String, String> searchParams) {
        return  sql.selectList("boardSpace.search",searchParams);
    }
}
