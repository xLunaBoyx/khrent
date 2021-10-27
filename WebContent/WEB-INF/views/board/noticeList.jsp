<%@page import="com.kh.semi.board.model.vo.NoticeBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.semi.board.model.vo.QuestionBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/style.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/termsAndConditions.css" />
<%
	List<NoticeBoard> list = (List<NoticeBoard>) request.getAttribute("list");

	String msg = (String) session.getAttribute("msg");
	// System.out.println("msg@header.jsp = " + msg);
	if(msg != null) session.removeAttribute("msg");
%>

<script>
<% if(msg != null) { %>
    alert("<%= msg %>");
<% } %>
</script>

<div class="wrap clearfix" style="width: 1417px; margin:auto;">
<%@ include file="/WEB-INF/views/board/customerCenterNav.jsp" %>


	<div class="board-container">
	
	<h1 class="board-title">공지사항</h1>
<% if(loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())){ %>	
	<input 
		type="button" 
		value="글쓰기" 
		id="btn-add" 
		onclick="location.href='<%= request.getContextPath() %>/board/noticeBoardForm';" />
<% } %>
	<!-- <div class="board-box"> -->
		<table id="tbl-board">
			<thead>
				<tr>
					<th style="width:30px;">번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
<%
	for(NoticeBoard board : list) {
%>
				<tr>
		       		<td><%= board.getNoticeNo() %></td>
		       		<td class="subject">
		       			<a href="<%= request.getContextPath() %>/board/noticeView?no=<%= board.getNoticeNo() %>"><%= board.getNoticeTitle() %></a>
		       		</td>
		       		<td><%= board.getRegDate() %></td>
		       		<td><%= board.getReadCount() %></td>
       			</tr>
<%
	}
%>       							
			</tbody>
		</table>
		
		<div id='pageBar'>
			<%= request.getAttribute("pagebar") %>
		</div>
	
</div>
	<!-- </div> -->
	
	<style>
	.board-title {
		position: relative;
		font-size: 3em;
	}
	.board-container {
		display: flex;
		flex-direction: column;
		height: 1000px;
		margin: 0 auto;
		background-color: white;
		align-items: center;
	}
	
	table {
		width: 1057px;
		border-collapse: collapse;
		
	}
	th {
	    border-top: 1px solid #989898;
    	border-bottom: 1px solid #e3e3e3;
		text-align: center;
		color: #434343;
		font-size: 15px;
		font-weight: 500;
		line-height: 66px;
		height: 66px;
	}
	#btn-add {
		width: 100px;
    	background-color: #d1d1d1;
    	margin: 10px 0px 10px 938px;
	}
	td {
	    border-bottom: 1px solid #e3e3e3;
	    text-align: center;
	    color: #434343;
	    font-size: 15px;
	    line-height: 58px;
	}
	.subject {
		width: 70%;
		text-align: left;
		padding-left: 44px;
	}
	#pagebar {
	    clear: both;
	    text-align: center;
	    margin: 20px 0;
	}
	.cPage {
	    display: inline-block;
	    background: #ff9826;
	    border: 1px solid #ff9826;
	    color: #fff;
	    font-weight: normal;
	    width: 27px;
	    vertical-align: middle;
	}
	#pagebar a {
		background: #fff;
	    text-decoration: none;
	    display: inline-block;
	    min-width: 27px;
	    height: 27px;
	    border: 1px solid #e3e3e3;
	    padding: 0;
	    height: 27px;
	    color: #414141;
	    font-size: 14px;
	    letter-spacing: 0;
	    line-height: 27px;
	    vertical-align: middle;
	}
	</style>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>