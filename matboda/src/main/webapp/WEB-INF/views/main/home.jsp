<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<style>
	.item-list{
		list-style: none;	margin: 20px 0;	padding: 0;
	}
	.item-list::after{
		clear: both; content: ''; display: block;
	}
	.item-list .item{
		width: 200px;
		
	}
</style>
</head>
<body>
	<c:forEach items="${list}" var="rt">
		<div class="container">
			<ul class="item-list">
				<li class="item">
					<a href="<%=request.getContextPath()%>/restaurant/main/?num=${rt.rt_num}">
						<img alt="" src="/matboda/img/2021/08/23/5b251657-3c99-483d-bb10-0ffb33a45bbd_음식점 기본 이미지.png" width="300" height="300">
						<span class="title">${rt.rt_name}</span>
						<span class="score">${rt.rt_score}</span>
					</a>
				</li>
			</ul>
		</div>
	</c:forEach>
</body>
</html>
