<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js"></script>
	<style>
		.userMod-container .inner-container{
			margin: 0 auto;		
			width: 800px;
			padding: 20px;
		}
		.error{
			color : red
		}
		.userMod-container .image-container{
			position: relative;
		}
		.userMod-container .image-container img{
			width: 200px;
			height: 200px;
			border-radius: 100%;
		}
		.userMod-container .img-icon{
			position: absolute;
		    font-size: 30px;
		    bottom: 0;
	       left: calc(25% - 20px)
		}
		.userMod-container .me_picture:hover{
			cursor: pointer;
		}
		.userMod-container #pre-image{
			background: white;
			width: 210px;
			height: 210px;
			position: absolute;
			left: 0;
			top: 0;
			z-index: 2;
			display: none;
		}
		.userMod-container #pre-image i{
			position: absolute;
		    top: 0;
		    right: 0;
		    font-size: 30px;
		    color: rgb(110,110,110);
		}
		.userMod-container #pre-image i:hover{
			 color: rgb(250,160,110);
			 cursor: pointer;
		}
	</style>
</head>
<body>

<form method="post" action="<%=request.getContextPath()%>/member/modify" enctype="multipart/form-data">
	<div class="userMod-container">
		<div class="inner-container">
			<h1>프로필 수정</h1>
			<div class="image-container">
				<div id="pre-image"><i class="far fa-window-close"></i></div>
				<label class="me_picture" for="me_picture">
					<c:choose>
						<c:when test="${user.me_picture == null || user.me_picture == ''}">
							<img src="/matboda/img/2021/08/30/b085dc96-3945-40fb-b974-eeed6408cf27_img.png" style="width: 180px;">
						</c:when>
						<c:otherwise>
							<img src="/matboda/img/${user.me_picture}">
						</c:otherwise>
					</c:choose>
					<span class="img-icon"><i class="far fa-image"></i></span>
				</label>
				<input type="file" name="file" id="me_picture" style="display: none;" accept="image/*" onchange="setThumbnail(event);"/>
			</div>
			<div class="form-group">
				<label>별명</label>
				<input type="text" class="form-control" name="me_nickname" value="${user.me_nickname}">
			</div>
			<div class="form-group">
				<label>이메일</label>
				<input type="text" class="form-control" name="me_email" value="${user.me_email}">
			</div>
			<div class="form-group">
				<label>전화번호</label>
				<input type="text" class="form-control" name="me_phoneNum" value="${user.me_phoneNum}">
			</div>
			<input type="hidden" name="me_id" value="${user.me_id}">
			<button class="mod-btn btn btn-outline-success col-12">수정하기</button>
		</div>
	</div>
</form>
<script type="text/javascript">
	$(function(){
		$("form").validate({
	       rules: {
	           me_email: {
	               required : true,
	               regex: /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/
	           },
	           me_phoneNum: {
	           	required : true,
	           	regex: /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/
	           },
	           me_nickname: {
	           	regex: /^([가-힣a-zA-Z]+){2,15}$/
	           },
	       },
	       //규칙체크 실패시 출력될 메시지
	       messages : {
	           me_email: {
	               required : "필수 정보입니다.",
	               regex : "메일규칙에 어긋납니다."
	           },
	           me_phoneNum: {
	           	required: "필수 정보입니다.",
	           		regex : "올바른 전화번호가 아닙니다."
	           },
	           me_gender: {
	           	required : "필수 정보입니다."
	           },
	           me_nickname: {
	           	 regex : "2~20자의 한글이나 영문 대ㆍ소문자만 사용 가능합니다."
	           }
	       }
		});
		$.validator.addMethod(
		    "regex",
		    function(value, element, regexp) {
		        var re = new RegExp(regexp);
		        return this.optional(element) || re.test(value);
		    },
		    "입력이 잘못되었습니다."
		);
	});
</script>
<script>
	/* 이미지를 클릭해서 이미지 변경하는 기능 */
	function setThumbnail(event) { 
		var reader = new FileReader(); 
		reader.onload = function(event) { 
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result); 
			document.querySelector("div#pre-image").appendChild(img); 
		};
		reader.readAsDataURL(event.target.files[0]);
		$('#pre-image').show();
	}
	$(function() {
		$('.fa-window-close').click(function(){
			$('#pre-image').hide();
			$('#pre-image img').remove();
			$('input[name=file]').val("");
		});
	});
</script>
</body>
</html>
