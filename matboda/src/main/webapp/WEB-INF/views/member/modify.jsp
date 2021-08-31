<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js"></script>
	<style>
		.error{
			color : red
		}
		.img-box{
			background: green;
			width: 200px;
			height: 200px;
			border-radius: 100%;
			overflow: hidden;
		}
		.img-box img{
			width: 200px;
			height: 200px;
		}
	</style>
</head>
<body>

<form class="container" method="post" action="<%=request.getContextPath()%>/member/modify">
	<h1>프로필 수정</h1>
	<div class="form-group img-box">
		<label  class="me_picture" for="me_picture">
			<img src="/matboda/img/2021/08/31/ebd346-df82-45b1-9b4f-d4c1f72364eb_img">
		</label>
		<input type="file" name="me_picture" id="me_picture" style="display: none;"/>
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
	<button class="btn btn-outline-success col-12">수정하기</button>
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
</script>
</body>
</html>
