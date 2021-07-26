<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>

</head>
<body>
	<div class="container">
		<div class="form-group">
			<input type="text" class="form-control" placeholder="이메일" name="email">
		</div>
		<button type="button" id="findIdBtn" class="btn btn-outline-success">아이디 찾기</button>
	</div>
	<script type="text/javascript">
		$(function(){
			$('#findIdBtn').click(function(){
				var email = $('[name=email]').val();
				//console.log(email);
				$.ajax({ //이메일은 '.'이 반드시 들어가서 post 방식으로 전송
					type: 'post', 
					data: {email: email},
					
					url: '<%=request.getContextPath()%>/find/id',
					success: function(res){
						//console.log(res);
						alert('가입된 아이디를 메일로 전송했습니다.');
					}
				})
			})
		})
	</script>
</body>
</html>
