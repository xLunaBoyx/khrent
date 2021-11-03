<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/style.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/member/login_enroll.css" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>

 	<div class="login_wrap">
			<strong class="tit01" style="margin-bottom:25px;">아이디 찾기</strong>
			<div class="login_box clearfix" >
				<form id="findFrm" name="findFrm" class="ajax-form" action="<%= request.getContextPath() %>/member/memberFindId" method="POST">

					<span class="input-text-outer-wrap is-login-text">
						<span class="is-text-inner-wrap">
							<input placeholder="이름을 입력해 주세요" name="memberName" id="memberName" type="text">
						</span>
					</span>
					<span class="input-text-outer-wrap is-login-text">
						<span class="is-text-inner-wrap">
							<input placeholder="(- 없이) 휴대폰 번호를 입력해주세요" name="phone" id="phone" type="text" > 
						</span>
					</span>

					<input type="button" value="찾기" class="btn btn-l btn-color-type07 btn-login" onclick="id_search()" />
				</form>
					<input type="button" value="취소" class="btn btn-l btn-color-type07 btn-login" style="margin-top: 10px; background-color: #b3b3b3;" onclick="history.back()">
			</div>		
		</div>

<script>

function id_search() { 
	 	var frm = document.findFrm;

	 	if (frm.memberName.value.length < 1) {
		  alert("이름을 입력해주세요");
		  return;
		 }

		 if (frm.phone.value.length != 11) {
			  alert("휴대폰 번호를 정확하게 입력해주세요");
			  return;
		 }

	 frm.submit();  
	 }

</script>
	 
<%@ include file="/WEB-INF/views/common/footer.jsp"%>