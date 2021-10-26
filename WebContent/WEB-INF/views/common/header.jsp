<%@page import="com.kh.semi.member.model.service.MemberService"%>
<%@page import="com.kh.semi.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	Member loginMember = (Member) session.getAttribute("loginMember");
	// System.out.println("loginMember@header.jsp = " + loginMember);
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH렌트</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/style.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/header.css" />

<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
</head>

<body>
		 <nav>
		 <div class="header">
			 <h1 class="logo">
				 <a href="<%= request.getContextPath() %>">
				 <img src="https://i.ibb.co/4fPNmks/mark.png" alt="mark" class="mark"/>
				 </a>
			 </h1>
		 </div>
      <ul class="navUl">
        <li class="dropdown">
          <div class="dropdown-menu" onclick="location.href='<%= request.getContextPath() %>/reservation/carSearch';">예약하기</div>        
        </li>
        <li class="dropdown">
          <div class="dropdown-menu" onclick="location.href='<%= request.getContextPath() %>/board/rentalInformation';">대여안내</div>
        </li>
        <li class="dropdown">
          <div class="dropdown-menu" onclick="location.href='<%= request.getContextPath() %>/board/communityList';">커뮤니티</div>
        </li>
        <li class="dropdown">
          <div class="dropdown-menu">고객센터</div>
          <div class="dropdown-content">
 			<a href="<%= request.getContextPath() %>/board/faq">자주 묻는 질문</a>
            <a href="<%= request.getContextPath() %>/board/notice">공지사항</a>
            <a href="<%= request.getContextPath() %>/board/questionList">대여문의</a>
            <a href="#">대여후기</a>
            <a href="<%= request.getContextPath() %>/board/termsAndConditions">약관/정책</a>
            <a href="<%= request.getContextPath() %>/board/companyIntroduction">회사소개</a>

          </div>
        </li>
		<%-- 관리자 보임 | 로그인하지 않거나, 일반회원 안보임 --%>
<% if(loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())){ %>
        <li class="dropdown">
          <div class="dropdown-menu" onclick="location.href='<%= request.getContextPath() %>/admin/admin';">관리자</div>
        </li>
<% } %>

<% if (loginMember == null) { %>
        <li class="signUp"><a href="<%= request.getContextPath() %>/member/enroll">회원가입</a></li>
        <li class="login"><a href="<%= request.getContextPath() %>/member/login" id="login">로그인</a></li>
<% } else { %>
        <li class="signUp"><a href="<%= request.getContextPath() %>/member/logout">로그아웃</a></li>
        <li class="login"><a href="<%= request.getContextPath() %>/member/myPage">마이페이지</a></li>
<% } %>
        <li class="reserCall">예약문의 1544-9970</li>
      </ul>
    </nav>
				
		<section id="content">