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
		width: 300px;
		
	}
</style>
</head>
<body>
	<c:forEach items="${list}" var="rt">
		<div class="container">
			<ul class="item-list">
				<li class="item">
					<a href="<%=request.getContextPath()%>/restaurant/main/?num=${rt.rt_num}">
						<c:choose>
							<c:when test=""></c:when>
						</c:choose>
						<img src="<%=request.getContextPath()%>/img/${rt.rt_im_name}" width="300" height="300">
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
