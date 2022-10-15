package com.hallabong.diner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.hallabong.diner.mapper.DinerMapper;
import com.hallabong.diner.vo.DinerVO;
import com.webjjang.util.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("dinerServiceImpl")
@Log4j
@Primary
public class DinerServiceImpl implements DinerService {

	@Setter(onMethod_ = { @Autowired })
	private DinerMapper mapper;

	// 맛집 목록
	@Override
	public List<DinerVO> list(PageObject pageObject) throws Exception {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));

		log.info(pageObject);

		return mapper.list(pageObject);
	}

	// 맛집 보기
	@Override
	public DinerVO view(long no, int inc) throws Exception {
		// TODO Auto-generated method stub
		if (inc == 1)
			mapper.increase(no);
		return mapper.view(no);
	}

	// 맛집 등록
	@Override
	public int write(DinerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	// 맛집 수정
	@Override
	public int update(DinerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	// 맛집 삭제
	@Override
	public int delete(long no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(no);
	}

}
