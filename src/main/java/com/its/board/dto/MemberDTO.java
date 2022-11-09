package com.its.board.dto;

import lombok.*;


@Getter
@Setter
@ToString
public class MemberDTO {
    private Long id;
    private String memberEmail;
    private String memberPass;
    private String memberName;
}
