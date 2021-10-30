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

<style>
.topComment {
   position: relative;
   left: 28%;
}
.carSearchResult {
	background-color: white;
}
</style>
<%
	List<Car> list = (List<Car>) request.getAttribute("list");
	String startDate = (String) request.getAttribute("start_date");
	String endDate = (String) request.getAttribute("end_date");
	/* System.out.println("startDate = " + startDate);
	System.out.println("endDate = " + endDate); */
	
	SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
	Date start = fm.parse(startDate);   // 시작일과 종료일 String을 Date로 변환
	Date end = fm.parse(endDate);
	/* System.out.println("start = " + start);
	System.out.println("end = " + end); */
	
	// 예약 시작일과 종료일의 차이를 구함
	int days = (int) (end.getTime() - start.getTime()) / (1000 * 60 * 60 * 24);
	System.out.println(days);
	
	DecimalFormat df = new DecimalFormat("###,###"); 
%>

<script>
$("#start_date").val(<%= startDate %>);
$("#end_date").val(<%= endDate %>);
</script>


<%
	if(list.size() == 0) {
%>
	
	<div class="topComment">
		<h2>조건에 맞는 차량이 없습니다.</h2>
	</div>
<%
	}
	else {
%>

	<div class="topComment">
		<h2>
			<span style="color: #DE60B9">"<%= startDate %> ~ <%= endDate %>"</span> 선택하신 기간에 예약가능한 차량은 <span style="color: #6EB1EC"><%= list.size() %></span>대입니다.
		</h2>
	</div>

	<section class="bfSection" style="margin: 0 auto;">
<%
		for(Car car : list) {
%>		
			<ul class="item-list">
				<li class="box clearfix">
				<div class="carSec">
					<span style="left:10px; color:#fff; position:absolute;border-radius: 5px; display: inline-block; min-width:10px; padding: 6px 10px;font-size: 14px;font-weight:bold;text-align: center;vertical-align: middle;background-color:#ED6767 !important;z-index:1000"><%= car.getCarSize() %></span>
					<img src="<%= request.getContextPath() %>/upload/car/<%= car.getImg() %>" width="300px;" alt="" class="lazy"/>
						<div class="desc">
							<div class="car_tit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= car.getCarName() %></div>   <!-- 차 이름이 밑의 글들과 들여쓰기가 안 맞아서 앞에 공백을 줌 -->
							<ul class="option01 clearfix">
								<li><%= car.getFuel() %></li>
								<li><%= car.getReleaseYear() %></li>
								<li><%= car.getMaker() %></li>
							</ul>
							<ul class="option02 clearfix">
								<li><%= car.getCarOption() %></li>
							</ul>
							<!-- <ul class="option03 clearfix">
								<li class="type01">
									<span>지점방문</span>
								</li>
							</ul>
							<span class="option04">만 26세 이상, 면허 1년 이상</span> -->
							<ul class="option05 clearfix">
								<li>대인 : <span>무한</span></li>
								<li>대물 : <span>50,000,000</span>원</li>
								<li>자손 : <span>15,000,000</span>원</li>
							</ul>
						</div>
					</div>
					<div class="priceArea">
						<div class="totalPrice">
							<strong>차량대여료</strong>
							<span><%= df.format(car.getPrice() * days) %></span>원
						</div>
						<dl data-calculation="carInsurance01" class="clearfix">
							<dt>자차1
								<a href="javascript:void(0);" class="insuTrigger" data-pop="noInsurance">
								<img src="//www.rentking.co.kr/resources/assets/src/imgs/rentking.w/ico/question_pop.svg?1622187507" alt="">
								팝업
								</a>
							</dt>
							<dd>20,000원 (면책금 30만원)</dd>
						</dl>
						<a href="<%= request.getContextPath() %>/reservation/reservationPage?start_date=<%= startDate %>&end_date=<%= endDate %>&car_code=<%= car.getCarCode() %>&price=<%= car.getPrice() * days %>" class="btn btn-l btn-color-type01">예약하기</a>
						<%-- <input type="button" onclick="location.href='<%= request.getContextPath() %>/reservation/reservationPage?start_date=<%= startDate %>&end_date=<%= endDate %>&car_code=<%= car.getCarCode() %>';" class="btn btn-l btn-color-type01" value="예약하기"/> --%>
						<!-- 버튼태그로 하니까 css가 이상해져서 기존의 것으로 했다. -->
					</div>
				</li>
			</ul>
		
<%
				}
%>	

		</section>
<%
	}
%>	
	

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
