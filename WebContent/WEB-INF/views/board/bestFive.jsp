<%@page import="java.util.List"%>
<%@page import="com.kh.semi.board.model.vo.CommunityBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>
 <link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/footer.css" />
 <link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/header.css" />
 <link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/nav.css" />
 <link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/style.css" />
 <link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/bestFive.css" />
 
<div id="allSection">
	<section class="bfSection">
	
		<h2 class="top">
			<span class="font_c_red">KH렌트</span>
			 후기 
		 	<span class="txtBold">TOP5</span>
	 	</h2>
	 	<p class="top_pick">
	 		가장 많이 사랑받는 고객님의 PICK!
		</p>
	
		<ul class="item-list">
			<li class="box clearfix">
			<div class="carSec">
				<span style="left:10px; color:#fff; position:absolute;border-radius: 5px; display: inline-block; min-width:10px; padding: 6px 10px;font-size: 14px;font-weight:bold;text-align: center;vertical-align: middle;background-color:#ED6767 !important;z-index:1000">금연차</span>
				<img src="https://img.rentking.co.kr/car/201708/1502154596.jpg" alt="" class="lazy">
					<div class="desc">
						<div class="car_tit">레이</div>
						<ul class="option01 clearfix">
							<li>휘발유</li>
							<li>2017</li>
							<li>밀키베이지</li>
						</ul>
						<ul class="option02 clearfix">
							<li>일반시트 하이패스 네비게이션 블랙박스 후방카메라 후방센서 스마트키</li>
						</ul>
						<ul class="option03 clearfix">
							<li class="type01">
								<span>지점방문</span>
							</li>
						</ul>
						<span class="option04">만 26세 이상, 면허 1년 이상</span>
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
						<span>59,000</span>원
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
					<a href="javascript:void(0);" onclick="goToReservation('34677');" class="btn btn-l btn-color-type01">예약하기</a>
				</div>
			</li>
		</ul>
		<ul class="item-list">
			<li class="box clearfix">
			<div class="carSec">
				<span style="left:10px; color:#fff; position:absolute;border-radius: 5px; display: inline-block; min-width:10px; padding: 6px 10px;font-size: 14px;font-weight:bold;text-align: center;vertical-align: middle;background-color:#ED6767 !important;z-index:1000">금연차</span>
				<img src="https://img.rentking.co.kr/car/201708/1502154596.jpg" alt="" class="lazy">
					<div class="desc">
						<div class="car_tit">레이</div>
						<ul class="option01 clearfix">
							<li>휘발유</li>
							<li>2017</li>
							<li>밀키베이지</li>
						</ul>
						<ul class="option02 clearfix">
							<li>일반시트 하이패스 네비게이션 블랙박스 후방카메라 후방센서 스마트키</li>
						</ul>
						<ul class="option03 clearfix">
							<li class="type01">
								<span>지점방문</span>
							</li>
						</ul>
						<span class="option04">만 26세 이상, 면허 1년 이상</span>
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
						<span>59,000</span>원
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
					<a href="javascript:void(0);" onclick="goToReservation('34677');" class="btn btn-l btn-color-type01">예약하기</a>
				</div>
			</li>
		</ul>
		
		<ul class="item-list">
			<li class="box clearfix">
			<div class="carSec">
				<span style="left:10px; color:#fff; position:absolute;border-radius: 5px; display: inline-block; min-width:10px; padding: 6px 10px;font-size: 14px;font-weight:bold;text-align: center;vertical-align: middle;background-color:#ED6767 !important;z-index:1000">금연차</span>
				<img src="https://img.rentking.co.kr/car/201708/1502154596.jpg" alt="" class="lazy">
					<div class="desc">
						<div class="car_tit">레이</div>
						<ul class="option01 clearfix">
							<li>휘발유</li>
							<li>2017</li>
							<li>밀키베이지</li>
						</ul>
						<ul class="option02 clearfix">
							<li>일반시트 하이패스 네비게이션 블랙박스 후방카메라 후방센서 스마트키</li>
						</ul>
						<ul class="option03 clearfix">
							<li class="type01">
								<span>지점방문</span>
							</li>
						</ul>
						<span class="option04">만 26세 이상, 면허 1년 이상</span>
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
						<span>59,000</span>원
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
					<a href="javascript:void(0);" onclick="goToReservation('34677');" class="btn btn-l btn-color-type01">예약하기</a>
				</div>
			</li>
		</ul>
		
		<ul class="item-list">
			<li class="box clearfix">
			<div class="carSec">
				<span style="left:10px; color:#fff; position:absolute;border-radius: 5px; display: inline-block; min-width:10px; padding: 6px 10px;font-size: 14px;font-weight:bold;text-align: center;vertical-align: middle;background-color:#ED6767 !important;z-index:1000">금연차</span>
				<img src="https://img.rentking.co.kr/car/201708/1502154596.jpg" alt="" class="lazy">
					<div class="desc">
						<div class="car_tit">레이</div>
						<ul class="option01 clearfix">
							<li>휘발유</li>
							<li>2017</li>
							<li>밀키베이지</li>
						</ul>
						<ul class="option02 clearfix">
							<li>일반시트 하이패스 네비게이션 블랙박스 후방카메라 후방센서 스마트키</li>
						</ul>
						<ul class="option03 clearfix">
							<li class="type01">
								<span>지점방문</span>
							</li>
						</ul>
						<span class="option04">만 26세 이상, 면허 1년 이상</span>
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
						<span>59,000</span>원
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
					<a href="javascript:void(0);" onclick="goToReservation('34677');" class="btn btn-l btn-color-type01">예약하기</a>
				</div>
			</li>
		</ul>
		
		<ul class="item-list">
			<li class="box clearfix">
			<div class="carSec">
				<span style="left:10px; color:#fff; position:absolute;border-radius: 5px; display: inline-block; min-width:10px; padding: 6px 10px;font-size: 14px;font-weight:bold;text-align: center;vertical-align: middle;background-color:#ED6767 !important;z-index:1000">금연차</span>
				<img src="https://img.rentking.co.kr/car/201708/1502154596.jpg" alt="" class="lazy">
					<div class="desc">
						<div class="car_tit">레이</div>
						<ul class="option01 clearfix">
							<li>휘발유</li>
							<li>2017</li>
							<li>밀키베이지</li>
						</ul>
						<ul class="option02 clearfix">
							<li>일반시트 하이패스 네비게이션 블랙박스 후방카메라 후방센서 스마트키</li>
						</ul>
						<ul class="option03 clearfix">
							<li class="type01">
								<span>지점방문</span>
							</li>
						</ul>
						<span class="option04">만 26세 이상, 면허 1년 이상</span>
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
						<span>59,000</span>원
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
					<a href="javascript:void(0);" onclick="goToReservation('34677');" class="btn btn-l btn-color-type01">예약하기</a>
				</div>
			</li>
		</ul>
		
	
	</section>
	
	<section class="bfSection">
	
		<h2 class="top">
			<span class="font_c_red">KH렌트</span>
			 예약 
		 	<span class="txtBold">TOP5</span>
	 	</h2>
	 	<p class="top_pick">
	 		가장 많이 사랑받는 고객님의 PICK!
		</p>
		<ul class="item-list">
				<li class="box clearfix">
				<div class="carSec">
					<span style="left:10px; color:#fff; position:absolute;border-radius: 5px; display: inline-block; min-width:10px; padding: 6px 10px;font-size: 14px;font-weight:bold;text-align: center;vertical-align: middle;background-color:#ED6767 !important;z-index:1000">금연차</span>
					<img src="https://img.rentking.co.kr/car/201708/1502154596.jpg" alt="" class="lazy">
						<div class="desc">
							<div class="car_tit">레이</div>
							<ul class="option01 clearfix">
								<li>휘발유</li>
								<li>2017</li>
								<li>밀키베이지</li>
							</ul>
							<ul class="option02 clearfix">
								<li>일반시트 하이패스 네비게이션 블랙박스 후방카메라 후방센서 스마트키</li>
							</ul>
							<ul class="option03 clearfix">
								<li class="type01">
									<span>지점방문</span>
								</li>
							</ul>
							<span class="option04">만 26세 이상, 면허 1년 이상</span>
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
							<span>59,000</span>원
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
						<a href="javascript:void(0);" onclick="goToReservation('34677');" class="btn btn-l btn-color-type01">예약하기</a>
					</div>
				</li>
			</ul>
			
			<ul class="item-list">
			<li class="box clearfix">
			<div class="carSec">
				<span style="left:10px; color:#fff; position:absolute;border-radius: 5px; display: inline-block; min-width:10px; padding: 6px 10px;font-size: 14px;font-weight:bold;text-align: center;vertical-align: middle;background-color:#ED6767 !important;z-index:1000">금연차</span>
				<img src="https://img.rentking.co.kr/car/201708/1502154596.jpg" alt="" class="lazy">
					<div class="desc">
						<div class="car_tit">레이</div>
						<ul class="option01 clearfix">
							<li>휘발유</li>
							<li>2017</li>
							<li>밀키베이지</li>
						</ul>
						<ul class="option02 clearfix">
							<li>일반시트 하이패스 네비게이션 블랙박스 후방카메라 후방센서 스마트키</li>
						</ul>
						<ul class="option03 clearfix">
							<li class="type01">
								<span>지점방문</span>
							</li>
						</ul>
						<span class="option04">만 26세 이상, 면허 1년 이상</span>
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
						<span>59,000</span>원
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
					<a href="javascript:void(0);" onclick="goToReservation('34677');" class="btn btn-l btn-color-type01">예약하기</a>
				</div>
			</li>
		</ul>
		
		<ul class="item-list">
			<li class="box clearfix">
			<div class="carSec">
				<span style="left:10px; color:#fff; position:absolute;border-radius: 5px; display: inline-block; min-width:10px; padding: 6px 10px;font-size: 14px;font-weight:bold;text-align: center;vertical-align: middle;background-color:#ED6767 !important;z-index:1000">금연차</span>
				<img src="https://img.rentking.co.kr/car/201708/1502154596.jpg" alt="" class="lazy">
					<div class="desc">
						<div class="car_tit">레이</div>
						<ul class="option01 clearfix">
							<li>휘발유</li>
							<li>2017</li>
							<li>밀키베이지</li>
						</ul>
						<ul class="option02 clearfix">
							<li>일반시트 하이패스 네비게이션 블랙박스 후방카메라 후방센서 스마트키</li>
						</ul>
						<ul class="option03 clearfix">
							<li class="type01">
								<span>지점방문</span>
							</li>
						</ul>
						<span class="option04">만 26세 이상, 면허 1년 이상</span>
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
						<span>59,000</span>원
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
					<a href="javascript:void(0);" onclick="goToReservation('34677');" class="btn btn-l btn-color-type01">예약하기</a>
				</div>
			</li>
		</ul>
		
		<ul class="item-list">
			<li class="box clearfix">
			<div class="carSec">
				<span style="left:10px; color:#fff; position:absolute;border-radius: 5px; display: inline-block; min-width:10px; padding: 6px 10px;font-size: 14px;font-weight:bold;text-align: center;vertical-align: middle;background-color:#ED6767 !important;z-index:1000">금연차</span>
				<img src="https://img.rentking.co.kr/car/201708/1502154596.jpg" alt="" class="lazy">
					<div class="desc">
						<div class="car_tit">레이</div>
						<ul class="option01 clearfix">
							<li>휘발유</li>
							<li>2017</li>
							<li>밀키베이지</li>
						</ul>
						<ul class="option02 clearfix">
							<li>일반시트 하이패스 네비게이션 블랙박스 후방카메라 후방센서 스마트키</li>
						</ul>
						<ul class="option03 clearfix">
							<li class="type01">
								<span>지점방문</span>
							</li>
						</ul>
						<span class="option04">만 26세 이상, 면허 1년 이상</span>
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
						<span>59,000</span>원
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
					<a href="javascript:void(0);" onclick="goToReservation('34677');" class="btn btn-l btn-color-type01">예약하기</a>
				</div>
			</li>
		</ul>
		
		<ul class="item-list">
			<li class="box clearfix">
			<div class="carSec">
				<span style="left:10px; color:#fff; position:absolute;border-radius: 5px; display: inline-block; min-width:10px; padding: 6px 10px;font-size: 14px;font-weight:bold;text-align: center;vertical-align: middle;background-color:#ED6767 !important;z-index:1000">금연차</span>
				<img src="https://img.rentking.co.kr/car/201708/1502154596.jpg" alt="" class="lazy">
					<div class="desc">
						<div class="car_tit">레이</div>
						<ul class="option01 clearfix">
							<li>휘발유</li>
							<li>2017</li>
							<li>밀키베이지</li>
						</ul>
						<ul class="option02 clearfix">
							<li>일반시트 하이패스 네비게이션 블랙박스 후방카메라 후방센서 스마트키</li>
						</ul>
						<ul class="option03 clearfix">
							<li class="type01">
								<span>지점방문</span>
							</li>
						</ul>
						<span class="option04">만 26세 이상, 면허 1년 이상</span>
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
						<span>59,000</span>원
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
					<a href="javascript:void(0);" onclick="goToReservation('34677');" class="btn btn-l btn-color-type01">예약하기</a>
				</div>
			</li>
		</ul>
		
	</section>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>