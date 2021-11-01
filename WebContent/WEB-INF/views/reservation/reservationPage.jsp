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

<!-- 아임포트 삽입 스크립트. header.jsp에 제이쿼리 삽입 코드가 있으므로 아래의 코드는 주석처리 -->
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<%
	Car car = (Car) request.getAttribute("car");
	String startDate = (String) request.getAttribute("start_date");
	String endDate = (String) request.getAttribute("end_date");
	int price = (int) request.getAttribute("price");
	
	DecimalFormat df = new DecimalFormat("###,###");
%> 
<style>
.reservationContainer {
	display: flex;
	
}
.carData {
	margin: 0 auto;
}
#map2 {
	width: 450px;
	height: 450px;
}
.upperBox {
	display: flex;
	margin: 0 auto;
}
.upperBox-right { 
	width: 450px;
	height: 570px;
	border: 1px solid;
}
.locationDesc {
	margin-top: 20px;
	text-align: center;
	font-size: 1.2em;
}
.carData {
	display: flex;
	margin: 20px 50px 10px 0;
    width: 900px;
}
.option01>li {
	float: left;
}
.carImage-showReview {
	margin-top: 90px;
	display: flex;
	flex-direction: column;
}
#reviewButton {
    width: 200px;
    height: 50px;
    text-align: center;
    margin: 10px auto 0;
}

</style>
<div class="reservationContainer">
	<div class="upperBox">
		<div class="upperBox-left">
			<div class="carData">
				<div class="carImage-showReview">
					<img src="<%= request.getContextPath() %>/upload/car/<%= car.getImg() %>" width="450px;" alt="" />
					<input type="button" id="reviewButton" value="리뷰보기"/>
				</div>
				<div class="text">
					<p style="font-size: 2em">&nbsp;&nbsp;&nbsp;&nbsp;<%= car.getCarName() %></p>
					<ul class="option01 clearfix">
						<li><%= car.getFuel() %> &nbsp;|&nbsp;&nbsp;</li>
						<li><%= car.getReleaseYear() %> &nbsp;|&nbsp;&nbsp;</li>
						<li><%= car.getMaker() %></li>
					</ul>
					<br />
					<ul class="option02 clearfix">
						<li><%= car.getCarOption() %></li>
						<br /><br />
						<li>! KH렌트의 모든 차량은 종합보험에 가입되어 있습니다.</li>
						<li>&nbsp;대인:무한 대물: 30,000,000원 자손: 15,000,000원</li>
						<br /><br />
						<li>!자차보험은 고객 선택사항이니, 아래에서 선택해주세요.</li>
					</ul>
					<%-- <p>대여기간 : <%= startDate %> ~ <%= endDate %></p>
					<p>총 결제금액은 <%= df.format(price) %>원 입니다.</p> --%>
				</div>
			</div>
			.	
		</div>
		<div class="upperBox-right">
			<div id="map2"></div>
			<div class="locationDesc">
				<strong>KH렌트 (서울 강남구)</strong>
				<p>평일 09:00 ~ 21:00 / 주말, 공휴일 09:00 ~ 20:00</p>
			</div>
		</div>
	</div>
	<br /><hr /><br />
	<div class="lowerBox">
		<div class="notice">
			<p>유의사항</p>
			
		</div>
	</div>
</div>

<script>
// 지도
var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
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
	    name : '<%= car.getCarName() %>',   
	    amount : <%= price %>,
	    buyer_name : '<%= loginMember.getMemberId() %>',
	    buyer_tel : '<%= loginMember.getPhone() %>', 
	    /* buyer_email : 'iamport@siot.do', */
	    /* buyer_addr : '서울특별시 강남구 삼성동', */
	    /* buyer_postcode : '123-456' */
	}, function(rsp) { // callback 로직
			if(rsp.success) {
				// jQuery로 HTTP 요청
				$.ajax({
				    url: "<%= request.getContextPath() %>/reservation/makeReservation",
				    method: "GET",
				    data: {
				        /* imp_uid: rsp.imp_uid,
				        merchant_uid: rsp.merchant_uid */
				        //기타 필요한 데이터가 있으면 추가 전달
				        member_id : "<%= loginMember.getMemberId() %>",
				        car_code : "<%= car.getCarCode() %>",
				        car_name : "<%= car.getCarName() %>",
				        start_date: "<%= startDate %>",
				        end_date: "<%= endDate %>",
				        price: <%= price %>
				    },
				    success(data){
				    	location.href="<%= request.getContextPath() %>/reservation/complete";
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