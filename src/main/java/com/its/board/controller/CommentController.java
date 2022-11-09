package com.its.board.controller;

import com.its.board.dto.CommentDTO;
import com.its.board.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CommentController {
    @Autowired
    CommentService commentService;

    @PostMapping("/commentSave")
    public @ResponseBody List<CommentDTO> commentSave(CommentDTO commentDTO) {
       commentService.commentSave(commentDTO);
       List<CommentDTO> commentList = commentService.commentList(commentDTO);
        System.out.println(commentList);

        return  commentList;
    }
}
