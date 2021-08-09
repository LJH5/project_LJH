<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>

<html>
<head>
</head>
<body>
	<nav class="navbar navbar-expand-sm navbar-yellow">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/">맛보다</a></li>
		</ul>
		<c:if test="${user == null}">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/member/signin">로그인</a></li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/member/signup">회원가입</a></li>
			</ul>
		</c:if>
		<c:if test="${user != null}">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/member/signout">로그아웃</a></li>
				<c:if test="${user.me_authority != 'USER'}">
					<li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/admin/user/list">회원관리</a></li>	
				</c:if>
			</ul>
		</c:if>
	</nav>
</body>
</html>