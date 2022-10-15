package com.hallabong.diner.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hallabong.diner.vo.ReplyVO;
import com.webjjang.util.PageObject;

public interface ReplyMapper {

	// 리뷰 목록
	public List<ReplyVO> getListWithPaging(
			@Param("pageObject") PageObject pageObject,
			@Param("no") Long no
	);
	
	// 해당 글번호 리뷰의 전체 데이터 개수 가져오기
	public Long getCountByNo(Long no);
	
	// 리뷰 등록
	public int insert(ReplyVO vo);
	
	// 리뷰 수정
	public int update(ReplyVO vo);
	
	// 리뷰 삭제
	public int delete(Long rno);
	
	// 리뷰 조회
	public ReplyVO read(Long rno);
	
}
