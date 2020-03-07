<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>

			<!-- include libraries(jQuery, bootstrap) -->

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
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

		<meta charset="utf-8">
		<title>Welcome</title>
	</head> 
	<body>
		<form action="codeModify" method="post">
		<div class="box-body" style="width: 90%;margin: 0 auto;">
		
			<div class="form-group">
		<label for="groupname">그룹명:</label> 	
		
		<select class="form-control" name="groupnum">
	 <option value="${readlist.groupnum}" selected hidden>${nowgroupname}</option>
	 <c:forEach items="${codeGroup}" var="GroupList">
	  <option value="${GroupList.groupnum}">${GroupList.name}</option>
	 </c:forEach>
	</select>

	</div>
		
		
			<div class="form-group">
				<label for="title">Title</label>
				<input type="text" name="title" class="form-control" value="${readlist.title}" >
			</div>
			<div class="form-group">
				<label for="Content">Content</label>
				<textarea name="content" id="summernote">${readlist.content}</textarea>
				
			</div>
			<div class="form-group">
				<label for="userid">Writer</label>
				<input type="text" name="userid" class="form-control" value="${readlist.userid}" readonly="readonly">
			</div>
			<input type="hidden" name="codenum" value="${readlist.codenum}">
			<input type="hidden" name="page" value="${cri.page}">
			<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
			<input type="hidden" name="keyword" value="${cri.keyword}">
			<input type="hidden" name="searchType" value="${cri.searchType}">
			
		</div>
		<p style="text-align: center;">
		<a href="${lastPage}" class="btn btn-secondary" >취소</a>
		<button type="submit" class="btn btn-warning">수정완료</button>
		</p>
		</form>
	</body>
</html>

