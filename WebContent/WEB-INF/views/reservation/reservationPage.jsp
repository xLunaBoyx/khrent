<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kh.semi.reservation.model.vo.Car"%>
<%@page import="com.kh.semi.reservation.model.vo.CarInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/footer.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/header.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/nav.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/style.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/bestFive.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/reservation/carSearch.css" />

<h1>임시 페이지</h1>
<%
	Car car = (Car) request.getAttribute("car");
	String startDate = (String) request.getAttribute("start_date");
	String endDate = (String) request.getAttribute("end_date");
	String price = (String) request.getAttribute("price");
%>
	<div class="carData">
		<img src="<%= request.getContextPath() %>/upload/car/<%= car.getImg() %>" width="450px;" alt="" />
		<div class="text">
			<p style="font-size: 2em"><%= car.getCarName() %></p>
			<p>대여기간 : <%= startDate %> ~ <%= endDate %></p>
			<p>총 결제금액은 <%= price %>원 입니다.</p>
			<form 
				name="reservationFrm"
				action="<%= request.getContextPath() %>/reservation/makeReservation?start_date=<%= startDate %>&end_date=<%= endDate %>&car_code=<%= car.getCarCode() %>&price=<%= price %>"
				method="post">
				<input type="hidden" name="member_id" value="<%= loginMember.getMemberId() %>" />
				<input type="hidden" name="start_date" value="<%= startDate %>"/>			
				<input type="hidden" name="end_date" value="<%= endDate %>"/>			
				<input type="hidden" name="car_code" value="<%= car.getCarCode() %>"/>			
				<input type="hidden" name="car_name" value="<%= car.getCarName() %>"/>			
				<input type="hidden" name="price" value="<%= price %>" />
				<button>결제하기</button>			
				<%-- <input type="button" value="결제하기" onclick="location.href='<%= request.getContextPath() %>/reservation/makeReservation?start_date=<%= startDate %>&end_date=<%= endDate %>&car_code=<%= car.getCarCode() %>&price=<%= price %>';"/> --%>
			</form>
		</div>
	</div>
	
	





<%@ include file="/WEB-INF/views/common/footer.jsp"%>