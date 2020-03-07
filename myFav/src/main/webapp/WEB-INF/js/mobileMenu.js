$(".btnMenuTest").click(function() {
$("#mobileMenu").addClass("open");
});
$(".close").click(function() {
	$("#mobileMenu").removeClass("open");
});
$(".favBtn").click(function() {
location.href = "/fav/list"
});
	$(".codeBtn").click(function() {
		location.href = "/code/list"
});
