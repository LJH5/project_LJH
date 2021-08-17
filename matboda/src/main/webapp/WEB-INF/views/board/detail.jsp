<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>게시판</title>
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
		<div class="reply form-group">
			<label>댓글</label>
			<div class="contents">
				<div class="reply-list form-group"></div>
				<ul class="pagination justify-content-center"></ul>
				<div class="reply-box form-group">
					<textarea class="reply-input form-control mb-2" ></textarea>
					<button type="button" class="reply-btn btn btn-outline-success">등록</button>
				</div>
			</div>
		</div>
		<c:if test="${user != null && user.me_id == board.bo_me_id }">
			<a href="<%=request.getContextPath()%>/board${type}/modify?num=${board.bo_num}" style="text-decoration: none">
				<button class="btn btn-outline-success">수정</button>
			</a>
			<a href="<%=request.getContextPath()%>/board${type}/delete?num=${board.bo_num}" style="text-decoration: none">
				<button class="btn btn-outline-danger">삭제</button>
			</a>
		</c:if>
			
	</div>
</body>
</html>