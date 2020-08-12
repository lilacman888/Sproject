<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<P>  The time on the server is ${serverTime}. </P>


<ul>
	<li><a href="list">일반게시판</a></li>
	<li><a href="#">리뷰게시판</a></li>
	<li><a href="#">고객센터</a></li>
	<li><a href="date">date</a></li>
	<li><a href="uploadForm">upload test</a></li>
	<li><a href="testpage">Test Page</a></li>
</ul>
</body>
</html>
