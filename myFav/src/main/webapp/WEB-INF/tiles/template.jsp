<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" type="text/css" href="/css/main.css" />
	
     <meta name="viewport" content="width=device-width; initial-scale=1.0">
    <title>Jiung.net</title>
	<style type="text/css">
	#left{
	background-color: #F2F2F2;
	}
	</style>
    <link rel="stylesheet" href="/css/layout.css" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  	<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
  	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  	<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
  	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
</head>
<body>
    <div class= "wrapper">
    <div id="logo"><tiles:insertAttribute name="logo" /></div>
    <div id="header"><tiles:insertAttribute name="header" /></div>
    <div id="left"><tiles:insertAttribute name="left" /></div>
    <%-- <div id="right"><tiles:insertAttribute name="right" /></div> --%>
    <div id="main">
  
    <tiles:insertAttribute name="body" />
    </div>    
    <div id="footer"><tiles:insertAttribute name="footer" /></div>
    </div>
 
    <script type="text/javascript">
        $(function() {
 
        });    
    </script>    
</body>
</html>