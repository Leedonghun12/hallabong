
---business --------------------------------------------------------------------------------

DROP TABLE business CASCADE CONSTRAINTS;
DROP SEQUENCE business_seq;

CREATE TABLE business(
    no NUMBER PRIMARY KEY, -- 호텔 번호
    id VARCHAR2(20) NOT NULL REFERENCES member(id),
    area VARCHAR2(50) NOT NULL,
    name VARCHAR2(50) NOT NULL, -- 호텔 이름
    content VARCHAR2(2000) NOT NULL,
    bus_tel VARCHAR2(30), -- 호텔 번호
    bus_mail VARCHAR2(40), -- 호텔 메일
    bus_address VARCHAR2(200) NOT NULL, -- 호텔 주소
    fileName VARCHAR2(50) NOT NULL -- 호텔 사진 
);

CREATE SEQUENCE business_seq;

INSERT INTO business(no, id, area, name, content, bus_tel, bus_mail, bus_address, fileName)
VALUES(business_seq.nextval, 'admin','서귀포시','제주 신라 호텔','매우 훌륭해요', '111-222-4444','qweasd@naver.com', '중문관광로72번길 75, 서귀포시, 제주특별자치도, 697-130', '/upload/business/01.jpg');

INSERT INTO business(no, id, area, name, content, bus_tel, bus_mail, bus_address, fileName)
VALUES(business_seq.nextval, 'admin','제주시','베스트웨스턴 제주 호텔','매우 훌륭해요', '111-222-4444','qweasd@naver.com', '제주도 제주시 도령로 27', '/upload/business/01.jpg');

INSERT INTO business(no, id, area, name, content, bus_tel, bus_mail, bus_address, fileName)
VALUES(business_seq.nextval,'admin','조천읍','유탑 유블레스 호텔', '매우 훌륭해요 ', '111-222-4444','qweasd@naver.com', '제주도 제주시 조천읍 조함해안로 502', '/upload/business/01.jpg');
COMMIT;

select * from business;

---room --------------------------------------------------------------------------------

DROP TABLE room CASCADE CONSTRAINTS;
DROP SEQUENCE room_seq;


CREATE TABLE room(
ro_no NUMBER PRIMARY KEY,
no NUMBER REFERENCES business(no) ON DELETE CASCADE,
ro_name VARCHAR2(300) NOT NULL,
id VARCHAR2(20) NOT NULL REFERENCES member(id) ON DELETE CASCADE,
ro_price VARCHAR2(300) NOT NULL,
ro_people VARCHAR2(30) NOT NULL,
ro_info VARCHAR2(2000) NOT NULL,
fileName VARCHAR2(2000) NOT NULL
);

CREATE SEQUENCE room_seq;

INSERT INTO room(ro_no, no, ro_name, id, ro_price, ro_people, ro_info, fileName)
VALUES(room_seq.nextval, 1, '싱글 스탠다드룸', 'admin', '1박 기준 : 30000원', '인원:1인', '객실크기:18평 / 전망:씨티뷰 / 베드:싱글베드 1개','/upload/roomimage/01.jpg');

INSERT INTO room(ro_no, no, ro_name, id, ro_price, ro_people, ro_info, fileName)
VALUES(room_seq.nextval, 1, '스위트룸', 'admin', '1박 기준 : 40000원', '인원:4인', '객실크기:20평 / 전망:마운틴뷰 / 베드:싱글베드 2개','/upload/roomimage/01.jpg');

INSERT INTO room(ro_no, no, ro_name, id, ro_price, ro_people, ro_info, fileName)
VALUES(room_seq.nextval, 1, '디럭스룸', 'admin', '1박 기준 : 65000원', '인원:4인', '객실크기:20평 / 전망:씨티뷰 / 베드:더블베드 1개','/upload/roomimage/01.jpg');

INSERT INTO room(ro_no, no, ro_name, id, ro_price, ro_people, ro_info,  fileName)
VALUES(room_seq.nextval, 2, '싱글 스탠다드룸', 'admin', '1박 기준 : 70000원', '인원:1인', '객실크기:20평 / 전망:씨티뷰 / 베드:싱글베드1개','/upload/roomimage/01.jpg');

INSERT INTO room(ro_no, no, ro_name, id, ro_price, ro_people, ro_info,  fileName)
VALUES(room_seq.nextval, 2, '스위트룸', 'admin', '1박 기준 : 110000원', '인원:4인', '객실크기:23평 / 전망:가든뷰 /  베드:더블베드1개','/upload/roomimage/01.jpg');

