<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome</title>
		<link href="https://fonts.googleapis.com/css?family=Noto+Sans&display=swap" rel="stylesheet">
<style type="text/css">
	#logo{
	margin-top:10px;
	text-align: center;
	font-family: 'Noto Sans', sans-serif;
	font-size: 50px;

	}
	#logoname{
		color:black;
		text-decoration: none;
	}
</style>



	</head> 
	<body>
	<%-- <div id="logo"><a href="/${nowUser}/fav/list"><img src="/img/jiung_logo.png" width="70%" height="70%"></a></div> --%>
	<div id="logo"><a id="logoname" href="/${nowUser}/fav/list">${nowUser}</a></div>
	
	</body>
</html>

