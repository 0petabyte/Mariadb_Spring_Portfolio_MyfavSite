<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
	<head>
	<link rel="stylesheet" type="text/css" href="/css/codePage.css" />
		<meta charset="utf-8">
		<title>Welcome</title>
<script type="text/javascript">
$(function(){
	$("#delBtn").click(function(){
		var result = confirm('정말로 삭제하시겠습니까? 되돌릴수 없습니다.');
		var page ='${cri.page}';
		var perPageNum ='${cri.perPageNum}';
		var nowGroupNum='${cri.groupnum}';
		var keyWord='${cri.keyword}';
		var searchType='${cri.searchType}';
		var text = '${readlist.codenum}';
		if(result==true) { 
			location.href="codeDelete?codenum="+text+"&groupnum="+nowGroupNum+"&page="+page+"&perPageNum="+perPageNum+"&keyword="+keyWord+"&searchType="+searchType;
			 } 
		else { 
			 $(this).dialog("close");
			}


		})
});
</script>

<script type="text/javascript">
$(function(){
	$(".goListBtn").click(function(){
		var page ='${cri.page}';
		var perPageNum ='${cri.perPageNum}';
		var nowGroupNum='${cri.groupnum}';
		var keyWord='${cri.keyword}';
		var searchType='${cri.searchType}';
		location.href="list?groupnum="+nowGroupNum+"&page="+page+"&perPageNum="+perPageNum+"&keyword="+keyWord+"&searchType="+searchType;
		})
})
</script>
<script type="text/javascript">
$(function(){
	$(".goModifyBtn").click(function(){
		var page ='${cri.page}';
		var perPageNum ='${cri.perPageNum}';
		var codeNum='${readlist.codenum}';
		var groupnum='${cri.groupnum}';
		var keyWord='${cri.keyword}';
		var searchType='${cri.searchType}';
		location.href="codeModify?codenum="+codeNum+"&page="+page+"&perPageNum="+perPageNum+"&keyword="+keyWord+"&searchType="+searchType+"&groupnum="+groupnum;
		})
})
</script>

	</head> 
	<body>
	
	

	
	
	
	
	
	
	
	
	
	
	
	
		<div class="box-body" style="width: 90%;margin: 0 auto;">
		
		
<%-- 			<div class="form-group">
		<label>작성시간:</label>
	<input type="text" class="form-control"  value="<fmt:formatDate value="${readlist.nowdate}" pattern="yyyy.MM.dd HH:mm:ss" />" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="groupname">그룹명:</label> 	
		<input value="${nowgroupname}" class="form-control" readonly="readonly">
	</div>
			<div class="form-group">
				<label for="title">Title</label>
				<input type="text" name="title" class="form-control" value="${readlist.title}" readonly="readonly">
			</div> --%>
			
			
			
			<div class="form-group">
				
				<div class="contentView">
				<p class="titleView">${readlist.title}</p>
				<p class="titleTime"><a href ="list?groupnum=${nowgroupnum}" class="titleGroup">${nowgroupname}</a> <fmt:formatDate value="${readlist.nowdate}" pattern="yyyy.MM.dd HH:mm:ss" /><span class="contentWriter">${readlist.userid}</span></p>
				
				<hr>
				<p class="contentViewer">
				${readlist.content}
				</p>
				</div>
			</div>
<%-- 			<div class="form-group">
				<label for="title">Writer</label>
				<input type="text" name="title" class="form-control" value="${readlist.userid}" readonly="readonly">
			</div> --%>

		</div>
		<p style="text-align: center;">
		<button type="button" class="btn btn-primary goListBtn" >목록으로</button>
		<c:if test="${nowUser == login.userid}">
		<button type="button" class="btn btn-success goModifyBtn" >수정하기</button>
		<button type="button" id="delBtn" class="btn btn-danger">삭제하기</button>
		</c:if>
		
		</p>
	</body>
</html>

