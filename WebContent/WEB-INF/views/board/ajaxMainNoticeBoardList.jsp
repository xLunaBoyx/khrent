<%@page import="com.kh.semi.board.model.vo.NoticeBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<NoticeBoard> list = (List<NoticeBoard>) request.getAttribute("list");
%>

					<a href="#" class="listItem">
<%
	for(NoticeBoard board : list) {
%>
						<p class="itemTitle"><%= board.getNoticeTitle() %></p>
						<p class="itemDate"><%= board.getRegDate() %></p>
<% } %>

					</a>