<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>

<html>
<head>
 <style>
        *{
            margin: 0;
            padding: 0;
            list-style: none;
            text-decoration: none;
        }
        .container{
            margin-top: 50px;
            margin-left: 20px;
        }
        #title{
            font-size: 25px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        #title #score{
       		color: orange;
       	}
        .infBox{
            margin-bottom: 10px;
        }
        .infBox #reviewNum{
            margin-right: 20px;
        }
        .detail{
        	width: 600px;
            border-top: 1px solid rgba(194, 184, 184, 0.747);
            border-bottom: 1px solid rgba(194, 184, 184, 0.747);
            box-sizing: border-box;
            padding-top: 10px;
            position: relative;
        }
        .detail li{
            margin-bottom: 10px;
        }
        .detail li{
            color: rgb(112, 112, 112);
        }
        .content{
            position: absolute;
            left: 100px;
        }
        .btn-box{
        	border-bottom: 1px solid rgba(194, 184, 184, 0.747);
        }
    </style>
</head>
<body>
	<div>
		<c:forEach items="${imageList}" var="image">
			<img src="<%=request.getContextPath() %>/img/${image.im_name}" style="width: 100px" height="100px">
		</c:forEach>
	</div>
	<div class="container">
		<div id="title">
			${rt.rt_name} <span id="score">${rt.rt_score}</span>
		</div>
		<div class="infBox">
			<span id="reviewNum">리뷰수</span> <span id="favoritesNum">즐겨찾기수</span>
		</div>
		<form method="GET" action="<%=request.getContextPath()%>/review/register">
			<div>
				<input type="hidden" name="num" value="${rt.rt_num}">
				<button class="btn btn-outline-success">리뷰쓰기</button>
			</div>
		</form>
		<div class="detail">
			<ul>
				<li>주소 <span class="content">${rt.rt_address}</span></li>
				<li>전화번호 <span class="content">${rt.rt_phoneNum}</span></li>
				<li>음식종류 <span class="content">${rt.rt_type}</span></li>
				<li>영업시간 <span class="content">${rt.rt_openTime}</span></li>
			</ul>
			<div>
				<c:if test="${user != null && (user.me_id == rt.rt_me_id || user.me_authority == 'ADMIN' || user.me_authority == 'SUPER ADMIN')}">
					<a href="<%=request.getContextPath()%>/restaurant/modify?num=${rt.rt_num}" style="text-decoration: none">
						<button class="btn btn-outline-success">수정</button>
					</a>
					<a href="<%=request.getContextPath()%>/restaurant/delete?num=${rt.rt_num}" style="text-decoration: none">
						<button class="btn btn-outline-danger">삭제</button>
					</a>
				</c:if>
			</div>
		</div>
		<div id="review-box">
			<c:forEach items="${reviews}" var="review">
				<div class="review">
					<div>
						종합 ${review.re_totalSc}
						서비스 ${review.re_service}
						분위기 ${review.re_mood}
						청결함 ${review.re_clean}
						음식맛 ${review.re_tasty}
						음식량 ${review.re_quantity}
					</div>
						<img src="<%=request.getContextPath() %>/img/${review.re_me_picture}" style="width: 100px; height: 100px; border-radius: 100%" >
					<ul>
						<li>${review.re_me_nickname}</li>
						<li>${review.re_content}</li>
						<li>${review.re_upDateStr}</li>
					</ul>
				</div>
				<c:forEach items="${review.re_image}" var="img">
					<img src="<%=request.getContextPath() %>/img/${img.im_name}" style="width: 100px" height="100px">
				</c:forEach>
				<c:choose>
					<c:when test="${user.me_id != review.re_me_id}">
						<div class="btn-box">
							<button class="btn btn-outline-success">맛잘알</button>
							<button class="btn btn-outline-danger">신고</button>
						</div>
					</c:when>
					<c:otherwise>
						<div class="btn-box">
							<a href="<%= request.getContextPath() %>/review/modify?num=${review.re_num}">
								<button class="mod-btn btn btn-outline-success">수정</button>
							</a>
							<button class="del-btn btn btn-outline-danger">삭제</button>
							<input class="re_num" type="hidden" value="${review.re_num}">
							<input class="rt_num" type="hidden" value="${rt.rt_num}">
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<ul class="pagination justify-content-center">
			<c:if test="${pm.prev}">
		    	<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/restaurant/main/?num=${rt.rt_num}&page=${pm.startPage-1}">이전</a></li>
	    	</c:if>
	    	<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
	    		<li class="page-item <c:if test="${pm.criteria.page == index }">active</c:if>">
	    			<a class="page-link" href="<%=request.getContextPath()%>/restaurant/main/?num=${rt.rt_num}&page=${index}">${index}</a>
	    		</li>
		    </c:forEach>
		    <c:if test="${pm.next}">
		    	<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/restaurant/main/?num=${rt.rt_num}&page=${pm.endPage+1}">다음</a></li>
		    </c:if>
		</ul>
	</div>
	<script type="text/javascript">
		var contextPath = '<%=request.getContextPath()%>';
		var rt_num = ${rt.rt_num};
		$(document).on('click', '.del-btn', function(){
			var re_num = $(this).siblings('.re_num').val();
			var data = {
					re_num : re_num
				}
			$.ajax({
				type : 'post',
				url  : contextPath + '/review/delete',
				data : data,
				success : function(res){
					if (res == 'OK') {
						alert('리뷰삭제 성공');
						$('#review-box').load(contextPath + '/restaurant/main/?num='+rt_num+' #review-box');
					}else{
						alert('리뷰삭제 실패');
					}
				}
			})
		})
	</script>
</body>
</html>
