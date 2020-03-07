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


<script>
$(function(){
	  $("#favAdd").click(function(){
		    if($.trim($("#urlInput").val())==''){
		      alert("Url을 입력해주세요.");
		      return false;
		    } 
		    $("#urlInsert").submit();
	  });
});
</script>

<script type="text/javascript">
function enterkey() {
    if (window.event.keyCode == 13) {

         // 엔터키가 눌렸을 때 실행할 내용
    	window.urlInsert.submit();
    }
}

</script>



<script type="text/javascript">

	
$(function(){
$(".delBtn").click(function(){

			var checkBtn = $(this);
			var tr = checkBtn.parent().parent();
			var td = tr.children();
			var no = td.eq(0).text();
				
			location.href="favRead?favnum="+no

});
});

</script>





</head>
<body>
<div id="paddingtop">
<div class="container">
<form action="urlInsert" name="urlInsert" id="urlInsert" role="form" method="post" style="position: sticky; top: 0; background-color: white">
  <div class="form-group">
  
<div class="alert alert-success">
  <c:choose>
    <c:when test="${nowgroupname == null}">
        <strong>전체 목록입니다.</strong>
    </c:when>

    <c:otherwise>
        <strong>${nowgroupname} 즐겨찾기 그룹입니다. ${groupcount} 개의 목록이 있습니다.
          <button id="groupDelBtn" type="button" class="btn btn-danger">그룹 삭제하기</button>
          <button id="favAdd" type="button" class="btn btn-primary" style="float: right">즐겨찾기 추가</button>
        </strong>
        
        
          <div class="form-group">
    <label for="url">URL:</label>
    <input id="urlInput" type="text" class="form-control" name="url">
  </div>
  <div class="form-group">
    <label for="memo">메모:</label>
    <input type="text" class="form-control" name="memo" onkeyup="enterkey();">
  </div>
  <div class="form-group">

    <input type="hidden" class="form-control" name="groupnum" value="${nowgroupnum}">

    


  </div>
    </c:otherwise>
</c:choose>




  

</div>

  
  </div>


 

</form>

<br>  
  <table id="favListTable"  class="table table-hover" >
    <thead>
      <tr class="table-active">
<!--       	<th>num</th> -->
        <th>URL (Link Direct)</th>
        <th>Memo (Modify/Del)</th>
<!--         <th>userid</th>
        <th>groupnum</th> -->
        <!-- <th>Time</th> -->
       <!--  <th>Modify</th> -->
      </tr>
    </thead>
    <tbody>
    


     <c:forEach items="${list}" var="urlList">
      <tr>
      	<td style="display:none;">${urlList.favnum}</td>
		<td><a href='${urlList.url}' target="_blank">${urlList.url}</a>
		</td>
		<td>
		  <div style="height: 20px; overflow:hidden;">
		      <a href="favRead${pageMaker.makeQuery(pageMaker.cri.page)}&favnum=${urlList.favnum}">${urlList.memo}</a>
		  </div>
		</td>
<%-- 		<td>
		<fmt:formatDate pattern="MM-dd HH:mm:ss" value="${urlList.nowdate}" />
		</td> --%>
		<%-- <td>${urlList.userid}</td>
		<td>${urlList.groupnum}</td> --%>
<%-- 		<td>
		<a class="btn btn-outline-danger" href="urlDelete?favnum=${urlList.favnum}" role="button">DELETE</a>
		</td> --%>
		
		<!-- <td>
		<button id="favDelBtn" class="delBtn btn btn-outline-info" type="button">수정</button></td> -->
      </tr>
	</c:forEach>
	

    
  
    </tbody>
  </table>
</div>
</div>

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




<!-- 모바일 왼쪽 메뉴 시작 -->
	<div id="mobileMenu" class="mobileMenu">
	
	<div style="height: 40px;">

 </div>

   <c:choose>
    <c:when test="${codeType == 'code' || codeType == 'read' }">
    
<div style="width:100%; margin: 0 auto; text-align:center;">
	<div class="btn-group" style="text-align:center;">
  		<button id="favBtn" type="button" class="favBtn btn btn-secondary">즐겨찾기</button>
  		<button id="codeBtn" type="button" class="codeBtn btn btn-success">코드</button>
	</div>
</div>
<div style="height: 10px;"></div>
    
<a href="code" class="list-group-item list-group-item-action">
<c:choose>
    <c:when test="${nowgroupname == null}">
 		<img src="img/red_folder.ico" width="20px" > &nbsp; 
    </c:when>

    <c:otherwise>
 		<img src="img/folder_89347.ico" width="20px" > &nbsp; 
    </c:otherwise>
</c:choose>

전체 목록</a> 
 
    
<div class="list-group">
  <c:forEach items="${codeGroup}" var="CodeGroup">
  <a href="code?groupnum=${CodeGroup.groupnum}" class="list-group-item list-group-item-action">
  <c:choose>
    <c:when test="${nowgroupnum == CodeGroup.groupnum}">
        <img src="img/red_folder.ico" width="20px" > &nbsp; 
    </c:when>

    <c:otherwise>
        <img src="img/folder_89347.ico" width="20px" > &nbsp; 
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
 		<img src="img/red_folder.ico" width="20px" > &nbsp; 
    </c:when>

    <c:otherwise>
 		<img src="img/folder_89347.ico" width="20px" > &nbsp; 
    </c:otherwise>
</c:choose>

전체 목록</a>


        
<div class="list-group">
  <c:forEach items="${grouplist}" var="GroupVO">
  <a href="list?groupnum=${GroupVO.groupnum}" class="list-group-item list-group-item-action">
  <c:choose>
    <c:when test="${nowgroupnum == GroupVO.groupnum}">
        <img src="img/red_folder.ico" width="20px" > &nbsp; 
    </c:when>

    <c:otherwise>
        <img src="img/folder_89347.ico" width="20px" > &nbsp; 
    </c:otherwise>
</c:choose>

  ${GroupVO.name} </a>
  </c:forEach>
</div>
    </c:otherwise>
</c:choose>
 
 <c:if test="${codeType == 'read'}">
 <a href="code?groupnum=${nowgroupnum}" class="list-group-item list-group-item-action">
 <img src="img/arrow_back.png" width="20px">
 뒤로가기</a>
 </c:if>
	
		<div class="close"></div>
	</div>
	<div class="btnMenuTest"></div>
<!-- 모바일 왼쪽 메뉴 끝 -->
	
	
	
<script type="text/javascript" src="/js/mobileMenu.js"></script>

</body>
</html>