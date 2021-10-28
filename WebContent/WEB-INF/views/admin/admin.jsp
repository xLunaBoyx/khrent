<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/admin.css" />
    
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>

<section class="page-content">
  <section class="search-and-user">
    <div class="admin-profile">
      <span class="greeting">Hello, <%= loginMember.getMemberName() %>님!</span>
      <div class="notifications">
        <svg>
          <use xlink:href="#users"></use>
        </svg>
      </div>
    </div>
  </section>
  <section class="grid">
    <article></article>
    <article></article>
    <article></article>
    <article></article>
    <article></article>
    <article></article>
  </section>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>