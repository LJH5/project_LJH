<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<title>게시판</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <h2>게시판</h2>  
  <c:if test="${list.size() != 0 }">         
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>등록일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
	    <c:forEach items="${list}" var="board">
	    <!-- items의 이름은 addObject의 왼쪽 요소와 동일하게 맞춘다 -->
	      <tr>
	        <td>${board.num}</td>
	        <td>${board.title}</td>
	        <td>${board.writer}</td>
	        <td>${board.registeredDate}</td>
	        <td>${board.views}</td>
	      </tr>
	    </c:forEach>
    </tbody>
  </table>
  </c:if> 
</div>
</body>
</html>
