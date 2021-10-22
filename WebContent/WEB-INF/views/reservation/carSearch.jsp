<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>

<%-- <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" /> --%>
<style>
/* nav 시작 */

section.searchSection {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

section.searchSection .searchLayout {
	background-color: #27ae60;
	border-radius: 3px;
	width: 1037px;
	height: 173px;
	padding: 20px;
	margin: 20px;
}

section.searchSection .searchLayout .searchLine {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

section.searchSection .searchLayout .searchBorder {
	display: flex;
	justify-content: flex-end;
}

section.searchSection .searchLayout .searchBorder hr {
	width: 910px;
	height: 1px;
	margin: 15px 0;
	padding: 0;
	border: none;
	background-color: rgba(255, 255, 255, 0.2);
}

section.searchSection .searchLayout .searchLabel {
	color: #fff;
	line-height: 57px;
	width: 85px;
	text-align: center;
}

section.searchSection .searchLayout .searchContent {
	font-size: 20px;
	font-weight: 500;
	margin: 10px;
}

section.searchSection .searchLayout .searchCar {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	width: 910px;
}

section.searchSection .searchLayout .searchRadio input {
	display: none;
}

section.searchSection .searchLayout .searchRadio input:checked+span {
	background-color: rgb(64, 64, 64);
	color: #fff;
}

section.searchSection .searchButton {
	background-color: rgb(64, 64, 64);
	border-color: #212326;
	width: 159px;
	border-radius: 3px;
	color: #fff;
	font-size: 17px;
	font-weight: 500;
	margin: 20px;
}

section .searchButton {
	cursor: pointer;
}

section.searchSection .searchLayout .searchRadio span {
	display: inline-block;
	height: 57px;
	line-height: 57px;
	min-width: 86px;
	padding: 0 10px;
	color: #69666a;
	font-size: 17px;
	font-weight: 500;
	background-color: #fff;
	border-radius: 3px;
	text-align: center;
	cursor: pointer;
}

.hasNavDatepicker {
	display: inline-block;
	height: 48px;
	width: 310px;
	line-height: 57px;
	min-width: 86px;
	padding: 0 10px;
	color: #69666a;
	font-size: 17px;
	font-weight: 500;
	background-color: #fff;
	border-radius: 3px;
	text-align: center;
	cursor: pointer;
	border: 0;
}

/* nav 끝 */
</style>