<!DOCTYPE html>

<%@page import="org.omg.CORBA.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/mobile.css" />



<script type="text/javascript">
$(function(){
	$("#groupDelBtn").click(function(){
		var result = confirm('정말로 삭제하시겠습니까? 되돌릴수 없습니다.');
		var text = '${nowgroupnum}';
		if(result==true) { 
			location.href="groupDelete?groupnum="+text
			 } 
		else { 
			 $(this).dialog("close");
			}


		})
});
</script>


</head>
<body>
<div id="paddingtop">
<div class="container">
<form action="codeInsert" role="form" method="GET" style="position: sticky; top: 0; background-color: white">
  <div class="form-group">
  
  


<div class="alert alert-success">
  <c:choose>
    <c:when test="${nowgroupname == null}">
        <strong>전체 목록입니다.</strong>
    </c:when>

    <c:otherwise>
        <strong>${nowgroupname} 코드메모 그룹입니다. ${groupcount} 개의 목록이 있습니다.
        <c:if test="${nowUser == login.userid}">
          <button id="groupDelBtn" type="button" class="btn btn-danger">그룹 삭제하기</button>
          <button type="submit"  class="btn btn-primary" style="float: right">코드메모 추가</button> 
        </c:if>
        </strong>
    </c:otherwise>
</c:choose>
</div>




  
  </div>

 
  <div class="form-group">

    <input type="hidden" class="form-control" name="groupnum" value="${nowgroupnum}">

    


  </div>
 

</form>

<br>  
  <table class="table table-hover" >
    <thead>
      <tr class="table-active">
      	<!-- <th>num</th> -->
        <th>Title</th>
        <th>Content</th>
<!--         <th>userid</th>
        <th>groupnum</th> -->
        <th>Time</th>
        <!-- <th>delete</th> -->
      </tr>
    </thead>
    <tbody>
    


   
     <c:forEach items="${list}" var="codeList">
      <tr>
      	<%-- <td>${codeList.codenum}</td> --%>
		<td><a href='codeRead${pageMaker.makeQuery(pageMaker.cri.page)}&codenum=${codeList.codenum}&searchType=${cri.searchType}&keyword=${cri.keyword}&groupnum=${cri.groupnum}' >${codeList.title}</a>
		</td>
		<td style="padding-left:5px;">
		  <div style="height: 25px; width:100px; overflow:hidden;">
		      ${codeList.content}
		  </div>
		</td>
		<td>
		<fmt:formatDate pattern="MM-dd HH:mm:ss" value="${codeList.nowdate}" />
		</td>
		<%-- <td>${codeList.userid}</td>
		<td>${codeList.groupnum}</td> --%>
<%-- 		<td>
		<a class="btn btn-outline-danger" href="codeDelete?codenum=${codeList.codenum}" role="button">DELETE</a>
		</td> --%>
      </tr>
	</c:forEach>

    
    
    
    
    
    
    
    
  
    </tbody>
  </table>
</div>
</div>

<!-- 페이징 처리 -->
	<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(pageMaker.startPage -1)}">Previous</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li class="page-item <c:out value="${pageMaker.cri.page == idx?'class = active':''}"/>" >
				<a class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx}</a>
				</li>
			</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a class="page-link" href="list${pageMaker.makeSearch(pageMaker.endPage +1)}">Next</a></li>
				</c:if>
		</ul>
	</div>


<!-- 왼쪽 메뉴 모바일 전용 -->

	<div id="mobileMenu">
	
	<div style="height: 40px;">

 </div>

   <c:choose>
    <c:when test="${nowTab == 'code'}">
    
<div style="width:100%; margin: 0 auto; text-align:center;">
	<div class="btn-group" style="text-align:center;">
  		<button id="favBtn" type="button" class="favBtn btn btn-secondary">즐겨찾기</button>
  		<button id="codeBtn" type="button" class="codeBtn btn btn-success">코드</button>
	</div>
</div>
<div style="height: 10px;"></div>
    
<a href="list" class="list-group-item list-group-item-action">
<c:choose>
    <c:when test="${nowgroupname == null}">
 		<img src="/img/red_folder.ico" width="20px" > &nbsp; 
    </c:when>

    <c:otherwise>
 		<img src="/img/folder_89347.ico" width="20px" > &nbsp; 
    </c:otherwise>
</c:choose>

전체 목록</a> 
 
    
<div class="list-group">
  <c:forEach items="${codeGroup}" var="CodeGroup">
  <a href="list?groupnum=${CodeGroup.groupnum}" class="list-group-item list-group-item-action">
  <c:choose>
    <c:when test="${nowgroupnum == CodeGroup.groupnum}">
        <img src="/img/red_folder.ico" width="20px" > &nbsp; 
    </c:when>

    <c:otherwise>
        <img src="/img/folder_89347.ico" width="20px" > &nbsp; 
    </c:otherwise>
</c:choose>

  ${CodeGroup.name} </a>
  </c:forEach>
</div>
    </c:when>

    <c:otherwise>
        
<div style="width:100%; margin: 0 auto; text-align:center;">
	<div class="btn-group" style="text-align:center;">
  		<button id="favBtn" type="button" class="favBtn btn btn-success">즐겨찾기</button>
  		<button id="codeBtn" type="button" class="codeBtn btn btn-secondary ">코드</button>
	</div>
</div>
<div style="height: 10px;"></div>        
        
        
<a href="list" class="list-group-item list-group-item-action">
<c:choose>
    <c:when test="${nowgroupname == null}">
 		<img src="/img/red_folder.ico" width="20px" > &nbsp; 
    </c:when>

    <c:otherwise>
 		<img src="/img/folder_89347.ico" width="20px" > &nbsp; 
    </c:otherwise>
</c:choose>

전체 목록</a>


        
<div class="list-group">
  <c:forEach items="${grouplist}" var="GroupVO">
  <a href="list?groupnum=${GroupVO.groupnum}" class="list-group-item list-group-item-action">
  <c:choose>
    <c:when test="${nowgroupnum == GroupVO.groupnum}">
        <img src="/img/red_folder.ico" width="20px" > &nbsp; 
    </c:when>

    <c:otherwise>
        <img src="/img/folder_89347.ico" width="20px" > &nbsp; 
    </c:otherwise>
</c:choose>

  ${GroupVO.name} </a>
  </c:forEach>
</div>
    </c:otherwise>
</c:choose>
 
 <c:if test="${codeType == 'read'}">
 <a href="list?groupnum=${lastPageGroup}" class="list-group-item list-group-item-action">
 <img src="/img/arrow_back.png" width="20px">
 뒤로가기</a>
 </c:if>
 
	
		<div class="close"></div>
	</div>
	<div class="btnMenuTest"></div>

<!-- 왼쪽 메뉴 모바일 전용 끝-->



<script type="text/javascript" src="/js/mobileMenu.js"></script>


</body>
</html>