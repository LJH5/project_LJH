<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>

<html>
<head>
	<style type="text/css">
		.board-box{
			display: flex;
		}
		.navbar-nav{
			margin-right: 20px
		}
	</style>
</head>
<body>
	<div class="jumbotron"style="height: 200px; box-sizing: border-box; margin-bottom: 0">
		<h4>맛집 정보 다모아</h4>
		<div class="board-box">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/board/request/list">수정요청</a></li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/board/list">문의사항</a></li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/board/notice/list">공지사항</a></li>
			</ul>
			<c:if test="${user != null}">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/restaurant/register">음식점 등록</a></li>
				</ul>	  
			</c:if>
		</div>
	</div>
</body>
</html>
