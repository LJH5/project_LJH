<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		.contanier{
			margin: 10px;
		}
		.table{
			height: 30px;
			line-height: 30px;
		}
		.star a{ 
			text-decoration: none; color: gray; 
		} 
		.star a.on{
			color: rgb(255, 165, 0); 
		}
		.img-wrap{
			width: 300px;
			margin-top: 50px;
		}
		.img-wrap img{
			max-width: 100%;
		}
		.review-input{
			resize: vertical;
			width: 600px;
		}
	</style>
</head>
<body>
	<form class="contanier" enctype="multipart/form-data" method="post" action="<%=request.getContextPath()%>/review/modify">
		<div>음식점에 대한 솔직한 리뷰 부탁드립니다.</div>
		<div class="contents">
			<div class="review-list form-group"></div>
			<ul class="pagination justify-content-center"></ul>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>
							<label>서비스</label>
							<P class="star service">
								<a href="#" value="1"><i class="fas fa-star"></i></a>
								<a href="#" value="2"><i class="fas fa-star"></i></a> 
								<a href="#" value="3"><i class="fas fa-star"></i></a> 
								<a href="#" value="4"><i class="fas fa-star"></i></a> 
								<a href="#" value="5"><i class="fas fa-star"></i></a> 
								<input type="hidden" name="re_service" value="${review.re_service}">
							</p>
						</th>
						<th>
							<label>분위기</label>
							<P class="star mood">
								<a href="#" value="1"><i class="fas fa-star"></i></a>
								<a href="#" value="2"><i class="fas fa-star"></i></a> 
								<a href="#" value="3"><i class="fas fa-star"></i></a> 
								<a href="#" value="4"><i class="fas fa-star"></i></a> 
								<a href="#" value="5"><i class="fas fa-star"></i></a>
								<input type="hidden" name="re_mood" value="${review.re_mood}"> 
							</p>
						</th>
						<th>
							<label>청결</label>
							<P class="star clean">
								<a href="#" value="1"><i class="fas fa-star"></i></a>
								<a href="#" value="2"><i class="fas fa-star"></i></a> 
								<a href="#" value="3"><i class="fas fa-star"></i></a> 
								<a href="#" value="4"><i class="fas fa-star"></i></a> 
								<a href="#" value="5"><i class="fas fa-star"></i></a>
								<input type="hidden" name="re_clean" value="${review.re_clean}">  
							</p>
						</th>
						<th>
							<label>음식맛</label>
							<P class="star tasty">
								<a href="#" value="1"><i class="fas fa-star"></i></a>
								<a href="#" value="2"><i class="fas fa-star"></i></a> 
								<a href="#" value="3"><i class="fas fa-star"></i></a> 
								<a href="#" value="4"><i class="fas fa-star"></i></a> 
								<a href="#" value="5"><i class="fas fa-star"></i></a>
								<input type="hidden" name="re_tasty" value="${review.re_tasty}">  
							</p>
						</th>
						<th>
							<label>음식량</label>
							<P class="star quantity">
								<a href="#" value="1"><i class="fas fa-star"></i></a>
								<a href="#" value="2"><i class="fas fa-star"></i></a> 
								<a href="#" value="3"><i class="fas fa-star"></i></a> 
								<a href="#" value="4"><i class="fas fa-star"></i></a> 
								<a href="#" value="5"><i class="fas fa-star"></i></a> 
								<input type="hidden" name="re_quantity" value="${review.re_quantity}">
								
							</p>
						</th>
					</tr>
				</thead>
			</table>
			<input type="hidden" name="re_totalSc">
			<input type="hidden" name="re_num" value="${review.re_num}">
			<input type="hidden" name="re_rt_num" value="${review.re_rt_num}">
			<div class="review-box form-group">
				<textarea class="review-input form-control mb-2" name="re_content" placeholder="리뷰를 작성해주세요.">${review.re_content}</textarea>
				<c:forEach items="${imageList}" var="image">
					<img src="<%=request.getContextPath() %>/img/${image.im_name}" style="width: 100px" height="100px">
					<div class="form-control">${iamge.im_oriName}<button type="button" class="del-btn">X</button></div>
				</c:forEach>
				<c:if test="${imageList == null || imageList.size() < 5}">
					<div class="form-group files">
						<input type="file" name="imageList" class="form-control" id="image" accept="image/*"onchange="chk_file_type(this)"/>
						<input type="hidden"name="imageNum" value="${image.im_num}">
					</div>
				</c:if>
				<a href="<%= request.getContextPath() %>/restaurant/main/?num=${num}"><button type="button" class="review-btn btn btn-outline-danger">취소</button></a>
				<button class="review-btn btn btn-outline-success">리뷰 올리기</button>
			</div>
		</div>
	</form>
	<script>
		$(function(){
			$('.del-btn').click(function(){
				var str = '<input type="file" class="form-control" name="file" data="">';
				$(this).parent().remove();
				if($('input[name=file]').length == 3)
					$('.files').append(str)
			})
			$('form').submit(function(){
				return true;
			})
			$(document).on('change', 'input[name=imageList]', function(){
				var val = $(this).val();
				var length = $('input[name=imageList]').length;
				var str = '<input type="file" name="imageList" class="form-control" id="image" accept="image/*" onchange="chk_file_type(this)">'+
						  '<input type="hidden"name="imageNum" value="${image.im_num}">';
				
				if(val == ''){
					$(this).remove();
					if(length == 5 && $('input[name=imageList]').last().val() != ''){
						$('.files').append(str);      
					}
				}else{
					if(length < 5){
						$('.files').append(str);
					}
				}
				
			})
			$(document).on('click', '.review-btn', function(){
				var service = parseInt($('input[name=re_service]').val());
				var mood = parseInt($('input[name=re_mood]').val());
				var clean = parseInt($('input[name=re_clean]').val());
				var tasty = parseInt($('input[name=re_tasty]').val());
				var quantity = parseInt($('input[name=re_quantity]').val());
				var totalSc = (service+mood+clean+tasty+quantity)/5
				$('[name=re_totalSc]').val(totalSc);
			})
			$('.star a').click(function(){ 
				console.log(123)
				$(this).parent().children("a").removeClass("on"); 
				$(this).addClass("on").prevAll("a").addClass("on");
				var sp = $(this).attr("value");
				$(this).siblings().last().val(sp);
			});
			var service = parseInt('${review.re_service}');
			$('.service a').each(function(index){
				if(index < service)
					$(this).addClass("on");
			})
			var mood = parseInt('${review.re_mood}');
			$('.mood a').each(function(index){
				if(index < mood)
					$(this).addClass("on");
			})
			var clean = parseInt('${review.re_clean}');
			$('.clean a').each(function(index){
				if(index < clean)
					$(this).addClass("on");
			})
			var tasty = parseInt('${review.re_tasty}');
			$('.tasty a').each(function(index){
				if(index < tasty)
					$(this).addClass("on");
			})
			var quantity = parseInt('${review.re_quantity}');
			$('.quantity a').each(function(index){
				if(index < quantity)
					$(this).addClass("on");
			})
		})	
	</script>
</body>
</html>