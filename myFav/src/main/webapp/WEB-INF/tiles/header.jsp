<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome</title>
		<style>
		#searchbar{
		float: right;
		margin: 10px 10px 10px 10px;
		
		}
		
		

		@media (max-width: 768px) {

		.searchSelect{
		width: 120px;
		}
		.searchInput{
		width: 170px;}
		
		}
		#searchbar{
		magin:0 auto;}
		</style>
		
		
	</head> 
	<body>

	


  <c:choose>
	    <c:when test="${headerType == 'fav'}">

	
<div class="row searchDiv" id="searchbar" >
<form action="list">
	<div class="form-inline">
<c:choose>
	<c:when test="${login.username == null}">
	<div><a href="/login">(로그인)</a></div>
	</c:when>
	<c:otherwise>
	<div>${login.username}님 반갑습니다.
	<a href="/logout">(로그아웃)</a></div>
	</c:otherwise>
</c:choose>
	 
	
	 		<select class="form-control searchSelect mr-sm-1" name="searchType">
			  <option value="n"
			  <c:out value="${cri.searchType ==null?'selected':''}"/>>
			  ---</option>
			  <option value="u"
			  <c:out value="${cri.searchType eq 'u'?'selected':''}"/>>
			  URL</option>
		  	  <option value="m"
			  <c:out value="${cri.searchType eq 'm'?'selected':''}"/>>
			  MEMO</option>
		  	  <option value="um"
			  <c:out value="${cri.searchType eq 'um'?'selected':''}"/>>
			  URL & MEMO</option>
			</select>
						    <input class="form-control mr-sm-2 searchInput" type="text" id="keywordInput" name="keyword" value='${cri.keyword}'>
    <button class="btn btn-success" type="submit">Search</button>
			    </div>
  </form>
</div>
			
	    </c:when>
	
	    <c:when test="${headerType == 'code'}">
	    
	    <div class="row searchDiv" id="searchbar" >
<form action="list">
	<div class="form-inline">
	<c:choose>
	<c:when test="${login.username == null}">
	<div><a href="/login">(로그인)</a></div>
	</c:when>
	<c:otherwise>
	<div>${login.username}님 반갑습니다.
	<a href="/logout">(로그아웃)</a></div>
	</c:otherwise>
</c:choose>

   	 		<select class="form-control searchSelect mr-sm-1" name="searchType">
			  <option value="n"
			  <c:out value="${cri.searchType ==null?'selected':''}"/>>
			  ---</option>
			  <option value="t"
			  <c:out value="${cri.searchType eq 't'?'selected':''}"/>>
			  Title</option>
		  	  <option value="c"
			  <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
			  Content</option>
		  	  <option value="tc"
			  <c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
			  Title & Content</option>
			</select>
			    <input class="form-control mr-sm-2 searchInput" type="text" id="keywordInput" name="keyword" value='${cri.keyword}'>
    <button class="btn btn-success" type="submit">Search</button>
						    </div>
  </form>
</div>
	    
	    </c:when>
	</c:choose>



	</body>
</html>

