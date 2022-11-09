package com.its.board.controller;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.CommentDTO;
import com.its.board.dto.MemberDTO;
import com.its.board.dto.PageDTO;
import com.its.board.service.BoardService;
import com.its.board.service.CommentService;
import com.its.board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {
    @Autowired
    CommentService commentService;
    @Autowired
    BoardService boardService;
    @Autowired
    MemberService memberService;


    @GetMapping("/listPage")
    public String listPage(Model model ){
        List<BoardDTO> result= boardService.boardList();
        model.addAttribute("List",result);
        return "/board/listPage";
    }
    @GetMapping("/boardPage")
    public String boardSavePage(@ModelAttribute MemberDTO memberDTO, Model model) {
        MemberDTO result= memberService.boardSavePage(memberDTO);
        model.addAttribute("member",result);
        return "/board/boardSave";
    }

    @PostMapping("/boardSave")
    public String boardSave(@ModelAttribute BoardDTO boardDTO) {
        boardService.boardSave(boardDTO);
        System.out.println("boardDTO = " + boardDTO);
        return  "redirect:paging";
    }

    @GetMapping("/detailPage")
    public String detailPage(@RequestParam("id")Long id,Model model) {
        BoardDTO result = boardService.detailPage(id);
        model.addAttribute("board",result);
        System.out.println(result);
        List<CommentDTO> commentList = commentService.commentList2(id);
        model.addAttribute("commentList",commentList);
        return "/board/boardDetail";
    }

    @GetMapping("/boardUpdate")
    public String updatePage(@RequestParam("id")Long id,Model model) {
        BoardDTO result =boardService.updatePage(id);
        model.addAttribute("board",result);
        return "/board/boardUpdatePage";
    }
   @GetMapping("/boardUpdate2")
    public String boardUpdate(@ModelAttribute BoardDTO boardDTO) {
        System.out.println("boardDTO = " + boardDTO);
        boardService.boardUpdate(boardDTO);
        return "redirect:paging";
    }
    @GetMapping("/boardDelete")
    public String boardDelete(@RequestParam("id") Long id){
        boardService.boardDelete(id);
        return "redirect:listPage";
    }
    @GetMapping("/boardHit")
    public void boardHit(@RequestParam("id") Long id) {
        boardService.boardHit(id);
    }
    @GetMapping("/paging")
    public String paging(Model model,@RequestParam(value = "page",required = false,
                                                   defaultValue = "1") int page){
        List<BoardDTO> pagingList=boardService.pagingList(page);

        PageDTO pageDTO =boardService.pagingParam(page);
        model.addAttribute("boardList",pagingList);
        model.addAttribute("paging",pageDTO);


        return "/board/boardPaging";
    }
    @GetMapping("/save_board")
    public String save_board() {
        return "/board/save_board";
    }
    @GetMapping("/boardSave")
    public String save_board2(@ModelAttribute BoardDTO boardDTO) {
        boardService.save_board2(boardDTO);
        return "redirect:listPage";
    }

    @GetMapping("/search")
    public String search(@RequestParam("type") String type,
                                 @RequestParam("q") String q,Model model) {
        List<BoardDTO> searchList = boardService.search(type,q);
        model.addAttribute("boardList",searchList);
        return "/board/boardPaging";

    }


}
