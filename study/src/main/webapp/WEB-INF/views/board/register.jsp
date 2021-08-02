<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<form class="container" method="post" action="<%=request.getContextPath()%>/board/register" enctype="multipart/form-data">
		<h1>게시글 등록</h1>
		<div class="form-group">
			<label>제목</label> <input type="text" class="form-control" name="title">
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea name="contents"></textarea>
		</div>
		<div class="form-group">
			<input type="file" name="fileList" class="form-control">
			<input type="file" name="fileList" class="form-control">
			<input type="file" name="fileList" class="form-control">
		</div>
		<button type="submit" class="btn btn-outline-success">등록</button>
		<a href="<%=request.getContextPath() %>/board/list"><button type="button" class="btn btn-outline-success">목록</button></a>
	</form>
</body>
</html>