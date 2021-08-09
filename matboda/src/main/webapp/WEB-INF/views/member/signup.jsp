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
	</style>
</head>
<body>

<form class="container" method="post" action="<%=request.getContextPath()%>/member/signup">
	<h1>회원가입</h1>
	<div class="form-group">
		<label>아이디</label>
		<input type="text" class="form-control" name="me_id" id="me_id">
	</div>
		<button type="button" class="id-dup-btn btn btn-outline-success col-12">아이디 중복 검사</button>
	<div class="form-group">
		<label>비밀번호</label>
		<input type="password" class="form-control" name="me_pw" id="me_pw">
	</div>
	<div class="form-group">
		<label>비밀번호 확인</label>
		<input type="password" class="form-control" name="me_pwCheck">
	</div>
	<div class="form-group">
		<label>이름</label>
		<input type="text" class="form-control" name="me_name">
	</div>
	<div class="form-group">
		<label>별명</label>
		<input type="text" class="form-control" name="me_nickname">
	</div>
	<div class="form-group">
		<label>프로필 사진</label>
			<input type="text" class="form-control" name="me_picture">
	</div>
	<div class="form-group">
		<label>이메일</label>
		<input type="email" class="form-control" name="me_email">
	</div>
	<div class="form-group">
		<label>전화번호</label>
		<input type="text" class="form-control" name="me_phoneNum">
	</div>
	<div class="form-group">
		<label>성별</label>
		<select class="form-control" name="me_gender">
			<option value="N">선택안함</option>
			<option value="M">남성</option>
			<option value="F">여성</option>
		</select>
	</div>
	<input type="hidden" name="idDup">
	<button class="btn btn-outline-success col-12">회원가입</button>
</form>
<script type="text/javascript">
	$(function(){
	    $("form").validate({
	        rules: {
	            me_id: {
	                required : true,
	                regex : /^[a-z0-9_-]{5,20}$/
	            },
	            me_pw: {
	                required : true,
	                regex: /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/
	            },
	            me_pwCheck: {
	                required : true,
	                equalTo : me_pw
	            },
	            me_name: {
	                required : true,
	                regex: /^[가-힣a-zA-Z]+$/
	            },
	            me_email: {
	                required : true,
	                email : true
	            },
	            me_phoneNum: {
	            	required : true,
	            	regex: /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/
	            },
	            me_gender: {
	            	required : true
	            },
	        },
	        //규칙체크 실패시 출력될 메시지
	        messages : {
	            me_id: {
	                required : "필수 정보입니다.",
	                regex : "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다."
	            },
	            me_pw: {
	                required : "필수 정보입니다.",
	                regex : "8~16자 영문 대ㆍ소문자, 숫자, 특수문자를 사용하세요."
	            },
	            me_pwCheck: {
	                required : "필수 정보입니다.",
	                equalTo : "비밀번호와 일치하지 않습니다."
	            },
	            me_name: {
	                required : "필수 정보입니다.",
	                regex: "한글이나 영문 대ㆍ소문자만 사용 가능합니다."
	            },
	            me_email: {
	                required : "필수 정보입니다.",
	                email : "메일규칙에 어긋납니다."
	            },
	            me_phoneNum: {
	            	required: "필수 정보입니다."
	            },
	            me_gender: {
	            	required : "필수 정보입니다."
	            }
	        }
	    });
		$(document).on('click', '.id-dup-btn', function(){
        	var id = $('[name=me_id]').val();
        	console.log(id)
			if(id == ''){
				alert('아이디를 입력하세요.');
				return;
			}
        	var res = memberService.idCheck(contextPath, id);
        	if(res)
        		alert('사용 가능한 아이디입니다.')
        	else
        		alert('이미 가입된 아이디입니다.')
   		})
	})
	$.validator.addMethod(
	    "regex",
	    function(value, element, regexp) {
	        var re = new RegExp(regexp);
	        return this.optional(element) || re.test(value);
	    },
	    "입력이 잘못되었습니다."
	);
	var contextPath = '<%=request.getContextPath()%>';
	var memberService = (function(){
		function idCheck(contextPath, id){
			var flag = false;
			$.ajax({
				async: false,
	    		type : 'post',
	    		url  : contextPath + '/member/id/check',
	    		data : {id : id},
	    		success : function (res){
	    			if(res == 'OK'){
	    				flag = true;
	    			}else{
	    				flag = false;
	    			}
	    		}
	    	})
	    	return flag;
		}
		return {
			name : 'memberService',
			idCheck : idCheck
		}
	})();
</script>
</body>
</html>
