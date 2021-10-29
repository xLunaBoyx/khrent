<%@page import="java.util.List"%>
<%@page import="com.kh.semi.board.model.vo.QuestionBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/style.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/customerCenterNav.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/board.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/question.css" />
<%
	List<QuestionBoard> list = (List<QuestionBoard>) request.getAttribute("list");
	
	String msg = (String) session.getAttribute("msg");
	
	// 그냥 두면 페이지 새로 띄울때마다 alert 메시지가 계속 뜨기 때문에, 한번만 할 수 있도록 메시지 띄우고 나면 msg가 삭제되도록 한다.
	if(msg != null) session.removeAttribute("msg");
%>

<script>
<% if(msg != null) { %>
	// 사용자 메시지 전달
	alert("<%= msg %>");
<% } %>
</script>

<div class="wrap clearfix" style="width: 1417px; margin:auto;">
<%@ include file="/WEB-INF/views/board/customerCenterNav.jsp" %>

	<div class="board-container">
	
	<h1 class="board-title">대여문의</h1>
	
<% if(loginMember != null){ %>	
	<input 
		type="button" 
		value="글쓰기" 
		id="btn-add" 
		onclick="location.href='<%= request.getContextPath() %>/board/questionBoardForm';" />
<% } %>

		<table id="tbl-board">
			<thead>
				<tr class="board-tr">
					<th style="width: 30px;">번호</th>
					<th >제목</th>
					<th style="width: 70px;">답변상태</th>
					<th style="width: 70px;">작성자</th>
					<th>작성일</th>
					<th style="width: 30px;">첨부파일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
<%
	for(QuestionBoard board : list) {
%>
				<tr class="board-tr">
		       		<td><%= board.getNo() %></td>
		       		<td class="subject">
		       			<a href="<%= request.getContextPath() %>/board/questionView?no=<%= board.getNo() %>"><%= board.getQna_title() %></a>
		       			<!-- 글제목 오른쪽에 댓글수를 표시함 -->
		       			<%= board.getBoardCommentCount() != 0 ? "(" + board.getBoardCommentCount() + ")" : "" %>
		       		</td>
		       		<td><%=board.getAnswer_status() %></td>
		       		<td><%= board.getWriter() %></td>
		       		<td><%= board.getRegDate() %></td>
		       		<td>
<% 
		if(board.getAttach() != null){
%>
				<img src="<%= request.getContextPath() %>/images/file.png" alt="" width="16px"/>			
<%
		}
%>		
		       		</td>
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
	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>