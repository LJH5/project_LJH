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
	<form class="container" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label>제목</label>
			<input type="text" class="form-control" name="bo_title">
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea id="summernote" class="form-control" name="bo_content" rows="10">${board.bo_content}</textarea>
		</div>
		<div class="form-group">
			<label>첨부파일</label>
			<input type="file" name="fileList" class="form-control" id="image" accept="image/*" onchange="chk_file_type(this)">
		</div>
		<button type="submit" class="btn btn-outline-success">등록</button>
		<a href="<%=request.getContextPath()%>/board${type}/list"><button type="button" class="btn btn-outline-success">목록</button></a>
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
			$('form').submit(function(){
				return true;
			})
		})
	</script>
	<script charset="utf-8">
		$(function(){
			$('#summernote').summernote({
				height: 600,
				fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
				fontNamesIgnoreCheck : [ '맑은고딕' ],
				focus: true,
				
				callbacks: {
					onImageUpload: function(files, editor, welEditable) {
			            for (var i = files.length - 1; i >= 0; i--) {
			            	sendFile(files[i], this);
			            }
			        }
				}
				
			});
		})
		function sendFile(file, el) {
			var form_data = new FormData();
	      	form_data.append('file', file);
	      	$.ajax({
	        	data: form_data,
	        	type: "POST",
	        	url: '<%=request.getContextPath()%>/board/img/upload',
	        	cache: false,
	        	contentType: false,
	        	enctype: 'multipart/form-data',
	        	processData: false,
	        	success: function(img_name) {
	        		console.log(img_name)
	          		$(el).summernote('editor.insertImage', '<%=request.getContextPath()%>/img'+ img_name);
	        	}
	      	});
	    }
		</script>	
			
</body>
</html>