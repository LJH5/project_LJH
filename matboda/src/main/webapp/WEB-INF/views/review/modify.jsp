<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
        *{
            margin: 0;
            padding: 0;
            text-decoration: none;
            list-style: none;
        }
        .inner-container{
            width: 700px;
            margin: 50px auto;
        }
        .text-container{
            margin-bottom: 10px;
            text-align: center;
            font-size: 35px;
            color: rgb(255, 165, 0);
        }
        .middle-container{
            border: 1px solid #dee2e6;
            padding: 10px;
            box-sizing: border-box;
        }
        .score-container{
            height: 100px; 
            text-align: center;
        }
        .star a{ 
			text-decoration: none; color: gray; 
		} 
		.star a.on{
			color: rgb(255, 165, 0); 
		}
        .score-container table{
            width: 100%;
            color: rgb(255, 165, 0);
            box-shadow: 0px 2px 1px #dee2e6;
        }
        .content-container{
            width: 620px;
            margin: 0 auto;
            padding: 0 10px;
        }
        .content-container textarea{
            width: 600px;
            border: none;
            overflow: hidden; 
            resize: none;
            min-height: 300px;
        }
        .content-container textarea:focus{
            outline: none;
        }
        .text-length{
            position: relative;
            height: 30px;
          
        }
        .text-length #counter{
            position: absolute;
            right: 0;
        }
        .image-container{
            margin-bottom: 30px;
        }
        .image-box{
            width: 200px;
            height: 200px;
            border-radius: 1px;
            position: relative;
            display: inline-block;
            overflow: hidden;
        }
        .image-box img{
       	    width: 100%;
    		height: 100%;
        }
       	.image-box .del-btn{
            position: absolute;
		    width: 40px;
		    height: 40px;
        	top: 4px;
   		 	right: 6px;
		    text-align: center;
		    line-height: 40px;
		    font-size: 40px;
		    box-sizing: border-box;
		    color: gray;

        }
        .image-box .del-btn:hover{
            color: rgb(255, 165, 0);
        }
        .btn-container{
            height: 100px;
            margin-bottom: 10px;
            position: relative;
        }
        .btn-box{
            position: absolute;
            right: 0;
        }
        a:hover {
			text-decoration: none;
		}
    </style>
</head>
<body>
    <form name="insertFrm" class="contanier" method="post" enctype="multipart/form-data">
        <div class="container">
            <div class="inner-container">
                <div class="text-container">
                    <div class="text-box">
                        <span>솔직한 리뷰 부탁드립니다.😍</span>
                    </div>
                </div>
                <div class="middle-container">
                    <div class="score-container">
                        <table>
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
                    </div>
                    <textarea id="xt" style="width:600px;height:1px;overflow-y:hidden;position:absolute;top:-10px;" disabled></textarea>
                    <div class="content-container">
                        <textarea id="re_content" name="re_content" onkeyup="xSize(this)" placeholder="님, 주문하신 메뉴는 어떠셨나요? 궁금해요!">${review.re_content}</textarea>
                    </div>
                </div>
                <div class="text-length"><span style="color:#aaa;" id="counter">(0 / 1000)</span></div>
                <div class="image-container">
                    <c:forEach items="${imageList}" var="image">
                        <span class="image-box">
                            <img name="imageList" src="<%=request.getContextPath() %>/img/${image.im_name}">
                           	<span class="del-btn"><i class="far fa-window-close"></i></span>
                            <input type="hidden"name="imageNum" value="${image.im_num}">
                        </span>
                    </c:forEach>
                    <c:if test="${imageList == null || imageList.size() < 5}">
                        <div class="form-group files">
                            <input type="file" name="imageList" class="form-control" id="image" accept="image/*"onchange="chk_file_type(this)"/>
                            <input type="hidden"name="imageNum" value="${image.im_num}">
                        </div>
                    </c:if>
                </div>
                <div class="btn-container">
                    <div class="btn-box">
                        <a href="<%= request.getContextPath() %>/restaurant/main/?num=${review.re_rt_num}">
                            <button type="button" class="btn btn-outline-danger">취소</button>
                        </a>
                        <button class="review-btn btn btn-outline-success">리뷰 수정하기</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        $(function(){
            // textarea 높이 자동
            function xSize(e){
                var xe = document.getElementById('xt'),
                    t;

                e.onfocus = function(){
                    t = setInterval(
                        function()
                        {
                            xe.value = e.value;
                            e.style.height = (xe.scrollHeight + 12) + 'px';
                        }, 100);
                }

                e.onblur = function()
                {
                    clearInterval(t);
                }
            }
            xSize(document.getElementById('re_content'));

            // textarea 글자수 제한
            $('.content-container').keyup(function (e){
                var content = $(this).children().val();
                $('#counter').html("("+content.length+" / 1000)");    //글자수 실시간 카운팅

                if (content.length > 1000){
                    alert("최대 1000자까지 입력 가능합니다.");
                    $(this).children().val(content.substring(0, 1000));
                    $('#counter').html("(1000 / 1000)");
                }
            });

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
				var length = $('[name=imageList]').length;
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
				$(this).parent().children("a").removeClass("on"); 
				$(this).addClass("on").prevAll("a").addClass("on");
				var sp = $(this).attr("value");
				$(this).siblings().last().val(sp);
			});
			
			/* 기존의 별점을 보여줌 */
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