<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js"></script>
	
	<style type="text/css">
		.me_picture img{
			width: 200px;
			height: 200px;
			border-radius: 100%;
		}
	</style>
</head>
<body>

<form class="container" method="post" action="<%=request.getContextPath()%>/member/signup">
	<h1>Mypage</h1>
	<div class="me_picture">
		<c:choose>
			<c:when test="${user.me_picture == null || user.me_picture == ''}">
				<img src="/matboda/img/2021/08/30/b085dc96-3945-40fb-b974-eeed6408cf27_img.png" style="width: 180px;">
			</c:when>
			<c:otherwise>
				<img src="/matboda/img/${user.me_picture}">
			</c:otherwise>
		</c:choose>
	</div>
	<div class="me_nickname">
		<label>별명</label>
		<input type="text" class="form-control" name="me_nickname" readonly value="${user.me_nickname}">
	</div>
	<div class="me_name">
		<label>이름</label>
		<input type="text" class="form-control" name="me_name" readonly value="${user.me_name}">
	</div>
	<div class="me_email">
		<label>이메일</label>
		<input type="text" class="form-control" name="me_email" readonly value="${user.me_email}">
	</div>
	<div class="me_phoneNum">
		<label>전화번호</label>
		<input type="text" class="form-control" name="me_phoneNum" readonly value="${user.me_phoneNum}">
	</div>
	<a href="<%= request.getContextPath() %>/member/modify">
		<button type="button" class="btn btn-outline-success col-4">프로필 수정</button>
	</a>
	<button type="button" class="btn btn-outline-success col-4">비밀번호 번경</button>
	<button type="button" class="btn btn-outline-danger col-3 ml-4">회원탈퇴</button>
</form>
</body>
</html>
