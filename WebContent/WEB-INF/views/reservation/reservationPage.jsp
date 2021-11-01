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

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reservation/reservationPage.css" />

<!-- 아임포트 삽입 스크립트. header.jsp에 제이쿼리 삽입 코드가 있으므로 아래의 코드는 주석처리 -->
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
<!-- iamport.payment.js -->

<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<%
Car car = (Car) request.getAttribute("car");
String startDate = (String) request.getAttribute("start_date");
String endDate = (String) request.getAttribute("end_date");
int price = (int) request.getAttribute("price");

DecimalFormat df = new DecimalFormat("###,###");
%>

<!-- <div class="reservationContainer"> -->
<!-- 	<div class="upperBox"> -->
<!-- 		<div class="upperBox-left"> -->
<!-- 			<div class="carData"> -->
<!-- 				<div class="carImage-showReview"> -->
<%-- 					<img src="<%= request.getContextPath() %>/upload/car/<%= car.getImg() %>" width="450px;" alt="" /> --%>
<!-- 					<input type="button" id="reviewButton" value="리뷰보기"/> -->
<!-- 				</div> -->
<!-- 				<div class="text"> -->
<%-- 					<p style="font-size: 2em">&nbsp;&nbsp;&nbsp;&nbsp;<%= car.getCarName() %></p> --%>
<!-- 					<ul class="option01 clearfix"> -->
<%-- 						<li><%= car.getFuel() %> &nbsp;|&nbsp;&nbsp;</li> --%>
<%-- 						<li><%= car.getReleaseYear() %> &nbsp;|&nbsp;&nbsp;</li> --%>
<%-- 						<li><%= car.getMaker() %></li> --%>
<!-- 					</ul> -->
<!-- 					<br /> -->
<!-- 					<ul class="option02 clearfix"> -->
<%-- 						<li><%= car.getCarOption() %></li> --%>
<!-- 						<br /><br /> -->
<!-- 						<li>! KH렌트의 모든 차량은 종합보험에 가입되어 있습니다.</li> -->
<!-- 						<li>&nbsp;대인:무한 대물: 30,000,000원 자손: 15,000,000원</li> -->
<!-- 						<br /><br /> -->
<!-- 						<li>!자차보험은 고객 선택사항이니, 아래에서 선택해주세요.</li> -->
<!-- 					</ul> -->
<%-- 					<p>대여기간 : <%= startDate %> ~ <%= endDate %></p>
<%-- 					<p>총 결제금액은 <%= df.format(price) %>원 입니다.</p> --%>
<!-- --%> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			.	 -->
<!-- 		</div> -->
<!-- 		<div class="upperBox-right"> -->
<!-- 			<div id="map2"></div> -->
<!-- 			<div class="locationDesc"> -->
<!-- 				<strong>KH렌트 (서울 강남구)</strong> -->
<!-- 				<p>평일 09:00 ~ 21:00 / 주말, 공휴일 09:00 ~ 20:00</p> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<br /><hr /><br /> -->
<!-- 	<div class="lowerBox"> -->
<!-- 		<div class="notice"> -->
<!-- 			<p>유의사항</p> -->

<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->

