package com.its.board.service;

import com.its.board.dto.MemberDTO;
import com.its.board.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    @Autowired
    MemberRepository memberRepository;
    public void saveMember(MemberDTO memberDTO) {
        memberRepository.saveMember(memberDTO);

    }

    public MemberDTO ckEmail(MemberDTO memberDTO) {
        return  memberRepository.ckEmail(memberDTO);
    }

    public MemberDTO login(MemberDTO memberDTO) {
     return    memberRepository.login(memberDTO);
    }


    public MemberDTO boardSavePage(MemberDTO memberDTO) {
        return  memberRepository.boardSavePage(memberDTO);
    }

    public MemberDTO myPage(String memberEmail) {
        return  memberRepository.myPage(memberEmail);
    }

    public List<MemberDTO> memberList() {
        return  memberRepository.memberList();
    }

    public void memberDelete(Long id) {
        memberRepository.memberDelete(id);
    }

    public MemberDTO memberUpdatePage(Long id) {
        return memberRepository.memberUpdatePage(id);
    }


    public boolean memberUpdate(MemberDTO memberDTO) {
       int result =  memberRepository.memberUpdate(memberDTO);
       if(result>0) {
           return true;
       }else{
           return false;
       }
    }
}
