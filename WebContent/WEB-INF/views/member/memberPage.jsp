<%@page import="java.util.List"%>
<%@page import="com.kh.semi.reservation.model.vo.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/style.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/myPage.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/myPageMenu.css" />

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>

<%
	List<Reservation> list = (List<Reservation>) request.getAttribute("list");

	String msg = (String) session.getAttribute("msg");
	// System.out.println("msg@header.jsp = " + msg);
	if(msg != null) session.removeAttribute("msg");
%>

<div class="detail_wrap">
	<div class="wrap clearfix" style="width: 1417px; margin:auto;">

<%@ include file="/WEB-INF/views/member/memberPageMenu.jsp"%>

		<div class="mypageCont">
			<strong class="tit01">예약내역</strong>
			<div class="sortBtn clearfix">
				<!-- 예약 기간에 따라 보여주게 할 거면 이 자리에 넣기 -->
				<table id="tbl-board">
					<thead>
						<tr class="board-tr">
							<th style="width:90px;">예약번호</th>
							<th>차 등록번호</th>
							<th>차종</th>
							<th>예약 시작일</th>
							<th>예약 종료일</th>
							<th>이용후기 작성 여부</th>
							<th>차량 반납 여부</th>
						</tr>
					</thead>
					<tbody>
<%
	if(list != null) {
		for(Reservation reservation : list) {
%>
						<tr class="board-tr">
				       		<td><%= reservation.getReserNo() %></td>
				       		<td><%= reservation.getCarCode() %></td>
				       		<td><%= reservation.getCarName() %></td>
				       		<td><%= reservation.getStartDate() %></td>
				       		<td><%= reservation.getEndDate() %></td>
				       		<td><%= reservation.getReviewStatus() %></td>
				       		<td><%= reservation.getReturnStatus() %></td>
		       			</tr>
<%
		}
	}
%>       							
					</tbody>
				</table>
			</div>

			<!-- 예약 Record 시작 -->
		</div>
	</div>
</div>

<script>

<% if(msg != null) { %>
// 사용자 메세지 전달
alert("<%= msg %>");
<% } %>

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>