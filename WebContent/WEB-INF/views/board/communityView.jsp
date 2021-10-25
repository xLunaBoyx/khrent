<%@page import="com.kh.semi.board.model.vo.CommunityBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
#container{
	width:1410px;
}

table{
	border-top:1px solid #4343436b;
	border-bottom:1px solid #4343436b;
	
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
	width:1410px;		   
}


tr, td{
	border-top:1px solid #4343436b;
 	solid #69666a63;
    text-align: center;
    color: black;
    font-size: 15px;
    line-height: 58px;
}

#content{text-align:left}

#comment-container{
	text-align:center;
}
#btn-insert{
 
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	CommunityBoard communityBoard = (CommunityBoard)request.getAttribute("communityBoard");
%>
	<table>
		<thead>
			<tr><th colspan = "4"><%=communityBoard.getTitle()%></th></tr>
		</thead>
		<tbody>
			<tr>
				<td> 작성자 : <%=communityBoard.getWriter() %></td>
				<td> 작성일 : <%=communityBoard.getRegDate()%></td>
				<td> 조회수 : <%=communityBoard.getReadCount() %></td>
				<td> 댓글 : <%=communityBoard.getBoardCommentCount() %></td>
			</tr>
			<tr><td colspan = "4" id="content"><%=communityBoard.getContent()%></td></tr>
		</tbody>
		<tfoot>
			<tr><td colspan = "4">댓글</td></tr>
		</tfoot>
	</table>
	<br />
	<div id=comment-container>
		<div class="comment-editor">
			<form 
				action="<%= request.getContextPath() %>/board/boardCommentEnroll" 
				name="boardCommentFrm" 
				method="POST">
				<textarea name="content" cols="60" rows="3"></textarea>
				<button id="btn-insert">등록</button>
				
				<input type="hidden" name="commentLevel" value="1" />
				<input type="hidden" name="writer" value="" />
				<input type="hidden" name="boardNo" value="" />
				<input type="hidden" name="commentRef" value="0" />
			</form>
		</div>
	</div>
	

		

</body>
</html>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>




