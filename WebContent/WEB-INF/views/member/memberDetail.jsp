<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/memberDetail.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/myPageMenu.css" />

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>

<section id="content" style="height: 1200px;">
<div class="detail_wrap">
	<div class="wrap clearfix" style="display: flex;">

		<!-- 공통 메뉴 -->
		<%@ include file="/WEB-INF/views/member/memberPageMenu.jsp"%>

		<div class="mypageCont">
			<strong class="tit01">내 정보</strong>
			<div class="mypageDesc2">
				<div class="topArea clearfix">
					<strong class="tit04 clearfix"> 기본정보 </strong>
				</div>
				
				<dl>
					<dt>이름</dt>
					<dd><%= loginMember.getMemberName() %></dd>
				</dl>
				
				<dl>
					<dt>비밀번호</dt>
					<dd>
						<span
							class="input-text-outer-wrap is-login-text have-right-section">
							<span class="is-text-inner-wrap is-login-text"> 
							<input type="password" data-text-module="" readonly="">
							</span> 
						<span class="input-text-outer-wrap__right-section"> 
						<a href="<%= request.getContextPath() %>/member/updatePassword" class="btn-pwd-pop">변경</a>
						</span>
						</span>
					</dd>
				</dl>
				
				<dl>
					<dt>휴대폰번호</dt>
					<dd>
						<form name="frmCpModify" id="frmCpModify" method="post">
							<input type="hidden" name="_token"
								value="KUIlaf6wzIPUNwYBCLiUCeU6b3f4PE3MxFgJp2O0"> 
								<span class="input-text-outer-wrap is-login-text have-right-section">
								<span class="is-text-inner-wrap is-login-text"> 
								<input type="text" name="cp" id="cp" value="<%= loginMember.getPhone() %>"
									data-text-module="" readonly="">
								</span> 
								<span class="input-text-outer-wrap__right-section"> 
								<a href="#" class="btn-cp-modify">변경</a>
								</span>
								</span>
							</form>
					</dd>
				</dl>
			</div>

			<div class="mypageDesc2 license active">
				<div class="topArea clearfix">
					<strong class="tit04 clearfix"> 운전면허 정보 </strong>
				</div>
				<p>등록된 면허 정보가 없습니다.</p>
				<div class="btnGroup">
					<a href="#" class="infoBtn btn-license">면허정보 등록</a>
				</div>
			</div>

			<div class="mypageDesc2 license">
				<div class="topArea clearfix">
					<strong class="tit04 clearfix"> 운전면허 정보 </strong>
				</div>

				<dl>
					<dt class="license-title">면허 종류</dt>
					<dd class="license-content"></dd>
				</dl>

				<dl>
					<dt>면허 번호</dt>
					<dd class="license-nums"></dd>
				</dl>
				<dl>
					<dt>적성검사 만료일</dt>
					<dd class="license-date1"></dd>
				</dl>
				<dl>
					<dt>면허 발급일(갱신일)</dt>
					<dd class="license-date2"></dd>
				</dl>
			</div>

			<div class="mypageDesc2">
				<div class="topArea clearfix">
					<strong class="tit04 clearfix"> 회원탈퇴 </strong>
				</div>
				<p>
					KH렌트 이용에 불편하신 점이 있으셨다면, 탈퇴 전 고객센터로 문의 주시면 답변 드리겠습니다. <br>
				</p>
				<div class="btnGroup">
					<a href="#" class="infoBtn">회원탈퇴</a>
				</div>
			</div>
		</div>
	</div>
</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>