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
		#star a{ 
			text-decoration: none; color: gray; 
		} 
		#star a.on{
			color: rgb(255, 165, 0); 
		}

	</style>
</head>
<body>
	<form class="contanier" method="post" action="<%=request.getContextPath()%>/review/register">
		<div>음식점에 대한 솔직한 리뷰 부탁드립니다.</div>
		<div class="contents">
			<div class="review-list form-group"></div>
			<ul class="pagination justify-content-center"></ul>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>
								<label>서비스</label>
								<P id="star">
									<a href="#" value="1"><i class="fas fa-star"></i></a>
									<a href="#" value="2"><i class="fas fa-star"></i></a> 
									<a href="#" value="3"><i class="fas fa-star"></i></a> 
									<a href="#" value="4"><i class="fas fa-star"></i></a> 
									<a href="#" value="5"><i class="fas fa-star"></i></a> 
									<input type="hidden" name="re_service">
								<p>
							</th>
							<th>
								<label>분위기</label>
								<P id="star">
									<a href="#" value="1"><i class="fas fa-star"></i></a>
									<a href="#" value="2"><i class="fas fa-star"></i></a> 
									<a href="#" value="3"><i class="fas fa-star"></i></a> 
									<a href="#" value="4"><i class="fas fa-star"></i></a> 
									<a href="#" value="5"><i class="fas fa-star"></i></a>
									<input type="hidden" name="re_mood"> 
								<p>
							</th>
							<th>
								<label>청결</label>
								<P id="star">
									<a href="#" value="1"><i class="fas fa-star"></i></a>
									<a href="#" value="2"><i class="fas fa-star"></i></a> 
									<a href="#" value="3"><i class="fas fa-star"></i></a> 
									<a href="#" value="4"><i class="fas fa-star"></i></a> 
									<a href="#" value="5"><i class="fas fa-star"></i></a>
									<input type="hidden" name="re_clean">  
								<p>
							</th>
							<th>
								<label>맛</label>
								<P id="star">
									<a href="#" value="1"><i class="fas fa-star"></i></a>
									<a href="#" value="2"><i class="fas fa-star"></i></a> 
									<a href="#" value="3"><i class="fas fa-star"></i></a> 
									<a href="#" value="4"><i class="fas fa-star"></i></a> 
									<a href="#" value="5"><i class="fas fa-star"></i></a>
									<input type="hidden" name="re_tasty">  
								<p>
							</th>
							<th>
								<label>양</label>
								<P id="star">
									<a href="#" value="1"><i class="fas fa-star"></i></a>
									<a href="#" value="2"><i class="fas fa-star"></i></a> 
									<a href="#" value="3"><i class="fas fa-star"></i></a> 
									<a href="#" value="4"><i class="fas fa-star"></i></a> 
									<a href="#" value="5"><i class="fas fa-star"></i></a> 
									<input type="hidden" name="re_quantity"> 
								<p>
							</th>
						</tr>
					</thead>
				</table>
				<input type="hidden" name="re_totalSc">
				<input type="hidden" name="re_rt_num" value="${num}">
			<div class="review-box form-group">
				<textarea class="review-input form-control mb-2" name="re_content" placeholder="리뷰를 작성해주세요.">${review.re_content}</textarea>
				<div class="form-group files">
					<input type="file" name="fileList" class="form-control" id="image" accept="image/*" onchange="chk_file_type(this)"/>
				</div>
				<a href="<%= request.getContextPath() %>/restaurant/main/?num=${num}"><button type="button" class="review-btn btn btn-outline-danger">취소</button></a>
				<button class="review-btn btn btn-outline-success">리뷰 올리기</button>
			</div>
		</div>
	</form>
	<script>
		 $(function(){
			$('form').submit(function(){
				return true;
			})
			$(document).on('change', 'input[name=fileList]', function(){
				var val = $(this).val();
				var length = $('input[name=fileList]').length;
				var str = '<input type="file" name="fileList" class="form-control" id="image" accept="image/*" onchange="chk_file_type(this)">';
				
				if(val == ''){
					$(this).remove();
					if(length == 5 && $('input[name=fileList]').last().val() != ''){
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
			$('#star a').click(function(){ 
				$(this).parent().children("a").removeClass("on"); 
				$(this).addClass("on").prevAll("a").addClass("on");
				var sp = $(this).attr("value");
				$(this).siblings().last().val(sp);
			});
		 })	
	</script>
</body>
</html>