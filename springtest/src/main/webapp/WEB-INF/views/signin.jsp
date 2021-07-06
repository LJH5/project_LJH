<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	로그인  
</h1>

<form action="/test/signin">
id : <input type="text" name="id"> <br>
pw : <input type="password" name="pw"> <br>
<button>전송</button>
</form>
</body>
</html>
