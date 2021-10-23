<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/myPage.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/myPageMenu.css" />

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>

<div class="detail_wrap">
	<div class="wrap clearfix" style="width: 70%;">

<%@ include file="/WEB-INF/views/member/memberPageMenu.jsp"%>

		<div class="mypageCont">
			<strong class="tit01">예약내역</strong>
			<div class="sortBtn clearfix">
				<!-- 예약 기간에 따라 보여주게 할 거면 이 자리에 넣기 -->
			</div>

			<!-- 예약 Record 시작 -->
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>