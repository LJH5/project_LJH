<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="container">
	<h1>회원관리</h1>
	<form method="get" action="<%=request.getContextPath()%>/admin/user/list">
		<div class="input-group mb-3">
			<input type="text" class="form-control" name="search" value="<c:out value="${pm.criteria.search}"/>" >
			<button class="search-btn btn btn-outline-dark">검색</button>
		</div>
	</form>
	<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>아이디</th>
					<th>
						<a href="<%=request.getContextPath()%>/admin/user/list?sortType=me_signupDate&sort=${pm.criteria.notSort}">
							<span>가입일</span> 
							<c:if test="${pm.criteria.sortType == 'me_signupDate' && pm.criteria.sort == 'desc'}">
								<i class="fas fa-sort-up"></i>
							</c:if> 
							<c:if test="${pm.criteria.sortType == 'me_signupDate' && pm.criteria.sort == 'asc'}">
								<i class="fas fa-sort-down"></i>
							</c:if>
						</a>
					</th>
					<th>
						<a href="<%=request.getContextPath()%>/admin/user/list?sortType=me_authority&sort=${pm.criteria.notSort}">
							<span>등급</span>
							<c:if test="${pm.criteria.sortType == 'me_authority' && pm.criteria.sort == 'asc'}">
								<i class="fas fa-sort-up"></i>
							</c:if> <c:if test="${pm.criteria.sortType == 'me_authority' && pm.criteria.sort == 'desc'}">
								<i class="fas fa-sort-down"></i>
							</c:if>
						</a>
					</th>
					<th>권한</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="member">    
					<tr id="uList">
						<td class="me_id">${member.me_id}</td>
						<td>${member.date}</td>
						<td>${member.authorityStr}</td>
						<td>
							<select class="form-control rank">
								<option value="USER" <c:if test="${member.me_authority == 'USER' }">selected</c:if>>회원</option>
								<c:if test="${user.me_authority == 'SUPER ADMIN' }">
									<option value="ADMIN" <c:if test="${member.me_authority == 'ADMIN' }">selected</c:if>>관리자</option>
								</c:if>
							</select>
						</td>
						<td><button type="submit" class="del-btn btn btn-outline-danger">회원삭제</button></td>
					</tr>
				</c:forEach>
		    </tbody>
	</table>
	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev}">
			<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/admin/user/list?page=${pm.startPage-1}&sortType=${pm.criteria.sortType}&sort=${pm.criteria.sort}">이전</a></li>
		</c:if>

		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
			<li class="page-item <c:if test="${pm.criteria.page == index }">active</c:if>"><a class="page-link" href="<%=request.getContextPath()%>/admin/user/list?page=${index}&sortType=${pm.criteria.sortType}&sort=${pm.criteria.sort}">${index}</a></li>
		</c:forEach>
	<c:if test="${pm.next}">
			<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/admin/user/list?page=${pm.endPage+1}&sortType=${pm.criteria.sortType}&sort=${pm.criteria.sort}">다음</a></li>
		</c:if>
	</ul>
</div>
<script type="text/javascript">
	var contextPath = '<%=request.getContextPath()%>';
	$(function(){
		$('.rank').change(function(){
			var authority = $(this).val();
			var id = $(this).parent().siblings().first().text();
			var data = {
				me_id : id,
				me_authority : authority
			}
			var obj = $(this).parent().siblings().eq(2);
			$.ajax({
				type : 'post',
				url  : contextPath + '/admin/user/mod',
				data : JSON.stringify(data),
				contentType : "application/json; charset=UTF-8",
				success : function(res){
					if(res == 'OK'){
						alert(id+"님의 등급이 변경되었습니다.");
						var str = authority == 'USER' ? '회원' : '관리자';
						obj.text(str);
					}
					else
						alert(id+"님의 등급 변경이 실패했습니다.");
				}
			})
		})
		$(document).on('click', '.del-btn', function(){
			var me_id = $(this).parent().siblings('.me_id').text();
			var data = {me_id: me_id};
			
			$.ajax({
				type : 'post',
				url  : contextPath + '/admin/user/del',
				data : data,
				success : function(res){
					if (res == 'OK') {
						alert('회원삭제 성공');
						//$('#uList').load("/matboda/admin/user/list #uList");
						location.reload();
					}else{
						alert('회원삭제 실패');
					}
				}
			})
		})
	})
</script>
</body>
</html>