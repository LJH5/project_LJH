<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>
	<form class="container" method="post" enctype="multipart/form-data">
		<h1>게시글 수정</h1>
		<div class="form-group">
			<label>제목</label> <input type="text" class="form-control"
				name="title" value="${board.title}">
		</div>
		<div class="form-group">
			<label>작성자</label> <input type="text" class="form-control"
				name="writer" value="${board.writer}" readonly>
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea class="form-control" id="summernote" name="contents" rows="10">${board.contents}</textarea>
		</div>
		<div class="form-group file-box">
			<label>첨부파일</label>
			<c:forEach items="${fList}" var="file">
				<div class="form-control">
					<span>${file.ori_name}</span>
					<i class="fas fa-times"></i>
					<input type="hidden" name="fileNUmList" value="${file.num}"> 
				</div>
			</c:forEach>
			<c:forEach begin="1" end="${3 - fList.size()}">
				<input type="file" class= form-control name="fileList">
			</c:forEach>
		</div>
		<input type="hidden" name="num" value="${board.num}">
		<button type="submit" class="btn btn-outline-danger">등록</button>
	</form>
	<script type="text/javascript">
		$(function(){
			$('.file-box fa-times').click(function(){
				//alert("삭제버튼 클릭");
				$(this).parent().remove();
				$('.file-box').append('<input type="file" class= form-control name="fileList">');
			})
			$('#summernote').summernote({
				placeholder: 'Hello Bootstrap 4',
				tabsize: 2,
				height: 400
			});
		})
	</script>
</body>
</html>
