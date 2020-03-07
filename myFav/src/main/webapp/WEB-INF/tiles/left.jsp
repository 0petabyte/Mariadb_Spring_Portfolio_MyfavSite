<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<link rel="stylesheet" type="text/css" href="/css/leftMenu.css">
<script type="text/javascript">
$(function(){
	$("#favBtn").click(function(){
		location.href="/"+"${nowUser}"+ "/fav/list"
		});
});
</script>
<script type="text/javascript">
$(function(){
	$("#codeBtn").click(function(){
		location.href="/"+"${nowUser}"+ "/code/list"
		});
});
</script>

<script>

   function changeContent(name){
	
      $('#main').children().remove();
      $('#main').load(name);

   }

</script>
</head>
<body>


<!-- 상단 여백용 -->
 <div style="height: 40px;"></div>
 
 <div class="list-group">
  <a href="/${nowUser}/fav/list" class="list-group-item list-group-item-action leftMenu"><img src="/img/home.png" width="20px"> 홈</a>
  <a href="/${nowUser}/code/portfolio" class="list-group-item list-group-item-action leftMenu" ><img src="/img/profile.png" width="20px"> 포트폴리오</a>
  <a href="/${nowUser}/guestBook" class="list-group-item list-group-item-action leftMenu"><img src="/img/paper.png" width="20px"> 방명록</a>
</div>
 

<hr>
<!-- code 와 fav 타입에 따라 따로 버튼색상 변경 -->


<!-------------------------- 코드 메뉴 시작 ------------------------------->
   <c:choose>
   

    <c:when test="${nowTab == 'code'}">
		<div style="width:100%; margin: 0 auto; text-align:center;">
			<div class="btn-group" style="text-align:center;">
	  		<button id="favBtn" type="button" class="btn btn-secondary">즐겨찾기</button>
	  		<button id="codeBtn" type="button" class="btn btn-success">코드</button>
			</div>
		</div>
		

<div style="height: 10px;"></div>
	<a href="/${nowUser}/code/list" class="list-group-item list-group-item-action leftMenu">
	
	
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
	  	<a href="/${nowUser}/code/list?groupnum=${CodeGroup.groupnum}" class="list-group-item list-group-item-action leftMenu">
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
  		<button id="favBtn" type="button" class="btn btn-success">즐겨찾기</button>
  		<button id="codeBtn" type="button" class="btn btn-secondary ">코드</button>
	</div>
</div>
<div style="height: 10px;"></div>        
        
        
<a href="/${nowUser}/fav/list" class="list-group-item list-group-item-action leftMenu">
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
  <a href="/${nowUser}/fav/list?groupnum=${GroupVO.groupnum}" class="list-group-item list-group-item-action leftMenu">
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
 
<!-------------------------- 코드 메뉴 끝 ------------------------------->


<c:choose>
<c:when test="${backBtn == 'codeRead'}">
	<a href="javascript:history.go(-1)" class="list-group-item list-group-item-action">
		<img src="/img/arrow_back.png" width="20px">
	뒤로가기</a>
</c:when>

<c:when test="${backBtn == 'favRead'}">
	<!-- <a href="list?groupnum=${nowgroupnum}" class="list-group-item list-group-item-action"> -->
	<a href="javascript:history.go(-1)" class="list-group-item list-group-item-action">
		<img src="/img/arrow_back.png" width="20px">
	뒤로가기</a>
</c:when>

<c:otherwise>
</c:otherwise>
</c:choose>

 

</body>
</html>