INSERT INTO room(ro_no, no, ro_name, id, ro_price, ro_people, ro_info,  fileName)
VALUES(room_seq.nextval, 2, '디럭스룸', 'admin', '1박 기준 : 120000원', '인원:4인', '객실크기:24평 / 전망:씨티뷰  /베드:더블베드 1개,싱글베드 1개','/upload/roomimage/01.jpg');

INSERT INTO room(ro_no, no, ro_name, id, ro_price, ro_people, ro_info, fileName)
VALUES(room_seq.nextval, 3, '싱글 스탠다드룸', 'admin', '1박 기준 : 70000원', '인원:2인', '객실크기:20평 / 전망:오션뷰 / 베드:더블베드 1개','/upload/roomimage/01.jpg');

INSERT INTO room(ro_no, no, ro_name, id, ro_price, ro_people, ro_info, fileName)
VALUES(room_seq.nextval, 3, '스위트룸', 'admin', '1박 기준 : 120000원', '인원:4인', '객실크기:23평 / 전망:오션뷰 / 베드:더블베드 1개','/upload/roomimage/01.jpg');

INSERT INTO room(ro_no, no, ro_name, id, ro_price, ro_people, ro_info, fileName)
VALUES(room_seq.nextval, 3, '디럭스', 'admin', '1박 기준 : 125000원', '인원:6인', '객실크기:26평 / 전망:오션뷰 / 베드:더블베드 1개 싱글베드 1개','/upload/roomimage/01.jpg');

COMMIT;


---hotel_booking_date --------------------------------------------------------------------------------
DROP TABLE hotel_booking_date CASCADE CONSTRAINTS PURGE;
CREATE TABLE hotel_booking_date(
bono number,
ro_no NUMBER CONSTRAINT room_ro_no_fk REFERENCES room(ro_no) ON DELETE CASCADE,

hbno NUMBER CONSTRAINT hotel_booking_date_hbno_fk REFERENCES hotel_booking(hbno) ON DELETE CASCADE,
	checkin               DATE   DEFAULT  sysdate NULL ,
	checkout              DATE   DEFAULT  sysdate NULL ,
	booking_state         NUMBER
);


create sequence hotel_booking_date_seq;



INSERT INTO hotel_booking_date
VALUES(hotel_booking_date_seq.nextval, '6', '100015', '2022-09-24','2022-09-27','1');
COMMIT;

---hotel_booking --------------------------------------------------------------------------------

DROP TABLE hotel_booking CASCADE CONSTRAINTS;

DROP SEQUENCE hotel_booking_seq;

CREATE SEQUENCE hotel_booking_seq
	INCREMENT BY 1
	START WITH 100000;


CREATE TABLE hotel_booking
(
	hbno                  NUMBER  NOT NULL ,
	id                    VARCHAR2(20)  NOT NULL ,
	userName              VARCHAR2(20)  NOT NULL ,
	userTel               VARCHAR2(20)  NOT NULL ,
	userEmail             VARCHAR2(30)  NOT NULL ,
	payOption             VARCHAR2(20)  NOT NULL ,
	payType               VARCHAR2(20)  NOT NULL ,
	confirmNo             NUMBER  NOT NULL ,
	payDay                DATE   DEFAULT  sysdate
 NOT NULL ,
	bookingDate           DATE   DEFAULT  sysdate
 NOT NULL ,
	progress              VARCHAR2(20)   DEFAULT  '진행중' NOT NULL ,
	ro_no                  NUMBER  NOT NULL 
);


CREATE UNIQUE INDEX hotel_booking_hbno_pk ON hotel_booking
(hbno  ASC);


ALTER TABLE hotel_booking
	ADD CONSTRAINT  hotel_booking_hbno_pk PRIMARY KEY (hbno);


ALTER TABLE hotel_booking
	ADD (CONSTRAINT  R_1 FOREIGN KEY (id) REFERENCES member(id) ON DELETE SET NULL);
 

insert into hotel_booking(hbno, id, userName, userTel, useremail, payOption,
paytype, confirmNo, progress,ro_no)
VALUES(hotel_booking_seq.nextval, 'admin','관리씨','010-3333-1234','admin@naver.com','신용카드',
'롯데카드','4444','예약확정','01');
commit;

