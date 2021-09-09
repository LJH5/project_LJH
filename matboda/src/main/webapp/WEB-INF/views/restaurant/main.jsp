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
            font-family: "고딕", "굴림" ,"돋움", sans-serif;
        }
        .swiper {
            min-width: 1400px;
            height: 300px;
            margin-bottom: 20px;
             box-shadow: 0 2px 4px 0 rgba(0,0,0,0.3);
        }
        .swiper-slide {
            background: rgb(130, 130, 130);
            /* Center slide text vertically */
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }

        .swiper-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        /* 상단 */
        .inner-container{
            min-width: 900px;
            display: flex;
        }
        .inner-container .left-container{
            width: calc(75% - 20px);
            min-width: 900px;
        }
        .left-container .inner-box{
            max-width: 900px;
            margin: 0 auto;
        }
        .left-container .top-container{
            padding: 10px;
            border-bottom: 1px solid rgba(160, 160, 160, 0.3);
        }
        .top-container .shop-head .fa-star{
            color: rgb(255, 165, 0);
            font-size: 50px;
        }
        .top-container .title{
            font-size: 30px;
            font-weight: bold;
            margin-bottom: 20px;
            display: flex;
        }
        .top-container .title .shop-box{
            width: 70%;
            font-size: 30px;
        }
        .top-container .title .btn-box{
            width: 30%;
            max-height: 110px;
            color: #404040;
        }
        .top-container .title .review-btn,
        .top-container .title .favorites-btn{
            text-align: center;
            float: right;
            margin-right: 10px;
        }
        .top-container .title .review-btn:hover,
        .top-container .title .favorites-btn:hover{
            color: rgb(255, 165, 0);
            cursor: pointer;
        }
        .top-container .title .btn-box i{
            font-size: 30px;
        }
        .top-container .review-text,
        .top-container .favorites-text{
            font-size: 20px;
        }
        .top-container .title .rt_score{
            color: rgb(255, 165, 0);
        }
        .top-container .inf-box{
            color: rgb(124, 124, 124);
        }
        .top-container .inf-box span{
            margin-right: 20px;
        }
        .top-container .inf-box i{
            margin-right: 5px;
        }
        
        /* 중단 */
        .left-container .middle-container{
            position: relative;
            border-bottom: 1px solid rgba(160, 160, 160, 0.3);
        }
        .middle-container .detail-box{
            box-sizing: border-box;
            padding: 10px;
        }
        .main-container .shop-inf{
            display: flex;
        }
        .main-container .shop-inf .inf-title{
            width: 10%;
        }
        .main-container .shop-inf .inf-content{
            width: 85%;
        }
        .middle-container .inf-content li{
            overflow: hidden;
            text-overflow: ellipsis;
            word-wrap: break-word;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
        }
        .middle-container .detail-box li{
            color: rgb(112, 112, 112);
            margin-bottom: 10px;
        }
        .middle-container .detail-box .btn-box{
            position:absolute;
            right: 5px;
            bottom: 5px;
        }
        
        /* 하단 */
         .left-container .bottom-container{
            padding: 10px;
        }
        .bottom-container .review-container{
            position: relative;
            min-height: 150px;
            border-bottom: 1px solid rgba(160, 160, 160, 0.3);
            padding-bottom: 30px;
            margin-bottom: 10px;
        }
        .review-container .review-inner{
            display: flex;
        }
        .review-container .user-box{
            width: 150px;
        }
        .review-container .user-box .img-box{
            width: 110px;
            height: 110px;
            padding: 20px;
    		margin: 0 auto;
        }
        .review-container .user-box .img-box img{
            width: 100%;
            height: 100%;
            border-radius: 100%;
        }
        .review-container .user-box .user-nickname{
            text-overflow: ellipsis;
            word-wrap: break-word;
            -webkit-line-clamp: 2;
            text-align: center;
            margin-bottom: 10px;
            color: rgb(112, 112, 112);
        }
        .review-container .user-box .user-inf{
            display: flex;
            font-size: 15px;
            color: rgb(112, 112, 112);
            text-align: center;
            width: 90px;
   			margin: 0 auto
        }
        .review-container .user-box .user-inf .review-num,
        .review-container .user-box .user-inf .recommend-num{
            width: 50%;
        }
        .review-container .review-box{
            width: 600px;
            padding: 5px;
        }
        .review-box .update{
            color: rgb(112, 112, 112);
            margin-bottom: 10px;
        }
        .review-box .re_content{
            width: 600px;
            font-size: 20px;
            white-space: pre-line;
            
        }
        .review-box pre{
        	font-size: 100%
        }
        .review-container .side-box{
            width: 130px;
            text-align: center;
        }
        .side-box .sc-box{
            margin-bottom: 10px;
        }
        .sc-box .sc-total a {
            color: rgb(255, 165, 0);
            font-size: 30px;

        }
        .sc-box .detail-btn{
            font-size: 15px;
            color: #404040;
            cursor: pointer;
            margin: 0 auto;
            width: 50px;
        }
        .sc-box:hover a{
            text-decoration: none;
            cursor: default;
        }
        .side-box .sc-detail{
            width: 170px;
            border-radius: 5%;
            border: 2px solid rgb(255, 165, 0);
            padding: 10px;
            position: absolute;
            right: 0;
            background-color: white;
            display: none;
            z-index: 2;
        }
        .side-box .sc-detail span{
            color: rgb(112, 112, 112);
        }
        .side-box .sc-detail .star{
            color: rgb(255, 165, 0);
        }
       .side-box .report-box,
        .side-box .recommend-box,
        .side-box .modify-box,
        .side-box .delete-box{
            font-size: 30px;
            text-align: center;
            color: rgb(112, 112, 112);
        }
        .side-box .report-box a,
        .side-box .recommend-box a,
        .side-box .modify-box a,
        .side-box .delete-box a{
            color: rgb(112, 112, 112);
        }
        .side-box .recommend-box:hover,
        .side-box .recommend-box:hover a,
        .side-box .modify-box:hover,
        .side-box .modify-box:hover a{
            color: rgb(255, 165, 0);
        }
        .side-box .report-box:hover,
        .side-box .report-box:hover a,
        .side-box .delete-box:hover,
        .side-box .delete-box:hover a{
            color: rgb(206, 3, 3);
        }
        .side-box .report-box div,
        .side-box .recommend-box div,
        .side-box .modify-box span,
        .side-box .delete-box div{
            font-size: 15px;
            font-weight: bold;
        }
        .right-container{
            width: 25%;
        }
        .right-container .map{
            width: 500px;
            height: 500px;
            background-color: lime;
        }
        .after::after{
            display: block;
            clear: both;
            content: '';
        }
        :hover a{
        	text-decoration: none
        }
        a span{
        	display: block;
        }
    </style>
