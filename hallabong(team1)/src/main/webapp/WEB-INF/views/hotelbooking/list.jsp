<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<script type="text/javascript">
 var page = "${pageObject.page}";
 var perPageNum = "${pageObject.perPageNum}";
 var key = "${pageObject.key}";
 var word = "${pageObject.word}";

</script>

<script type="text/javascript" src="/resources/hotelbooking/js/hbookingEvent.js"></script>


   <!-- Service Start -->
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
        <h2>호텔예약리스트</h2>
        
            <div class="text-center mb-3 pb-3">
                <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">HOTEL BOOKING</h6>
                <h1>나의 예약 리스트</h1>
            </div>
     
     <div class="row service-item bg-white">
      <table class="table table-bordered table-hover ">
		    <thead>
		      <tr>
		        <th>예약번호</th>
		        <th>호텔</th>
		        <th>인원수</th>
		        <th>체크인/체크아웃</th>
		        <th>예약현황</th>
		         <c:if test="${!empty login && login.gradeNo == 9 }">
		        <th>아이디</th>
		        </c:if>
		      </tr>
		    </thead>
		   <c:forEach items="${list }" var="vo">
		    <tbody >
		   		<c:if test="${vo.id == login.id || login.gradeNo == 9}">
			      <tr class="dataRow hotelbooking"> 
			        <td class="no">${vo.hbno }</td>
<%-- 				       <c:forEach items="${rolist }" var="rvo">  --%>
					        <td class="rono">${vo.area }-${vo.ro_name }.${vo.ro_no }</td>
					        <td>${vo.ro_people }</td>
					        <td><fmt:formatDate value="${vo.checkin }"/> ~<fmt:formatDate value="${vo.checkout }"/></td>
<%-- 				        </c:forEach> --%>
				        <td>${vo.progress }
					        <img class="img-fluid mx-auto"  
					        src="/resources/img/hotelbooking/check.png" style="width: 30px; height: 30px;"> 
					        </td> 
					    <c:if test="${!empty login && login.gradeNo == 9 }">
				        	<td>${vo.id }</td> 
				        </c:if>
			      </tr>
		      	</c:if>
		    </tbody>
		    </c:forEach>
		  </table>
		  </div>
      </div> 
  
    </div>
    <!-- Service End -->


