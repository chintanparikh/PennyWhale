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

	$('#card-form').card({
	    // a selector or jQuery object for the container
	    // where you want the card to appear
	    container: '.card-wrapper', // *required*
	    numberInput: '#card_number', // optional — default input[name="number"]
	    expiryMonthInput: '#card_month', // optional — default input[name="expiry"]
	    expiryYearInput: '#card_year',
	    cvcInput: '#card_code', // optional — default input[name="cvc"]
	    nameInput: '#card_name', // optional - defaults input[name="name"]

	    width: 300, // optional — default 350px
	    formatting: true // optional - default true
	});


});