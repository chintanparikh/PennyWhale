
$(document).ready(function()
{

	var c=0, words=['Show me the PE Ratios for $AAPL vs $GOOG','Show me the quarterly earnings growth for $FB','How much cash does $TSLA have','Show me the holdings for $GLRE'];


	function loop(){
	  $('#changer').delay(3000).fadeTo(300,0,function(){
	     $(this).text(words[++c%words.length]).fadeTo(300,1,loop);
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

	//financials highlighting 

	$('input').click(function(){

		//check if its the first checkbox

		var first_rows = []
		$('tbody').each(function(index, elem) {
				first_rows.push($(elem).children()[1]);
		});

		if (first_rows.indexOf($(this).parent().parent()[0]) > -1) {
			console.log($(this).parent().parent().parent().find('input'));
			var inputs = [];
			
			$(this).parent().parent().parent().find('input').each(function(){
				inputs.push($(this));
			});

			inputs.shift();

			$(inputs).each(function(){
				$(this).click();
			});	
		}

		// otherwise just handle that shit 

		var row = $($(this).parent()).parent();

		if ($(this).prop('checked')){
			var elements = [];
			$(row).children().each(function(){
				elements.push($(this));
			});

			elements.shift();
			elements.pop();
			
			$(elements).each(function(index){
				if (index < elements.length-1){
					var first_num = parseInt($(this).html().replace('$','').replace(',','').replace('.', ''))
					var second_num = parseInt($(elements[index+1]).html().replace('$','').replace(',','').replace('.', ''))
					if (second_num > first_num){
						$(elements[index+1]).css('background-color', 'rgba(53, 207, 53, 0.39)');
					}
					else if (second_num < first_num){
						$(elements[index+1]).css('background-color', 'rgba(246, 30, 30, 0.43)');	
					}
					else
						null;
				}
				
			});
		}
		else
		{
			$($(row).children()).each(function(){
				$(this).css('background-color','#FFFFFF');
			});

		}
		

	});

	




	
});




