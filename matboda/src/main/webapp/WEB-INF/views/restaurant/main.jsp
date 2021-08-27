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
    </style>
</head>
<body>
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
				<c:if
					test="${user != null && (user.me_id == rt.rt_me_id || user.me_authority == 'ADMIN' || user.me_authority == 'SUPER ADMIN')}">
					<a href="<%=request.getContextPath()%>/restaurant/modify?num=${rt.rt_num}" style="text-decoration: none">
						<button class="btn btn-outline-success">수정</button>
					</a>
					<a href="<%=request.getContextPath()%>/restaurant/delete?num=${rt.rt_num}" style="text-decoration: none">
						<button class="btn btn-outline-danger">삭제</button>
					</a>
				</c:if>
			</div>
		</div>
		<div class="review-box">
			<c:forEach items="${review}" var="review">
				<div class="revierw">
					${review.re_me_nickname}
					${review.re_content}
					${review.re_upDateStr}
				</div>
				<div class="btn-box">
					<button class="btn btn-outline-success">맛잘알</button>
					<button class="btn btn-outline-danger">신고</button>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
