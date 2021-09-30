<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<style>
	.search-container .notSearch-container{
		height: 700px;
		width: 800px;
		margin: 0 auto;
		margin-top: 70px;
	}
	.search-container .notSearch-container h1{
		margin-bottom: 30px;
	}
	.search-container .register-link{
		font-size: 50px;
	}
	.search-container .register-link:hover{
		color: rgb(255, 165, 0);
	}
	.search-container .onSearch-container{
		display: flex;
		margin-bottom: 20px;
	}
	.search-container .left-container{
		min-height: 400px;
		width: 930px;
		margin: 0 auto;
		padding: 10px;
	}
	.search-container .left-container h2{
		color: rgb(255, 165, 0);
		margin-bottom: 20px;
	}
	.left-container .shop-container{
		width: 930px;
	}
	.left-container .shop-box{
		width: 300px;
		height: 400px;
		margin-right: 10px;
		float: left;
		margin-bottom: 30px;
	}
	.search-container .shop-box:hover img{
		transform: scale(1.1);
	}
	.search-container .shop-box:hover a{
		text-decoration: none;
	}
	.onSearch-container a span{
		display: block;
	}
	.onSearch-container .img-box {
		width: 300px;
		height: 300px;
		overflow: hidden;
	}
	.onSearch-container .img-box img{
		width: 100%;
		height: 100%;
		display: block;
      	transition: transform 1s;
	}
	.onSearch-container .shopInf-container{
		width: 290px;
		height: 100px;
		padding: 0 5px;
	}
	.onSearch-container .shopInf-top{
		height: 40px;
	}
	.onSearch-container .shopInf-top span{
		float: left;
		font-size: 30px;
		line-height: 40px;
	}
	.onSearch-container .shopInf-top .title{
		max-width: 220px;
		margin-right: 10px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		color: black;
	}
	.onSearch-container .shopInf-top .score{
		color: rgb(255, 165, 0);
		font-weight: bold;
	}
	.onSearch-container .shopInf-mid{
		height: 20px;
		line-height: 20px;
	}
	.onSearch-container .shopInf-mid .address,
	.onSearch-container .shopInf-bot .type{
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		color: rgb(112, 112, 112);
	}
	.onSearch-container .shopInf-bot{
		height: 20px;
		line-height: 20px;
	}
	.right-container{
        width: 450px;
        padding-top: 65px;
    }
    .right-container .map{
        width: 450px;
        height: 450px;
    }
	/* after */
	.onSearch-container .shopInf-top::after,
	.onSearch-container .shop-container::after{
		display: block;
		content: '';
		clear: both;
	}
</style>
</head>
<body>
	<div class="search-container">
		<div class="inner-container">
			<c:if test="${list.size() == 0}">
				<div class="notSearch-container">
					<h1>'${cri.search}'에 대한 검색 결과가 없습니다.</h1>
					<h1>검색한 식당이 없다면?🤔</h1>
					<a class="register-link" href="<%= request.getContextPath() %>/restaurant/register">음식점 등록👈😉</a>
				</div>
			</c:if> 
			<div class="onSearch-container">
				<div class="left-container">
					<h2>'${cri.search}'에 대한 검색 결과</h2>
					<div class="shop-container">
						<c:forEach items="${list}" var="rt">
							<div class="shop-box">
								<a href="<%=request.getContextPath()%>/restaurant/main/?num=${rt.rt_num}">
									<span class="img-container">
										<span class="img-box">
											<c:choose>
												<c:when test="${rt.rt_im_name != null}"><img src="<%=request.getContextPath()%>/img/${rt.rt_im_name}" width="300px" height="300px"></c:when>
												<c:otherwise><img src="<%=request.getContextPath()%>/img/2021/08/23/5b251657-3c99-483d-bb10-0ffb33a45bbd_음식점 기본 이미지.PNG" width="300px" height="300px"></c:otherwise>
											</c:choose>
										</span>
									</span>
									<span class="shopInf-container">
										<span class="shopInf-top">
											<span class="title">${rt.rt_name}</span>
											<span class="score">${rt.rt_score}</span> <br>
										</span>
										<span class="shopInf-mid">
											<span class="address">${rt.rt_address}</span>
										</span>
										<span class="shopInf-bot">
											<span class="type">${rt.rt_type}</span>
										</span>
									</span>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="right-container">
					<div class="map" id="map"></div>
				</div>
			</div>
		</div>
	</div>
	<script>
			var mapOptions = {
			    center: new naver.maps.LatLng(37.3595704, 127.105399),
			    zoom: 10
			};		
			var map = new naver.maps.Map('map', mapOptions);
			
			var markerOptions = {
			    position: new naver.maps.LatLng(37.3595704, 127.105399),
			    map: map
			};		
			var marker = new naver.maps.Marker(markerOptions);
			
			
			//네이버 주소 -> 좌표
			naver.maps.Service.fromAddrToCoord({
		        address: '불정로 6'
		    }, function(status, response) {
		    	console.log(status)
		        if (status !== naver.maps.Service.Status.OK) {
		            return alert('Something wrong!');
		        }
		
		        var result = response.result; // 검색 결과의 컨테이너
		            items = result.items; // 검색 결과의 배열
		console.log(result)
		        // do Something
		    });
		</script>
</body>
</html>
