<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<title>마이 페이지</title>
</head>
<body>

<form class="container" method="post" action="<%=request.getContextPath()%>/member/mypage">
	<h1>마이페이지</h1>
	<div class="form-group">
		<label>아이디</label>
		<input type="text" class="form-control" name="id" value="${user.id}" readonly>
	</div>
	<div class="form-group">
		<label>새　비밀번호</label>
		<input type="password" class="form-control" name="pw">
	</div>
	<div class="form-group">
		<label>새　비밀번호 확인</label>
		<input type="password" class="form-control" name="pw2">
	</div>
	<div class="form-group">
		<label>이름</label>
		<input type="text" class="form-control" name="name" value="${user.name}" readonly>
	</div>
	<div class="form-group">
		<label>이메일</label>
		<input type="text" class="form-control" name="email" value="${user.email}">
	</div>
	<div class="form-group">
		<label>성별</label>
		<select class="form-control" name="gender">
			<option value="M" <c:if test="${user.gender == 'M'}">selected</c:if>>남성</option>
			<option value="F" <c:if test="${user.gender == 'F'}">selected</c:if>>여성</option>
		</select>
	</div>
	<button class="btn btn-outline-success col-12">수정</button>
</form>
<script type="text/javascript">
	$(function(){
		$('form').submit(function() {
			var id = $('[name=id]').val();
			var pw = $('[name=pw]').val();
			var pw2 = $('[name=pw2]').val();
			var name = $('[name=name]').val();
			var email = $('[name=email]').val();
			if(id.trim() == ''){
				alert('아이디를 입력하세요.')
				return false;
			}
			if(pw.trim() == ''){
				alert('비밀번호를 입력하세요.')
				return false;
			}
			if(pw != pw2){
				alert('비밀번호가 일치하지 않습니다.')
				return false;
			}
			if(name.trim() == ''){
				alert('이름을 입력하세요.')
				return false;
			}
			if(email.trim() == ''){
				alert('이메일을 입력하세요.')
				return false;
			}
		})
	})
</script>
</body>
</html>
