<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
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
        #star a{ 
			text-decoration: none; color: gray; 
		} 
		#star a.on{
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
            background-color: aquamarine;
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
                    </div>
                    <textarea id="xt" style="width:600px;height:1px;overflow-y:hidden;position:absolute;top:-10px;" disabled></textarea>
                    <div class="content-container">
                        <textarea id="re_content" name="re_content" onkeyup="xSize(this)" placeholder="${user.me_nickname}님, 주문하신 메뉴는 어떠셨나요? 궁금해요!"></textarea>
                    </div>
                </div>
                <div class="text-length"><span style="color:#aaa;" id="counter">(0 / 1000)</span></div>
                <div class="image-container">
                    <div class="image-box"></div>
                    <div class="form-group files">
                        <input type="file" name="imageList" class="form-control" id="image" accept="image/*" onchange="chk_file_type(this)"/>
                    </div>
                </div>
                <div class="btn-container">
                    <div class="btn-box">
                        <a href="<%= request.getContextPath() %>/restaurant/main/?num=${num}"><button type="button" class=" btn btn-outline-danger">취소</button></a>
                        <button class="review-btn btn btn-outline-success">리뷰 올리기</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
	<script>
		 $(function(){
			//a 태그 위치이동 막기
			$('#star a').click(function(e) {
				e.preventDefault()
			})
			// textarea 높이 자동
			function xSize(e){
			    var xe = document.getElementById('xt'),
			        t;
			
			    e.onfocus = function(){
			        t = setInterval(
			            function(){
			                xe.value = e.value;
			                e.style.height = (xe.scrollHeight + 12) + 'px';
			            }, 100);
			    }
			
			    e.onblur = function(){
			        clearInterval(t);
			    }
			}
			xSize(document.getElementById('re_content'));
			
			// textarea 줄 수/글자 수 제한
			$('.content-container').keyup(function (e){
				//줄 수 제한
				 var rows = $(this).children().val().split('\n').length;
		            var maxRows = 35;
		            if( rows > maxRows){
		                alert('35줄 까지만 가능합니다');
		                modifiedText = $(this).children().val().split("\n").slice(0, maxRows);
		                $(this).children().val(modifiedText.join("\n"));
		            }
				//글자 수 제한
			    var content = $(this).children().val();
			    $('#counter').html("("+content.length+" / 1000)");    //글자수 실시간 카운팅
			
			    if (content.length > 1000){
			        alert("최대 1000자까지 입력 가능합니다.");
			        $(this).children().val(content.substring(0, 1000));
			        $('#counter').html("(1000 / 1000)");
			    }
			});
			
			// 이미지 input 개수 제한 5개
			$(document).on('change', 'input[name=imageList]', function(){
				var val = $(this).val();
				var length = $('input[name=imageList]').length;
				var str = '<input type="file" name="imageList" class="form-control" id="image" accept="image/*" onchange="chk_file_type(this)">';
				
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
			
			// 별점, 내용을 입력하지 않으면 리뷰 전송 막기
			$(document).on('click', '.review-btn', function(e){
				if($('input[name=re_service]').val() == "" || $('input[name=re_mood]').val() == "" || $('input[name=re_clean]').val() == "" || $('input[name=re_tasty]').val() == "" || $('input[name=re_quantity]').val() == ""){
					alert("별점을 모두 등록해주세요")
					e.preventDefault()
				}else if($('[name=re_content]').val() == ""){
					alert("내용을 작성해주세요.")
					event.preventDefault()		
				}else{
					var service = parseInt($('input[name=re_service]').val());
					var mood = parseInt($('input[name=re_mood]').val());
					var clean = parseInt($('input[name=re_clean]').val());
					var tasty = parseInt($('input[name=re_tasty]').val());
					var quantity = parseInt($('input[name=re_quantity]').val());
				}	
				var totalSc = (service+mood+clean+tasty+quantity)/5
				$('[name=re_totalSc]').val(totalSc);
			})
			
			//별점 css 
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