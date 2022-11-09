package com.its.board.service;

import com.its.board.dto.CommentDTO;
import com.its.board.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    CommentRepository commentRepository;
    public void commentSave(CommentDTO commentDTO) {
         commentRepository.commentSave(commentDTO);
    }

    public List<CommentDTO> commentList(CommentDTO commentDTO) {
        return  commentRepository.commentList(commentDTO);
    }

    public List<CommentDTO> commentList2(Long id) {
        return  commentRepository.commentList2(id);
    }
}
