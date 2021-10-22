<%@page import="com.kh.semi.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/login_enroll.css" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<%
HttpSession session2 = request.getSession();
System.out.println(session2.getId());
%>
	<div class="login_wrap">
			<strong class="tit01" style="margin-bottom:25px;">로그인</strong>
			<div class="login_box clearfix" >
				<form id="loginFrm" class="ajax-form" action="<%= request.getContextPath() %>/member/login" method="POST">

					<span class="input-text-outer-wrap is-login-text">
						<span class="is-text-inner-wrap">
							<input placeholder="아이디를 입력해 주세요" name="memberId" id="memberId" type="text">
						</span>
					</span>
					<span class="input-text-outer-wrap is-login-text">
						<span class="is-text-inner-wrap">
							<input placeholder="비밀번호를 입력해 주세요" name="password" id="password" type="password" > 
						</span>
					</span>
					<div class="inp_chk_wrap">
					<span class="check-box have-text">
						<input type="checkbox" name="saveId" id="saveId">
						<label for="remember">자동로그인</label>
					</span>
					</div>
					<input type="submit" value="로그인" class="btn btn-l btn-color-type07 btn-login" />
				</form>
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

$(() => {
	
	/**
	* loginFrm 유효성 검사
	*/
	
	$(document.loginFrm).submit(e => {
		const $memberId = $(memberId);
		const $password = $(password);
		// memberId 체크
		if(!/^.{4,}$/.test($memberId.val())){
			alert("아이디를 입력하세요.");
			$memberId.select();
			e.preventDefault();
			return;
		}
		
		// password 체크
		if(!/^.{4,}$/.test($password.val())){
			alert("비밀번호를 입력하세요.");
			$password.select();
			e.preventDefault();
			return;
		}
	});

});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
