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

<h1>임시 결제페이지</h1>
<%
	Car car = (Car) request.getAttribute("car");
	String startDate = (String) request.getAttribute("start_date");
	String endDate = (String) request.getAttribute("end_date");
	int price = (int) request.getAttribute("price");
	
	DecimalFormat df = new DecimalFormat("###,###");
%> 
 

<div class="carData">
	<img src="<%= request.getContextPath() %>/upload/car/<%= car.getImg() %>" width="450px;" alt="" />
	<div class="text">
		<p style="font-size: 2em"><%= car.getCarName() %></p>
		<p>대여기간 : <%= startDate %> ~ <%= endDate %></p>
		<p>총 결제금액은 <%= df.format(price) %>원 입니다.</p>
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
			<!-- <input type="button" value="결제하기(카카오페이)" onclick="requestPay()"/> -->
			<input type="button" value="결제하기(이니시스)" onclick="inicisPay()"/>			
			<%-- <input type="button" value="결제하기" onclick="location.href='<%= request.getContextPath() %>/reservation/makeReservation?start_date=<%= startDate %>&end_date=<%= endDate %>&car_code=<%= car.getCarCode() %>&price=<%= price %>';"/> --%>
		</form>
	</div>
</div>

<script>
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