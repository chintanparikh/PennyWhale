module App::GraphsHelper
	# This code is TEMPORARY for v1
	# TODO switch to d3 for all graphing
	def generate_graph intent, tickers
		graph = ''
		case intent.name
		when "PE Ratio"
			graphs = []
			tickers.each do |ticker|
				graphs.push({content: "<img src='http://www.nasdaq.com//charts/#{ticker}_per.jpeg' />", ticker: ticker, id: 'graph'})
			end
			graph = make_tabs graphs
		when "PEG Ratio"
			graphs = []
			tickers.each do |ticker|
				graphs.push({content: "<img src='http://www.nasdaq.com//charts/#{ticker}_peg.jpeg' />", ticker: ticker, id: 'graph'})
			end
			graph = make_tabs graphs
		when "Diluted EPS"
			graphs = []
			tickers.each do |ticker|
				graphs.push({content: "<img src='http://www.nasdaq.com//charts/#{ticker}_epss.jpeg' />", ticker: ticker, id: 'graph'})
			end
			graph = make_tabs graphs
		when "Quarterly earnings growth"
			graphs = []
			tickers.each do |ticker|
				graphs.push({content: "<img src='http://www.nasdaq.com//charts/#{ticker}_egr.jpeg' />", ticker: ticker, id: 'graph'})
			end
		else
			graph = "<!-- TradingView Widget BEGIN -->
							<div id='tv-medium-widget-7cd56'></div>
							<script type='text/javascript' src='https://d33t3vvu2t2yu5.cloudfront.net/tv.js'></script>
							<script type='text/javascript'>
							new TradingView.MediumWidget({
							 'container_id': 'tv-medium-widget-7cd56',
							 'symbols': ["
		 	tickers.each do |ticker|
		 		graph += "['#{ticker}', '#{ticker}']"
		 		graph += ',' unless ticker.equal? tickers.last
		 	end

		  graph += "],
							 'gridLineColor': '#E9E9EA ',
							 'fontColor': '#158cba ',
							 'underLineColor': '#F0F0F0 ',
							 'timeAxisBackgroundColor': '#E9EDF2 ',
							 'trendLineColor': '#158cba ',
							 'width': '100%',
							 'height': 350
							});
							</script>
							<!-- TradingView Widget END -->"
		end
		graph
	end

end
