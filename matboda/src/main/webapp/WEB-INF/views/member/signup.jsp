<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
</head>
<body>

<form class="container" method="post" action="<%=request.getContextPath()%>/member/signup">
	<h1>회원가입</h1>
	<div class="form-group">
		<label>아이디</label>
		<input type="text" class="form-control" name="me_id">
	</div>
		<button type="button" class="id-dup-btn btn btn-outline-success col-12">아이디 중복 검사</button>
	<div class="form-group">
		<label>비밀번호</label>
		<input type="password" class="form-control" name="me_pw" id="me_pw">
	</div>
	<div class="form-group">
		<label>비밀번호 확인</label>
		<input type="password" class="form-control" name="me_pw">
	</div>
	<div class="form-group">
		<label>이름</label>
		<input type="text" class="form-control" name="me_name">
	</div>
	<div class="form-group">
		<label>별명</label>
		<input type="text" class="form-control" name="name">
	</div>
	<div class="form-group">
		<label>이름</label>
		<input type="text" class="form-control" name="name">
	</div>
	<div class="form-group">
		<label>이메일</label>
		<input type="text" class="form-control" name="email">
	</div>
	<div class="form-group">
		<label>성별</label>
		<select class="form-control" name="gender">
			<option value="N">선택안함</option>
			<option value="M">남성</option>
			<option value="F">여성</option>
		</select>
	</div>
	<button class="btn btn-outline-success col-12">회원가입</button>
</form>
</body>
</html>
