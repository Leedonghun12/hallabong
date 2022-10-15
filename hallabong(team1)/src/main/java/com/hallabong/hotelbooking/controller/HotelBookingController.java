package com.hallabong.hotelbooking.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hallabong.business.service.BusinessService;
import com.hallabong.hotelbooking.service.HotelBookingService;
import com.hallabong.hotelbooking.vo.HotelBookingVO;
import com.hallabong.member.vo.LoginVO;
import com.hallabong.room.service.RoomService;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller 
@RequestMapping("/hotelbooking")
@Log4j
public class HotelBookingController {
	
	@Autowired
	@Qualifier("hotelBookingServiceImpl")
	private HotelBookingService service;
	
	@Inject
	private RoomService roomServiceImpl;
	@Inject
	private BusinessService businessServiceImpl;
	
	
	
	@GetMapping("/list.do")
	public String list(PageObject pageObject, Model model, HttpServletRequest request) throws Exception{
				
		// 세션 로그인  정보 가져오기
		HttpSession session = request.getSession();
		LoginVO id = (LoginVO) session.getAttribute("login");
		
		log.info("호텔예약 리스트 입니다." );
		
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		//model.addAttribute("rolist",roomServiceImpl.list(pageObject, no)); 
		
		return "hotelbooking/list";
	} 
	
	@GetMapping("/view.do")
	public String view(long hbno, Model model)throws Exception{
		
		log.info("호텔예약 상세보기 입니다.-------------" + hbno);
	
		model.addAttribute("vo", service.view( hbno));
		
		return "hotelbooking/view";
	} 
	
	@GetMapping("/write.do")
	public String writeForm(Model model,long ro_no) throws Exception{
		log.info("호텔예약 등록폼 입니다.==================");
		
//		model.addAttribute(businessServiceImpl.view(no));
		model.addAttribute("vo",roomServiceImpl.view(ro_no)); 
		return "hotelbooking/write";
	} 
	
	@PostMapping("/write.do")
	public String write(HotelBookingVO vo, HttpSession session,
			Model model,RedirectAttributes rttr) throws Exception{
		
		vo.setId(((LoginVO)session.getAttribute("login")).getId());
		log.info("호텔예약 등록 입니다.-----------------");
		
		service.write(vo);
		rttr.addFlashAttribute("result", "register success : hbno - "+vo.getHbno());

		
		return "redirect:/member/myPage.do";
	}
	
	@GetMapping("/update.do")
	public String updateForm(long hbno, Model model) throws Exception{
		
		log.info("호텔예약 수정폼 입니다.");
		model.addAttribute("vo", service.view(hbno));
		return "hotelbooking/update";
	} 
	
	@PostMapping("/update.do")
	public String update(HotelBookingVO vo, PageObject pageObject) throws Exception{
		
		log.info("호텔예약 수정 입니다.");
		service.update(vo);
		return "redirect:view.do?hbno="  + vo.getHbno()
				+"&page=" +pageObject.getPage()
				+"&perPageNum=" +pageObject.getPerPageNum()
				+"&key=" +pageObject.getKey()
				+"&word=" +pageObject.getWord();
	} 

	
	//delete
	@GetMapping("/delete.do")
	public String delete(long hbno) throws Exception{
		log.info("호텔예약삭제");
		service.delete(hbno);
		return "redirect:/member/myPage.do";
	}
}
