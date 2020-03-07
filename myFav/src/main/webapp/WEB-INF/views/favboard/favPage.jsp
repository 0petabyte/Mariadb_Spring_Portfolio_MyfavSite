<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	

		<meta charset="utf-8">
		<title>Welcome</title>
		<script type="text/javascript">
$(function(){
	$("#delBtn").click(function(){
		var result = confirm('정말로 삭제하시겠습니까? 되돌릴수 없습니다.');
		var text = '${favlist.favnum}';
		var page ='${cri.page}';
		var perPageNum ='${cri.perPageNum}';
		var nowGroupNum='${cri.groupnum}';
		var keyWord='${cri.keyword}';
		var searchType='${cri.searchType}';
		if(result==true) { 
			location.href="urlDelete?favnum="+text+"&groupnum="+nowGroupNum+"&page="+page+"&perPageNum="+perPageNum+"&keyword="+keyWord+"&searchType="+searchType;
			 } 
		else { 
			 $(this).dialog("close");
			}


		})
});
</script>
	</head> 
	<body>
	<div class="alert alert-success" style="margin: 0 auto; width: 70%;">
	<form action="favRead" method="post">

	
	<div class="form-group">
		<label>작성시간:</label>
	<input type="text" class="form-control"  value="<fmt:formatDate value="${favlist.nowdate}" pattern="yyyy.MM.dd HH:mm:ss" />" readonly="readonly">
	</div>
	
	<div class="form-group">
		<label for="groupname">그룹명:</label> 	
		<select class="form-control" name="groupnum">
	 <option value="${favlist.groupnum}" selected hidden>${nowgroupname}</option>
	 <c:forEach items="${grouplist}" var="GroupList">
	  <option value="${GroupList.groupnum}">${GroupList.name}</option>
	 </c:forEach>
	</select>

	</div>


 
	
	
	<div class="form-group">
		<label for="url">URL:</label> <input id="urlInput" type="text"
			class="form-control" name="url" value="${favlist.url}">
	</div>
	<div class="form-group">
		<label for="memo">메모:</label> <input type="text" class="form-control"
			name="memo" value="${favlist.memo}">
	</div>
	<div class="form-group">
		<input type="hidden" class="form-control" name="favnum" value="${favlist.favnum}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
		<input type="hidden" name="searchType" value="${cri.searchType}">

	</div>
			<p style="text-align: center; margin-top: 20px;">
			<a href="list?searchType=${cri.searchType}&keyword=${cri.keyword}&groupnum=${cri.groupnum}&page=${cri.page}&perPageNum=${cri.perPageNum}" class="btn btn-primary" >목록으로</a>
			<c:if test="${nowUser == login.userid}">
				<button type="button" id="delBtn" class="btn btn-danger">삭제하기</button>
				<button type="submit" class="btn btn-warning">수정완료</button>
			</c:if>

		
		
		</p>
	</form>

	 	

		
	</div>
</body>
</html>

