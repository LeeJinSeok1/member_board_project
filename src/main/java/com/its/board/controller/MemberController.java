package com.its.board.controller;

import com.its.board.dto.MemberDTO;
import com.its.board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MemberController {
    @Autowired
    MemberService memberService;

    // 회원가입페이지로 이동요청 쿼리
    @GetMapping("/savePage")
    public String savePage(){
        return "/member/savePage";
    }

    // 회원가입 db 저장
    @PostMapping("/saveMember")
    public String saveMember(@ModelAttribute MemberDTO memberDTO) {
        memberService.saveMember(memberDTO);
        return "index";
    }

    // 이메일 중복 체크
    @GetMapping("/emailCk")
    public @ResponseBody String ckEmail(@ModelAttribute MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        MemberDTO result = memberService.ckEmail(memberDTO);
        if(result != null){
            return "no";
        }else {
            return "good";
        }
    }

    //로그인 페이지 요청
    @GetMapping("/loginPage")
    public String loginPage() {
        return "/member/loginPage";
    }

    //로그인 시도 로그인 처리
    @GetMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO,
                        HttpSession session,
                        Model model) {
       MemberDTO result = memberService.login(memberDTO);
        System.out.println(result);
       if(result != null) {
           session.setAttribute("loginEmail",memberDTO.getMemberEmail());
           model.addAttribute("memberDTO",result);
           return "redirect:paging";

       }else {
           return "Fail";
       }
    }
    //로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
    }
    @GetMapping("/myPage")
    public String myPage(@RequestParam("memberEmail") String memberEmail,Model model){
        System.out.println("memberEmail = " + memberEmail );
       MemberDTO memberDTO = memberService.myPage(memberEmail);
       model.addAttribute("member",memberDTO);
       return "/member/memberDetail";
    }
    @GetMapping("memberList")
    public String memberList(Model model) {
      List<MemberDTO> memberList=  memberService.memberList();
      model.addAttribute("memberList",memberList);
      return "/member/memberList";
    }
    @GetMapping("/memberDelete")
    public String memberDelete(@RequestParam("id") Long id) {
        System.out.println("id = " + id);
        memberService.memberDelete(id);
        return "redirect:memberList";

    }
    @GetMapping("/memberUpdate")
    public String memberUpdatePage(@RequestParam("id") Long id,Model model) {
      MemberDTO memberDTO = memberService.memberUpdatePage(id);
      model.addAttribute("member",memberDTO);
      return "/member/memberUpdatePage";
    }
    @PostMapping("/memberUpdate")
    public String memberUpdate(@ModelAttribute MemberDTO memberDTO) {
           boolean result = memberService.memberUpdate(memberDTO);
           if(result) {
               return "redirect:/myPage?memberEmail="+memberDTO.getMemberEmail();
           }else {
               return "index";
           }


    }



}

