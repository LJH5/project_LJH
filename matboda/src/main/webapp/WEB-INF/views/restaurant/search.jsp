<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<style>
	*{
		margin: 0;
		padding: 0;
		text-decoration: none;
		list-style: none;
	}
	.search-container .notSearch-container{
		height: 700px;
		width: 800px;
		margin: 0 auto;
		margin-top: 200px;
	}
	.search-container .notSearch-container h1{
		margin-bottom: 30px;
	}
	.search-container .register-link{
		font-size: 50px;
		color: black;
	}
	.search-container .register-link:hover{
		text-decoration: none;
		color: rgb(255, 165, 0);
	}
	.item-list{
		list-style: none;	margin: 20px 0;	padding: 0;
	}
	.item-list::after{
		clear: both; content: ''; display: block;
	}
	.item-list .item{
		width: 300px;
		
	}
</style>
</head>
<body>
	<c:if test="${list.size() == 0}">
		<div class="search-container">
			<div class="inner-container">
				<div class="notSearch-container">
					<h1>'${cri.search}'에 대한 검색 결과가 없습니다.</h1>
					<h1>검색한 식당이 없다면?🤔</h1>
					<a class="register-link" href="<%= request.getContextPath() %>/restaurant/register">음식점 등록👈😉</a>
				</div>
			</div>
		</div>
	</c:if>
	<c:forEach items="${list}" var="rt">
		<div class="container">
			<ul class="item-list">
				<li class="item">
					<a href="<%=request.getContextPath()%>/restaurant/main/?num=${rt.rt_num}">
						<c:choose>
							<c:when test="${rt.rt_im_name != null}"><img src="<%=request.getContextPath()%>/img/${rt.rt_im_name}" width="300px" height="300px"></c:when>
							<c:otherwise><img src="<%=request.getContextPath()%>/img/2021/08/23/5b251657-3c99-483d-bb10-0ffb33a45bbd_음식점 기본 이미지.PNG" width="300px" height="300px"></c:otherwise>
						</c:choose>
						<span class="title">${rt.rt_name}</span>
						<span class="score">${rt.rt_score}</span> <br>
						<span class="address">${rt.rt_address}</span>
					</a>
				</li>
			</ul>
		</div>
	</c:forEach>
</body>
</html>
