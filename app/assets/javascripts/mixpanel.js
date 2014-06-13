$("#home.index").ready(function()
{
	mixpanel.track("Visit landing page");

	$("#query").focus(function(){
		mixpanel.track("Type initial query");
		console.log('test');
	});

	$("#query_form").submit(function(){
		mixpanel.track("Submit initial query");
		return true;
	});

	$("#bottom_signup_button").click(function() {
		mixpanel.track("Click bottom signup button")
	});
});

$("#registrations.new").ready(function() {
	mixpanel.track("Visit registration page");

	$(".btn.btn-success").ready(function() {
		mixpanel.track("Complete registration");
	});
})


