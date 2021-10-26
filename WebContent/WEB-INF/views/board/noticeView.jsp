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
%>
<div class="wrap clearfix" style="width: 70%; margin:auto;">
<%@ include file="/WEB-INF/views/board/customerCenterNav.jsp" %>
<%
	NoticeBoard noticeBoard = (NoticeBoard)request.getAttribute("noticeBoard");
%>
	<div class="board-container">
		<table id="tbl-board">
			<thead>
			<tr style="border-top: 1px solid black;"><th colspan = "4"><%= noticeBoard.getNoticeTitle()%></th></tr>
		</thead>
		<tbody>
			<tr style="border-top: 1px solid black;">
				<td> 작성일 : <%= noticeBoard.getRegDate()%></td>
				<td> 조회수 : <%= noticeBoard.getReadCount() %></td>
			</tr>
			<tr><td colspan = "4" id="content"><%= noticeBoard.getNoticeContent()%></td></tr>
		</tbody>
		</table>
		
		<br />
	
</div> <!-- </div> .board-container -->
	
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
	    margin-top: 84px;
	}
	th {
	    border-top: 1px solid #989898;
    	border-bottom: 1px solid #e3e3e3;
		text-align: center;
		color: #434343;
		font-size: 30px;
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
        width: 40px;
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