<div class="content_wrap">
	<div class="wrap">
		<input type="hidden" id="rentage" value="26"> <input
			type="hidden" id="partnerid" value="">
		<div class="reservation_sec clearfix">
			<div class="reservation_info">
				<div>
					<div>
						<img
							src="https://img.rentking.co.kr/car/202110/PsbgGxVLdsvQHfyTZxkNmryslrz3h4IkYeD7OU7m.png"
							alt="차량이미지">
					</div>

					<div class="reserve_notice" style="width: 320px;">
						<p class="notice">
							<span class="color" style="font-size: 12px;"> *위 차량은 실대여시
								모델명, 색상이 다를수 있습니다. </span>
						</p>
						<button type="button" class="btn btn-l btn-color-type01"
							id="btn-preivew" style="width: 80%">차량 상세 이미지</button>
					</div>
				</div>
				<div class="info_list">
				<strong> 아반떼MD </strong>
				<ul class="option01 clearfix">
					<li>휘발유</li>
					<li>2016</li>
					<li>화이트</li>
				</ul>
				<br />
				<p style="margin-left: 38px;">네비게이션 전면 블랙박스 후방카메라 후방센서 블루투스 AUX케이블</p>
				<ul class="icoList clearfix">
					<li class="icon visit active"><span>본사 방문</span></li>
					<li class="icon recentYear "><span>최근연식</span></li>
					<li class="icon nonSmokingCar active"><span>금연차</span></li>
					<li class="icon electricCar "><span>전기차</span></li>
				</ul>
				<br />
				<ul class="notice">
					<li>! 아래 조건에 맞아야 대여가 가능합니다.
						<p>만 26세 이상 , 면허 취득 1년 이상</p>
					</li>
					<li>! 렌트킹의 모든 차량은 종합보험에 가입되어 있습니다.
						<p>대인: 무한 &nbsp;&nbsp;&nbsp;&nbsp;대물:
							20,000,000원&nbsp;&nbsp;&nbsp;&nbsp;자손: 15,000,000 원</p>
					</li>
					<li>! 자차보험은 고객 선택사항이니, 아래에서 내용 확인 후 선택해주세요.</li>
				</ul>
			</div>
				</div>
			<div class="map_area">

				<div id="map" style="width: 500px; height: 500px;"></div>

				<div class="map_info">
					<strong class="location">KH렌트<span>(서울 강남구)</span></strong>
					<p>평일 10:00 ~ 20:00 / 주말, 공휴일 10:00 ~ 20:00</p>
					<p class="etc point">본사의 정확한 주소와 연락처는 예약이 완료되면 안내해드립니다.</p>
				</div>

			</div>
		</div>
		<div class="clearfix" style="position: relative;">
			<div class="leftSec">
				<div class="reservation_sec">
					<strong class="tit03"> 자차보험 선택 </strong> <a
						class="modalPop insurance" href="javascript:;"
						data-pop="insurance"><img
						src="//www.rentking.co.kr/resources/assets/src/imgs/rentking.w/ico/question_pop.svg?1622187507"
						alt="">자차보험 안내</a>
					<table class="insuranceTable">
						<caption>자차보험 선택 테이블</caption>
						<colgroup>
							<col style="width: auto;">
							<col style="width: 170px;">
							<col style="width: 170px;">
							<col style="width: 200px;">
						</colgroup>
						<thead>
							<tr>
								<th>보험 선택</th>
								<th>보험료</th>
								<th>보상한도</th>
								<th>고객부담금(면책금)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th><input type="radio" name="insurance" data-num="1"
									data-limit="0" data-exem="500000" id="self1" value="20000">
									<label for="self1">선택안함</label></th>
								<td colspan="3">차량 사고 시 차량 손해액의 전부를 고객님께서 부담하셔야 합니다.</td>
							</tr>
							<tr>
								<th><input type="radio" name="insurance" data-num="1"
									data-limit="0" data-exem="500000" id="self1" value="20000">
									<label for="self1">자차 1</label></th>
								<td>20,000원</td>
								<td>무한</td>
								<td>500,000원 / 건</td>
							</tr>
						</tbody>
					</table>
					<strong class="tit03">운전자 정보 입력</strong>
					<div class="licenseArea">
						<div class="firstDriver">
							<dl>
								<dt>
									<label for="firstDriverName">이름</label>
								</dt>
								<dd>
									<span class="disable"> <!-- 포워딩된 회원정보 수정 불가 --> <input
										type="text" id="firstDriverName" name="firstDriverName"
										value="지수진" placeholder="제 1 운전자 이름">
									</span>
								</dd>
							</dl>
							<dl>
								<dt>
									<label for="firstDriverPhoneNumber">휴대폰 번호 <span
										style="color: rgb(131, 134, 131); font-size: 12px">(
											(-)없이 숫자만 입력)</span></label>
								</dt>
								<dd>
									<span class="disable"> <input type="text"
										id="firstDriverPhoneNumber" name="firstDriverPhoneNumber"
										value="01089604543" maxlength="11" placeholder="(-)없이 숫자만 입력">
									</span>
								</dd>
							</dl>
							<dl>
								<dt>
									<label for="firstDriverBirth">생년월일 <span
										style="color: rgb(131, 134, 131); font-size: 12px">(
											8자리(예: 20190101))</span></label>
								</dt>
								<dd>
									<span class="disable"> <input type="text"
										id="firstDriverBirth" name="firstDriverBirth"
										value="1995-09-22" maxlength="10" placeholder="8자리(YYYYMMDD)">
									</span>
								</dd>
							</dl>
							<div style="padding-top: 1em">*예약자와 제1운전자(이름,휴대폰,생년월일)가 다르면
								수정하고 아래 면허정보에서 저장하세요.</div>
							<div class="alertWrap">
							<a href="javascript:;" class="saveBtn" onclick="saveLicense();">면허 정보 저장</a>
							</div>
						</div>
					</div>
				</div>
				<div class="reservation_sec">
					<strong class="tit04">면허정보</strong>
					<div class="licenseArea">

						<!-- 면허가 등록되어 있지 않을 경우 -->
						<div class="licenseForm  active ">

							<div class="driverLicense active">
								<form action="" name="frmDomestic" id="frmDomestic"
									method="post" novalidate="novalidate" style="display: flex; flex-direction: column;">

									<div class="licenseType clearfix">
										<strong class="tit04">면허 종류</strong>

										<div class="licenseList clearfix">
											<input type="radio" id="stick" name="type" value="stick" checked="&quot;checked&quot;"> 
												<label for="kinds1"><span>1종 보통</span></label> 
											<input type="radio" id="auto" name="type" value="auto"> 
											<label for="kinds3"><span>2종 보통</span></label>
										</div>
									</div>
									<div class="licenseNumber">
										<dl>
											<dt>
												<label for="SecondNum">면허 번호</label>
											</dt>
											<dd>
												<div class="licenseNumInput">
													<input type="text" placeholder="XX XXXXXX XX" value="" maxlength="12" name="license_no" id="license_no" required="">
												</div>
											</dd>
										</dl>
									</div>
									<div class="updateDate">
										<dl>
											<dt>
												<label>면허 발급일</label>
											</dt>
											<dd>
											<div class="licenseNumInput">
												<input type="text" placeholder="날짜 선택" id="issue_date" name="issue_date" required="">
											</div>
											</dd>
										</dl>
									</div>
									<div class="saveInfoBtn">
										<input type="submit" value="면허 정보 저장" class="licenseRegisterBtn" />
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div class="reservation_sec" style="display: flex; flex-direction: column;">
					<strong class="tit03"> 취소수수료 및 대여규정 동의 </strong> 

					<strong class="tit04">차량 대여 주의사항</strong> <em>차량옵션 보장 및 차량 변경
						안내</em>
					<ul class="caution">
						<li>단기 대여시 반납지연, 정비 등으로 인하여 <span>동급/상급 차종으로 변경 될 수
								있으며, 차량 옵션이 달라질 수 있습니다.</span></li>
						<li>차량 변경시, 해당 제휴업체에서 별도로 연락드립니다.</li>
						<li>차량 주행거리는 보여지는 것과 상이할 수 있습니다.</li>
						<li><span class="error">제휴사의 사정, 대여중 사고 및 전산기입 오류</span>로 인해
							<span class="error">취소 및 대체차량</span>으로 배정 받을 수 있습니다.</li>
					</ul>
					<em>금연차량에서 흡연시 패널티</em>
					<ul class="caution">
						<li>금연차량에서 흡연 시 해당 제휴업체에서 실내 세차 비용 등의 추가 요금을 부과할 수 있으니 흡연은
							삼가해주세요.</li>
					</ul>
					<em>렌터카 대여시 자동차 보험</em>
					<ul class="caution">
						<li>자동차 보험의 정확한 보장 범위는 대여 시 렌트카업체에서 정하는 작성하는 임대차 계약서를 기준으로
							결정됩니다. <br>차량 대여 시 작성하는 임대차계약서 내용을 반드시 확인해주세요
						</li>
					</ul>
					<em>유의사항</em>
					<ul class="caution">
						<li>사고 발생 시, 대인, 대물, 자손, 자차에서 각각의 <span class="error">면책금과
								휴차 보상료</span>가 발생됩니다.
						</li>
						<li>단독 사고, 휠/타이어, 중과실 사고 시에는 자차에 대한 보상이 적용이 불가할 수 있습니다.</li>
					</ul>
					<em>차량 정비 및 사고</em>
					<ul class="caution">
						<li>차량 정비는 렌트카 업체의 규정에 따라야 하며 이를 이행하지 않았을 경우 서비스 이용이 제한됩니다.</li>
						<li>사고가 발생했을 경우 사고 상황을 즉시 렌트카 업체로 통보해야 하며 사고 처리는 렌트카 업체와의 계약
							약관에 따라 진행됩니다.</li>
					</ul>
					<em>단,울릉도 지역은 동급 차종중에서 색상 및 옵션이 수시로 변경될 수 있습니다.</em>
				</div>
			</div>
			<div class="rightSec" style="position: fixed;">
				<h2>대여기간</h2>
				<span>2021-11-01 15:00 ~ 2021-11-02 15:00</span>
				<p>
					총 <em>1일 0시간</em> 이용
				</p>

				<div class="paymentArea">
					<dl>
						<dt>차량 대여료</dt>
						<dd>
							<span id="charge">29,000</span>원
						</dd>
					</dl>
					<dl>
						<dt>자차 보험료</dt>
						<dd>
							<span id="insu">0</span>원
						</dd>
					</dl>
					<dl>
						<dt>총 대여 금액</dt>
						<dd>
							<strong><span id="totalCharge">29,000</span>원</strong>
						</dd>
					</dl>
					<dl class="divideLine"></dl>
					<dl>
						<dt>
							<strong>결제금액</strong>
						</dt>
						<dd>
							<strong> <span id="paymentAmount" data-paymentamount="0"
								data-totalcharge="0" data-deposit="0" data-charge="29000"
								data-moncharge="0" data-leftcharge="0" data-precharge="0"
								data-delivery="0" data-insu="0" data-partner="0" data-coupon="0">29,000</span>원
							</strong>
						</dd>
					</dl>
				</div>
				<div>
					<a href="javascript:;" onclick="doPayment('kcp'); return false;" class="btn btn-l btn-color-type01" style="background-color: #39b56d; padding-top: 20px; width: 350px; height: 30px; margin-top: 60px;">결제하기</a>
				</div>
			</div>
		</div>
	</div>
