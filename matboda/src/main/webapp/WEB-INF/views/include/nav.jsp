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
        .search .search-button{
            width: 45px;
            height: 46px;
            position: absolute;
            right: 0px;
            top: 0;
            border: none;
            background-color: rgb(255, 165, 0);
            border-radius: 0;    
        }
        .search .search-button i{
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
        .user-box img{
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
            width: 200px;
            height: 300px;
            background-color: aqua;
            position: absolute;
            top: 70px;
            right: 0px;
            z-index: 1;
            display: none;
            font-size: 20px
        }
        .user-menu .mypage{
            width: 50px;

        }
	</style>
</head>
<body>
	 <div class="nav">
		<div class="logo">
		    <a href="<%= request.getContextPath() %>/"><h2>맛보다</h2></a>
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
						<c:when test="${user.me_picture == null}">
							<img src="/matboda/img/2021/08/30/b085dc96-3945-40fb-b974-eeed6408cf27_img.png">
						</c:when>
						<c:otherwise>
							<img src="/matboda/img/${user.me_picture}">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="user-menu">
					<div class="mypage">
						<a class="nav-link" href="<%= request.getContextPath() %>/member/mypage">마이페이지</a>
					</div>
					<div class="signout">
						<a class="nav-link" href="<%= request.getContextPath() %>/member/signout">로그아웃</a>
					</div>
				</div>
				<c:if test="${user.me_authority != 'USER'}">
					<a class="nav-link" href="<%= request.getContextPath() %>/admin/user/list"></a>
				</c:if>
			</c:if>
		</div>
		<div class="search">
		    <form action="#">
		        <div></div>
		        <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
		    </form>
		</div>
	</div>
	<nav class="navbar navbar-expand-sm navbar-yellow">
		<c:if test="${user != null}">
			<ul class="navbar-nav">
				<c:if test="${user.me_authority != 'USER'}">
					<li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/admin/user/list">회원관리</a></li>	
				</c:if>
			</ul>
		</c:if>
	</nav>
	<script type="text/javascript">
		$(function(){
			 $('.account').click(function(){
	                $('.user-menu').toggle();
	            })
		})
	</script>
</body>
</html>
