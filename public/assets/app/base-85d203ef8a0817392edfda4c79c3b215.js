$(document).ready(function(){function e(){$("#changer").delay(3e3).fadeTo(300,0,function(){$(this).text(i[++o%i.length]).fadeTo(300,1,e)})}var o=0,i=["Show me the PE Ratios for $AAPL vs $GOOG","Show me the quarterly earnings growth for $FB","How much cash does $TSLA have","Show me the holdings for $GLRE"];e(),$("form").on("click","#query-vs",function(){new_fields='<div class="row"><div class="col-lg-3"></div><div class="col-lg-2"><div class="form-group"><input class="form-control input-lg" id="ticker" name="ticker" placeholder="TCKR" type="text"></div></div><div class="col-lg-4"><div class="form-group"></div></div><div class="col-lg-3"></div></div>',$("#query-fields").append(new_fields)}),$("#query").autocomplete({serviceUrl:"/app/queries/autocomplete.json",triggerSelectOnValidInput:!1,minChars:2,preventBadQueries:!1})});