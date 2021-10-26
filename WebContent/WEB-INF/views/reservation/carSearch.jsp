<%@page import="com.kh.semi.reservation.model.vo.CarInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/style.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/reservation/carSearch.css" />

<%
	List<CarInfo> list = (List<CarInfo>) request.getAttribute("list");
%>
	
	<section class="car-container">
	
<%
	if(list.size() == 0) {
%>
	
	<h2>조건에 맞는 차량이 없습니다.</h2>
	
<%
	}
	else {
%>
	
	<h2>대여 가능한 차량 목록</h2>
	<ul>
	
<%
		for(CarInfo car : list) {
%>	

	<li>
		<div class="carBox">
		
		</div>
	</li>
		
	
	
<%
		}
%>

	</ul>
	
<%
	}
%>	
	</section>


<!-- <div class="search_wrap">
		<div class="wrap">
			<div class="search_wrap clearfix">
				<div class="searchList_wrap">
				<div class="searchList_text">
					<div class="searchTermTxt">
						<span class="period_txt">'2021-10-24 ~ 2021-10-25'</span>
						<span>조건으로 대여 가능한 차량입니다.</span>
					</div>

					<div class="sort_option clearfix">
						<div class="search_reservation_txt">
							<span class="carCount">#</span>대의 차량이 예약 가능합니다.
						</div>
						
						<div class="sort clearfix">
							<ul>
								<li class="tit">정렬 순서</li>
								<li>
									<select id="order">
										<option value="charge|ASC" selected="">최저가 낮음</option>
										<option value="charge|DESC">최저가 높음</option>
										<option value="modelName|ASC">모델명(ㄱ-ㅎ)</option>
										<option value="modelName|DESC">모델명(ㅎ-ㄱ)</option>
									</select>
								</li>
							</ul>
						</div>
					</div>
				</div>
					<div class="item_wrap clearfix">
					<div class="item_sec">
					<a href="javascript:searchByModel('K3');">
					<strong class="item_tit">K3<span class="grade">소형</span></strong>
					<p class="price">최저 <span>55,600</span>원~</p>
					<div class="goToReservation">총 <span>1</span>대 예약가능</div>
					<div class="goToArrow"><span>모두보기</span></div>
					<img src="https://img.rentking.co.kr/car/201810/1B5soSuqnIYZ0lHdlz2jfYIIw75vyLuiCewehsRG.png" alt="" style="width:325px;height:200px;"></a>
					</div>
					
					<div class="item_sec">
					<a href="javascript:searchByModel('아반떼AD');">
					<strong class="item_tit">아반떼AD<span class="grade">소형</span></strong>
					<p class="price">최저 <span>56,200</span>원~</p>
					<div class="goToReservation">총 <span>4</span>대 예약가능</div>
					<div class="goToArrow"><span>모두보기</span></div>
					<img src="https://img.rentking.co.kr/car/201708/1503369214.jpg" alt="" style="width:325px;height:200px;"></a>
					</div>
					
					<div class="item_sec">
					<a href="javascript:searchByModel('더 뉴 아반떼AD');">
					<strong class="item_tit">더 뉴 아반떼AD<span class="grade">소형</span></strong>
					<p class="price">최저 <span>56,200</span>원~</p>
					<div class="goToReservation">총 <span>2</span>대 예약가능</div>
					<div class="goToArrow"><span>모두보기</span></div>
					<img src="https://img.rentking.co.kr/car/202010/OW8ueOjEZUItk2yyZQtEAOMzP1QFCi4NbVtwxT84.png" alt="" style="width:325px;height:200px;"></a>
					</div>
					
					<div class="item_sec">
					<a href="javascript:searchByModel('레이');">
					<strong class="item_tit">레이<span class="grade">소형</span></strong>
					<p class="price">최저 <span>60,000</span>원~</p>
					<div class="goToReservation">총 <span>1</span>대 예약가능</div>
					<div class="goToArrow"><span>모두보기</span></div>
					<img src="https://img.rentking.co.kr/car/201708/1502154596.jpg" alt="" style="width:325px;height:200px;"></a>
					</div>
					
					</div>
				</div>
			</div>
		</div>
	</div> -->
	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
