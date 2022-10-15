package com.hallabong.diner.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class DinerVO {

	private long no; // 글 번호
	private String region, kind; // 지역, 음식 종류
	private String name; // 맛집 이름
	private String address; // 주소
	private String price; // 가격대
	private String tel; // 전화번호
	private String introduce; // 소갯말
	private String image; // 이미지
	private String content; // 내용
	private String park; // 주차
	private String hours; // 영업시간
	private long hit; // 조회수

	private MultipartFile imageFile; 

	private int replyCnt; // 리뷰 총 갯수

}
