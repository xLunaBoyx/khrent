<%@page import="java.util.List"%>
<%@page import="com.kh.semi.board.model.vo.CommunityBoardComment"%>
<%@page import="com.kh.semi.board.model.vo.CommunityBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/board.css" />
<!DOCTYPE html>
<html>
<head>
<style>
#content{
	display:flex;
	flex-direction:column;
	align-items: center;
	
}

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
	width:1400px;
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
	String msg = (String)session.getAttribute("msg");
	if(msg != null) session.removeAttribute("msg");
	List<CommunityBoardComment>commentList = (List<CommunityBoardComment>)request.getAttribute("list");
%>
<div id=comment-container>
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
	
		<div class="comment-editor">
			<form 
				action="<%= request.getContextPath() %>/board/communityBoardCommentEnroll" 
				name="communityBoardEnroll" 
				method="POST">
				<textarea name="content" cols="60" rows="3"></textarea>
				<button id="btn-insert">등록</button>
				
				<input type="hidden" name="commentLevel" value="1" />
				<input type="hidden" name="writer" value="<%=loginMember != null ? loginMember.getMemberId() : "" %>" />
				<input type="hidden" name="boardNo" value="<%=communityBoard.getNo() %>" />
				<input type="hidden" name="commentRef" value="0" />
			</form>
		</div>
		
		<table id="tbl-comment">
	<%
	if(commentList != null && !commentList.isEmpty()){
		for(CommunityBoardComment cb : commentList){
			if(cb.getCommentLevel() == 1){
	%>
			<%-- 댓글 --%>
			<tr class = "level1">
				<td>
					<sub class="comment-writer"><%=cb.getWriter() %></sub>
					<sub class="comment-date"><%=cb.getRegDate() %></sub>	
					<br />
					<%-- 댓글 내용 --%>
					<%= cb.getContent() %>			
				</td>
				<td>
					<button class="btn-reply" value="<%= cb.getNo() %>">답글</button>
				</td>
			</tr>
	
	<%
			}
			else{	
	%>
			<%-- 대댓글(답글) --%>
			<tr class="level2">
				<td>
					<sub class="comment-writer"><%= cb.getWriter() %></sub>
					<sub class="comment-date"><%= cb.getRegDate() %></sub>
					<br />
					<%-- 댓글 내용 --%>
					<%= cb.getContent() %>
				</td>
				<td></td>
			</tr>
	
	<%			
		}
	}
}
%>		

		</table>
		
	</div>
		
<script>

<% if(msg !=null){ %>
	alert("<%=msg%>");
<% } %>

$(document.communityBoardEnroll).submit((e) => {
	<% if(loginMember == null){%> 
		loginAlert();
		return false;
	<% } %>	
});

const loginAlert = () => {
	alert("로그인 후 이용 바랍니다.");
	$("#login").click();
}


// 대댓글
$(".btn-reply").click((e) => {
	const commentRef = $(e.target).val();
	const tr = `<tr>
	<td colspan="2" style="text-align: left;">
		<form 
			action="<%= request.getContextPath() %>/board/communityBoardCommentEnroll" 
			method="POST">
			<textarea name="content" cols="60" rows="1"></textarea>
			<button class="btn-insert2">등록</button>
			
			<input type="hidden" name="commentLevel" value="2" />
			<input type="hidden" name="writer" value="<%= loginMember != null ? loginMember.getMemberId() : "" %>" />
			<input type="hidden" name="boardNo" value="<%= communityBoard.getNo() %>" />
			<input type="hidden" name="commentRef" value="\${commentRef}" />	
		</form>
	</td>
</tr>`;
console.log(tr);
	
	const $trOfBtn = $(e.target).parent().parent();
	// $trOfBtn.after(tr);
	$(tr)
		.insertAfter($trOfBtn)
		.find("form")
		.submit((e) => {
<% if(loginMember == null){%> 
			loginAlert();
			return false;
<% } %>	
			// 내용검사
			// const textarea = $("[name=content]", document.boardCommentFrm);	
			const $textarea = $("[name=content]", e.target);	
			
			if(!/^(.|\n)+$/.test($textarea.val())){
				alert("댓글 내용을 작성해주세요.");
				$textarea.focus();
				return false;
			}
		})
		.find("[name=content]")
		.focus();
	
	// 현재버튼의 handler 제거
	$(e.target).off('click');
});




</script>

</body>
</html>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>




