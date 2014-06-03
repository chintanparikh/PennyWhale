function populate_table(table_index, url)
{
	$.ajax({
		type: 'GET',
		url: "http://accesscontroloverride.herokuapp.com",
		dataType: 'jsonp',
		data: {url: url},
		success: function(data) {
			$.each(data['rows'], function(index, value)
			{
				elem = "<tr>";
				elem += "<td>";
				elem += value.name;
				elem += "</td>";
				elem += "<td>";
				elem += value.current_shares;
				elem += "</td>";
				elem += "<td>";
				elem += value.current_mv;
				elem += "</td>";
				elem += "<td>";
				elem += value.current_percent_of_portfolio;
				elem += "</td>";
				elem += "<td>";
				elem += value.previous_percent_of_portfolio;
				elem += "</td>";
				elem += "<td>";
				elem += value.ranking;
				elem += "</td>";
				elem += "<td>";
				elem += value.shares_change;
				elem += "</td>";
				elem += "</tr>";
				console.log(table_index);
				$($('tbody')[table_index]).append(elem)
			});
		}
	});
}

$(document).ready(function()
{
	$("form").on('click', "#query-vs", function()
	{
		new_fields = '<div class="row"><div class="col-lg-3"></div><div class="col-lg-2"><div class="form-group"><input class="form-control input-lg" id="ticker" name="ticker" placeholder="TCKR" type="text"></div></div><div class="col-lg-4"><div class="form-group"></div></div><div class="col-lg-3"></div></div>';

    	$("#query-fields").append(new_fields);
	});

	$("#query").autocomplete({
		serviceUrl: '/app/queries/autocomplete.json',
		triggerSelectOnValidInput: false
	});

	// Code for populating 13f tables. Needs to be moved into it's own file at some point
	if (("#13f").length) {
		$("#13f table").each(function(index)
		{
			table = this;
			populate_table(index, $(table).data('url'))
		});
	}
});