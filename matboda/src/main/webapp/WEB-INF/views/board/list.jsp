<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>

<html>
<head>
</head>
<body>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="board" varStatus="status">
					<tr>
						<td>${pm.totalCount - status.index - pm.criteria.pageStart}</td>
						
						<td>
							<a href="<%=request.getContextPath()%>/board${type}/detail?num=${board.bo_num}">
								${board.bo_title}
							</a>
						</td>
						<td>${board.bo_me_id}</td>
						<td>${board.dateTime}</td>
						<td>${board.bo_views}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<ul class="pagination justify-content-center">
			<c:if test="${pm.prev}">
		    	<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board${type}/list?page=${pm.startPage-1}">이전</a></li>
	    	</c:if>
	    	<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
	    		<li class="page-item <c:if test="${pm.criteria.page == index }">active</c:if>">
	    			<a class="page-link" href="<%=request.getContextPath()%>/board${type}/list?page=${index}">${index}</a>
	    		</li>
		    </c:forEach>
		    <c:if test="${pm.next}">
		    	<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board${type}/list?page=${pm.endPage+1}">다음</a></li>
		    </c:if>
		</ul>
		<c:if test="${user != null}">
			<c:if test="${(type eq '/notice' && (user.me_authority eq 'ADMIN' || user.me_authority eq 'SUPER ADMIN')) || (type ne '/notice')}">
				<a href="<%=request.getContextPath()%>/board${type}/register">
					<button class="btn btn-outline-success">글쓰기</button>
				</a>
			</c:if>
		</c:if>
	</div>
</body>
</html>
