<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!doctype html>
 
<html>
<head>
<title>스프링</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
</head>
<body>
    <tiles:insertAttribute name="body" />                                                
</body>
</html>
