
$(document).ready(function()
{

	var c=0, words=['PE Ratio','total debt/equity ratio','revenue','quarterly earnings growth'];


	function loop(){
	  $('#changer').delay(3000).fadeTo(300,0,function(){
	     $(this).text( words[++c%words.length]).fadeTo(300,1,loop);
	  });
	}

	loop();
	$("form").on('click', "#query-vs", function()
	{
		new_fields = '<div class="row"><div class="col-lg-3"></div><div class="col-lg-2"><div class="form-group"><input class="form-control input-lg" id="ticker" name="ticker" placeholder="TCKR" type="text"></div></div><div class="col-lg-4"><div class="form-group"></div></div><div class="col-lg-3"></div></div>';

    	$("#query-fields").append(new_fields);
	});

	$("#query").autocomplete({
		serviceUrl: '/app/queries/autocomplete.json',
		triggerSelectOnValidInput: false,
		minChars: 2,
		preventBadQueries: false
	});

	
});