</head>
<body>
	<div class="swiper mySwiper">
		<div class="swiper-wrapper">
			<c:forEach items="${imageList}" var="image">
				<div class="swiper-slide">
					<img src="<%=request.getContextPath() %>/img/${image.im_name}">
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="main-container">
		<div class="inner-container">
			<div class="left-container">
				<div class="inner-box">
					<div class="top-container">
						<div class="title">
							<div class="shop-box">
								<span class="rt_name">${rt.rt_name}</span> <span
									class="rt_score">${rt.rt_score}</span>
							</div>
							<div class="btn-box after">
								<div class="favorites-btn">
									<i class="far fa-star"></i>
									<div class="favorites-text">즐겨찾기</div>
								</div>
								<form method="GET"
									action="<%=request.getContextPath()%>/review/register">
									<div class="review-btn">
										<input type="hidden" name="num" value="${rt.rt_num}">
										<i class="fas fa-pen"></i>
										<div class="review-text">리뷰쓰기</div>
									</div>
								</form>
							</div>
						</div>
						<div class="inf-box">
							<span id="views"><i class="far fa-eye"></i>조회수</span> <span
								id="reviewNum"><i class="fas fa-pen"></i>리뷰수</span> <span
								id="favoritesNum"><i class="fas fa-star"></i>즐겨찾기수</span>
						</div>
					</div>
					<div class="middle-container">
						<div class="detail-box">
							<div class="shop-inf">
								<div class="inf-title">
									<ul>
										<li>주소</li>
										<li>전화번호</li>
										<li>음식종류</li>
										<li>영업시간</li>
									</ul>
								</div>
								<div class="inf-content">
									<ul>
										<li>${rt.rt_address}</li>
										<li>${rt.rt_phoneNum}</li>
										<li>${rt.rt_type}</li>
										<li>${rt.rt_openTime}</li>
									</ul>
								</div>
							</div>
							<div class="btn-box">
								<c:if
									test="${user != null && (user.me_id == rt.rt_me_id || user.me_authority == 'ADMIN' || user.me_authority == 'SUPER ADMIN')}">
									<a
										href="<%=request.getContextPath()%>/restaurant/modify?num=${rt.rt_num}">
										<button class="btn btn-outline-success">수정</button>
									</a>
									<a
										href="<%=request.getContextPath()%>/restaurant/delete?num=${rt.rt_num}">
										<button class="btn btn-outline-danger">삭제</button>
									</a>
								</c:if>
							</div>
						</div>
					</div>
					<div class="bottom-container">
						<c:forEach items="${reviews}" var="review">
							<div class="review-container">
								<div class="review-inner">
									<div class="user-box">
										<div class="img-box">
											<img
												src="<%=request.getContextPath() %>/img/${review.re_me_picture}">
										</div>
										<div class="user-nickname">${review.re_me_nickname}</div>
										<div class="user-inf">
											<div class="review-num">
												<i class="fas fa-pen"></i>
												<div>999+</div>
											</div>
											<div class="recommend-num">
												<i class="fas fa-thumbs-up"></i>
												<div>999+</div>
											</div>
										</div>
									</div>
									<div class="review-box">
										<div class="update">${review.re_upDateStr}</div>
										<pre class="content">${review.re_content}</pre>
										<div class="image-box">
											<c:forEach items="${review.re_image}" var="img">
												<img src="<%=request.getContextPath() %>/img/${img.im_name}"
													style="width: 100px" height="100px">
											</c:forEach>
										</div>
									</div>
									<div class="side-box">
										<div class="sc-box">
											<div class="sc-total aPrivent">
												<a href="#"> 
													<span class="totalSc">${review.re_totalSc}</span>
													<span class="detail-btn">상세<i class="fas fa-caret-down"></i></span>
												</a>
											</div>
											<a href="#"> 
											<span class="sc-detail"> 
												<span>
													<span>친절함</span> <span class="star">★★★★★</span>
												</span>
												 <span> 
												 	<span>분위기</span> 
												 	<span class="star">★★★★★</span>
												</span> 
												<span> 
													<span>깨끗함</span> 
													<span class="star">★★★★★</span>
												</span> 
												<span> 
													<span>음식맛</span> 
													<span class="star">★★★★★</span>
												</span> 
												<span> 
													<span>음식량</span> 
													<span class="star">★★★★★</span>
												</span>
											</span>
											</a>
										</div>
										<c:choose>
											<c:when test="${user.me_id != rt.rt_me_id}">
												<div class="recommend-box aPrivent">
													<a href="#"> <i class="far fa-thumbs-up"></i>
													</a>
													<div>맛잘알</div>
												</div>
												<div class="report-box aPrivent">
													<a href="#"> <i class="fas fa-bullhorn"></i>
													</a>
													<div>신고</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="btn-box">
													<div class="modify-box">
														<a href="<%= request.getContextPath() %>/review/modify?num=${review.re_num}">
															<i class="fas fa-pen"></i>
															<span>수정</span>
														</a>
													</div>
													<div class="delete-box">
														<i class="fas fa-trash-alt"></i>
														<div class="del-btn">삭제</div>
														<input class="re_num" type="hidden"value="${review.re_num}"> 
														<input class="rt_num" type="hidden" value="${rt.rt_num}">
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<ul class="pagination justify-content-center">
					<c:if test="${pm.prev}">
						<li class="page-item"><a class="page-link"
							href="<%=request.getContextPath()%>/restaurant/main/?num=${rt.rt_num}&page=${pm.startPage-1}">이전</a></li>
					</c:if>
					<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
						<li
							class="page-item <c:if test="${pm.criteria.page == index }">active</c:if>">
							<a class="page-link"
							href="<%=request.getContextPath()%>/restaurant/main/?num=${rt.rt_num}&page=${index}">${index}</a>
						</li>
					</c:forEach>
					<c:if test="${pm.next}">
						<li class="page-item"><a class="page-link"
							href="<%=request.getContextPath()%>/restaurant/main/?num=${rt.rt_num}&page=${pm.endPage+1}">다음</a></li>
					</c:if>
				</ul>
			</div>
			<div class="right-container">
				<div class="map"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$('.review-btn').click(function(){
				$(this).parent().submit();
			})
			$('.aPrivent').click(function(e) {
				e.preventDefault();
			})
			$(document).on('click', '.sc-total', function(){
			    $(this).siblings().children().first('.sc-detail').toggle();
			})
			var contextPath = '<%=request.getContextPath()%>';
			var rt_num = ${rt.rt_num};
			$(document).on('click','.del-btn',function() {
				var re_num = $(this).siblings('.re_num').val();
				var data = {
					re_num : re_num
				}
				$.ajax({
					type : 'post',
					url  : contextPath + '/review/delete',
					data : data,
					success : function(res) {
						if (res == 'OK') {
							alert('리뷰삭제 성공');
							$('#review-box').load(contextPath+ '/restaurant/main/?num='+ rt_num + ' #review-box');
						} else {
							alert('리뷰삭제 실패');
						}
					}
				})
			})
			var contextPath = '	<%=request.getContextPath()%>
		/review';
			var review = $(this).parent().children().last().val();
			var state = $(this).hasClass('up') ? 1 : 0;
			$.ajax({
				type : 'get',
				url : contextPath + '/recommend/' + review + '/' + state,
				success : function(result, status, xhr) {
					$('.recommend-btn i').removeClass('fas').addClass('far');
					if (result == 'UP') {
						alert('해당 게시글을 추천했습니다.');
						$('.recommend-btn.up i').addClass('fas');
					} else if (result == 'GUEST') {
						alert('추천을 하려면 로그인을 하세요.');
					} else if (result == 'CANCEL') {
						alert('추천을 취소했습니다.')
					}
				},
				error : function(xhr, status, e) {
					console.log('에러 발생');
				}
			})
		})
	</script>
	<script>
		var swiper = new Swiper(".mySwiper", {
			slidesPerView: 5,
			spaceBetween: -1,
			slidesPerGroup: 1,
			grabCursor: true,
			loop: true,
			loopFillGroupWithBlank: false,
			autoplay: {
				delay: 2500,
				disableOnInteraction: false,
			},
			pagination: {
				el: ".swiper-pagination",
				clickable: true,
			}
		});
	</script>
</body>
</html>
