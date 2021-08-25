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
								<select class="form-control" name="re_service">
									<option value=1>1</option>
									<option value=2>2</option>
									<option value=3>3</option>
									<option value=4>4</option>
									<option value=5>5</option>
								</select>
							</th>
							<th>
								<label>분위기</label>
								<select class="form-control" name="re_mood">
									<option value=1>1</option>
									<option value=2>2</option>
									<option value=3>3</option>
									<option value=4>4</option>
									<option value=5>5</option>
								</select>
							</th>
							<th>
								<label>청결</label>
								<select class="form-control" name="re_clean">
									<option value=1>1</option>
									<option value=2>2</option>
									<option value=3>3</option>
									<option value=4>4</option>
									<option value=5>5</option>
								</select>
							</th>
							<th>
								<label>맛</label>
								<select class="form-control" name="re_tasty">
									<option value=1>1</option>
									<option value=2>2</option>
									<option value=3>3</option>
									<option value=4>4</option>
									<option value=5>5</option>
								</select>
							</th>
							<th>
								<label>양</label>
								<select class="form-control" name="re_quantity">
									<option value=1>1</option>
									<option value=2>2</option>
									<option value=3>3</option>
									<option value=4>4</option>
									<option value=5>5</option>
								</select>
							</th>
						</tr>
					</thead>
				</table>
				 <input type="hidden" name="re_totalSc">
			<div class="review-box form-group">
				<textarea class="review-input form-control mb-2" placeholder="리뷰를 작성해주세요."></textarea>
				<div class="form-group files">
					<input type="file" name="fileList" class="form-control" id="image" accept="image/*" onchange="chk_file_type(this)" data=""/>
				</div>
				<a href="<%= request.getContextPath() %>/restaurant/main/?num=1"><button type="button" class="review-btn btn btn-outline-danger">취소</button></a>
				<button class="review-btn btn btn-outline-success">리뷰 올리기</button>
			</div>
		</div>
	</form>
</body>
	<script type="text/javascript">
	 $(function(){
		$(document).on('change', 'input[name=fileList]', function(){
			var val = $(this).val();
			var length = $('input[name=fileList]').length;
			var str = '<input type="file" name="fileList" class="form-control" id="image" accept="image/*" onchange="chk_file_type(this)" data="">';
			
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
			var service = $('[name=re_service]').val();
			var mood = $('[name=re_mood]').val();
			var clean = $('[name=re_clean]').val();
			var tasty = $('[name=re_tasty]').val();
			var quantity = $('[name=re_quantity]').val();
			var totalSc =  (service+mood+clean+tasty+quantity)/5
			$('[name=re_totalSc]').val(totalSc);
		})
	 })
	</script>
</html>