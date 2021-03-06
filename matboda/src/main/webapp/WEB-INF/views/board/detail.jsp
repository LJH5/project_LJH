<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/reply.js"></script>
	<style>
		.recommend-btn{
			font-size: 30px;
		}
		.fa-thumbs-down{
			transform : rotateY(180deg);
		}
	</style>
</head>
<body>
	<div class="container">
		<h1>게시판</h1>
		<div class="form-group">
			<label>제목</label>
			<input type="text" class="form-control" name="bo_title" value="<c:out value="${board.bo_title}"/>" readonly>
		</div>
		<div class="form-group">
			<label>작성자</label>
			<input type="text" class="form-control" name="bo_me_id" value="${board.bo_me_id}" readonly>
		</div>
		<div class="form-group">
			<label>작성일</label>
			<input type="text" class="form-control" name="bo_regdate" value="${board.dateTime}" readonly>
		</div>
		<div class="form-group">
			<label>조회수</label>
			<input type="text" class="form-control" name="bo_views" value="${board.bo_views}" readonly>
		</div>

		<div class="form-group">
			<label>내용</label>
			<div class="form-control" style="min-height:400px;">${board.bo_content}</div>
		</div>
		<div class="form-group">
			<c:forEach items="${fList}" var="image">
				<label>첨부파일</label>
				<a class="form-control" href="<%=request.getContextPath()%>/board${type}/download?fileName=${image.im_name}">${image.im_oriName}</a>
			</c:forEach>
		</div>
		<c:if test="${board.bo_type != 'NOTICE' }">
			<div class="reply form-group">
			<label>댓글</label>
			<div class="contents">
				<div class="reply-list form-group"></div>
				<ul class="pagination justify-content-center"></ul>
				<div class="reply-box form-group">
					<textarea class="reply-input form-control mb-2" ></textarea>
					<button type="button" class="reply-btn btn btn-outline-success">댓글 등록</button>
				</div>
			</div>
		</div>
		</c:if>
		<c:if test="${user != null && user.me_id == board.bo_me_id }">
			<a href="<%=request.getContextPath()%>/board${type}/modify?num=${board.bo_num}" style="text-decoration: none">
				<button class="btn btn-outline-success">수정</button>
			</a>
			<a href="<%=request.getContextPath()%>/board${type}/delete?num=${board.bo_num}" style="text-decoration: none">
				<button class="btn btn-outline-danger">삭제</button>
			</a>
		</c:if>
		<a href="<%=request.getContextPath()%>/board${type}/list" style="text-decoration: none">
			<button class="btn btn-outline-success">목록</button>
		</a>	
	</div>
	
<script type="text/javascript">
	var rp_bo_num = '${board.bo_num}';
	var rp_me_id = '${user.me_id}';
	var contextPath = '<%=request.getContextPath()%>';
	$(function(){
		$('.reply-btn').click(function(){
			if(rp_me_id == ''){
				alert('로그인을 하세요.');
				return;
			}
			var rp_content = $('.reply-input').val();
			var data = {
					rp_bo_num:rp_bo_num, rp_content:rp_content
			}
			replyService.add(contextPath, data, addOk, listOk);
			$('.reply-input').val('');
		})
		$(document).on('click','.reply .pagination li', function(){
			var page = $(this).attr('data-page');
			replyService.list(contextPath, {page : page, rp_bo_num: rp_bo_num}, listOk);
		})
		$(document).on('click','.reply-mod-btn', function(){
			var rp_content = $(this).parent().siblings('.reply-content').text();
			
			$('.reply .reply-content').each(function(){
				var rp_content = $(this).text();
				var str = '<div class="form-control reply-content">'+rp_content+'</div>';
				$(this).before(str);
				$(this).remove();
				$('.reply .reply-ok-btn').remove();
				$('.reply .reply-mod-btn').show();
			})
			
			$(this).parent().siblings('.reply-content').remove();
			var str = '<textarea class="form-control reply-content">'+rp_content+'</textarea>'
			$(this).parent().before(str);
			$(this).hide();
			str = '<button class="btn btn-outline-success reply-ok-btn">등록</button>';
			$(this).before(str);		
		})
		$(document).on('click','.reply-ok-btn', function(){
			var rp_num = $(this).siblings('.rp_num').val();
			var rp_content = $(this).parent().siblings('.reply-content').val();
			var page = $('.reply .pagination .active a').html();
			var data = {
					rp_num     : rp_num, 
					rp_content : rp_content,
					rp_bo_num  : rp_bo_num,
					page       : page
			}
			replyService.mod(contextPath, data, responseOk ,listOk );
		});
		$(document).on('click','.reply-del-btn', function(){
			var rp_num = $(this).siblings('.rp_num').val();
			var data = {rp_num : rp_num, rp_bo_num : rp_bo_num};
			replyService.del(contextPath, data, responseOk, listOk);
			
		});
		replyService.list(contextPath, {page : 1, rp_bo_num: rp_bo_num}, listOk);
	})
	function responseOk(res, str){
		if(res == 'OK')
			alert('댓글이 '+str+' 되었습니다.');
		else
			alert('댓글 '+str+'에 실패했습니다.');
	}
	function listOk(res){
		var list = res.list;
		var str = '';
		for(i = 0; i<list.length; i++){
			str +=
				'<div class="input-group">'+
					'<div class="input-group-prepend">'+
			        	'<span class="input-group-text">'+list[i].rp_me_id+'</span>'+
				    '</div>'+
					'<div class="form-control reply-content">'+list[i].rp_content+'</div>'+
					'<div class="input-group-append">';
						if(list[i].rp_me_id == rp_me_id){
							str += 
							'<button class="btn btn-outline-success reply-mod-btn">수정</button>'+
						    '<button class="btn btn-outline-danger reply-del-btn">삭제</button>'+
						    '<input type="hidden" class="rp_num" value="'+list[i].rp_num+'">'
						}
					str +=
					'</div>'+
				'</div>'
		}
		$('.reply-list').html(str);
		str ='';
		var pm = res.pm;
		if(pm.prev)
			str += '<li class="page-item" data-page="'+(pm.startPage-1)+'"><a class="page-link" href="javascript:void(0);">이전</a></li>'
		for(i=pm.startPage; i<=pm.endPage; i++){
			if(pm.criteria.page != i)
				str += '<li class="page-item" data-page="'+i+'"><a class="page-link" href="javascript:void(0);">'+i+'</a></li>'
			else
				str += '<li class="page-item active" data-page="'+i+'"><a class="page-link" href="javascript:void(0);">'+i+'</a></li>'
		}
		if(pm.next)
			str += '<li class="page-item" data-page="'+(pm.endPage+1)+'"><a class="page-link" href="javascript:void(0);">다음</a></li>'
		$('.pagination').html(str);
	}
</script>
</body>
</html>