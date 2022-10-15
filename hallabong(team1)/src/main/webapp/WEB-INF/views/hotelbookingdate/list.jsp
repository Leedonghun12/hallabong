<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<meta http-equiv="X-UA-Compatible" content="ie=edge">




	<div class="row">
		<div class="col-md-6">
			<form action="/hotelbooking/write.do"  class="form-inline">
				<input type="hidden" name="ro_no"  value="${vo.ro_no }" />
				<div class="form-group">
					<label for="checkin">입실날자</label>
					<input name="checkin" class="form-control" id="checkin"  style="margin:5px 10px"/>
				</div>
				<div class="form-group">
					<label for="checkout">퇴실날자</label>
					<input name="checkout" class="form-control" id="checkout"  style="margin:5px 10px"/>
				</div>
				<button class="btn btn-default" id="insertBtn" style="margin-top:15px">예약하기</button>
			</form>
			  <div >
		      	<table class="table table-bordered table-hover" style="margin-top:30px">
				    <thead>
				      <tr class="text-center">
				        <th class="text-center">번호</th>
				        <th>방번호</th>
				        <th>예약번호</th>
				        <th>체크인</th>
				        <th>체크아웃</th>
				      </tr>
				    </thead>
				    <tbody  class="chat">
				    </tbody>
				  </table>
				</div>
		</div>
		<div class="col-md-6">
			<div id='calendar-container' >
	    		<div id='calendar' style="width:500px">
	    		</div>
	 		 </div>  
 		 
 		</div>

	</div>
