<%@page import="com.kh.semi.board.model.vo.CommunityBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
	table{border:1px solid black;  border-collapse: collapse;}
	tr, td{border:1px solid black;}
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	CommunityBoard communityBoard = (CommunityBoard)request.getAttribute("communityBoard");
%>
	<table>
		<tr>
			<td>글 번호</td>
			<td><%= communityBoard.getNo()%></td>
		</tr>
		<tr>
			<td>글 제목</td>
			<td><%= communityBoard.getTitle()%></td>
		</tr>
		<tr>
			<td>글 작성자</td>
			<td><%= communityBoard.getWriter()%></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%= communityBoard.getRegDate()%></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%= communityBoard.getReadCount()%></td>
		</tr>
	</table>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>