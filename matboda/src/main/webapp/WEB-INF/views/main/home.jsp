<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html>
<head>
<style>
	.item-list{
		list-style: none;	margin: 20px 0;	padding: 0;
	}
	.item-list::after{
		clear: both; content: ''; display: block;
	}
	.item-list .item{
		width:calc(100% / 3); float: left; text-align: center;
		box-sizing: border-box; padding : 0 10px;
	}
	.item-list .item span{
		display: block; width: 100%; margin-top: 5px; line-height: 20px; 
		height: 20px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;
	}
</style>
</head>
<body>
	<div class="container">
		<ul class="item-list">
			<li class="item">
				<a href="<%=request.getContextPath()%>/board/image/detail?num=${board.num}">
					<img alt="" src="<%=request.getContextPath()%>/resources/img${board.thumbnail.name}" width="100%" height="300">
					<span class="title">${rt.rt_name}</span>
				</a>
			</li>
		</ul>
	</div>
</body>
</html>
