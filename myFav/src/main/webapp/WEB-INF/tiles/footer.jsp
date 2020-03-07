<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Gothic+A1&display=swap" rel="stylesheet">
<style type="text/css">
#groupInsert{
font-family: 'Gothic A1', sans-serif;
}
</style>


<script>
$(function(){
	  $("#insertBtn").click(function(){
		    if($.trim($("#nameInput").val())==''){
		      alert("그룹명을 입력해주세요.");
		      return false;
		    } 
		    $("#groupForm").submit();
	  });
});
</script>

<script>
$(function(){
	  $("#codeInsertBtn").click(function(){
		    if($.trim($("#codename").val())==''){
		      alert("그룹명을 입력해주세요.");
		      return false;
		    } 
		    $("#codeInsertForm").submit();
	  });
});
</script>
</head>
<body>
<hr>

<c:choose>
	<c:when test="${nowTab == 'code'}">
	  <a href="#" data-toggle="modal" data-target="#codeModal" class="list-group-item list-group-item-action list-group-item-primary leftMenu">
	  <img src="/img/plus.png" width="10px">  새 코드메모 그룹</a>
	</c:when>
	<c:otherwise>
	  <a href="#" data-toggle="modal" data-target="#favModal" class="list-group-item list-group-item-action list-group-item-success leftMenu">
	  <img src="/img/plus.png" width="10px">  새 즐겨찾기 그룹</a>
	</c:otherwise>

</c:choose>





 <!-- Button to Open the Modal -->
<!--   <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button> -->

  <!-- The Modal -->
  <div class="modal fade" id="favModal" >
    <div class="modal-dialog">
      <div class="modal-content">
      
<div id="groupInsert" class="container" style="width:500px; height:100%; padding: 10px; margin: 0 auto;">

  <h2>즐겨찾기 그룹등록</h2>
  <hr>
  <form action="/${nowUser}/fav/groupInsert" method="post" id="groupForm">
   <div class="form-inline form-group" >
      <label for="phone_num" class="col-md-4 control-label">그룹명:</label>
      <div class="col-xs-9">
       <input type="text" class="form-control" id="nameInput" name="name">
       <input type="hidden" name="userid" value="${login.userid}">
      </div>
     </div>


    <button id="insertBtn" type="button" class="btn btn-primary" style="float: right;">등록</button>
    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
  </form>
</div>

        
      </div>
    </div>
  </div>


 <!-- The Modal -->
  <div class="modal fade" id="codeModal" >
    <div class="modal-dialog">
      <div class="modal-content">
      
<div id="groupInsert" class="container" style="width:500px; height:100%; padding: 10px; margin: 0 auto;">

  <h2>코드 그룹등록</h2>
  <hr>
  <form action="/${nowUser}/code/groupInsert" method="post" id="codeInsertForm">
   <div class="form-inline form-group" >
      <label for="phone_num" class="col-md-4 control-label">그룹명:</label>
      <div class="col-xs-9">
       <input type="text" class="form-control" id="codename" name="name">
       <input type="hidden" name="userid" value="${login.userid}">
      </div>
     </div>


    <button id="codeInsertBtn" type="button" class="btn btn-primary" style="float: right;">등록</button>
    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
  </form>
</div>

        
      </div>
    </div>
  </div>


<!-- <div class="jumbotron text-center" style="margin-bottom:0">

	<div class="area_legal">
		<a href="/service/cs/privacy" target="_blank">개인정보처리방침</a>
		<a href="/service/cs/policy" target="_blank">책임의 한계와 법적고지</a>
		<a href="/service/cs/teenager" target="_blank">청소년 보호정책</a>
	</div>
	<div class="area_company">© 2019<span id="nowYear"></span>&nbsp;&nbsp;•&nbsp;&nbsp;ETHKOREA.CO.KR</div>
</div> -->
</body>