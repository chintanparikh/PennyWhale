$(document).ready(function() {
	$("#form1").ajaxForm(function() {
		console.log("Done");
	});

	$('#email-input').bind('keypress keydown keyup', function(e){
       if(e.keyCode == 13) { e.preventDefault(); }
    });	

	$("#email-input").keyup(function(e)
	{
		if (e.keyCode == 13)
		{
			$("#form1").submit();
			$("#modal").modal();
			$("#form1").hide();
			$("#form-input-group").append("<p>You've signed up! Email <a href='mailto:hello@pennywhale.com'>hello@pennywhale.com</a> if you have any questions or features requests");
		}
	})

	$("#email-submit").click(function()
	{
		$("#form1").submit();
		$("#modal").modal();
		$("#form1").hide();
		$("#form-input-group").append("<p>You've signed up! Email <a href='mailto:hello@pennywhale.com'>hello@pennywhale.com</a> if you have any questions or features requests");
	});


});