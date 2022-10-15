package com.hallabong.diner.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private long rno; // 리뷰 번호
	private long no; // 글 번호
//	private long star;
	private String reply; // 리뷰 내용
	private String id; // 아이디
	private Date replyDate; // 리뷰 등록 날짜
	private Date updateDate; // 리뷰 수정 날짜

}
