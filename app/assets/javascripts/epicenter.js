
$(document).ready(function(){
	$("#unfollow-btn").hover(function(){
		$(this).html("Unfollow");
		$(this).removeClass("btn-primary");
		$(this).addClass("btn-danger");
	}, function(){
		$(this).html("Following");
		$(this).removeClass("btn-danger");
		$(this).addClass("btn-primary");
	});
})
