<%@page import="com.kh.semi.board.model.vo.CommunityBoard"%>
<%@page import="com.kh.semi.board.model.vo.Attachment"%>
<%@page import="com.kh.semi.board.model.vo.NoticeBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.semi.board.model.vo.QuestionBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/style.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/boardForm.css" />

<%
	CommunityBoard communityBoard = (CommunityBoard) request.getAttribute("communityBoard");
%>

<div class="wrap clearfix" style="width: 1417px; margin:auto;">

<section id="board-container">

<h1 class="board-title">커뮤니티</h1>

<form 
	name="boardUpdateFrm" 
	action="<%=request.getContextPath() %>/board/communityBoardUpdate"
	enctype="multipart/form-data" 
	method="post" id="boardEnrollFrm">
	<input type="hidden" name="no" value="<%= communityBoard.getNo() %>" />
	<table id="tbl-board-view">
		<tr>
			<th>제 목</th>
			<td><input id="title" type="text" name="title" value="<%= communityBoard.getTitle() %>" required></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				<input id="writer" type="text" name="writer" value="<%= communityBoard.getWriter() %>" readonly/>
			</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<div class="filebox">
				<input type="file" name="upFile" id="ex_file">
<%
	Attachment attach = communityBoard.getAttach();
	if(attach != null) {
%>		
					<span id="fname"><%= attach.getOriginalFilename() %></span>
					<input type="checkbox" name="delFile" id="delFile" value="<%= attach.getNo() %>" />
					<label id="gizon" for="delFile">기존파일삭제</label>
<%
	}
%>
				</div>
			</td>
		</tr>
		<tr>
			<th>내 용</th>
			<td><textarea id="textarea" rows="5" cols="40" name="content"><%= communityBoard.getContent()%></textarea></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" value="취소" onclick="history.go(-1);" class="cancelBtn"/>
				<input type="submit" value="수정하기" class="writeBtn"/>
			</th>
		</tr>
	</table>
</form>
</section>
</div>
<script>
// 첨부파일 관련
<% if(attach != null) { %>
$("[name=upFile]").change(e => {
	// 파일 선택여부
	const $file = $(e.target);
	console.log($file);
	console.log($file.val());
	
	if($file.val() != "") {
		// 파일을 새로 선택한 경우
		$(fname).hide();
		$(delFile)
			.prop("checked", true)
			.hide()
			.next()
			.hide();
	}
	else {
		// 파일선택을 취소한 경우
		$(fname).show();
		$(delFile)
			.prop("checked", false)
			.show()
			.next()
			.show();
	}
});
<% } %>

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