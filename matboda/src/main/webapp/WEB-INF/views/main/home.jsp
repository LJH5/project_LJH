<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<style>
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	list-style: none;
}

.home-container {
	padding: 20px;
}

.body-container {
	max-width: 1300px;
	min-width: 900px;
	margin: 20px auto;
	position: relative;
}

.top3-box {
	padding: 20px;
	border: 2px solid rgb(255, 165, 0);
	font-size: 30px;
	text-align: center;
	color: rgb(255, 165, 0);
	box-sizing: border-box;

}
.top3-box .rank1 {
	position: relative;
}
.top3-box .top3 {
	margin-top: 20px;
	display: flex;
}

.top3-box .top3 .rank {
	width: calc(100%/ 3);
	height: 400px;
	margin-right: 20px;
	font-size: 20px;
}

.top3-box .top3 :nth-child(3) {
	margin-right: 0;
}
.top3-box .fa-crown {
    position: absolute;
    font-size: 45px;
    top: -5px;
    left: calc(50% - 25px);
    z-index: 2;
}
.top3 .rank {
	overflow: hidden;
	border: 2px solid rgb(255, 165, 0);
	box-sizing: border-box;
	text-align: left;
}

.top3 .rank img {
	width: 100%;
	height: 100%;
}


.top3 .rank  img {
	display: block;
	transition: transform 1s;
}

.top3 .rank:hover img {
	transform: scale(1.1);
}

.rank a:hover {
	text-decoration: none;
}

.rank .img-box {
	background-color: aqua;
	width: 100%;
	height: 310px;
	display: block;
	overflow: hidden;
}

.rank .rank-content {
	display: block;
	width: 100%;
	height: 100%;
	color: #555;
}

.rank .rt-content {
	display: block;
	height: 76px;
	padding: 0 10px;
}

.rt-content .content-top {
	display: block;
	height: 40px;
	font-size: 25px;
}

.rt-content .content-top span {
	float: left;
}

.rank .rt_name {
	margin-right: 10px;
	max-width: 200px;
	overflow: hidden;
	text-overflow: ellipsis;
	word-wrap: break-word;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
}
.rank .rt_score{
	font-weight: bold;
	color: rgb(255, 165, 0);
}
.rt-content .content-mid,
.rt-content .content-bot {
	display: block;
	font-size: 15px;
}

.body .report-box {
	width: 100%;
	height: 50px;
	border: 2px solid rgb(255, 165, 0);
	margin-top: 20px;
	box-sizing: border-box;
	line-height: 50px;
}

.report-box {
	height: 50px;
	margin: 10px 0;
	border: 2px solid rgb(255, 165, 0);
	box-sizing: border-box;
}

.report-box .report {
	width: 80px;
	height: 100%;
	line-height: 48px;
	text-align: center;
	border-right: 2px solid rgb(255, 165, 0);
	color: rgb(255, 165, 0);
	float: left;
}

.report-box .content {
	width: calc(100% - 80px);
	height: 100%;
	overflow: hidden;
	line-height: 48px;
	padding-left: 10px;
}

.report-box .content li {
	height: 100%;
}

.category-box {
	position: relative;
	margin-top: 40px;
	display: flex;
	left: 0px;
	right: 0px;
	padding: 50px 20px;
	border: 2px solid rgb(255, 165, 0);
	text-align: center;
	box-sizing: border-box;
}

.category-TOP10 {
	position: absolute;
	top: -30px;
	background: white;
	color: rgb(255, 165, 0);
	padding: 10px;
}

.category-box .category {
	width: calc(( 100% + 20px)/4);
	text-align: center;
}

.category-box .category-title {
	margin-right: 20px;
	font-size: 20px;
	color: rgb(255, 165, 0);
	height: 30px;
}

.swiper-slide {
	width: 100%;
	overflow: hidden;
}

.swiper-container {
	height: 300px;
	border: 2px solid rgb(255, 165, 0);
	margin-right: 20px;
	box-sizing: border-box;
	margin-bottom: 20px;
	overflow: hidden;
}

.swiper-container img {
	display: block;
	transition: transform 1s;
}

