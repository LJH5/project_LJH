<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<style>
	.faList-container .inner-container{
		display: flex;
	    padding-top: 50px;
	}
	.faList-container .left-container{
		width: calc(75% - 20px);
		min-width: 940px;
	}
	/* 즐겨찾기 없음 */
	.faList-container .notSearch-container{
		height: 700px;
		width: 800px;
		margin: 0 auto;
		margin-top: 70px;
	}
	.faList-container .notSearch-container h1{
		margin-bottom: 30px;
	}
	.faList-container .register-link{
		font-size: 50px;
	}
	.faList-container .register-link:hover{
		color: #ffa500;
	}

	/* 즐겨찾기 음식점 리스트 */
	.faList-container .onSearch-container{
		max-width: 940px;
		margin: 0 auto;
	}
	.faList-container .title-box{
		font-size: 50px;
		text-align: center;		
		color: #ffa500;
	}
	.faList-container .shop-container{
		width: 940px;
		padding-left: 10px;
	}
	.faList-container .shop-box{
		width: 300px;
		height: 400px;
		margin-right: 10px;
		float: left;
		margin-bottom: 30px;
	}
	.faList-container .shop-box:hover img{
		transform: scale(1.1);
	}
	.faList-container .shop-box:hover a{
		text-decoration: none;
	}
	.faList-container .onSearch-container a span{
		display: block;
	}
	.faList-container .onSearch-container .img-box {
		width: 300px;
		height: 300px;
		overflow: hidden;
	}
	.faList-container .onSearch-container .img-box img{
		width: 100%;
		height: 100%;
		display: block;
      	transition: transform 1s;
	}
	.faList-container .onSearch-container .shopInf-container{
		width: 290px;
		height: 100px;
		padding: 0 5px;
	}
	.faList-container .onSearch-container .shopInf-top{
		height: 40px;
	}
	.faList-container .onSearch-container .shopInf-top span{
		float: left;
		font-size: 30px;
		line-height: 40px;
	}
	.faList-container .onSearch-container .shopInf-top .title{
		max-width: 220px;
		margin-right: 10px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		color: black;
	}
	.faList-container .onSearch-container .shopInf-top .score{
		color: rgb(255, 165, 0);
		font-weight: bold;
	}
	.faList-container .onSearch-container .shopInf-mid{
		height: 20px;
		line-height: 20px;
	}
	.faList-container .onSearch-container .shopInf-mid .address,
	.faList-container .onSearch-container .shopInf-bot .type{
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		color: rgb(112, 112, 112);
	}
	.faList-container .onSearch-container .shopInf-bot{
		height: 20px;
		line-height: 20px;
	}
	.faList-container .right-container{
		width: 450px;
		padding-top: 75px;
	}
	.faList-container .map-container{
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
	<div class="faList-container">
		<div class="inner-container">
			<c:if test="${list.size() == 0}">
				<div class="notSearch-container">
					<h1>'${cri.search}'에 대한 검색 결과가 없습니다.</h1>
					<h1>검색한 식당이 없다면?🤔</h1>
					<a class="register-link" href="<%= request.getContextPath() %>/restaurant/register">음식점 등록👈😉</a>
				</div>
			</c:if>
			<div class="left-container">
				<div class="onSearch-container">
					<div class="title-box">'${user.me_nickname}'님의 즐겨찾기's</div>
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
					<ul class="pagination justify-content-center">
						<c:if test="${pm.prev}">
							<li class="page-item"><a class="page-link"
								href="<%=request.getContextPath()%>/member/favoritesList/?page=${pm.startPage-1}">이전</a></li>
						</c:if>
						<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
							<li
								class="page-item <c:if test="${pm.criteria.page == index }">active</c:if>">
								<a class="page-link"
								href="<%=request.getContextPath()%>/member/favoritesList/?page=${index}">${index}</a>
							</li>
						</c:forEach>
						<c:if test="${pm.next}">
							<li class="page-item"><a class="page-link"
								href="<%=request.getContextPath()%>/member/favoritesList/?page=${pm.endPage+1}">다음</a></li>
						</c:if>
					</ul>
				</div> 
			</div>
			<div class="right-container">
				<div class="map-container" id="map">
				</div>
			</div>
		</div>
	</div>
	<script>
		// 지도에 좌표 여러개 가져오기
		var address = []
		var areaArr = new Array();  // 지역을 담는 배열 ( 지역명/위도경도 )
		$('.address').each(function() {
			address.push($(this).text());
			var name = $(this).parent().siblings().children().first().text();
			getxy(name, $(this).text());
		})
		
		//네이버 주소 -> 좌표
		function getxy(name, address) {
			var x, y;
			naver.maps.Service.geocode({
		        address: address
		    }, function(status, response) {
		        if (status !== naver.maps.Service.Status.OK) {
		            return alert('Something wrong!');
		        }
		        var item=response.result.items[1]; // 도로명 주소
		        x = item.point.x;
		        y = item.point.y;
		        initMap([{location : name , lat : y , lng : x}]);
		    });
		}
		$(function() {
			
			initMap(areaArr);
			
		});

		var map = new naver.maps.Map('map', {
	        center: new naver.maps.LatLng(36.503929, 127.267907), //지도 시작 지점
	        zoom: 7
	    });
		// 다중 마커
		function initMap(areaArr) { 
			
			let markers = new Array(); // 마커 정보를 담는 배열
			let infoWindows = new Array(); // 정보창을 담는 배열
			
			
			if(typeof areaArr == "undefined" )
				return;
			for (var i = 0; i < areaArr.length; i++) {
				// 지역을 담은 배열의 길이만큼 for문으로 마커와 정보창을 채워주자 !

			    var marker = new naver.maps.Marker({
			        map: map,
			        title: areaArr[i].location, // 지역구 이름 
			        position: new naver.maps.LatLng(areaArr[i].lat , areaArr[i].lng) // 지역구의 위도 경도 넣기 
			    });
			    
			    /* 정보창 */
				 var infoWindow = new naver.maps.InfoWindow({
				     content: '<div style="width:200px;text-align:center;padding:10px;"><b>' + areaArr[i].location + '</b><br></div>'
				 }); // 클릭했을 때 띄워줄 정보 HTML 작성
			    
				 markers.push(marker); // 생성한 마커를 배열에 담는다.
				 infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.
			}
		    
			 
		    function getClickHandler(seq) {
				
		            return function(e) {  // 마커를 클릭하는 부분
		                var marker = markers[seq], // 클릭한 마커의 시퀀스로 찾는다.
		                    infoWindow = infoWindows[seq]; // 클릭한 마커의 시퀀스로 찾는다

		                if (infoWindow.getMap()) {
		                    infoWindow.close();
		                } else {
		                    infoWindow.open(map, marker); // 표출
		                }
		    		}
		    	}
		    
		    for (var i=0, ii=markers.length; i<ii; i++) {
		        naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
		    }
		}
	</script>
</body>
</html>