</div>







<script>
// 지도
var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(37.49904818396395, 127.03313483800216), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
    
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('서울특별시 강남구 테헤란로14길 6', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width: 150px; text-align: center; padding: 6px 0;">KH렌트</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    



// 결제
function inicisPay() {
	var IMP = window.IMP;      // 계속 requestPay is undefined라고 떠서 시간을 한참 날렸는데, 이 두줄도 같이 function 안에 넣어줘야하는거였다.
	IMP.init("imp94728784");   // 아임포트 관리자페이지에 있는 자신의 가맹점번호  
	
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card', //생략 가능
	    merchant_uid: "reservation_" + new Date().getTime(), // 아임포트 관리자페이지의 결제내역 목록에서 각 건마다 붙는 등록번호같은것
	    name : '<%=car.getCarName()%>',   
	    amount : <%=price%>,
	    buyer_name : '<%=loginMember.getMemberId()%>',
	    buyer_tel : '<%=loginMember.getPhone()%>', 
	    /* buyer_email : 'iamport@siot.do', */
	    /* buyer_addr : '서울특별시 강남구 삼성동', */
	    /* buyer_postcode : '123-456' */
	}, function(rsp) { // callback 로직
			if(rsp.success) {
				// jQuery로 HTTP 요청
				$.ajax({
				    url: "<%=request.getContextPath()%>/reservation/makeReservation",
				    method: "GET",
				    data: {
				        /* imp_uid: rsp.imp_uid,
				        merchant_uid: rsp.merchant_uid */
				        //기타 필요한 데이터가 있으면 추가 전달
				        member_id : "<%=loginMember.getMemberId()%>",
				        car_code : "<%=car.getCarCode()%>",
				        car_name : "<%=car.getCarName()%>",
				        start_date: "<%=startDate%>",
				        end_date: "<%=endDate%>",
				        price: <%=price%>
				    },
				    success(data){
				    	location.href="<%=request.getContextPath()%>/reservation/complete";
				    }
				}).done(function (data) {
				  // 가맹점 서버 결제 API 성공시 로직
				})
			} else {
				var msg = "결제에 실패하였습니다.";				
				console.log(msg);
			}
	});
}


<%-- 카카오페이는 구매자정보 입력란에 <%= %> 이게 안먹혀서 일단 보류 --%>
<%-- function requestPay() {
	var IMP = window.IMP;        // 계속 requestPay is undefined라고 떠서 시간을 한참 날렸는데, 이 두줄도 같이 function 안에 넣어줘야하는거였다.
	IMP.init("imp94728784");     
	
	IMP.request_pay({
	    pg : 'kakaopay',
	    pay_method : 'card', //생략 가능
	    merchant_uid: "reservation_" + new Date().getTime(), // 상점에서 관리하는 주문 번호
	    name : '<%= car.getCarName() %>',
	    amount : <%= price %>,
	    /* buyer_email : 'iamport@siot.do', */
	    buyer_name : '<%= loginMember.getMemberId() %>',
	    buyer_tel : '010-1234-5678', 
	    /* buyer_addr : '서울특별시 강남구 삼성동', */
	    /* buyer_postcode : '123-456' */
	}, function(rsp) { // callback 로직
			if(rsp.success) {
				var msg = "결제가 완료되었습니다.";
				console.log(msg);
			} else {
				var msg = "결제에 실패하였습니다.";				
				console.log(msg);
			}
	});
} --%>

</script>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>