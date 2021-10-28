<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common/nav.css" />

<section class="searchSection l-ct">
	<form action="/reservation/carSearch" style="display: content;">
		<div class="searchLayout">

		<div class="searchLine vueDateBind">
			<p class="searchContent searchLabel">대여일</p>
			<p class="searchContent searchInput inputDate">
					<input type="text" id="start_date" autocomplete="off" class="hasNavDatepicker" placeholder="날짜선택"/>
			</p>
			<p class="searchContent searchInput inputTime">
				<i class="kit-search-time"></i> 
			</p>
			<p class="searchContent searchLabel">반납일</p>
			<p class="searchContent searchInput inputDate">
					<input type="text" id="end_date" autocomplete="off" class="hasNavDatepicker" placeholder="날짜선택"/>
			</p>
			<p class="searchContent searchInput inputTime">
				<i class="kit-search-time"></i> 
			</p>
		</div>
	</div>
	<button type="submit" class="searchButton">검색하기</button>
	</form>
</section>

<script>

	// 	날짜 선택 현재 날짜 기준으로 나타내기
	document.getElementById('navSDate').value = new Date().toISOString()
			.substring(0, 10);
	;
	document.getElementById('navEDate').value = new Date().toISOString()
			.substring(0, 10);
	;
	
</script>