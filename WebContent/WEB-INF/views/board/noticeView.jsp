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

<div class="wrap clearfix" style="width: 1417px; margin:auto;">

<%@ include file="/WEB-INF/views/board/customerCenterNav.jsp" %>

<%
	NoticeBoard noticeBoard = (NoticeBoard)request.getAttribute("noticeBoard");
	boolean editable = loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole());
	//System.out.println("ediatable@boardView.jsp = " + editable);
	
	String msg = (String) session.getAttribute("msg");
	// System.out.println("msg@header.jsp = " + msg);
	if(msg != null) session.removeAttribute("msg");
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
			<tr>
				<td colspan = "4" id="content"><%= noticeBoard.getNoticeContent()%></td>
			</tr>
<% 	if(editable){ %>
			<tr>
				<%-- 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 --%>
				<th colspan="2">
					<input type="button" value="수정하기" onclick="updateBoard()">
					<input type="button" value="삭제하기" onclick="deleteBoard()">
				</th>
			</tr>
<% 	} %>	
		</tbody>
		</table>
		
		<br />
	
</div> <!-- </div> .board-container -->
<% if(editable){ %>
<form action="<%= request.getContextPath() %>/board/noticeBoardDelete" name="deleteBoardFrm">
	<input type="hidden" name="no" value="<%= noticeBoard.getNoticeNo() %>" />
</form>
<script>
const updateBoard = 
() => location.href = "<%= request.getContextPath() %>/board/noticeBoardUpdate?no=<%= noticeBoard.getNoticeNo() %>";
/**
 * 삭제할 때 저장된 첨부파일이 있다면, 파일삭제!
 * - java.io.File API참조
 */
const deleteBoard = () => {
	if(confirm("정말 이 게시물을 삭제하시겠습니까?")){
		$(document.deleteBoardFrm).submit();
	}
};

<% if(msg != null) { %>
alert("<%= msg %>");
<% } %>


</script>
<% } %>

	<style>
	.board-title {
		position: relative;
		font-size: 3em;
	}
	.board-container {
		display: flex;
		flex-direction: column;
		height: 1070px;
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
	td{
	    border-bottom: 1px solid #e3e3e3;
	    text-align: center;
	    color: #434343;
	    font-size: 15px;
	    line-height: 36px;
        width: 40px;
	}
	
	td#content {
		border-bottom: 1px solid #e3e3e3;
	    text-align: left;
	    color: #434343;
	    font-size: 15px;
	    line-height: 85px;
        width: 40px;
        height: auto;	
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