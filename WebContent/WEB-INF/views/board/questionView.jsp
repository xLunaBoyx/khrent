<%@page import="com.kh.semi.board.model.vo.QuestionBoardComment"%>
<%@page import="com.kh.semi.board.model.vo.Attachment"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.semi.board.model.vo.QuestionBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/style.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/termsAndConditions.css" />
<%
	QuestionBoard questionBoard = (QuestionBoard)request.getAttribute("questionBoard");
	Attachment attachment = questionBoard.getAttach();
	System.out.println(attachment);
	boolean editable = loginMember != null && (questionBoard.getWriter().equals(loginMember.getMemberId()) || MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole()));
	
	List<QuestionBoardComment> commentList = (List<QuestionBoardComment>) request.getAttribute("commentList");
%>
<div class="wrap clearfix" style="width: 1417px; margin:auto;">
	<%@ include file="/WEB-INF/views/board/customerCenterNav.jsp" %>
	<div class="board-container">
		<table id="tbl-board">
			<thead>
				<tr><th colspan = "4"><%=questionBoard.getQna_title()%></th></tr>
			</thead>
			<tbody>
				<tr>
					<td> 작성자 : <%=questionBoard.getWriter() %></td>
					<td> 작성일 : <%=questionBoard.getRegDate()%></td>
					<td> 조회수 : <%=questionBoard.getReadCount() %></td>
					<td> 답변여부 : <%=questionBoard.getAnswer_status() %></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td colspan = "3">
<%
	if(attachment != null) {
%>			
				<%-- 첨부파일이 있을경우만, 이미지와 함께 original파일명 표시 --%>
				<!-- 숙제인줄 알고 했던 것. 첨부파일 주소를 적어서 첨부파일 제목 클릭시 첨부파일을 볼 수 있도록 했다. 아래 코드는 수업에서 한 다운로드 기능 <a href="<%= request.getContextPath() %>/upload/board/<%= attachment.getRenamedFilename() %>"><%= attachment.getOriginalFilename() %></a>  -->
				<img alt="첨부파일" src="<%= request.getContextPath() %>/images/file.png" width=16px>
				<a href="<%= request.getContextPath() %>/qnaboard/fileDownload?no=<%= attachment.getNo() %>"><%= attachment.getOriginalFilename() %></a>
<%
	}
%>							
					</td>
				</tr>
				
				<tr>
					<td colspan = "4" id="questionViewContent">
<%
	if(attachment != null) {
%>	
					<br />
					<img src="<%= request.getContextPath() %>/upload/board/<%= attachment.getRenamedFilename() %>" height="400px;" alt="" />
					<br />
<%
	}
%>	
				<%=questionBoard.getQna_content()%>
					</td>
				</tr>
			</tbody>
		</table>
		
		<br />
		
		<div class="buttons">
<%
	if(editable) {
%>		
		<%-- 작성자와 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 --%>
			<input type="button" value="수정하기" onclick="updateBoard()">
			<input type="button" value="삭제하기" onclick="deleteBoard()">
<%
	}
%>				
		</div>

		<br />
		
		<!-- 여기부터 댓글 -->
		
		<div class="comment-container">
<%
	if(editable) {
%>	
	<!-- 문의글 작성자와 관리자만 댓글작성 폼이 보인다. -->
			<div class="comment-editor">
				<form 
					action="<%= request.getContextPath() %>/board/qnaBoardCommentEnroll" 
					name="qnaBoardCommentFrm" 
					method="post">
					<textarea name="content" cols="60" rows="3"></textarea>
					<button id="btn-insert">등록</button>
					
					<input type="hidden" name="commentLevel" value="1" />
					<input type="hidden" name="writer" value="<%= loginMember != null ? loginMember.getMemberId() : "" %>" />
					<input type="hidden" name="boardNo" value="<%= questionBoard.getNo() %>" />
					<input type="hidden" name="commentRef" value="0" />
				</form>
			</div>
<%
	}
%>					
			
			<table id="tbl-comment">
<%
	if(commentList != null && !commentList.isEmpty()) {   // commentList가 있고, 내용도 있을 경우
		for(QuestionBoardComment bc : commentList) {
			if(bc.getCommentLevel() == 1) {
%>
				<%-- 댓글 --%>
				<tr class="level1">
					<td>
						<sub class="comment-writer"><%= bc.getWriter() %></sub>
						<sub class="comment-date"><%= bc.getRegDate() %></sub>
						<br />
						<%-- 댓글 내용 --%>
						<%= bc.getContent() %>
					</td>
					<td>
						<button class="btn-reply" value="<%= bc.getNo() %>">답글</button>
<%
				// 댓글 작성자와 관리자계정에게만 댓글삭제 버튼이 보인다.
				if(loginMember != null && (bc.getWriter().equals(loginMember.getMemberId()) || MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole()))) {
%>					
					<button class="btn-delete" value="<%= bc.getNo() %>">삭제</button>
<%
				}
%>					
					</td>
				</tr>

<% 				
			}
			else {
%>
				<%-- 대댓글 --%>
				<tr class="level2">
					<td>
						<sub class="comment-writer"><%= bc.getWriter() %></sub>
						<sub class="comment-date"><%= bc.getRegDate() %></sub>
						<br />
						<%-- 댓글 내용 --%>
						<%= bc.getContent() %>
					</td>
					<td>
<%
				//댓글 작성자와 관리자계정에게만 삭제 버튼이 보인다.
				if(loginMember != null && (bc.getWriter().equals(loginMember.getMemberId()) || MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole()))) {
%>				
					<button class="btn-delete" value="<%= bc.getNo() %>">삭제</button>
<%
				}
%>
					</td>
				</tr>

<%				
			}
		}
	}
