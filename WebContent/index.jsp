<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- 문구, 날짜선택, 예약가능차량/차종 시작 -->

<section class="visual_area" style="height: 700px;">
	<div class="section section0" id="section0"
		style="height: 700px; z-index: 1;">
		
		<div class="visual_cont">
			<div class="wrap">
				<div class="subs">
					<h4>
						맞춤형 렌트카 <span>No.1</span> KH렌트
					</h4>
					<p></p>
					<p>합리적인 가격과</p>
					<p>최상의 서비스</p>
					<p class="point">모두 실시간 예약 가능합니다.</p>
				</div>
				<div class="home_img">
					<img src="https://i.ibb.co/TLRGQyF/k3.png" id="home_car_img"
						alt="car" />
				</div>
			</div>
		</div>

		<div class="search_area" style="margin-top: 20px;">
			<div class="wrap">

				<div class="tab_area">
					<div class="tab_cont">
						<!-- 내륙 -->
						<div class="tab inland active">
							<div class="search_form">
								<form action="#" class="clearfix">
									<div class="sdate">
										<label for="">대여일시</label>
										<div class="searchBox clearfix">
											<input type="date" id="mainSDate" autocomplete="off"
												class="hasDatepicker" />
										</div>
									</div>
									<div class="edate">
										<label for="">반납일시</label>
										<div class="searchBox clearfix">
											<input type="date" id="mainEDate" autocomplete="off"
												class="hasDatepicker" />
										</div>
									</div>
								</form>
								<button class="search_btn" type="button" onclick=>
									<span>차량 검색</span>
								</button>
							</div>
						</div>
					</div>

					<div>
						<ul class="data clearfix">
							<li><strong>예약가능차량</strong> <span
								class="counter" data-counter="16986"
								style="font-weight: 900;">0</span></li>
							<li><strong>예약가능차종</strong> <span
								class="counter" data-counter="532"
								style="font-weight: 900;">0</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 문구, 날짜선택, 예약가능차량/차종 끝 -->

<!-- 게시판 시작 -->

<section class="board_area">
	<div class="wrap">
		<h1 class="hidden">latest list</h1>
		<div class="latestList l-ct">
			<div class="latestBoard">
				<a href="#" class="boardTitle">
					<p>
						<span class="titleKr">공지사항</span> <span class="titleEn">notice
						</span>
					</p> <i class="fas fa-plus"></i>
				</a>
				<div class="boardList">
					<a href="#" class="listItem">
						<p class="itemTitle">[공지] KH렌트 이용 변경사항 안내</p>
						<p class="itemDate">2021.09.24</p>
					</a>
				</div>
			</div>
			<!-- .latestBoard -->


			<div class="latestBoard">
				<a href="#" class="boardTitle">
					<p>
						<span class="titleKr">대여문의</span> <span class="titleEn">travel
							inquiry</span>
					</p> <i class="fas fa-plus"></i>
				</a>
				<div class="boardList">
					<a href="#" class="listItem">
						<p class="itemTitle">[문의] 예약확인 문자</p>
						<p class="itemDate">2021.10.19</p>
					</a>
				</div>
			</div>
			<!-- .latestBoard -->


			<div class="latestBoard">
				<a href="#" class="boardTitle">
					<p>
						<span class="titleKr">대여후기</span> <span class="titleEn">travel
							reviews</span>
					</p> <i class="fas fa-plus"></i>
				</a>
				<div class="boardList">
					<a href="#" class="listItem">
						<p class="itemTitle">[후기] 짱입니다!</p>
						<p class="itemDate">2021.10.17</p>
					</a>
				</div>
			</div>
			<!-- .latestBoard -->
		</div>
	</div>
</section>

<!-- 게시판 끝 -->

<script>

	// 	날짜 선택 현재 날짜 기준으로 나타내기
	document.getElementById('mainSDate').value = new Date().toISOString()
			.substring(0, 10);
	;
	document.getElementById('mainEDate').value = new Date().toISOString()
			.substring(0, 10);
	;
	
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
