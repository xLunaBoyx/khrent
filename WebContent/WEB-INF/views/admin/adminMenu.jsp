<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/adminMenu.css" />

<section class="app">
	<aside class="sidebar">
		<header> Menu </header>
		<nav class="sidebar-nav">

			<ul>
				<li><a href="#"><i class="ion-bag"></i> 
				<span>예약관리</span></a>
					<ul class="nav-flyout">
						<li><a href="#"><i class="ion-ios-color-filter-outline"></i>예약조회</a>
						</li>
						<li><a href="#"><i class="ion-ios-clock-outline"></i>예약변경</a>
						</li>
						<li><a href="#"><i class="ion-android-star-outline"></i>예약취소</a>
						</li>
					</ul></li>

				<li><a href="#"><i class="ion-ios-settings"></i> 
				<span class="">차량관리</span></a>
					<ul class="nav-flyout">
						<li><a href="#"><i class="ion-ios-alarm-outline"></i>차량조회</a>
						</li>
						<li><a href="#"><i class="ion-ios-camera-outline"></i>차량추가</a>
						</li>
						<li><a href="#"><i class="ion-ios-chatboxes-outline"></i>차량삭제</a>
						</li>
						<li><a href="#"><i class="ion-ios-cog-outline"></i>차량변경</a>
						</li>
					</ul></li>

				<li><a href="#"><i class="ion-ios-briefcase-outline"></i> 
				<span class="">회원관리</span></a>
					<ul class="nav-flyout">
						<li><a href="<%= request.getContextPath()%>/admin/adminMemberList"><i class="ion-ios-flame-outline"></i>회원목록조회</a>
						</li>
						<li><a href="#"><i class="ion-ios-lightbulb-outline"></i>회원정보수정</a>
						</li>
						<li><a href="#"><i class="ion-ios-location-outline"></i>탈퇴회원조회</a>
						</li>
						<li><a href="#"><i class="ion-ios-locked-outline"></i>회원권한변경</a>
						</li>
						<li><a href="#"><i class="ion-ios-navigate-outline"></i>Ghostface</a>
						</li>
					</ul>
				</li>
				
				<li><a href="#"><i class="ion-ios-analytics-outline"></i> 
				<span class="">Graphicals</span></a>
					<ul class="nav-flyout">
						<li><a href="#"><i class="ion-ios-timer-outline"></i>Timers</a>
						</li>
						<li><a href="#"><i class="ion-arrow-graph-down-left"></i>You
								Lose</a></li>
						<li><a href="#"><i class="ion-ios-partlysunny-outline"></i>Stormy</a>
						</li>
						<li><a href="#"><i class="ion-ios-timer-outline"></i>Lookie
								Look</a></li>
						<li><a href="#"><i
								class="ion-ios-game-controller-a-outline"></i>Dork Mfer</a></li>
					</ul>
				</li>
				
				<li><a href="#"><i class="ion-ios-medical-outline"></i> <span
						class="">Cocaine</span></a></li>
			</ul>
		</nav>
	</aside>
</section>