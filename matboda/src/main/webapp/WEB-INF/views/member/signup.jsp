<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js"></script>
<style>
	.signup-container .inner-container{
		width: 500px;
		margin: 0 auto;
		padding-top: 50px;
	}
	.signup-container .id-dup-btn{
		margin-top: 10px;
	}
</style>
</head>
<body>
	<form method="post" action="<%=request.getContextPath()%>/member/signup">
		<div class="signup-container">
			<div class="inner-container">
				<div class="form-group">
					<label for="id">아이디</label>
					<input type="text" class="form-control common" id="id" name="me_id">
					<div id="me_id-error" style="color: red;"></div>
					<div class="dup" style="color: red; display: none;">이미 가입된 아이디입니다.</div>
					<input type="hidden" name="idDup">
				</div>
				<div class="form-group">
					<label for="pw">비밀번호</label>
					<input type="password" class="form-control common" id="pw" name="me_pw">
					<div id="me_pw-error" style="color: red;"></div>
				</div>
				<div class="form-group">
					<label for="pwCheck">비밀번호 재확인</label>
					<input type="password" class="form-control" id="pwCheck" name="pwCheck">
					<div id="pwCheck-error" style="color: red;"></div>
				</div>
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" class="form-control common" id="name" name="me_name">
					<div id="me_name-error" style="color: red;"></div>
				</div>
				<div class="form-group">
					<label for="phoneNum">휴대전화</label>
					<input type="text" class="form-control common" id="phoneNum" name="me_phoneNum">
					<div id="me_phoneNum-error" style="color: red;"></div>
				</div>
				<div class="form-group">
					<label>생년월일</label>
					<div class="input-group">
						<input type="text" class="form-control col-4 mr-1" id="year" name="year" maxlength="4">
						<select name="month" id="month" class="form-control col-4 mr-1">
							<option value="">월</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>
						</select>
						<input type="text" class="form-control col-4" id="day" name="day" maxlength="2">
					</div>
					<div id="birthday-error" style="color: red;"></div>
				</div>
					
				<div class="form-group">
					<label for="gender">성별</label>
					<select class="form-control common" id="gender" name="me_gender">
						<option>선택안함</option>
						<option>남자</option>
						<option>여자</option>
					</select>
					<div id="me_gender-error" style="color: red;"></div>
				</div>
				<div class="form-group">
					<label for="email">본인 확인 이메일<span style="color:gray;font-size:10px">(선택)</span></label>
					<input type="text" class="form-control" id="email" name="me_email">
					<div id="me_email-error" style="color: red;"></div>
				</div>
				<input type="hidden" name="me_birthday">
				<button class="signup-btn btn btn-outline-success col-12">가입하기</button>
			</div>
		</div>
		
	</form>
	<script>
		var flag = true;	
	
		var emptyMessage = '필수 정보입니다.';
		var idRegex = /^[a-z0-9_-]{5,20}$/;
		var idRegexMessage = '5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.';
		var pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
		var pwRegexMessage = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
		var differentMessage = '비밀번호가 일치하지 않습니다.';
		var nameRegex = /^[가-힣a-zA-Z]+$/;
		var nameRegexMessage = '한글이나 영문 대ㆍ소문자만 사용 가능합니다.';
		var phoneNumRegex = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		var phoneNumRegexMessage = '올바른 전화번호가 아닙니다.';

		var regex = {
			'me_id':  /^[a-z0-9_-]{5,20}$/,
			'me_pw': /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/,
			'me_name': /^[가-힣a-zA-Z]+$/,
			'me_phoneNum' : /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/,
			'me_gender': null
		}
		var regexMessage = {
			'me_id': '5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.',
			'me_pw': '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.',
			'me_name': '한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)',
			'me_phoneNum' : '올바른 전화번호가 아닙니다.',
			'me_gender': null
		}
		$(function(){
			$('.common').on('change',function(){
				var name = $(this).attr('name');
				printRegexMessage(name,emptyMessage,regex[name],regexMessage[name]);
				
				var id = $('[name=me_id]').val();
				if(id == ''){
					alert('아이디를 입력하세요.');
					return;
				}
				var res = memberService.idCheck(contextPath, id);
				if(res){
					$('.dup').hide();
					flag = true;
				}
				else{
					$('.dup').show();
					flag = false;
				}
			})
			$('[name=pwCheck]').on('change',function(){
				pwConfirmCheck('me_pw','pwCheck',emptyMessage, differentMessage);
			})
			$('[name=year],[name=month],[name=day]').on('change',function(){
				birthdayCheck('year','month','day','birthday-error');
			})
			$('.signup-btn').on('click',function(e){
				//가입하기 버튼 클릭 시 form태그의 submit()이 동작하지 않도록 하기 위해서 추가
				if(!printRegexMessage('me_id',emptyMessage,idRegex,idRegexMessage)){
					flag = false;
				}
				if(!printRegexMessage('me_pw',emptyMessage,pwRegex,pwRegexMessage)){
					flag = false;
				}
				if(!pwConfirmCheck('me_pw','pwCheck',emptyMessage, differentMessage)){
					flag = false;
				}
				if(!printRegexMessage('me_name',emptyMessage,nameRegex,nameRegexMessage)){
					flag = false;
				}
				if(!printRegexMessage('me_phoneNum',emptyMessage,phoneNumRegex,phoneNumRegexMessage)){
					flag = false;
				}
				if(!printRegexMessage('me_gender',emptyMessage,null,null)){
					flag = false;
				}
				if(!birthdayCheck('year','month','day','birthday-error')){
					flag = false;
				}
				
				//생일 합치기
				var year = $('[name=year]').val();
				var month = $('[name=month]').val();
				if(month < 10){
					month = '0' + month;
				}
				var day = $('[name=day]').val();
				if(day < 10){
					day = '0' + day;
				}
				var birthday = year + month + day;
				$('[name=me_birthday]').val(birthday);

				return flag;
			})
		})
		/* 
		- 비밀번호 확인에 비어 있는지 또는 비밀번호와 일치하는지 확인 한 후 에러 메세지를
			화면에 보여주는 함수
		*/
		function pwConfirmCheck(pwName, pw2Name,emptyMessage,differentMessage){
			var pw2 = $('[name='+pw2Name+']').val();
			if(pw2 == ''){
				printRegexMessage(pw2Name,emptyMessage,null,null);
				return;
			}
			var pw = $('[name='+pwName+']').val();
			var str = '';
			if(pw != pw2){
				str = differentMessage;
			}
			$('#'+pw2Name+'-error').text(str);
			if(str == '')
				return true;
			return false;
		}
		/*
		- 년, 월, 일을 체크하여 에러 메세지를 화면에 보여주는 함수
		*/
		function birthdayCheck(yearName, monthName, dayName,errorId){
			var str = '';
			var year = $('[name='+yearName+']').val();
			var month = $('[name='+monthName+']').val();
			var day = $('[name='+dayName+']').val();
			var yearRegex = /^[0-9]{4}$/;
			var dayRegex = /^[0-9]{2}$/;
			if(!yearRegex.test(year)){
				str = '태어난 년도 4자리를 정확하게 입력하세요.';
			}else if(month == ''){
				str = '태어난 월을 선택하세요.';
			}else if(day == ''){
				str = '태어난 일(날짜) 2자리를 정확하게 입력하세요.';
			}else if(!isValidDate(year,month,day)){
				str = '생년월일을 다시 확인해주세요.';
			}else{
				var date = new Date();//현재 시간
				var date2 = new Date(year,month-1,day);//주어진 년월일로 만들어진 시간
				if(year <= 1921){
					str = '정말이세요?';
				}
				else if(date.getTime() < date2.getTime()){
					str = '미래에서 오셨군요. ^^';
				}
				else{
					str = '';
				}
			}
			$('#'+errorId).text(str);
			if(str == '')
				return true;
			return false;
		}
		/*
		- 년, 월, 일이 주어졌을 때 유효한 날짜인지 확인하는 함수
		*/
		function isValidDate(year, month, day){
			year = Number(year);
			month = Number(month);
			day = Number(day);
			if(isNaN(year) || isNaN(month) || isNaN(day)){
				return false;
			}
			var date = new Date(year, month-1, day);
			//월이 0~11이 아닌값이 들어가면 년도가 바뀜
			//일이 해당 월에 올바른 일이 아니면 월이 바뀜
			if(year != date.getFullYear() || month-1 != date.getMonth()){
				return false;
			}
			return true;
		}
		/* 
		- 입력태그(input,select,textarea등)의 name을 이용하여 정규 표현식을 확인하여
			에러 메세지를 화면에 보여주는 함수
		*/
		function printRegexMessage(name, emptyMessage, regex, regexMessage){
			var str = $('[name='+name+']').val();
			var message = check(str,emptyMessage,regex,regexMessage);
			$('#'+name+'-error').text(message);
			
			if(message == '' || message == null)
				return true;
			return false;
		}
		/* 
		- 주어진 문자열(str)이 빈 문자열이면 빈 문자열에 대한 문자열(emptyMessage)를 알려주고, 
			주어진 문자열이 정규표현식(regex)에 맞지 않으면 정규 표현식에 대한 
			문자열(regexMessage)을 알려주고
			아니면 빈 문자열을 알려주는 함수
		*/
		function check(str, emptyMessage, regex, regexMessage){
			if(str == null || str == '' || typeof str == 'undefined'){
				return emptyMessage;
			}
			if(regex == null || typeof regex == 'undefined' || !regex.test(str)){
				return regexMessage;
			}
			return '';
		}

		//아이디 중복 확인
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
