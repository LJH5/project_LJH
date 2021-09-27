<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<style type="text/css">
		.mypage-container{
			width: 800px;
			padding: 20px;
			margin: 0 auto;
		}
		.me_picture{
			margin-bottom: 20px;
		}
		.me_picture img{
			width: 200px;
			height: 200px;
			border-radius: 100%;
		}
		.userInf-box{
			margin-bottom: 10px;
			display: flex;
		}
		.userInf-title{
			margin-right: 20px;
			width: 80px;
		}
		.userInf-contents{
			width: 400px;
		}
		.userInf-title div,
		.userInf-contents div{
			margin-bottom: 10px;
		}
		span:hover a{
			text-decoration: none;
		}
	</style>
</head>
<body>
	<form method="post" action="<%=request.getContextPath()%>/member/signup">
		<div class="mypage-container">
			<h1>Mypage</h1>
			<div class="me_picture">
				<c:choose>
					<c:when test="${user.me_picture == null || user.me_picture == ''}">
						<img src="<%=request.getContextPath()%>/img/2021/08/30/b085dc96-3945-40fb-b974-eeed6408cf27_img.png" style="width: 180px;">
					</c:when>
					<c:otherwise>
						<img src="<%=request.getContextPath()%>/img/${user.me_picture}">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="userInf-box">
				<div class="userInf-title">
					<div class="me_nickname">별명</div>
					<div class="me_name">이름</div>
					<div class="me_email">이메일</div>
					<div class="me_phoneNum">전화번호</div>
				</div>
				<div class="userInf-contents">
					<div class="">${user.me_nickname}</div>
					<div>${user.me_name}</div>
					<div>${user.me_email}</div>
					<div>${user.me_phoneNum}</div>
				</div>
			</div>
			<div class="btn-box">
				<span class="mod-btn">
					<a href="<%= request.getContextPath() %>/member/modify">
						<button type="button" class="btn btn-outline-success col-4">프로필 수정</button>
					</a>
				</span>
				<span class="withdrawal-btn">
					<a href="<%= request.getContextPath() %>/member/delete">
						<button type="button" class="btn btn-outline-danger col-3 ml-4">회원탈퇴</button>
						<input type="hidden" name="me_id" value="${user.me_id}">
					</a>
				</span>
			</div>
		</div>
	</form>
</body>
</html>
