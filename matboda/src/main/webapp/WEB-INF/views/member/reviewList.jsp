<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<style>
       *{
            margin: 0;
            padding: 0;
            list-style: none;
            text-decoration: none;
        }
        .reviewList-container{
        	width: 900px;
        	margin: 0 auto;
        }
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
        .bottom-container .main-title{
        	font-size: 50px;
		    color: rgb(255,165,0);
		    text-align: center;
		    margin-bottom: 25px;
        }
        .review-container .review-inner{
            display: flex;
        }
        .review-container .user-box{
            width: 150px;
        }
        .review-container .user-box .img-container{
            width: 110px;
            height: 110px;
            padding: 20px;
    		margin: 0 auto;
        }
        .review-container .user-box .img-box{
            width: 100%;
            height: 100%;
            border-radius: 100%;
    		box-shadow: 0px 1px 1px 1px #d9cece;
    		overflow: hidden;
        }
        .review-container .user-box .img-container img{
            width: 100%;
            height: 100%;
           
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
        .sc-box .sc-total a{
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
            text-align: left;
            z-index: 2;
            display: none;
        }
        .side-box .sc-detail .detail-box{
         	color: rgb(112, 112, 112);
        }
        .side-box span.star > * {
		    height: 16px; 
		    background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
		    width: 80px;
		    display: inline-block;
		}
		 
		.side-box span.star > * {
		    background-position: 0 0;
		    max-width:80px; 
		}
        .side-box .report-btn,
        .side-box .recommend-btn,
        .side-box .modify-box,
        .side-box .delete-box{
            font-size: 30px;
            text-align: center;
            color: rgb(112, 112, 112);
        }
        .side-box .delete-box a{
            color: rgb(112, 112, 112);
        }
        .side-box .report-btn:hover a,
        .side-box .recommend-btn:hover a{
        	cursor: default;
        }
        .side-box .delete-box:hover,
        .side-box .delete-box:hover a{
            color: rgb(206, 3, 3);
            cursor: pointer;
        }
        .side-box .recommend-btn a span,
        .side-box .report-btn a span,
        .side-box .delete-box div{
            font-size: 15px;
            font-weight: bold;
          	display: block;
        }
        .right-container{
            width: 25%;
        }
        .right-container .map{
            width: 450px;
            height: 450px;
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
        .block{
        	display: block;
        }
    </style>
</head>
<body>
	<div class="reviewList-container">
		<div class="inner-container">
			<div class="left-container" id="left-container">
				<div class="inner-box">
					<div class="bottom-container" id="bottom-container">
						<div class="main-title">'${user.me_nickname}'님의 리뷰's</div>
						<c:forEach items="${reviews}" var="review">
							<div class="review-container">
								<div class="review-inner">
									<div class="user-box">
										<div class="img-container">
											<div class="img-box">
												<c:choose>
													<c:when test="${user.me_picture == null || user.me_picture == ''}">
														<img src="<%=request.getContextPath()%>/img/2021/08/30/b085dc96-3945-40fb-b974-eeed6408cf27_img.png">
													</c:when>
													<c:otherwise>
														<img src="<%=request.getContextPath() %>/img/${user.me_picture}">
													</c:otherwise>
												</c:choose>
											</div>
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
										<div class="sc-box aPrevent">
											<div class="sc-total">
												<a href="#">
													<span class="totalSc block">${review.re_totalSc}</span>
													<span class="detail-btn block">상세<i class="fas fa-caret-down"></i></span>
												</a>
											</div>
											<a href="#"> 
												<span class="sc-detail after"> 
													<span class="detail-box">
														<span>친절함</span>
														<span class="star service">${review.re_service}</span> <br>
													</span>
													 <span class="detail-box"> 
													 	<span>분위기</span> 
													 	<span class="star mood">${review.re_mood}</span> <br>
													</span> 
													<span class="detail-box"> 
														<span>깨끗함</span> 
														<span class="star clean">${review.re_clean}</span> <br>
													</span> 
													<span class="detail-box"> 
														<span>음식맛</span> 
														<span class="star tasty">${review.re_tasty}</span> <br>
													</span> 
													<span class="detail-box"> 
														<span>음식량</span> 
														<span class="star quantity">${review.re_quantity}</span> <br>
													</span>
												</span>
											</a>
										</div>
										<div class="recommend-btn re-btn up aPrevent">
											<a href="#" style="color: rgb(255,165,0);"> 
												<i class="far fa-thumbs-up"></i>
												<span class="">맛잘알</span>
												<span>${review.re_recommend}</span>
											</a>
										</div>
										<div class="report-btn re-btn aPrevent">
											<a href="#" style="color: rgb(206, 3, 3);"> 
												<i class="fas fa-bullhorn"></i>
												<span>신고</span>
												<span>${review.re_report}</span>
											</a>
										</div>
										<div class="btn-box">
											<div class="delete-box">
												<i class="fas fa-trash-alt"></i>
												<div>삭제</div>
												<input class="re_num" type="hidden" value="${review.re_num}"> 
												<input class="rt_num" type="hidden" value="${review.re_rt_num}">
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<ul class="pagination justify-content-center">
					<c:if test="${pm.prev}">
						<li class="page-item"><a class="page-link"
							href="<%=request.getContextPath()%>/member/reviewList/?page=${pm.startPage-1}">이전</a></li>
					</c:if>
					<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
						<li
							class="page-item <c:if test="${pm.criteria.page == index }">active</c:if>">
							<a class="page-link"
							href="<%=request.getContextPath()%>/member/reviewList/?page=${index}">${index}</a>
						</li>
					</c:forEach>
					<c:if test="${pm.next}">
						<li class="page-item"><a class="page-link"
							href="<%=request.getContextPath()%>/member/reviewList/?page=${pm.endPage+1}">다음</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$('.sc-total').click(function(){
			    $(this).next().children().toggle();
			})
			$('.review-btn').click(function(){
				$(this).parent().submit();
			})
			
			// a 태그 클릭시 화면 이동 방지
			$('.aPrevent a').click(function(e) {
				e.preventDefault();
			})
			
			//리뷰 삭제
			var contextPath = '<%=request.getContextPath()%>';
			$(document).on('click','.delete-box',function() {
				var re_num = $(this).children('.re_num').val();
				var rt_num = $(this).children('.rt_num').val();
				var data = {
					re_num : re_num,
					rt_num : rt_num
				}
				$.ajax({
					type : 'post',
					url  : contextPath + '/review/delete',
					data : data,
					success : function(res) {
						if (res == 'OK') {
							alert('리뷰삭제 성공');
							location.reload();
						} else {
							alert('리뷰삭제 실패');
						}
					}
				})
			})
		})
	</script>
	<script>
		$.fn.generateStars = function() {
		    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
		};
		$('.star').generateStars();
	</script>
</body>
</html>
