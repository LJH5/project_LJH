<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>

<html>
<head>
</head>
<body>
	<div class="jumbotron"style="height: 200px; box-sizing: border-box; margin-bottom: 0">
		<h3>맛집 정보 다모아</h3>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/board/request/list">수정요청</a></li>
		</ul>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/board/list">문의사항</a></li>
		</ul>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/board/notice/list">공지사항</a></li>
		</ul>
	</div>
</body>
</html>
