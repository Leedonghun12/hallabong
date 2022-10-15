
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

----------맛집 샘플데이터--------------
INSERT INTO diner(no, region, kind, name, image, introduce, address, price, tel, content, park, hours) 
VALUES(diner_seq.nextval, '제주 모슬포/화순', '해산물', '미영이네 식당'
,'/upload/diner/go.jpg', 
'고등어회, 방어회(10월~3월), 고등어구이', '제주특별자치도 서귀포시 대정읍 하모항구로 42', 
'2만원-3만원',
'064-792-0077',
'제주도에서 생선이 많이 잡히기로 소문난 모슬포항 인근에 자리 잡은 고등어 요리 전문점 ‘미영이네식당’. 현지인 맛집으로 잘 알려졌으나, 최근 관광객들에게도 입소문이 나며 문전성시를 이루고 있습니다. 대표 메뉴 ‘고등어회+탕’을 주문하면 푸르스름한 은빛이 도는 껍질과 붉은 살점이 조화를 이루는 고등어회가 먼저 나옵니다. 먹음직스럽게 윤기가 도는 고등어회는 간장이나 초장을 살짝 찍어 본연의 싱싱함을 맛본 후, 양파 무침, 참기름으로 양념한 밥과 함께 김에 올려 한입에 먹는 방법을 추천합니다. 회를 다 먹어갈 즈음 준비되는 탕은 시원하면서도 칼칼한 맛 덕에 술을 절로 부릅니다.', 
'무료주차 가능', 
'11:30 - 22:00');
commit;

INSERT INTO diner(no, region, kind, name, image, introduce, address, price, tel, content, park, hours) 
VALUES(diner_seq.nextval, '제주 제주시내', '디저트', '진아떡집'
,'/upload/diner/디저트.jpg', 
'오메기떡, 오메기떡박스', '제주특별자치도 제주시 동문로4길 7-1', 
'만원 미만',
'064-757-0229',
'제주 동문재래시장내 위치한 곳으로 수유미식회에 방영된 떡집이다. 각종떡과 오메기떡을 하는 곳으로 떡은 그날 바로 만들어서 소진될때까지 판매한다. 오메기떡은 8개 한팩, 32개, 48개 박스 포장 구매가 가능하며 택배는 70개 부터 가능하다. 무방부제라 쉽게 상하기때문에 구매한날 저녁부터는 냉동보관 해야한다. 마감은 재료소진시까지이다.', 
'유료주차 가능', 
'06:00 - 16:00');
Commit;


INSERT INTO diner(no, region, kind, name, image, introduce, address, price, tel, content, park, hours) 
VALUES(diner_seq.nextval, '제주 함덕/김녕', '브런치', '무거버거'
,'/upload/diner/버거.jpg', 
'당근버거, 시금치버거, 마늘버거', '제주특별자치도 제주시 조천읍 조함해안로 356', 
'만원 미만',
'010-9622-5076',
'푸르게 펼쳐진 함덕 바다를 바라보며 여유로운 식사를 즐기기 좋은 ‘무거버거’. ‘자연과 가까운 버거를 만든다’는 경영 철학을 바탕으로 채소를 이용하여 유기농 밀가루와 채소를 이용하여 번을 만듭니다. 대표 메뉴 ‘당근 버거’는 당근으로 주황빛을 낸 번 안에 당근 소스, 청상추, 양파, 토마토, 소고기패티, 치즈, 당근 튀김을 차곡차곡 쌓아 제공합니다. 담백하면서도 감칠맛이 도는 소스가 갖은 재료를 아우르며 입안 가득 풍성한 식감과 맛의 향연이 펼쳐집니다. 이외에도 마늘의 향긋함이 스며든 ‘마늘 버거’, 시금치의 싱그러운 맛을 담아낸 ‘시금치 버거’ 등 이색적인 메뉴를 만나볼 수 있습니다.', 
'무료주차 가능', 
'10:00 - 20:00');
Commit;

