<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style>
		.error{
			color : red
		}
		.open-time{
			display: flex;
			line-height: 35px;
		}
		.open-time div{
			margin-left: 3px;
			margin-right: 20px;
		}
	</style>
</head>
<body>

<form class="container" method="post" action="<%=request.getContextPath()%>/restaurant/register">
	<h1>음식점 등록</h1>
	<div class="form-group">
		<label>상호명</label>
		<input type="text" class="form-control" name="rt_name" id="rt_name">
	</div>
	<div class="form-group address">
         <label>주소</label>
	         <input class="form-control"type="text" id="sample4_postcode" placeholder="우편번호">
	         <input class="form-control"type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
	         <input class="form-control"type="text" id="sample4_roadAddress" placeholder="도로명주소">
	         <input class="form-control"type="text" id="sample4_jibunAddress" placeholder="지번주소">
	         <span class="form-control"id="guide" style="color:#999;display:none"></span>
	         <input class="form-control"type="text" id="sample4_detailAddress" placeholder="상세주소">
	         <input class="form-control"type="text" id="sample4_extraAddress" placeholder="참고항목">
	         <input type="hidden" name="rt_address">
    </div>
	<div class="form-group">
		<label>전화번호</label>
		<input type="text" class="form-control" name="rt_phoneNum" placeholder="(-) 붙여서 입력해주세요.">
	</div>
	<div class="form-group">
		<label>음식종류</label>
		<select class="form-control" name="rt_type">
			<option>한식</option>
			<option>치킨</option>
			<option>양식/피자</option>
			<option>중식</option>
			<option>일식</option>
			<option>분식</option>
			<option>카페/디저트</option>
			<option>브런치/버거/샌드위치</option>
			<option>다국적 아시아</option>
			<option>세계 음식</option>
			<option>기타</option>
		</select>
	</div>
	<label>영업시간</label>
	<div class="form-group open-time">
		<select class="form-control col-2" name="openHour">
			<option>00</option>
			<option>01</option>
			<option>02</option>
			<option>03</option>
			<option>04</option>
			<option>05</option>
			<option>06</option>
			<option>07</option>
			<option>08</option>
			<option>09</option>
			<option>10</option>
			<option>11</option>
			<option>12</option>
			<option>13</option>
			<option>14</option>
			<option>15</option>
			<option>16</option>
			<option>17</option>
			<option>18</option>
			<option>19</option>
			<option>20</option>
			<option>21</option>
			<option>22</option>
			<option>23</option>
			<option>24</option>
		</select>
		<div>시</div>
		<select class="form-control col-2" name="openMinute">
			<option>00</option>
			<option>10</option>
			<option>20</option>
			<option>30</option>
			<option>40</option>
			<option>50</option>
		</select>
		<div>분</div>
		<div>~</div>
		<select class="form-control col-2" name="closeHour">
			<option>00</option>
			<option>01</option>
			<option>02</option>
			<option>03</option>
			<option>04</option>
			<option>05</option>
			<option>06</option>
			<option>07</option>
			<option>08</option>
			<option>09</option>
			<option>10</option>
			<option>11</option>
			<option>12</option>
			<option>13</option>
			<option>14</option>
			<option>15</option>
			<option>16</option>
			<option>17</option>
			<option>18</option>
			<option>19</option>
			<option>20</option>
			<option>21</option>
			<option>22</option>
			<option>23</option>
			<option selected>24</option>
		</select>
		<div>시</div>
		<select class="form-control col-2" name="closeMinute">
			<option>00</option>
			<option>10</option>
			<option>20</option>
			<option>30</option>
			<option>40</option>
			<option>50</option>
		</select>
		<div>분</div>
		<input type="hidden" name="rt_openTime">
	</div>
	<input type="hidden" name="dupCheck">
	<button class="btn btn-outline-success col-12">음식점 등록</button>
</form>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    $(function(){
	    $("form").validate({
			rules: {
				rt_name: {
			     	required : true
			    },
			    rt_phoneNum: {
			    	required : true,
			    	regex: /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-[0-9]{3,4}-[0-9]{4}$/
			    },
				rt_type: {
				 	required : true
				},
				rt_openTime: {
				 	required : true
				},
				rt_address: {
					required: true
				}
			},
	        messages : {
	        	rt_name: {
	        		required: "필수 정보입니다."
			    },
			    rt_phoneNum: {
            		required: "필수 정보입니다.",
           			regex : "올바른 전화번호가 아닙니다."
            	},
				rt_type: {
					required: "필수 정보입니다."
				},
				rt_openTime: {
					required: "필수 정보입니다."
				}
        	},
			submitHandler: function(form){
				var sp = $('input[id=sample4_postcode]').val();
				var road = $('input[id=sample4_roadAddress]').val();
				var jibun = $('input[id=sample4_jibunAddress]').val();
				var detail = $('input[id=sample4_detailAddress]').val();
				var extra = $('input[id=sample4_extraAddress]').val();
				var address = road+detail+extra;
				$('[name=rt_address]').val(address);
				
				
				var openHour = $('[name=openHour]').val();
				var openMinute = $('[name=openMinute]').val();
				var closeHour = $('[name=closeHour]').val();
				var closeMinute = $('[name=closeMinute]').val();
				var openTime =  openHour+':'+openMinute+' ~ ' +closeHour+':'+closeMinute;
				$('[name=rt_openTime]').val(openTime);
				$('form').submit();
  	   		}
        	
	    })
    });
    $.validator.addMethod(
    	    "regex",
    	    function(value, element, regexp) {
    	        var re = new RegExp(regexp);
    	        return this.optional(element) || re.test(value);
    	    },
    	    "입력이 잘못되었습니다."
    	);
</script>
</body>
</html>