<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<!-- include libraries(jQuery, bootstrap) -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
		
		<!-- include summernote css/js-->
		<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
		<meta charset="utf-8">
		<title>Welcome</title>
		<script type="text/javascript">
		$(document).ready(function() {
		     $('#summernote').summernote({
		             height: 500,                 // set editor height
		             minHeight: null,             // set minimum height of editor
		             maxHeight: null,             // set maximum height of editor
		             focus: true                  // set focus to editable area after initializing summernote
		     });
		});

		</script>
	</head> 
	<body>
	
	<form action="" id="boardform" style="width: 90%;margin: 0 auto;">
	<textarea name="content" id="summernote" value=""></textarea>
	<button type="button" class="btn btn-secondary" style="float: right;margin-right: 50px;">취소</button>
	<button type="button" class="btn btn-primary" style="float: right;margin-right: 10px;">등록</button>
	</form>
	</body>
</html>

