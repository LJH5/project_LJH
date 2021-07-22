<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>게시글 등록</title>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
</head>
<body>
	<form class="container" method="post" action="<%=request.getContextPath()%>/board/register" enctype="multipart/form-data">
		<h1>게시글 등록</h1>
		<div class="form-group">
			<label>제목</label> <input type="text" class="form-control"
				name="title">
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea id="summernote" name="contents"></textarea>
		</div>
		<div class="form-group">
			<label>첨부파일</label>
			<input type="file" class="form-control" name="files">
			<input type="file" class="form-control" name="files">
			<input type="file" class="form-control" name="files">
		</div>
		<button type="submit" class="btn btn-outline-danger">등록</button>
		<a href="<%=request.getContextPath() %>/board/list"><button type="button" class="btn btn-outline-success">목록</button></a>
	</form>
	<script type="text/javascript">
		$(function(){
			$('#summernote').summernote({
		        placeholder: '내용을 작성하세요.',
		        tabsize: 2,
		        height: 400
			});
		})
	</script>
</body>
</html>
