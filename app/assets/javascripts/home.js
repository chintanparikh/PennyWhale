var c=0, words=['Show me the PE Ratios for $AAPL vs $GOOG','Show me the quarterly earnings growth for $FB','How much cash does $TSLA have','Show me the holdings for $GLRE'];

function loop(){
  $('#changer').delay(3000).fadeTo(300,0,function(){
     $(this).text(words[++c%words.length]).fadeTo(300,1,loop);
  });
}

$("#home.index").ready(function() {
  var heroHeight;
  heroHeight = window.innerHeight - document.getElementById("navigation").clientHeight;
  document.getElementById("hero").getElementsByTagName("div")[0].style.height = heroHeight + "px";
  loop();

  $("#query").autocomplete({
  	serviceUrl: '/app/queries/autocomplete.json',
  	triggerSelectOnValidInput: false,
  	minChars: 2,
  	preventBadQueries: false
  });
});



