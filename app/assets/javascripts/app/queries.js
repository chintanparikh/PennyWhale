$(document).ready(function()
{
	$("form").on('click', "#query-vs", function()
	{
		new_fields = '<div class="row"><div class="col-lg-3"></div><div class="col-lg-2"><div class="form-group"><input class="form-control input-lg" id="ticker" name="ticker" placeholder="TCKR" type="text"></div></div><div class="col-lg-4"><div class="form-group"></div></div><div class="col-lg-3"></div></div>';

    	$("#query-fields").append(new_fields);
	});
});