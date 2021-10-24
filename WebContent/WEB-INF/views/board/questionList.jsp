<%@page import="java.util.List"%>
<%@page import="com.kh.semi.board.model.vo.QuestionBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/style.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/termsAndConditions.css" />
<%
	List<QuestionBoard> list = (List<QuestionBoard>) request.getAttribute("list");
%>
<div class="wrap clearfix" style="width: 70%; margin:auto;">
<%@ include file="/WEB-INF/views/board/customerCenterNav.jsp" %>
	<div class="board-container">
	
	<h1 class="board-title">대여문의</h1>
	<!-- <div class="board-box"> -->
		<table id="tbl-board">
			<thead>
				<tr>
					<th style="width:30px;">번호</th>
					<th>제목</th>
					<th>답변상태</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
<%
	for(QuestionBoard board : list) {
%>
				<tr>
		       		<td><%= board.getNo() %></td>
		       		<td class="subject">
		       			<a href="<%= request.getContextPath() %>/board/boardView?no=<%= board.getNo() %>"><%= board.getQna_title() %></a>
		       			<!-- 글제목 오른쪽에 댓글수를 표시함 -->
		       			<%= board.getBoardCommentCount() != 0 ? "(" + board.getBoardCommentCount() + ")" : "" %>
		       		</td>
		       		<td><%=board.getAnswer_status() %></td>
		       		<td><%= board.getWriter() %></td>
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