---diner  --------------------------------------------------------------------------------
DROP TABLE diner CASCADE CONSTRAINTS;
DROP SEQUENCE diner_seq;

CREATE TABLE diner(
   no NUMBER PRIMARY KEY,
   region VARCHAR2(100) NOT NULL,
   kind VARCHAR2(90) NOT NULL,
    id VARCHAR2(20) NOT NULL REFERENCES member(id),
   name VARCHAR2(90) NOT NULL,
   address VARCHAR2(300) NOT NULL,
    price VARCHAR2(100) NOT NULL,
   tel VARCHAR2(13) NOT NULL,
    introduce varchar2(150)NOT NULL,
    image VARCHAR2(100) NOT NULL,
   content VARCHAR2(1000) NOT NULL,
    park VARCHAR2(100) NOT NULL,
   hours VARCHAR2(100),
    hit number default 0
);
CREATE SEQUENCE diner_seq;

alter table diner add (replyCnt number default 0);
update diner set replycnt = (select count(rno) from diner_reply where diner_reply.no = diner.no);
commit;

---diner_reply --------------------------------------------------------------------------------
drop table diner_reply CASCADE CONSTRAINTS;
drop SEQUENCE diner_reply_seq;


create table diner_reply (
    rno number, --pk
    no number not null,-- 보고있는 글번호 - fk
    reply VARCHAR2(1000) not null, -- 댓글 내용
    id VARCHAR2(20) NOT NULL REFERENCES member(id),
    replyDate DATE default sysdate,
    updateDate DATE default sysdate

);

create SEQUENCE diner_reply_seq;


alter table diner_reply 
add CONSTRAINT diner_reply_rno_pk PRIMARY KEY (rno);
--diner 에 대한 댓글 이다- diner 에 no 가 있어야 입력이된다
--REFERENCES 사용
alter table diner_reply 
add CONSTRAINT diner_reply_no_fk 
FOREIGN KEY (no) REFERENCES diner (no) ON DELETE CASCADE;

create index idx_diner_reply on diner_reply (no desc, rno desc);


---tourArea, tourTheme, tour, tourLike ------------------------------------------------------------------

-- 테이블/시퀸스 객체 제거
DROP TABLE tourArea CASCADE CONSTRAINTS;
DROP TABLE tourTheme CASCADE CONSTRAINTS;
DROP TABLE tour CASCADE CONSTRAINTS;
DROP TABLE tourLike CASCADE CONSTRAINTS;
DROP SEQUENCE tour_seq;

-- 관광명소(지역)
-- 1. 제주시 / 2. 애월읍 / 3. 한림읍 / 4. 한경면 / 5. 대정읍 / 6. 안덕면 / 7. 서귀포시 /
-- 8. 남원읍 / 9. 표선면 / 10. 성산읍 / 11. 구좌읍 / 12. 조천읍 / 99. 전체보기
CREATE TABLE tourArea (
    no NUMBER(2) PRIMARY KEY,
	areaName VARCHAR2(12) NOT NULL
);

-- 관광명소(테마)
-- 1 . 체험관광 / 2. 휴양관광 / 3. 역사문화 / 4. 박물관/기념관 / 5. 드라마 / 6. 전통시장
-- 99. 전체보기
CREATE TABLE tourTheme (
    no NUMBER(2) PRIMARY KEY,
	themeName VARCHAR2(30) NOT NULL
);

-- 관광명소 테이블
CREATE TABLE tour(
	no NUMBER PRIMARY KEY,
    id VARCHAR2(20) NOT NULL REFERENCES member(id) ON DELETE CASCADE,
	area NUMBER NOT NULL REFERENCES tourArea(no),
	theme NUMBER NOT NULL REFERENCES tourTheme(no),
	name VARCHAR2(100) NOT NULL,
    thumbnail VARCHAR2(100) NOT NULL,
	address VARCHAR2(300) NOT NULL,
    content VARCHAR2(3000) NOT NULL,
	tel VARCHAR2(13) NOT NULL,
	hours VARCHAR2(100),
	roadMap VARCHAR2(3000)
);
CREATE SEQUENCE tour_seq;

-- 좋아요
CREATE TABLE tourLike(
    id VARCHAR2(20) REFERENCES member(id) ON DELETE CASCADE,
    no NUMBER REFERENCES tour(no) ON DELETE CASCADE
);

