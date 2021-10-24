<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/memberDelete.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/myPageMenu.css" />

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>

<div class="delete_wrap">
	<div class="wrap clearfix">

		<%@ include file="/WEB-INF/views/member/memberPageMenu.jsp"%>


		<div class="pop_header">
			<strong>회원탈퇴 <br />
			<p class="deleteNotice">비밀번호 입력이 완료되면, 탈퇴가 진행됩니다.</p>
			</strong>

		</div>

		<div class="pop_cont">
			<form name="memberDelFrm" id="memberDelFrm" method="POST"
				action="<%=request.getContextPath()%>/member/memberDelete">

				<div class="inputWrap">
					<ul>
						<input type="hidden" name="memberId" value="<%= loginMember.getMemberId() %>" />
						<li>
						<label for="name">현재 비밀번호</label> 
						<input type="password" placeholder="" name="password" id="password" required>
						</li>						
					</ul>
				</div>
				<div class="pop_footer">
					<input type="submit" value="탈퇴" class="deletePwdBtn" onclick="deleteMember();" />
				</div>
			</form>
		</div>
	</div>
</div>

<script>


<% 
String msg = (String) session.getAttribute("msg");
if(msg != null) session.removeAttribute("msg");

%>

<% if(msg != null) { %>
// 사용자 메세지 전달
alert("<%= msg %>");
<% } %>

$("[name=memberDelFrm]").submit(function() {
	
	if(!passwordValidate()){
		return false;
	}
	return true;
)};


function passwordValidate() {
	var $password = $("#password");

	if ($password.val() != <%= loginMember.getPassword() %>) {
		alert("입력한 비밀번호가 일치하지 않습니다.");
		return false;
	}
	return true;
}

<%@ include file="/WEB-INF/views/common/footer.jsp"%>