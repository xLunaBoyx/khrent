<%@page import="com.kh.semi.board.model.vo.NoticeBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.semi.board.model.vo.QuestionBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/style.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/customerCenterNav.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/noticeBoardUpdate.css" />

<%
	NoticeBoard noticeBoard = (NoticeBoard) request.getAttribute("noticeBoard");
%>
<div class="wrap clearfix" style="width: 1417px; margin:auto;">
	<%@ include file="/WEB-INF/views/board/customerCenterNav.jsp" %>
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
</div>
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
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
