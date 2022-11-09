package com.its.board.repository;

import com.its.board.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    SqlSessionTemplate sql;
    public void saveMember(MemberDTO memberDTO) {
        sql.insert("memberSpace.saveMember",memberDTO);
    }

    public MemberDTO ckEmail(MemberDTO memberDTO) {
        return  sql.selectOne("memberSpace.ckEmail",memberDTO);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return  sql.selectOne("memberSpace.login",memberDTO);
    }


    public MemberDTO boardSavePage(MemberDTO memberDTO) {
        return  sql.selectOne("memberSpace.boardSavePage",memberDTO);
    }

    public MemberDTO myPage(String memberEmail) {
        return  sql.selectOne("memberSpace.myPage",memberEmail);
    }

    public List<MemberDTO> memberList() {
        return  sql.selectList("memberSpace.memberList");
    }

    public void memberDelete(Long id) {
        sql.delete("memberSpace.memberDelete",id);
    }

    public MemberDTO memberUpdatePage(Long id) {
        return sql.selectOne("memberSpace.memberUpdatePage",id);
    }


    public int memberUpdate(MemberDTO memberDTO) {
       int result = sql.update("memberSpace.memberUpdate",memberDTO);
       return  result;
    }
}
