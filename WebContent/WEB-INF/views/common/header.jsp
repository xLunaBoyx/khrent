<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH렌트</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" />
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
      <ul>
        <li class="dropdown">
          <a href="<%=request.getContextPath()%>/reservation/carSearch">예약하기</div>
        </li>
        <li class="dropdown">
          <div class="dropdown-menu" onclick="location.href='<%= request.getContextPath() %>/common/rentalInformation';">대여안내</div>
        </li>
        <li class="dropdown">
          <!-- <div class="dropdown-menu" id="community">커뮤니티</div> -->
          <a href="<%=request.getContextPath()%>/community">커뮤니티</a>
        </li>
        <li class="dropdown">
          <div class="dropdown-menu">고객센터</div>
          <div class="dropdown-content">
            <a href="#">자주 묻는 질문</a>
            <a href="#">공지사항</a>
            <a href="#">대여문의</a>
            <a href="#">대여후기</a>
            <a href="#">약관/정책</a>
            <a href="#">회사소개</a>
          </div>
        </li>
        <li class="signUp"><a href="#">회원가입</a></li>
        <li class="login"><a href="#">로그인</a></li>
        <li class="reserCall">예약문의 1544-9970</li>
      </ul>
      
    </nav>
		<section id="content">
	<script>
		$("#community")
	</script>
	
	
	
	
	