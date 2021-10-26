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
	NoticeBoard noticeBoard = (NoticeBoard) request.getAttribute("noticeBoard");
%>
<section id="board-container">
<h2>게시판 수정</h2>
<form 
	name="boardUpdateFrm" 
	action="<%=request.getContextPath() %>/board/noticeBoardUpdate"
	method="post">
	<input type="hidden" name="no" value="<%= noticeBoard.getNoticeNo() %>" />
	<table id="tbl-board-view">
		<tr>
			<th>제 목</th>
			<td><input type="text" name="title" value="<%= noticeBoard.getNoticeTitle() %>" required></td>
		</tr>
		<tr>
			<th>내 용</th>
			<td><textarea rows="5" cols="40" name="content"><%= noticeBoard.getNoticeContent() %></textarea></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="수정하기"/>
				<input type="button" value="취소" onclick="history.go(-1);"/>
			</th>
		</tr>
	</table>
</form>
</section>
<script>

$(document.boardUpdateFrm).submit(function (){
	const $title = $("[name=title]");
	const $content = $("[name=content]");
	//제목을 작성하지 않은 경우 폼제출할 수 없음.
	if(!/^.+$/.test($title.val())){
		alert("제목을 입력하세요.");
		return false;
	}
					   
	//내용을 작성하지 않은 경우 폼제출할 수 없음.
	// .(임의의 문자)에는 \n(개행문자)가 포함되지 않는다.
	if(!/^(.|\n)+$/.test($content.val())){
		alert("내용을 입력하세요.");
		return false;
	}
	return true;
});


</script>
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
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
