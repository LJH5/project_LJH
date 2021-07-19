<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<style>
	.navbar{
		margin-bottom: 10px;
	}	
</style>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="<%=request.getContextPath()%>/board/list">게시글</a>
    </li>
    <c:if test="${user == null}">
	    <li class="nav-item">
	      <a class="nav-link" href="<%=request.getContextPath()%>/signin">로그인</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="<%=request.getContextPath()%>/signup">회원가입</a>
	    </li>
    </c:if>
   	<c:if test="${user != null}">
        <li class="nav-item">
	      <a class="nav-link" href="<%=request.getContextPath()%>/signout">로그아웃</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="<%=request.getContextPath()%>/member/mypage">마이페이지</a>
	    </li>
   	</c:if>
  </ul>
</nav>
</body>
</html>