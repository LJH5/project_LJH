<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
	
	<style type="text/css">
		.fa-thumbs-down{
			transform: rotateY(180deg);
		}
		re-btn{
			font-size: 30px;
		}
	</style>	
</head>
<body>
	<div class="container">
		<h1>게시판</h1>
		<div class="form-group">
			<label>제목</label>
			<input type="text" class="form-control" name="title" value="<c:out value="${board.title}"/>" readonly>
		</div>
		<div class="form-group">
			<label>작성자</label>
			<input type="text" class="form-control" name="writer" value="${board.writer}" readonly>
		</div>
		<div class="form-group">
			<label>작성일</label>
			<input type="text" class="form-control" name="registered" value="${board.dateTime}" readonly>
		</div>
		<div class="form-group">
			<label>조회수</label>
			<input type="text" class="form-control" name="views" value="${board.views}" readonly>
		</div>
		
		<div>
			<a href="#" class="re-btn up">
				<c:choose>
					<c:when test="${recommend != null && recommend.state == 1 }"><i class="fas fa-thumbs-up"></i></c:when>
					<c:otherwise><i class="far fa-thumbs-up"></i></c:otherwise>
				</c:choose>
			</a>
			<a href="#" class="re-btn down">
				<c:choose>
					<c:when test="${recommend != null && recommend.state == -1 }"><i class="fas fa-thumbs-down"></i></c:when>
					<c:otherwise><i class="far fa-thumbs-down"></i></c:otherwise>
				</c:choose>
			</a>
		</div>
		<div class="form-group">
			<label>내용</label>
			<div class="form-control" style="min-height:300px;">${board.contents}</div>
		</div>
		<c:if test="${fileList.size() != 0}">
			<div class="form-group">
				<label>첨부파일</label>
				<c:forEach items="${fileList}" var="file">
					<a href="<%=request.getContextPath()%>/board/download?fileName=${file.name}" class="form-control mb-2">${file.ori_name}</a>
				</c:forEach>
			</div>
		</c:if>
		<div class="reply form-group">
			<label>댓글</label>
			<div class="contents">
				<div class="reply-list">
				</div>
				<ul class="pagination justify-content-center">
				</ul>
				<div class="reply-box form-group">
					<textarea class="reply-input form-control mb-2"></textarea>
					<button type="button" class="reply-btn btn btn-outline-success">등록</button>
				</div>
			</div>
		</div>
		<div class="input-group">
			<a href="<%=request.getContextPath() %>/board/list" class="mr-2"><button class="btn btn-outline-success">목록</button></a>
			<c:if test="${board != null && user.id eq board.writer}"> <!-- eq는 == 와 같음 -->
				<a href="<%=request.getContextPath()%>/board/modify?num=${board.num}" class="mr-2"><button class="btn btn-outline-success">수정</button></a>
				<form action="<%=request.getContextPath()%>/board/delete" method="post" class="mr-2">
					<input type="hidden" value="${board.num}" name="num">
					<button class="btn btn-outline-danger">삭제</button>
				</form>
			</c:if>
		</div>
	</div>
	<script type="text/javascript">
	$(function(){
		var msg = '${msg}';
		printMsg(msg);
		history.replaceState({},null,null);
	})
	function printMsg(msg){
		if(msg == '' || history.state){
			return ;
		}
		alert(msg);
	}
	$(function(){
		$('.recommend-btn').click(function(e){
			e.preventDefault();
			var board = '${board.num}';
			var state = $(this).hasClass('up') ? 1 : -1;
			$.ajax({
				type:'get',
				url : '<%=request.getContextPath()%>/board/recommend/'+board +'/' +state,
				success : function(result, status, xhr){
					$('.recommend-btn i').removeClass('fas').addClass('far');
					if(result == 'UP'){
						alert('해당 게시글을 추천했습니다.');
						$('.recommend-btn.up i').addClass('fas');
					}else if(result == 'DOWN'){
						alert('해당 게시글을 비추천했습니다.');
						$('.recommend-btn.down i').addClass('fas');
					}else if(result == 'GUEST'){
						alert('추천/비추천을 하려면 로그인을 하세요.');
					}else if(result == 'CANCEL'){
						if(state == 1){
							alert('추천을 취소했습니다.')
						}else{
							alert('비추천을 취소했습니다.');
						}
					}
				},
				error : function(xhr, status, e){
					console.log('에러 발생');
				}
			})
		})
	})
	$(function(){
		$('.reply-btn').click(function(){
			var rp_bd_num = '${board.num}';
			var rp_me_id = '${user.id}';
			var rp_content = $('.reply-input').val();
			//console.log(rp_bd_num);
			//console.log(rp_me_id);
			//console.log(rp_content);
			if(rp_me_id == ''){
				alert('로그인이 필요한 서비스입니다.');
				return;
			}
			if(rp_content == ''){
				alert('내용을 작성해 주세요');
				return;
			}
			$.ajax({
				type:'post',
				url : '<%=request.getContextPath()%>/reply/ins',
				success : function(result, status, xhr){
				
				},
				error : function(xhr, status, e){
					console.log('에러 발생');
				}
			})
		})
	})
	</script>	
</body>
</html>
</body>
</html>
