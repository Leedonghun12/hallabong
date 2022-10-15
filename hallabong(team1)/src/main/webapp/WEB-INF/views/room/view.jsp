<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>객실 보기</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- 장점 : 재활용 가능, 이미지게시판과 이미지 댓글을 동시에 개발할 수 있다. 보안에 도움이 된다. -->
<!-- utility JS -->
<script type="text/javascript" src="/resources/js/hotelbooking/util.js" ></script>

<!-- 댓글 객체인 replyServcie를 가져오자. - 처리하는 함수만 존재, 호출이 없다. -->
<script type="text/javascript" src="/resources/js/hotelbooking/reply.js" ></script>

<!-- 댓글 페이지네이션 - 처리하는 함수만 존재, 호출이 없다. -->
<script type="text/javascript" src="/resources/js/hotelbooking/replyPagination.js" ></script>

<!-- 댓글 이벤트처리 / replyServcie를 호출해서 서버에서 DB처리를 하는것을가져오자. -->
<script type="text/javascript" src="/resources/js/hotelbooking/replyEvent.js"></script>

<script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>

<link href='/resources/lib/fullcalendar/main.css' rel='stylesheet'>
<script defer src='/resources/lib/fullcalendar/main.js'></script>
<script type="text/javascript">

var ro_no = "${vo.ro_no }";
module="/hotelbookingdate";
</script>



<script type="text/javascript">



$(function() {
	$(".dataRow").on("click", function(){
		// alert("보기로 이동");
			var ro_no = $(this).data(".no");
				location = "view.do?no=" + ro_no + "&page=${pageObject.page}"
							+ "&perPageNum=${pageObject.perPageNum}"
						+ "&key=${pageObject.key}"
						+ "&word=${pageObject.word}"
			});


	
	$("#updateBtn").click(function(){
		location = "update.do?ro_no=${vo.ro_no}&no=${param.no}&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}";

	});
	
	$("#deleteBtn").on("click", function(){
		if(confirm("정말 삭제하시겠니까?"))
			location = "delete.do?ro_no=${vo.ro_no}&no=${param.no}&perPageNum=${param.perPageNum}";
	});
	
	$("#listBtn").click(function(){
		location = "list.do?page=" + "${param.page}"
		+ 	"&perPageNum=" + "${param.perPageNum}"
		+ "&key=" + "${param.key}"
		+ "&word=" + "${param.word}"
		+ "&no=${param.no}"
		;
	});
});

</script>
<style type="text/css">
  .img{
    position: relative;                                                           
    height: 50vh;
    background-size: cover;
  }
  .img-cover{
     position: absolute;
     height: 100%;
     width: 100%;
     background-size: cover;                                                              
  }

</style>

</head>
<body>
	<input type="hidden" id="ro_no" data-no="${vo.ro_no }">
	<div class="container">
	<!-- 객실 출력 -->
	<div class="container">
		<div class="container">
		<p style="text-align:center;"><img class = "image" src="${vo.fileName }" alt="${vo.ro_name }" ></p>
	        
	        <div class="img-cover"></div>
		</div>
	</div>
	<h2>${vo.ro_name }</h2>
	<h1></h1>
	<hr style="border:solid; color= silver">
	
	<div class="container">		
		<div class="container">
			
			<p>객실명 : ${vo.ro_name }</p>
			<p>${vo.ro_price }</p>
			<p>${vo.ro_people }</p>
			<p>객실 기본옵션 : ${vo.ro_info }</p>

		</div>	
		 
	</div>

		<!-- 그 외 기능 버튼 위치 -->
<div class="row">
		<div class="col-md-4" style="padding: 20px;">
			<div class="btn-group">
 			<c:if test="${!empty login && login.gradeNo == 9 }"> <!-- 관리자 계정일때 수정, 삭제 표시 -->
			<button type = "button" id="updateBtn" class="btn-default">수정</button>
			<button type = "button" id="deleteBtn" class="btn-default">삭제</button>		
			</c:if>
			<button type = "button" id="listBtn" class="btn-default">리스트</button>
			</div>
			</div>
			</div>
			
<%-- 					<c:if test="${!empty login && login.gradeNo == 9 }"> <!-- 관리자 계정일때 수정, 삭제 표시 --> --%>
<%-- 				</c:if> --%>
		
			
	</div>
	
	<!--  달력 있는 부분 -->
	<div class="container">
	<%@ include file="../hotelbookingdate/list.jsp" %>	
	</div>
	
</body>
</html>