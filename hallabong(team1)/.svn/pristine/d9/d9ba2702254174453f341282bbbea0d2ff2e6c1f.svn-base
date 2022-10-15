package com.hallabong.qna.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hallabong.faq.vo.FaqVO;
import com.hallabong.qna.vo.QnaVO;
import com.webjjang.util.PageObject;

public interface QnaMapper {

		// 리스트
		public List<QnaVO> list(PageObject pageObject) throws Exception;
		// 전체 데이터 개수
		public long getTotalRow(PageObject pageObject) throws Exception;
		
		// 질문하기(write)
		public int write(QnaVO vo) throws Exception;
		
		// QNA에 있는 글 FAQ로 등록
		public int writes(FaqVO vo) throws Exception;		
		// QNA -> FAQ로 등록하기 위한 mapper(FaqVO)
		public FaqVO views(Integer no) throws Exception;
		
		// QNA 글 보기
		public List<QnaVO> view(@Param("no") Integer no, @Param("refNo") Integer refNo) throws Exception;
		
		// 답변하기
		public Integer answer(QnaVO vo) throws Exception;
		// 순서 번호 증가
		public Integer increaseOrdNo(QnaVO vo) throws Exception;
		
		// 수정하기
		public Integer update(QnaVO vo) throws Exception;
		
		// 글 삭제하기
		public Integer deletes(@Param("refNo") Integer refNo) throws Exception;
		
		// 답변 삭제하기
		public Integer delete(@Param("no") Integer no) throws Exception;
	
}
