<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<style type="text/css">
		.signIn-container .inner-container{
			margin: 70px auto;
			width: 500px;
			position: relative;
		}
		.signIn-container .login-box{
			border: 1px solid #c8c8c8;
			border-radius: 5px;
			padding: 20px;
			box-shadow: 0 5px 9px 0 rgb(68 68 68 / 5%);
		}
		.signIn-container .checkbox-box{
		    font-size: 17px;
		    font-weight: 500;
		    color: #777;
		    margin-bottom: 20px;
		}
		.signIn-container .signUp-box{
			position: absolute;
			right: 5px;
			margin-top: 10px;
		}
		.signIn-container .signUp-box a{
			color: black;
			padding: 0;
		}
		
	</style>	
</head>
<body>
<form method="post" action="<%=request.getContextPath()%>/member/signin">
	<div class="signIn-container">
		<div class="inner-container">
			<h1>로그인</h1>
			<div class="login-box">
				<div class="form-group">
					<input type="text" class="form-control" name="me_id" placeholder="아아디">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" name="me_pw" placeholder="비밀번호">
				</div>
				<label class="checkbox-box">
					<input type="checkbox" name="useCookie" value="true"> 로그인 상태 유지
				</label>
				<button class="btn btn-outline-success col-12">로그인</button>
			</div>
			<div class="signUp-box">
				<a class="nav-link" href="<%= request.getContextPath() %>/member/signup">회원가입</a>
			</div>
		</div>
	</div>
</form>
</body>
</html>