INSERT INTO diner(no, region, kind, name, image, introduce, address, price, tel, content, park, hours) 
VALUES(diner_seq.nextval, '제주 성산/우도', '카페', '신산리마을카페'
,'/upload/diner/카페.jpg', 
'녹차 아이스크림, 녹차 크런치 초콜릿', '제주특별자치도 서귀포시 성산읍 환해장성로 33', 
'만원 미만',
'064-784-4333',
'녹차 마을 까페. 신산리 주민들이 지역 특산물인 녹차를 활용해 직접 만든 디저트를 판매하는 곳. 메뉴로는 100% 생크림과 신선한 우유를 사용한 녹차 아이스크림, 100% 코코아 버터로 만든 스위스산 초콜릿에 제주산 보리를 넣은 녹차 크런치 초콜릿, 제주 청귤차, 녹차 팥빙수, 녹차, 녹차라떼, 무화과 스무디, 커피, 머핀 등이 있다. 매장은 신산리 해안도로에 위치해 바다가 보이는 곳.', 
'무료주차 가능', 
'09:00 - 19:00');
Commit;

INSERT INTO diner(no, region, kind, name, image, introduce, address, price, tel, content, park, hours) 
VALUES(diner_seq.nextval, '제주 제주시내', '한식', '숙성도'
,'/upload/diner/숙성.jpg', 
'교차숙성 흑돼지, 숙성삼겹, 뼈등심', '제주특별자치도 제주시 원노형로 41', 
'만원-2만원',
'064-711-5212',
'제주도 맛집으로 유명한 고깃집입니다. 육즙이 풍부한 숙성 고기를 판매하고 있습니다. 기본으로 고기에 곁들여 먹을 소스와 반찬이 푸짐하게 제공되고 있습니다. 육즙이 자르르 흐르고 두툼한 두께를 자랑하며 고기 본연의 맛을 느낄 수 있습니다. 소스도 많고 곁들여 먹을 반찬 또한 많아 다양한 방법으로 즐길 수 있습니다. 제주만의 특별한 메뉴인 갈치속젓볶음밥 또한 맛볼 수 있습니다. 가게 내부는 편안한 분위기입니다.', 
'주차공간없음', 
'11:00 - 21:00');
Commit;

INSERT INTO diner(no, region, kind, name, image, introduce, address, price, tel, content, park, hours) 
VALUES(diner_seq.nextval, '제주 제주시내', '한식', '우진해장국'
,'/upload/diner/해장국.jpg', 
'고사리육개장, 사골해장국, 몸국', '제주특별자치도 제주시 서사로 11', 
'만원미만',
'064-757-3393',
'제주식 해장국으로 유명한 ‘우진해장국’입니다. 대표메뉴는 사골 육수에 고사리를 넣고 걸쭉하게 푹 끓여낸 ‘고사리 육개장’입니다. 제주에서만 먹을 수 있는 전통 보양식으로, 깊고 담백한 맛에 인근 주민뿐만 아니라 관광객들로 항상 북적입니다. 잘게 찢어진 고사리는 마치 소고기를 먹는 듯한 느낌을 줍니다. 구수하면서 부드럽게 후루룩 넘어가는 맛입니다. 해조류 모자반을 넣고 끓인 칼칼하고 시원한 맛의 ‘몸국’도 인기 메뉴라고 하니 참고 바랍니다.', 
'주차공간없음', 
'06:00 - 22:00');
Commit;
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

---------맛집 리뷰 샘플 데이터------------
INSERT INTO diner_reply(rno, no, reply, id) 
VALUES(diner_reply_seq.nextval, '25', '맛있어요!', 'test');
Commit;

INSERT INTO diner_reply(rno, no, reply, id) 
VALUES(diner_reply_seq.nextval, '34', '여럿이 갈 땐 여러 메뉴를 먹어보자. 대표메뉴 고사리육개장은 말할 것 없고, 사골해장국도 훌륭했다. 몸국은 전날 먹어서 피했는데, 몸국 드시는 분들도 많았음.
고사리 넣고 오랜 시간(수일로 추정) 고아서 국물에 녹아들어 죽같은 질감이다. 먹자마자 ‘이게 해장국인가?’하는 느낌이 들었음. 서울에는 정말 없는 맛. 구체적 형용은 어렵지만, 아주 맛있게 먹었음.
사골해장국이 의외로 엄청 맛있음. 선지와 콩나물, 소고기가 들어가는데 국물이 아주 깔끔. 매콤하다고 사전 공지를 주신 것에 비해 전혀 맵지 않았음.
반찬류 중 부추겉절이가 아주 맛있었음. 약간 단 맛 나긴 했지만 젓갈향이 살짝 나면서 간도 적절. 리필해 먹었음.
무김치도 딱 좋은 당도와 식감. 주차는 바로 앞 공영주차장 1시간 무료. 휴일은 무료. 웨이팅 번호표 발급하는 시스템.', 'test');
Commit;

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