%>		
			</table>
		
		</div>
		<!-- 댓글 삭제용 폼 -->
		<form 
			action="<%= request.getContextPath() %>/board/qnaBoardCommentDelete" 
			name="qnaBoardCommentDelFrm"
			method="POST">
			<input type="hidden" name="no" />
			<input type="hidden" name="boardNo" value="<%= questionBoard.getNo() %>"/>
		</form>
	
	</div> <!-- </div> .board-container -->
</div> <!-- </div> .wrap clearfix -->	
	
<script>
/* 대댓글 등록 버튼 */
$(".btn-reply").click((e) => {
	const commentRef = $(e.target).val();
	const tr = `<tr>
	<td colspan="2" style="text-align: left;">
		<form 
			action="<%= request.getContextPath() %>/board/qnaBoardCommentEnroll" 
			method="post">
			<textarea name="content" cols="60" rows="1"></textarea>
			<button class="btn-insert2">등록</button>
			
			<input type="hidden" name="commentLevel" value="2" />
			<input type="hidden" name="writer" value="<%= loginMember != null ? loginMember.getMemberId() : "" %>" />
			<input type="hidden" name="boardNo" value="<%= questionBoard.getNo() %>" />
			<input type="hidden" name="commentRef" value="\${commentRef}" />
		</form>
	</td>
</tr>`

	console.log(tr);
	console.log($(tr));
	
	const $trOfBtn = $(e.target).parent().parent();
	// $trOfBtn.after(tr);
	/* console.log($trOfBtn);  */
	/* console.log($(tr).find("form")); */ 
	$(tr)
		.insertAfter($trOfBtn)
		.find("form")   
		.submit((e) => {
<% 
	if(loginMember == null) { 
%>
			loginAlert();
			return false;
<% 
	} 
%>	

			// 내용검사
			const $textarea = $("[name=content]", e.target); 

			if(!/^(.|\n)+$/.test($textarea.val())) {
				alert("댓글 내용을 작성해주세요.");
				$textarea.focus();
				return false;
			}
		})
		.find("[name=content]")
		.focus();
		
	// 현재버튼의 handler 제거(그냥 두면 대댓글 버튼 클릭할때마다 입력폼이 계속 추가됨)
	$(e.target).off('click');
	
});


$(".btn-delete").click(function(){
	if(confirm("해당 댓글을 삭제하시겠습니까?")){
		var $frm = $(document.qnaBoardCommentDelFrm);
		var no = $(this).val();
		$frm.find("[name=no]").val(no);
		$frm.submit();
	}
});	


<!-- qnaBoardCommentFrm 아래의 [name=content]를 찾는다 -->
$("[name=content]", document.qnaBoardCommentFrm).focus(e => {
<% if(loginMember == null) { %>
	loginAlert();
<% } %>	
});


$(document.qnaBoardCommentFrm).submit((e) => {   
<% if(loginMember == null) { %>
	loginAlert();
	return false;
	
<% } %>	

	// 내용검사
	const $textarea = $("[name=content]", e.target); 

	if(!/^(.|\n)+$/.test($textarea.val())) {
		alert("댓글 내용을 작성해주세요.");
		$textarea.focus();
		return false;
	}
	
});

const loginAlert = () => {
	alert("로그인 후 이용 바랍니다.");
	$("#login").get(0).click();
}

</script>	
	
	
	
	
<style>
.buttons {
	position: relative;
	   right: -400px;
}
#questionViewContent {
	/* min-height: 400px; */
	min-height: 400px;
}
.board-title {
	position: relative;
	font-size: 3em;
}
.board-container {
	display: flex;
	flex-direction: column;
	margin: 0 auto;
	background-color: white;
	align-items: center;
}
table {
	width: 950px;
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


/*댓글등록버튼*/
div.comment-container button#btn-insert{width:60px; height:50px; color:white; background:#3300ff; position:relative; top:-20px;}

/*댓글테이블*/
table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse;} 
table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
table#tbl-comment button.btn-reply{display:none;}
table#tbl-comment tr:hover {background:lightgray;}
table#tbl-comment tr:hover button.btn-reply{display:inline;}
table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
table#tbl-comment sub.comment-date {color:tomato; font-size:10px}

table#tbl-comment tr.level2 {color:gray; font-size: 14px;}
table#tbl-comment tr.level2 td:first-of-type{padding-left:100px;}
table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}
table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}

/*답글관련*/
table#tbl-comment textarea{margin: 4px 0 0 0;}
table#tbl-comment button.btn-insert2{width:60px; height:23px; color:white; background:#3300ff; position:relative; top:-5px; left:10px;}

/* 삭제버튼관련 */
table#tbl-comment button.btn-delete{background:red; color:white; display:none;}
table#tbl-comment tr:hover button.btn-delete{display:inline;}

</style>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>