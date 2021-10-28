<%@page import="java.util.List"%>
<%@page import="com.kh.semi.board.model.vo.CommunityBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>

<%
	List<CommunityBoard> list = (List<CommunityBoard>) request.getAttribute("list");
	String msg = (String)session.getAttribute("msg");
	
	// 그냥 두면 페이지 새로 띄울때마다 alert 메시지가 계속 뜨기 때문에, 한번만 할 수 있도록 메시지 띄우고 나면 msg가 삭제되도록 한다.
		if(msg != null) session.removeAttribute("msg");
%>
<script>
	<% if(msg != null) { %>
	// 사용자 메시지 전달
	alert("<%= msg %>");
	<% } %>
</script>
	<div class="board-container">
	<h1 class="board-title">커뮤니티</h1>
	<% if(loginMember != null) { %>
	<div id="writing-container" >
		<input type="button" value="글쓰기" id="writing"
		id="btn-add" 
		onclick="location.href='<%= request.getContextPath() %>/board/commentBoardForm';" />
	</div>
	<% } %>
	<!-- <div class="board-box"> -->
		<table id="tbl-board">
			<thead>
				<tr> 
					<th width="10%">번호</th>
					<th>제목</th>
					<th>첨부파일</th>
					<th width="5%">작성자</th>
					<th width="15%">작성일</th>
					<th width="5%">조회수</th>
				</tr>
			</thead>
			<tbody>
<%
	for(CommunityBoard board : list) {
%>
				<tr>
		       		<td><%= board.getNo() %></td>
		       		<td class="subject">
		       			<a href="<%= request.getContextPath() %>/board/boardView?no=<%= board.getNo() %>"><%= board.getTitle() %></a>
		       			<!-- 글제목 오른쪽에 댓글수를 표시함 -->
		       			<%= board.getBoardCommentCount() != 0 ? "(" + board.getBoardCommentCount() + ")" : "" %>
		       		</td>
		       		<td>
<% 
		if(board.getAttach() != null){
%>
				<img src="<%= request.getContextPath() %>/images/file.png" alt="" width="16px"/>			
<%
		}
%>			       		
		       		</td>
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
		width: 1200px;
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
		width: 55%;
		text-align: left;
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
	
	/* 글쓰기 스타일  */
	#writing-container{
		width:1200px;
		text-align: end;
		margin-bottom: 15px;
	}
	#writing{
		width: 100px;
   		height: 26px;
    	line-height: 26px;
    	background-color: #d1d1d1;
    	border: 1px solid black;
	    text-align: center;
	    color: #000 !important;
	    font-size: 12px;
	}
	
	
	</style>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>