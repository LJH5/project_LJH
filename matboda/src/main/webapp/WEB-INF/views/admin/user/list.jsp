<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="container">
	<h1>회원관리</h1>
	<table class="table table-striped table-hover">
	    <thead>
			<tr>
				<th>가입일</th>
				<th>아이디</th>	
				<th>등급</th>
				<th>설정</th>
			</tr>
	    </thead>
	    <tbody>
	    	<c:forEach items="${list}" var="member">    
			<tr>
				<td>${member.date}</td>
				<td>${member.me_id}</td>
				<td>${member.authorityStr}</td>
				<td>
					<select class="form-control">
						<option value="USER" <c:if test="${member.me_authority == 'USER' }">selected</c:if>>회원</option>
						<c:if test="${user.me_authority == 'SUPER ADMIN' }">
							<option value="ADMIN" <c:if test="${member.me_authority == 'ADMIN' }">selected</c:if>>관리자</option>
						</c:if>
					</select>
				</td>
			</tr>
		</c:forEach>
	    </tbody>
  	</table>
</div>
</body>
</html>