.swiper-container:hover img {
	transform: scale(1.1);
}

.after::after {
	clear: both;
	display: block;
	content: '';
}
</style>
</head>
<body>
	<div class="home-container">
		<div class="body-container">
			<div class="top3-container">
				<div class="top3-box">
					<div>명예의 전당 TOP3</div>
					<div class="rank1"><i class="fas fa-crown"></i></div>
					<div class="top3">
						<c:forEach items="${list}" var="rt">
							<div class="rank">
	                           <a href="<%=request.getContextPath()%>/restaurant/main/?num=${rt.rt_num}">
	                               <span class="rank-content">
	                                    <span class="img-box">
	                                        <c:choose>
												<c:when test="${rt.rt_im_name != null}"><img src="<%=request.getContextPath()%>/img/${rt.rt_im_name}"></c:when>
												<c:otherwise><img src="<%=request.getContextPath()%>/img/2021/08/23/5b251657-3c99-483d-bb10-0ffb33a45bbd_음식점 기본 이미지.PNG"></c:otherwise>
											</c:choose>
	                                    </span>
	                                    <span class="rt-content">
	                                        <span class="content-top after">
	                                            <span class="rt_name">${rt.rt_name}</span>
	                                            <span class="rt_score">${rt.rt_score}</span>
	                                        </span>
	                                        <span class="content-mid">
	                                            <span class="rt_address">${rt.rt_address}</span>
	                                        </span>
	                                        <span class="content-bot">
	                                            <span class="rt_type">${rt.rt_type}</span>
	                                        </span>
	                                    </span>
	                                </span>
	                            </a>
	                        </div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="report-container">
				<div class="report-box after">
					<div class="report">공지사항</div>
					<ul class="content">
						<li>공지1</li>
						<li>공지2</li>
						<li>공지3</li>
						<li>공지4</li>
					</ul>
				</div>
			</div>
			<div class="category-container">
				<div class="category-box">
					<div class="category-TOP10">
						<h1>카테고리 별 TOP 3</h1>
					</div>
					<div class="category">
						<div class="category-title">한식</div>
						<div class="swiper-container mySwiper">
							<div class="swiper-wrapper">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
							</div>
						</div>
						<div class="category-title">일식</div>
						<div class="swiper-container mySwiper">
							<div class="swiper-wrapper">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
							</div>
						</div>
					</div>
					<div class="category">
						<div class="category-title">치킨</div>
						<div class="swiper-container mySwiper">
							<div class="swiper-wrapper">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
							</div>
						</div>
						<div class="category-title">분식</div>
						<div class="swiper-container mySwiper">
							<div class="swiper-wrapper">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
							</div>
						</div>
					</div>
					<div class="category">
						<div class="category-title">양식/피자</div>
						<div class="swiper-container mySwiper">
							<div class="swiper-wrapper">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
							</div>
						</div>
						<div class="category-title">카페/디저트</div>
						<div class="swiper-container mySwiper">
							<div class="swiper-wrapper">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
							</div>
						</div>
					</div>
					<div class="category">
						<div class="category-title">중식</div>
						<div class="swiper-container mySwiper">
							<div class="swiper-wrapper">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
							</div>
						</div>
						<div class="category-title">브런치/버거/샌드위치</div>
						<div class="swiper-container mySwiper">
							<div class="swiper-wrapper">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
								<img class="swiper-slide" src="../JS수업/img/cat.jfif" alt="고양이">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var id1
		$(function() {
			id1 = rollingTop('.report-box .content', 'li', '-50', 500, 3000);
			$('.report-box .content').hover(
					function() {
						clearInterval(id1);
					},
					function() {
						id1 = rollingTop('.report-box .content', 'li', '-50',
								500, 3000);
					})
			$('.user-account').click(function() {
				$('.user-menu').toggle();
			})
		})
		var swiper = new Swiper(".mySwiper", {
			spaceBetween : 10,
			centeredSlides : true,
			autoplay : {
				delay : 5000,
				disableOnInteraction : false,
			},
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			}
		});
	</script>
</body>
</html>
