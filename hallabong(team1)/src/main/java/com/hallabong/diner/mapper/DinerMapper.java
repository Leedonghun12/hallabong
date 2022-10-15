package com.hallabong.diner.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hallabong.diner.vo.DinerVO;
import com.webjjang.util.PageObject;

public interface DinerMapper {

	// 맛집 목록
	public List<DinerVO> list(PageObject pageObject) throws Exception;

	// 맛집 전체 데이터 개수
	public long getTotalRow(PageObject pageObject) throws Exception;

	// 맛집 보기
	public DinerVO view(long no) throws Exception;

	// 조회수
	public int increase(long no) throws Exception;

	// 맛집 등록
	public int write(DinerVO vo) throws Exception;

	// 맛집 수정
	public int update(DinerVO vo) throws Exception;

	// 맛집 삭제
	public int delete(long no) throws Exception;

	// replyCnt(리뷰 총 갯수)
	public void updateReplyCnt(@Param("no") Long no, @Param("perPageNum") int perPageNum);

}
