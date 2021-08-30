<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
</head>
<body>

<form class="container" method="post" action="<%=request.getContextPath()%>/member/signin">
	<h1>로그인</h1>
	<div class="form-group">
		<label>아이디</label>
		<input type="text" class="form-control" name="me_id">
	</div>
	<div class="form-group">
		<label>비밀번호</label>
		<input type="password" class="form-control" name="me_pw">
	</div>
	<label class="form-group">
		<input type="checkbox" name="useCookie" value="true">자동로그인
	</label>
	<button class="btn btn-outline-success col-12">로그인</button>
	<a class="nav-link" href="<%= request.getContextPath() %>/member/signup">회원가입</a>
</form>
</body>
</html>