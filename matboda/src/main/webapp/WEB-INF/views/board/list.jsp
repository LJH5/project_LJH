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
				<c:forEach items="${list}" var="board">
					<tr>
						<td>${board.bo_num}</td>
						
						<td>
							<a href="<%=request.getContextPath()%>/board/detail?num=${board.bo_num}">
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
		<a href="<%=request.getContextPath()%>/board/register">
			<button class="btn btn-outline-success">글쓰기</button>
		</a>
	</div>
</body>
</html>
