<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>

<html>
<head>
	<style type="text/css">
		*{
			padding: 0;
			margin: 0;
			list-style: none;
			text-decoration: none;
		}
		.footer-container{
			
		}
		.footer-box{
			height: 100px;
			line-height: 100px;
			min-width: 1400px;
			padding: 0 10px;
			border-top: 1px solid rgb(200, 200, 200);
			background: #fafbfc;
		}
		.footer-box span{
			padding: 0 10px;
			border-right: 1px solid rgb(212, 212, 212);
		}
		.footer-box a {
			color: black;
			color: #777;
		}
		.footer-box a:hover{
			text-decoration: underline;
		}
	</style>
</head>
<body>
	<div class="footer-container">
		<div class="footer-box">
			<span><a href="<%=request.getContextPath()%>/board/request/list">수정요청</a></span>
			<span><a href="<%=request.getContextPath()%>/board/list">문의사항</a></span>
			<span><a href="<%=request.getContextPath()%>/board/notice/list">공지사항</a></span>
			<c:if test="${user != null}">
				<span><a href="<%= request.getContextPath() %>/restaurant/register">음식점 등록</a></span>
				<c:if test="${user.me_authority != 'USER'}">
					<span><a href="<%= request.getContextPath() %>/admin/user/list">회원관리</a></span>	
				</c:if>
			</c:if>
		</div>
	</div>
</body>
</html>
