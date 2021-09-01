<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js"></script>
	
	<style type="text/css">
		.me_picture img{
			width: 200px;
			height: 200px;
			border-radius: 100%;
		}
	</style>
</head>
<body>

<form class="container" method="post" action="<%=request.getContextPath()%>/member/signup">
	<h1>Mypage</h1>
	<div class="me_picture">
		<c:choose>
			<c:when test="${user.me_picture == null || user.me_picture ==''}">
				<img src="/matboda/img/2021/08/30/b085dc96-3945-40fb-b974-eeed6408cf27_img.png" style="width: 180px;">
			</c:when>
			<c:otherwise>
				<img src="/matboda/img/${user.me_picture}">
			</c:otherwise>
		</c:choose>
	</div>
	<div class="me_nickname">
		<label>별명</label>
		<input type="text" class="form-control" name="me_nickname" readonly value="${user.me_nickname}">
	</div>
	<div class="me_name">
		<label>이름</label>
		<input type="text" class="form-control" name="me_name" readonly value="${user.me_name}">
	</div>
	<div class="me_email">
		<label>이메일</label>
		<input type="text" class="form-control" name="me_email" readonly value="${user.me_email}">
	</div>
	<div class="me_phoneNum">
		<label>전화번호</label>
		<input type="text" class="form-control" name="me_phoneNum" readonly value="${user.me_phoneNum}">
	</div>
	<a href="<%= request.getContextPath() %>/member/modify">
		<button type="button" class="btn btn-outline-success col-4">프로필 수정</button>
	</a>
	<button type="button" class="btn btn-outline-success col-4">비밀번호 번경</button>
	<button type="button" class="btn btn-outline-danger col-3 ml-4">회원탈퇴</button>
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
	                regex: /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/
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
	                regex : "메일규칙에 어긋납니다."
	            },
	            me_phoneNum: {
	            	required: "필수 정보입니다.",
	            		regex : "올바른 전화번호가 아닙니다."
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
