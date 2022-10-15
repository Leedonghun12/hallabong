package com.hallabong.qna.service;

import java.util.List;

import com.hallabong.faq.vo.FaqVO;
import com.hallabong.qna.vo.QnaVO;
import com.webjjang.util.PageObject;

public interface QnaService {

	// 리스트
	public List<QnaVO> list(PageObject pageObject) throws Exception;
	
	// 질문하기(write)
	public Integer write(QnaVO vo) throws Exception;
	
	// QNA에 있는 글 FAQ로 등록
	public Integer writes(FaqVO vo) throws Exception;
	// QNA -> FAQ 로 등록하기 위한 Service(FaqVO)
	public FaqVO views(Integer no) throws Exception;
	
	// QNA 글 보기
	public List<QnaVO> view(Integer no, Integer refNo) throws Exception;
	
	// 답변하기
	public Integer answer(QnaVO vo) throws Exception;
	
	// 수정하기
	public Integer update(QnaVO vo) throws Exception;
	
	// 글 삭제하기
	public Integer deletes(Integer refNo) throws Exception;
	
	// 답변 삭제하기
	public Integer delete(Integer no) throws Exception;
	
}