ALTER TABLE tourLike ADD PRIMARY KEY (id, no);

--- faq    ----------------------------------------------------------------------------------
DROP TABLE faq;
DROP SEQUENCE faq_seq;

-- 테이블 생성
CREATE TABLE faq(
no NUMBER PRIMARY KEY,
title VARCHAR2(300) NOT NULL,
content VARCHAR2(2000) NOT NULL,
id VARCHAR2(20) NOT NULL REFERENCES member(id)
);

-- 시퀸스 생성
CREATE SEQUENCE faq_seq;

-- FAQ 등록
INSERT into faq(no, title, content, id)
VALUES(faq_seq.nextval, '바보란?', '자바란?', 'test');
COMMIT;

--- qna    ----------------------------------------------------------------------------------
DROP TABLE qna;
DROP SEQUENCE qna_seq;

-- 생성 : PK(member) -> FK(qna)
-- 부모에 해당되는 데이터가 삭제될 때 현재 데이터에 대한 처리 방법 선언할 수 있다.
-- REFERENCES qna(no) ON DELETE CASCADE - 현재 데이터도 같이 삭제한다.
-- REFERENCES qna(no) ON DELETE SET NULL - 현재 데이터의 참조항목을 null로 수정해 준다.
CREATE TABLE qna(
no NUMBER PRIMARY KEY,
title VARCHAR2(300) NOT NULL,
content VARCHAR2(2000) NOT NULL,
id VARCHAR2(20) NOT NULL REFERENCES member(id),
writeDate DATE DEFAULT SYSDATE,
refNo NUMBER REFERENCES qna(no), -- 관련 번호(1차정렬)
ordNo NUMBER, -- 순서 번호(2차정렬) 1 -> +1
levNo NUMBER, -- 들여쓰기 0 -> +1
parentNo NUMBER REFERENCES qna(no) ON DELETE CASCADE -- 부모글
--PRIMARY KEY (no, parentNo)
);

CREATE SEQUENCE qna_seq;

-- 모든 데이터 보기
select * FROM qna; 

-- 답변
-- refNo -> refNo
-- ordNo -> ordNo + 1 : update -> insert
-- levNo -> levNo + 1
-- no -> parentNo

-- 질문 등록
INSERT into qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
VALUES(qna_seq.nextval, '컴퓨터란?', '자바란?', 'test', qna_seq.nextval, 1, 0, 1);
COMMIT;

---member, grade --------------------------------------------------------------------------------

DROP SEQUENCE member_seq;

CREATE SEQUENCE member_seq;

DROP TABLE member CASCADE CONSTRAINTS PURGE;

DROP TABLE grade CASCADE CONSTRAINTS PURGE;

CREATE TABLE grade
(
	gradeNo               NUMBER(4) PRIMARY KEY ,
	gradeName             VARCHAR2(20)  NOT NULL 
);

CREATE TABLE member
(
	id                    VARCHAR2(20)  NOT NULL ,
	memberNo              NUMBER  NOT NULL ,
	pw                    VARCHAR2(20)  NOT NULL ,
	name                  VARCHAR2(30)  NOT NULL ,
	birth                 DATE  NOT NULL ,
	gender                VARCHAR2(6)  NOT NULL ,
	tel                   VARCHAR2(13)  NOT NULL ,
	email                 VARCHAR2(50)  NOT NULL ,
	regDate               DATE   DEFAULT  SYSDATE NULL ,
	conDate               DATE   DEFAULT  SYSDATE NULL ,
	status                VARCHAR2(6)   DEFAULT  '정상' NULL  CONSTRAINT  MEMBER_STATUS CHECK (status in ( '정상', '강퇴', '탈퇴', '휴면')),
	gradeNo NUMBER(4) DEFAULT 1 REFERENCES grade(gradeNo),
    address               VARCHAR2(3000) ,
    hobby                 VARCHAR2(8) ,
    license               VARCHAR2(20)
        
);

commit;
    

INSERT INTO grade (gradeNo, gradeName)
VALUES ( 1, '일반');

INSERT INTO grade (gradeNo, gradeName)
VALUES ( 2, '탈퇴');
 
INSERT INTO grade (gradeNo, gradeName)
VALUES ( 3, '휴면');
 
INSERT INTO grade (gradeNo, gradeName)
VALUES ( 9, '관리자');

commit;
