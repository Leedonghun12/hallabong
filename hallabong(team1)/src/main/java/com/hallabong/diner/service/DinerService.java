package com.hallabong.diner.service;

import java.util.List;

import com.hallabong.diner.vo.DinerVO;
import com.webjjang.util.PageObject;

public interface DinerService {

	// 맛집 목록
	public List<DinerVO> list(PageObject pageObject) throws Exception;

	// 맛집 보기
	public DinerVO view(long no, int inc) throws Exception;

	// 맛집 등록
	public int write(DinerVO vo) throws Exception;

	// 맛집 수정
	public int update(DinerVO vo) throws Exception;

	// 맛집 삭제
	public int delete(long no) throws Exception;

}
