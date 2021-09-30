<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>
	<form class="container" enctype="multipart/form-data" method="post">
		<h1>게시판</h1>
		<div class="form-group">
			<label>제목</label>
			<input type="text" class="form-control" name="bo_title" value="${board.bo_title}">
		</div>
		<div class="form-group">
			<label>작성자</label>
			<input type="text" class="form-control" name="bo_me_id" readonly value="${board.bo_me_id}">
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea id="summernote" class="form-control" name="bo_content" rows="10">${board.bo_content}</textarea>
		</div>
		<div class="form-group file-box">
			<label>첨부파일</label>
			<c:choose>
				<c:when test="${fList.size() == 1}">
					<c:forEach items="${fList}" var="image">
						<div class="form-control">
							<span>${image.im_oriName}</span>
							<i class="fas fa-times"></i>
							<input type="hidden" name="fileNumList" value="${image.im_num}">
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<input type="file" name="fileList" class="form-control" id="image" accept="image/*" onchange="chk_file_type(this)">
				</c:otherwise>
			</c:choose>
			
		</div>
		<input type="hidden" name="bo_num" value="${board.bo_num}">
		<button class="btn btn-outline-success">등록</button>
		<a href="<%=request.getContextPath()%>/board${type}/list"><button type="button" class="btn btn-outline-danger">목록</button></a>
	</form>
	<script type="text/javascript">
		function chk_file_type(obj) {
			var file_kind = obj.value.lastIndexOf('.');
			var file_name = obj.value.substring(file_kind+1,obj.length);
			var file_type = file_name.toLowerCase();
			var check_file_type=new Array();
			check_file_type=['jpg','gif','png','jpeg','bmp','tif'];
			if(check_file_type.indexOf(file_type)==-1) {
				alert('이미지 파일만 첨부 가능합니다.');
				var parent_Obj=obj.parentNode;
				var node=parent_Obj.replaceChild(obj.cloneNode(true),obj);
				$('[name=fileList]').val("");
				return false;
			}
		}
		$(function(){
			$('#summernote').summernote({
				placeholder: 'Hello Bootstrap 4',
				tabsize: 2,
				height: 400
			});
			$('.file-box .fa-times').click(function(){
				$(this).parent().remove();
				$('.file-box').append('<input type="file" class="form-control" name="fileList">');
			})
		})
	</script>
</body>
</html>