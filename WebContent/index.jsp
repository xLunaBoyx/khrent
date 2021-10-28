<%@page import="com.kh.semi.board.model.vo.QuestionBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/main.css" />


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
					<img src="https://i.ibb.co/VB4tMYF/main.png" id="home_car_img"
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
								<form
									action="<%=request.getContextPath()%>/reservation/carSearch"
									name="carSearchFrm" class="clearfix">
									<div class="sdate">
										<label for="">대여일시</label>
										<div class="searchBox clearfix">
											<input type="text" id="start_date" placeholder="날짜 선택">
										</div>
									</div>
									<div class="edate">
										<label for="">반납일시</label>
										<div class="searchBox clearfix">
											<input type="text" id="end_date" placeholder="날짜 선택">
										</div>
										
<script type="text/javascript">
$(document).ready(function() {
		$("#datepicker").datepicker();
});
</script>
									</div>
								</form>
								<button class="search_btn" type="button" onclick="submitForm();">
									<span>차량 검색</span>
								</button>
							</div>
						</div>
					</div>

					<div>
						<ul class="data clearfix">
							<li><strong>예약가능차량</strong> <span class="counter"
								data-counter="16986" style="font-weight: 900;">0</span></li>
							<li><strong>예약가능차종</strong> <span class="counter"
								data-counter="532" style="font-weight: 900;">0</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 문구, 날짜선택, 예약가능차량/차종 끝 -->

<!-- 게시판 시작 -->

<section class="board_area" id="board_area">
	<div class="wrap">
		<h1 class="hidden" id="hidden">latest list</h1>
		<div class="latestList l-ct" id="wrap">
		
		
		
		
		<!-- .latestBoard -->
			<div class="latestBoard">
				<a href="<%= request.getContextPath() %>/board/notice" class="boardTitle">
					<p>
						<span class="titleKr">공지사항</span> <span class="titleEn">Notice</span>
					</p> 
					<i class="fas fa-plus"></i>
				</a>
				<div class="boardList" id="boardList1">	
				</div>
			</div>
			
			<div class="latestBoard">
				<a href="<%= request.getContextPath() %>/board/questionList" class="boardTitle">
					<p>
						<span class="titleKr">대여문의</span> <span class="titleEn">Travel inquiry</span>
					</p> <i class="fas fa-plus"></i>
				</a>
				<div class="boardList" id="boardList2">
				</div>
			</div>
			
			<div class="latestBoard">
				<a href="#" class="boardTitle">
					<p>
						<span class="titleKr">대여후기</span> <span class="titleEn">Travel Reviews</span>
					</p> <i class="fas fa-plus"></i>
				</a>
				<div class="boardList" id="boardList3">
				</div>
			</div>
					
		</div>
	</div>

</section>

<!-- 게시판 끝 -->

<script>
	$(document).ready(function () {
		$.ajax({
			url:"<%=request.getContextPath()%>/board/ajaxMainNoticeBoard",
			method: "GET",
			success: function(data) {
				$("#boardList1").html(data);
			},
			complete: function() {
				console.log("complete")
			}
		});
	});
</script>

<script>
$(document).ready(function () {
	$.ajax({
		url:"<%=request.getContextPath()%>/board/ajaxMainQuestionBoard",
		method: "GET",
		success: function(data) {
			$("#boardList2").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
});
</script>

<script>

<%String msg = (String) session.getAttribute("msg");
if (msg != null)
	session.removeAttribute("msg");%>

<%if (msg != null) {%>
// 사용자 메세지 전달
alert("<%=msg%>
	");
<%}%>

	// 차량 검색 버튼 클릭시 폼 제출
	function submitForm() {
		document.carSearchFrm.submit();
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
