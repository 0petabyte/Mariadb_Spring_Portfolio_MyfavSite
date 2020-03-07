function getAllList(){
$.getJSON("/replies/all/"+bno, function(data){

	var str="";
	console.log(data.length);

	$(data).each(
		function(){
			str+= "<li data-rno='"+this.rno+"' class='replyLi'>"
			+this.rno + ":" + this.replytext + "</li>";
			
			});
	$("#replies").html(str);
	});
}
