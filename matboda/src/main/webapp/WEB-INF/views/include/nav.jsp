<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>

<html>
<head>
	<style type="text/css">
		  *{
            margin: 0;
            padding: 0;
            text-decoration: none;
            list-style: none;
        }
        .after::after{
            clear: both;
            display: block;
            content: '';
        }
        .nav{
            position: relative;
            background: wheat;
            height: 70px;
            padding: 10px;
        }
        .nav .logo{
            margin-top: 5px;
        }
        .nav .logo a{
            color: rgb(255, 165, 0);
        }
        .search{
            height: 56px;
            border: 5px solid rgb(255, 165, 0);
            position: absolute;
            left: 120px;
            right: 100px;
            top: calc(50% - 28px);

        }
        .search-bar .search-input:focus{
            outline: none;
            border: none;
        }
        .search .search-btn{
            width: 45px;
            height: 46px;
            position: absolute;
            right: 0px;
            top: 0;
            border: none;
            background-color: rgb(255, 165, 0);
            border-radius: 0;    
        }
        .search .search-btn i{
            color: wheat;
            font-size: 30px;
        }
        .user-box{
            float: right;
            position: absolute;
            height: 70px;
            top: 0;
            right: 10px;
            line-height: 70px;
        }
        .user-box a{
            font-size: 50px;
            color: rgb(255, 165, 0);
        }
        .user-box .account img{
        	position: absolute;
        	top: 10px;
        	right: 0;
        	width: 50px;
        	height: 50px;
        	border-radius: 50px;
        }
        .account:hover{
        	cursor: pointer;
        }
        .user-menu{
            width: 250px;
            height: 300px;
            border: 2px solid rgb(255, 165, 0);
            background-color: white;
            position: absolute;
            top: 70px;
            right: -10px;
            z-index: 3;
            display: none;
        }
        .user-menu img{
            width: 150px;
            height: 150px;
            border-radius: 100%;
            margin-top: 10px;
            margin-left: 50px;
        }
        .user-menu .me_nickname{
            font-size: 20px;
            text-align: center;
        }
        .user-menu .mypage a,
        .user-menu .signout a{
            width: 100px;
            height: 50px;
            padding: 10px;
            background-color: white;
            border: 2px solid rgb(255, 165, 0);
            box-sizing: border-box;
            text-align: center;
            line-height: 50px;
            font-size: 19px;
            font-weight: bold;
            margin-left: 8px;
        }
        .user-menu .mypage a{
            left: 10px;
        }
        .user-menu .signout a{
            right: 10px;
        }
       .search-input{
        	color:rgb(255, 165, 0);
            height: 30px;
            width: 400px;
            position: absolute;
            top: 8px;
            left: 10px;
            border: none;
            font-size: 20px;
            background: none;
        }
        .search-input:focus{
            outline: none;
        }
	</style>
</head>
<body>
	 <div class="nav">
		<div class="logo">
		    <a href="<%= request.getContextPath() %>/"><h2>맛보다</h2></a>
		</div>
		<div class="search">
		    <form action="<%= request.getContextPath() %>/restaurant/search">
		        <input class="search-input" type="text" name="search" value="<c:out value="${pm.criteria.search}"/>" placeholder="지역이나 식당이름">
		        <button type="submit" class="search-btn"><i class="fas fa-search"></i></button>
		    </form>
		</div>
		<div class="user-box">
			<c:if test="${user == null}">
				<div class="signin">    
				    <a href="<%= request.getContextPath() %>/member/signin"><i class="far fa-user-circle"></i></a>
				</div>
			</c:if>
			<c:if test="${user != null}">
				<div class="account">
					<c:choose>
						<c:when test="${user.me_picture == null || user.me_picture == ''}">
							<img src="/matboda/img/2021/08/30/b085dc96-3945-40fb-b974-eeed6408cf27_img.png">
						</c:when>
						<c:otherwise>
							<img src="/matboda/img/${user.me_picture}">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="user-menu">
					<c:choose>
						<c:when test="${user.me_picture == null || user.me_picture ==''}">
							<img src="/matboda/img/2021/08/30/b085dc96-3945-40fb-b974-eeed6408cf27_img.png">
						</c:when>
						<c:otherwise>
							<img src="/matboda/img/${user.me_picture}">
						</c:otherwise>
					</c:choose>
					<div class="me_nickname">${user.me_nickname}</div>
					<span class="mypage"><a href="<%= request.getContextPath() %>/member/mypage">마이페이지</a></span>
					<span class="signout"><a href="<%= request.getContextPath() %>/member/signout">로그아웃</a></span>
				</div>
				<c:if test="${user.me_authority != 'USER'}">
					<a class="nav-link" href="<%= request.getContextPath() %>/admin/user/list"></a>
				</c:if>
			</c:if>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			 $('.account').click(function(){
                $('.user-menu').toggle();
	         })
	         $('.maypage').click(function(){
	         	$('.user-menu').hide();
	         })
         	$(document).on('click', '.search-btn', function(event){
				if($('input[name=search]').val() == ""){
					alert("검색어를 입력해주세요.")
					event.preventDefault()
				}
			})
		})
	</script>
</body>
</html>
