<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		
		<!-- include libraries(jQuery, bootstrap) -->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
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
		<script type="text/javascript">
		$(function(){
			$("#cancelBtn").click(function(){
				var result = confirm('정말로 취소하시겠습니까? 저장되지 않습니다.');
				var text = '${nowgroupnum}';
				if(result==true) { 
					location.href="list?groupnum="+text
					 } 
				else { 
					 $(this).dialog("close");
					}


				})
		});
		</script>
		
<script>
$(function(){
	  $("#codeFormBtn").click(function(){
		    if($.trim($("#title").val())==''){
		      alert("제목 을 입력해주세요.");
		      return false;
		    } 
		    $("#boardform").submit();
	  });
});
</script>


	</head> 
	<body>

	<form action="codeInsert" method="post" id="boardform" style="width: 90%;margin: 0 auto;">
		<div class="alert alert-success">
        <strong>현재 입력중인 그룹은 [${nowgroupname}] 코드메모 그룹입니다.
        </strong></div>
	<div class="form-group">
    <label for="url">제목</label>
    <input id="title" type="text" class="form-control" name="title">
    <input type="hidden" class="form-control" name="groupnum" value="${nowgroupnum}">
    <input type="text" name="userid" value="${login.userid}">
 	</div>
	<textarea name="content" id="summernote"></textarea>
	<button type="button" id="cancelBtn" class="btn btn-secondary" style="float: right;margin-right: 50px;">취소</button>
	<button id="codeFormBtn" type="button" class="btn btn-primary" style="float: right;margin-right: 10px;">등록</button>
	</form>
	
	</body>
</html>

