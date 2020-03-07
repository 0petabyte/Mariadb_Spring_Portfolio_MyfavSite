<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
<!-- 	<script type="text/javascript" src="/js/listAjax.js"></script> -->
		<meta charset="utf-8">
		<title>Welcome</title>
		<script>
$(document).ready(function(){
  $('.toast').toast('show');
});
</script>
	<script type="text/javascript">
	function getAllList(){
		console.log('allin');
		var touser = "${nowUser}";
		$.getJSON("/replies/all/"+touser, function(data){

			var str="";
			console.log(data.length);
		
			$(data).each(
				function(){
					var timestamp = this.updatedate;
					var date = new Date(timestamp);
					str+= "<body><div class='container'><div data-rno='"+this.rno+"' class='replyLi alert alert-success' style='width:80%; height:100px'><strong id='userName'> ["
					+this.replyer + "] </strong><button class='btn btn-outline-secondary' data-toggle='modal' data-target='#myModal' style='float:right;'>수정</button> <p id='spanReplyText'> " + this.replytext +  "</p><p>"+ date+" </p></div></div></body>";
					
					});
			$("#replies").html(str);
			});
		}
	</script>
		<script type="text/javascript">
		console.log('repli')
		var loginUser = "${nowUser}";
			$.getJSON("/replies/all/"+loginUser, function(data){

				var str="";
				console.log(data.length);
				$(data).each(
					function(){
						var timestamp = this.updatedate;
						var date = new Date(timestamp);
						str+= "<body><div class='container'><div data-rno='"+this.rno+"' class='replyLi alert alert-success' style='width:80%; height:100px'><strong id='userName'> ["
						+this.replyer + "] </strong><button class='btn btn-outline-secondary' data-toggle='modal' data-target='#myModal' style='float:right;'>수정</button> <p id='spanReplyText'> " + this.replytext + "</p><p>"+ date+" </p></div></div></body>";
						
						});
				//$("#replies").html(str);
				getPageList(1);
			
				});

		</script>
	<script type="text/javascript">
	$(function(){	
			$("#replyAddBtn").on("click", function(){
				var replyer = $("#newReplyWriter").val();
				var replytext = $("#newReplyText").val();
				var touser = "${nowUser}";
				$.ajax({
					type:'post',
					url:'/replies',
					headers:{
						"Content-Type" : "application/json",
						"X-HTTP-Method-Ovrride" : "POST"
						},
						dataType : 'text',
						data:JSON.stringify({
							replyer : replyer,
							replytext : replytext,
							touser : touser
							}),

							success : function(result){
								if(result == 'SUCCESS'){
									
									//getAllList();
									//$("#newReplyWriter").val("");
									$("#newReplyText").val("");
									alert("글이 등록되었습니다");
									getPageList(1);
									}
								}
					});
				});
			});
		</script>
		<script type="text/javascript">
		$(function(){	
			$("#replies").on("click", ".replyLi button", function(){
				var reply = $(this).parent();

				chRno = reply.attr("data-rno");
				var chReplyer = document.getElementById("userName").innerText.replace('[','').replace(']','');
				var chReply = document.getElementById("spanReplyText").innerText
				
				
				var replytext = reply[1]
				$("#modalBno").val(chRno);
				$("#modalReplyer").val(chReplyer);
				$("#modalReplytext").val(chReply);
				$("#myModal").show("slow");

				})
		});

		</script>
		<script type="text/javascript">
	$(function(){
		$("#replyDelBtn").on("click", function(){

			var rnoNum = chRno;

			$.ajax({
				type:'delete',
				url:'/replies/' + rnoNum,
				headers :{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
					},
					dataType:'text',
					success : function(result){
						console.log("result:" + result);
						if (result == "SUCCESS"){
							alert("삭제되었습니다.");
							$("modDiv").hide("slow");
							getAllList();
							//var replyPage = 1;
							//getPageList(replyPage);
							}
						}
				})
			})
		})
		</script>
	<script type="text/javascript">
	$(function(){
		$("#replyModBtn").on("click", function(){
			var rno = $("#modalBno").val();
			var replytext = $("#modalReplytext").val();
			var replyer = $("#modalReplyer").val();
			var testdata = 'test';
			$.ajax({
				type:'put',
				url:'/replies/' + rno,
				headers :{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"},
					data:JSON.stringify({
						replyer : replyer,
						replytext : replytext,
						}),
					dataType:'text',
					success : function(result){
						console.log("result:" + result);
						if (result == "SUCCESS"){
							alert("수정되었습니다.");
							$("modDiv").hide("slow");
							getAllList();
							//var replyPage = 1;
							//getPageList(replyPage);
							}
						}
				})

				
			})
		})
		</script>
		
		<script type="text/javascript">
		function getPageList(page){
			console.log("in");
			var touser="${nowUser}";
			$.getJSON("/replies/"+touser+"/"+page, function(data){
				console.log(data.list.length);
				
				var str ="";

				$(data.list).each(function(){
					var timestamp = this.updatedate;
					var date = new Date(timestamp);
					str+= "<body><div class='container'><div data-rno='"+this.rno+"' class='replyLi alert alert-success' style='width:80%; height:100px'><strong id='userName'> ["
					+this.replyer + "] </strong><button class='btn btn-outline-secondary' data-toggle='modal' data-target='#myModal' style='float:right;'>수정</button> <p id='spanReplyText'> " + this.replytext + "</p><p>"+ date+" </p></div></div></body>";
					
					});

				$("#replies").html(str);

				printPaging(data.pageMaker);
				})
			}
		</script>
		
		<script type="text/javascript">
			function printPaging(pageMaker){
				var str = "";

				if(pageMaker.prev){
					str += "<li class='page-item'><a class = 'page-link' href='"+(pageMaker.startPage-1)+"'> Previous </a></li>";
					}

				for(var i=pageMaker.startPage, len=pageMaker.endPage; i <=len; i++){
					var strClass = pageMaker.cri.page == i?'active':'';
					str += "<li class='page-item "+strClass+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
					}
				if(pageMaker.next){
					str += "<li class='page-item'><a class='page-link' href='"+(pageMaker.endPage+1)+"'> Next </a></li>";
					}
				console.log('in')
				$('.pagination').html(str);
				}
		</script>
		
		<script type="text/javascript">
		$(function(){
		var replyPage = 1;
		$(".pagination").on("click", "li a", function(event){
			event.preventDefault();
			replyPage = $(this).attr("href");
			getPageList(replyPage);
			});
		});
		</script>

	</head> 
	<body>


		<div class='container'>
		<h2>방명록</h2>
		<p>로그인하지 않는 사용자의 경우 쓰신글을 보시거나 수정 하실수 없습니다.<p>
		
		<div class="form-inline">
			<div style="width: 80%">
				<label style="float: left;">이름:</label><br> 

				<c:choose>
					<c:when test="${login.userid == null}">
						<input type="text" value="손님" name="replyer" readonly="readonly" class="form-control" >
					</c:when>
					<c:otherwise>
						<input type="text" name="replyer" id="newReplyWriter" class="form-control" value="${login.userid}" readonly="readonly">
					</c:otherwise>
				</c:choose>
				<button id="replyAddBtn" class="btn btn-primary" style="float: right;">전송</button>
		</div>
			

		</div>
		
			<div>
				메세지: <textarea style="width:80%; height: 100px;" name="replytext" id="newReplyText" class="form-control"></textarea>
			</div>
			
		
		<br>
		
		<div id="replies"></div>
		  <ul class="pagination justify-content-center" ></ul>
		</div>

  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">댓글 수정하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" style="width: 500px; height: 500px;">
          <input class="form-control" type="hidden" id='modalBno'>
          <label>작성자:</label><input class="form-control" type="text" id='modalReplyer'>
          <label>메세지:</label><textarea style="width: 500;height: 80%;" class="form-control" id='modalReplytext'></textarea>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" id='closeBtn' class="btn btn-secondary" data-dismiss="modal">취소</button>
          <button type="button" id='replyDelBtn' class="btn btn-danger" data-dismiss="modal">삭제</button>
          <button type="button" id='replyModBtn' class="btn btn-warning" data-dismiss="modal">수정완료</button>
          
        </div>
        
      </div>
    </div>
  </div>

	</body>
</html>

