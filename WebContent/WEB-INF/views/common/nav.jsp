<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common/nav.css" />

<section class="searchSection l-ct">
	<h1 class="hidden">search</h1>
	<div class="searchLayout">

		<div class="searchLine vueDateBind">
			<p class="searchContent searchLabel">대여일</p>
			<p class="searchContent searchInput inputDate">
					<input type="date" id="navSDate" autocomplete="off" class="hasNavDatepicker" />
			</p>
			<p class="searchContent searchInput inputTime">
				<i class="kit-search-time"></i> 
			</p>
			<p class="searchContent searchLabel">반납일</p>
			<p class="searchContent searchInput inputDate">
					<input type="date" id="navEDate" autocomplete="off" class="hasNavDatepicker" />
			</p>
			<p class="searchContent searchInput inputTime">
				<i class="kit-search-time"></i> 
			</p>
		</div>

		<div class="searchBorder">
			<hr>
		</div>
		<div class="searchLine">
			<p class="searchContent searchLabel">차&nbsp;&nbsp;&nbsp;종</p>
			<div class="searchContent searchCar">
				<label class="searchRadio active"> <input type="radio" value="" name="carSelect" checked="checked"> 
				<span>전체</span>
				</label> <label class="searchRadio"> <input type="radio" value="경차" name="carSelect">
					<span>경차</span>
				</label> <label class="searchRadio"> <input type="radio" value="소형/준중형" name="carSelect"> 
					<span>소형/준중형</span>
				</label> <label class="searchRadio"> <input type="radio" value="중형" name="carSelect">
					<span>중형</span>
				</label> <label class="searchRadio"> <input type="radio" value="SUV" name="carSelect">
					<span>SUV</span>
				</label> <label class="searchRadio"> <input type="radio" value="고급" name="carSelect">
					<span>고급</span>
				</label> <label class="searchRadio"> <input type="radio" value="승합" name="carSelect">
					<span>승합</span>
				</label>
			</div>
		</div>
	</div>
	<button type="button" class="searchButton">검색하기</button>
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