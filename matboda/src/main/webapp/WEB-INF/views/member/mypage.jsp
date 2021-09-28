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
			position: relative;
		}
		.me_picture{
			margin-bottom: 20px;
		}
		.me_picture img{
			width: 200px;
			height: 200px;
			border-radius: 100%;
			box-shadow: 1px 1px 1px 2px #d9cece;
		}
		.user-activity{
			width: 400px;
			height: 200px;
			position: absolute;
			top: 75px;
			right: 30px;
			display: flex;
			border: 2px solid rgb(255, 165,0);
			padding: 10px;
			box-sizing: border-box;
		}
		
		.user-activity .review,
		.user-activity .favorites{
			width: 50%;
			text-align: center;

		}
		.user-activity .title{
			margin-bottom: 10px;
			font-size: 20px;
			font-weight: bold;
		}
		.user-activity .review-num,
		.user-activity .favorites-num{
			width: 100px;
			height: 100px;
			margin: 0 auto;
			line-height: 100px;
			font-size: 30px;
			border-radius: 100%;
			background-color: #ffc107;
			margin-bottom: 10px;
			color: white;
			display: block;
		}
		.user-activity .review:hover a,
		.user-activity .favorites:hover a{
			text-decoration: none;
		}
		.user-activity .favorites{
			border-left: 1px solid rgb(223, 217, 217);
		}
		.user-activity a{
			color: black;
		}
		.userInf-box{
		    margin-bottom: 10px;
		    display: flex;
		    color: #747070;
		    font-size: 18px;
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
			<div class="user-activity">
				<div class="review">
					<div class="title">리뷰</div>
					<a href="<%=request.getContextPath()%>/member/reviewList">
						<span class="review-num">${reNum}</span>
						<span>리뷰 목록</span>
					</a>
				</div>
				<div class="favorites">
					<div class="title">즐겨찾기</div>
					<a href="">
						<span class="favorites-num">${faNum}</span>
						<span>즐겨찾기 목록</span>
					</a>
				</div>
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
