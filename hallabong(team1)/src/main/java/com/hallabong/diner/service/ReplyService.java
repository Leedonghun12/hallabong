package com.hallabong.diner.service;

import java.util.List;

import com.hallabong.diner.vo.ReplyVO;
import com.webjjang.util.PageObject;

public interface ReplyService {

	// 리뷰 리스트
	public List<ReplyVO> getList(PageObject pageObject, Long no);

	// 리뷰 등록
	public int register(ReplyVO vo);

	// 리뷰 수정
	public int modify(ReplyVO vo);

	// 리뷰 삭제
	public int remove(Long rno);

	// 리뷰 조회
	public ReplyVO get(Long rno);
}
