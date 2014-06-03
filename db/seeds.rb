# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def match_phrases_to_intent phrases, intent
	phrases.each do |phrase|
		Phrase.create(phrase: phrase, intent_id: intent.id)
		puts "Creating phrase #{phrase} for #{intent.name}"
	end
end

# After Hours Price
intent = Intent.create(name: 'After Hours Price', code: "pull_from_yahoo('c8')")
match_phrases_to_intent(['After hours', 'After hours price', 'After hours change'], intent)

# Annualized Gains
intent = Intent.create(name: 'Annualized Gains', code:"pull_from_yahoo('g3')")
match_phrases_to_intent(['Annualized Gain', 'Annualized Gains'], intent)

# Ask (and realtime)
intent = Intent.create(name: 'Ask', code: 'realtime_pull_from_yahoo("b2", "a0")')
match_phrases_to_intent(['Ask', 'Ask Price'], intent)

# Ask Size
intent = Intent.create(name: 'Ask Size', code:"pull_from_yahoo('a5')")
match_phrases_to_intent(['Ask Size'], intent)

# Average Daily Volume
intent = Intent.create(name: 'Average Daily Volume', code:"pull_from_yahoo('a2')")
match_phrases_to_intent(['Average volume', 'Average daily volume'], intent)

# Bid
intent = Intent.create(name: 'Bid', code: 'realtime_pull_from_yahoo("b3", "b0")')
match_phrases_to_intent(['Bid', 'Bid price'], intent)

# Bid size
intent = Intent.create(name: 'Bid	Size', code:"pull_from_yahoo('b6')")
match_phrases_to_intent(['Bid size'], intent)

# Book Value per Share
intent = Intent.create(name: 'Book Value per Share', code:"pull_from_yahoo('b4')")
match_phrases_to_intent(['Book Value per Share', 'Book Value', 'bv/s', 'bs'], intent)

# Change + %
intent = Intent.create(name: 'Price change', code: "pull_from_yahoo('c0')")
match_phrases_to_intent(['change', 'change in price', 'price change', 'change since open', 'change in percent'], intent)

# Change from Fifty Day Moving Average + %
intent = Intent.create(name: 'Change from Fifty Day Moving Average', code: "percent_change_yahoo('m7','m8')")
match_phrases_to_intent(['change from fifty day moving average', 'change from fifty day average', 'change from 50 day moving average', 'change from 50 day average'], intent)

# Change from 200 Day Moving Average + %
intent = Intent.create(name: 'Change from Two Hundred Day Moving Average', code: "percent_change_yahoo('m5', 'm6')")
match_phrases_to_intent(['change from two hundred day moving average', 'change from two hundred day average', 'change from 200 day moving average', 'change from 200 day average'], intent)

# Change from year high + %
intent = Intent.create(name: 'Change from Year High', code: "percent_change_yahoo('k4','k5')")
match_phrases_to_intent(['change from year high'], intent)

# Commission
intent = Intent.create(name: 'Commission', code:"pull_from_yahoo('c3')")
match_phrases_to_intent(['commission'], intent)

# Currency
intent = Intent.create(name: 'Currency', code:"pull_from_yahoo('c4')")
match_phrases_to_intent(['currency'], intent)

# Days High
intent = Intent.create(name: 'Days High', code:"pull_from_yahoo('h0')")
match_phrases_to_intent(["Day's high", "days high", "price high", "highest price in the last day", 'highest price in day', 'todays high'], intent)

# Days Low
intent = Intent.create(name: 'Days Low', code:"pull_from_yahoo('g0')")
match_phrases_to_intent(["Day's low", "days low", "price low", "lowest price in the last day", 'lowest price in day', 'todays low'], intent)

# Days Range + realtime
intent = Intent.create(name: 'Days Range', code: 'pull_from_yahoo("m0")')
match_phrases_to_intent(["day's range", 'days range', 'range', 'todays range'], intent)

# Days Value Change + realtime
intent = Intent.create(name: 'Days Value Change', code: 'pull_from_yahoo("w1")')
match_phrases_to_intent(["day's value change", "days value change", 'value cahnge today', 'todays value change'], intent)

# Dividend pay date
intent = Intent.create(name: 'Dividend Pay Date', code:"pull_from_yahoo('r1')")
match_phrases_to_intent(['dividend pay date', 'dividend date'], intent)

# Trailing Annual Dividend Yield + %
intent = Intent.create(name: 'Trailing Annual Dividend Yield', code: "percent_change_yahoo('d0','y0')")
match_phrases_to_intent(['trailing annual dividend yield', 'trailing annual dividend yield percent', 'trailing annual dividend yield percentage'], intent)

# Diluted EPS
intent = Intent.create(name: 'Diluted EPS', code:"pull_from_yahoo('e0')")
match_phrases_to_intent(['diluted eps', 'eps', 'earnings per share', 'diluted earnings per share'], intent)

# EBITDA
intent = Intent.create(name: 'EBITDA', code:"pull_from_yahoo('j4')")
match_phrases_to_intent(['EBITDA', 'earnings'], intent)

# EPS Estimate Current Year
intent = Intent.create(name: 'EPS Estimate Current Year', code:"pull_from_yahoo('e7')")
match_phrases_to_intent(['eps estimate this year', 'eps estimate current year'], intent)

# EPS Estimate Next Quarter
intent = Intent.create(name: 'EPS Estimate Next Quarter', code:"pull_from_yahoo('e9')")
match_phrases_to_intent(['eps estimate next quarter', 'eps estimate'], intent)

# EPS Estimate Next Year
intent = Intent.create(name: 'EPS Estimate Next Year', code:"pull_from_yahoo('e8')")
match_phrases_to_intent(['eps estimate next year'], intent)

# Ex Dividend Date
intent = Intent.create(name: 'Ex Dividend Date', code:"pull_from_yahoo('q0')")
match_phrases_to_intent(['ex dividend Date'], intent)

# 50 Day Moving Average
intent = Intent.create(name: '50 Day Moving Average', code:"pull_from_yahoo('m3')")
match_phrases_to_intent(['fifty day moving average', '50 day moving average', 'average', 'price average', 'average price'], intent)

# Shares Float
intent = Intent.create(name: 'Shares Float', code:"pull_from_yahoo('f6')")
match_phrases_to_intent(['shares float', 'float'], intent)

# High Limit
intent = Intent.create(name: 'High Limit', code:"pull_from_yahoo('l2')")
match_phrases_to_intent(['high limit'], intent)

# Holdings Gain + %
intent = Intent.create(name: 'Holdings Gain', code: "percent_change_yahoo('g4','g1')")
match_phrases_to_intent(['holdings gain', 'gain from holdings', 'holdings gain percentage', 'percentage holdings gain'], intent)

# Holdings Value
intent = Intent.create(name: 'Holdings Value', code:"pull_from_yahoo('v1')")
match_phrases_to_intent(['holdings value'], intent)

# Low Limit
intent = Intent.create(name: 'Low Limit', code:"pull_from_yahoo('l3')")
match_phrases_to_intent(['low limit'], intent)

# Market Capitalization
intent = Intent.create(name: 'Market Capitalization', code: 'pull_from_yahoo("j1")')
match_phrases_to_intent(['market cap', 'market Capitalization'], intent)

# Name
intent = Intent.create(name: 'Name', code:"pull_from_yahoo('n0')")
match_phrases_to_intent(['name'], intent)

# One Year Target Price
intent = Intent.create(name: 'One Year Target Price', code:"pull_from_yahoo('t8')")
match_phrases_to_intent(['One year target price', 'target price for one year', 'target price'], intent)

# Open
intent = Intent.create(name: 'Open', code:"pull_from_yahoo('a0')")
match_phrases_to_intent(['open'], intent)

# PEG Ratio
intent = Intent.create(name: 'PEG Ratio', code:"pull_from_yahoo('r5')")
match_phrases_to_intent(['PEG', 'peg ratio', 'p/eg ratio', 'p/eg', 'price to earnings growth', 'price to earnings growth ratio'], intent)

# PE Ratio
intent = Intent.create(name: 'PE Ratio', code: 'pull_from_yahoo("r0")')
match_phrases_to_intent(['PE', 'p/e', 'PE Ratio', 'P/E ratio', 'price to earnings ratio', 'price to earnings'], intent)

# Previous Close
intent = Intent.create(name: 'Previous Close', code:"pull_from_yahoo('p0')")
match_phrases_to_intent(['previous close'], intent)

# Price book
intent = Intent.create(name: 'Price Book', code:"pull_from_yahoo('p6')")
match_phrases_to_intent(['price book'], intent)

# Price over EPS estimate for current year
intent = Intent.create(name: 'Price/EPS estimate for current year', code:"pull_from_yahoo('r6')")
match_phrases_to_intent(['price over eps estimate for current year'], intent)

# Price over EPS estimate for next year
intent = Intent.create(name: 'Price/EPS estimate for next year', code:"pull_from_yahoo('r7')")
match_phrases_to_intent(['price over eps estimate for next year'], intent)

# Revenue
intent = Intent.create(name: 'Revenue', code:"pull_from_yahoo('s6')")
match_phrases_to_intent(['revenue'], intent)

# Shares Owned
intent = Intent.create(name: 'Shares Owned', code:"pull_from_yahoo('s1')")
match_phrases_to_intent(['shares owned', 'shares retention'], intent)

# Shares Outstanding
intent = Intent.create(name: 'Shares Outstanding', code:"pull_from_yahoo('j2')")
match_phrases_to_intent(['shares outstanding'], intent)

# Short Ratio
intent = Intent.create(name: 'Short Ratio', code:"pull_from_yahoo('s7')")
match_phrases_to_intent(['short ratio'], intent)

# 200 Day Moving Average
intent = Intent.create(name: '200 Day Moving Average', code:"pull_from_yahoo('m4')")
match_phrases_to_intent(['two hundred day moving average', '200 day moving average', '200 day average', 'two hundred day average', '200 day price average'], intent)

# Volume
intent = Intent.create(name: 'Volume', code:"pull_from_yahoo('v0')")
match_phrases_to_intent(['volume'], intent)

# Year High
intent = Intent.create(name: 'Year High', code:"pull_from_yahoo('k0')")
match_phrases_to_intent(['year high', '52 week high'], intent)

# Year Low
intent = Intent.create(name: 'Year Low', code:"pull_from_yahoo('j0')")
match_phrases_to_intent(['year low', '52 week low'], intent)

# Year range
intent = Intent.create(name: 'Year range', code:"pull_from_yahoo('w0')")
match_phrases_to_intent(['year range', 'years range'], intent)

# Enterprise Value
Intent.create(name: 'Enterprise Value', code: "yahoo_key_stats('enterprise value')")
match_phrases_to_intent(['enterprise value', 'value', 'valuation'], intent)

# Trailing P/E
Intent.create(name: 'Trailing P/E', code: "yahoo_key_stats('trailing p/e')")
match_phrases_to_intent(['Trailing PE', 'trailing p/e', 'Trailing PE Ratio', 'Trailing P/E ratio', 'trailing price to earnings ratio', 'trailing price to earnings'], intent)

# Forward P/E
Intent.create(name: 'Forward P/E', code: "yahoo_key_stats('forward p/e')")
match_phrases_to_intent(['Forward PE', 'forward p/e', 'Forward PE Ratio', 'Forward P/E ratio', 'forward price to earnings ratio', 'forward price to earnings'], intent)

# Price/Sales
Intent.create(name: 'Price/Sales', code: "yahoo_key_stats('price/sales)")
match_phrases_to_intent(['Price/Sales', 'Price/Sales ratio', 'PS ratio', 'ps', 'p/s', 'p/s ratio', 'price sales', 'price sales ratio'], intent)

# Price/Book
Intent.create(name: 'Price/Book', code: "yahoo_key_stats('price/book')")
match_phrases_to_intent(['Price/Book', 'Price/Book ratio', 'PB ratio', 'pb', 'p/b', 'p/b ratio', 'price book', 'price book ratio'], intent)

# Enterprise Value/Revenue
Intent.create(name: 'Enterprise Value/Revenue', code: "yahoo_key_stats('enterprise value/revenue')")
match_phrases_to_intent(['Enterprise Value/Revenue', 'ev/r', 'enterprise value revenue', 'evr ratio', 'evr', 'enterprise value over revenue'], intent)

# Enterprise Value/EBITDA
Intent.create(name: 'Enterprise Value/EBITDA', code: "yahoo_key_stats('enterprise value/ebitda')")
match_phrases_to_intent(['Enterprise Value/EBITDA', 'Enterprise Value over EBITDA'], intent)

# Fiscal year ends
Intent.create(name: 'Fiscal year ends', code: "yahoo_key_stats('fiscal year ends')")
match_phrases_to_intent(['Fiscal year ends', 'end of fiscal year'], intent)

# Most recent quarter
Intent.create(name: 'Most recent quarter', code: "yahoo_key_stats('most recent quarter')")
match_phrases_to_intent(['Most recent quarter'], intent)

# Profit margin
Intent.create(name: 'Profit Margin', code: "yahoo_key_stats('profit margin')")
match_phrases_to_intent(['Profit margin'], intent)

# Operating margin
Intent.create(name: 'Operating margin', code: "yahoo_key_stats('operating margin')")
match_phrases_to_intent(['operating margin'], intent)

# Return on assets
Intent.create(name: 'Return on assets', code: "yahoo_key_stats('return on assets')")
match_phrases_to_intent(['return on assets', 'roa'], intent)

# Return on equity
Intent.create(name: 'Return on equity', code: "yahoo_key_stats('return on equity')")
match_phrases_to_intent(['return on equity', 'roe'], intent)

# Revenue per share
Intent.create(name: 'Revenue per Share', code: "yahoo_key_stats('return per share')")
match_phrases_to_intent(['revenue per share', 'rs', 'r/s', 'rs ratio', 'r/s ratio', 'revenue/share'], intent)

# Quarterly revenue growth
Intent.create(name: 'Quarterly Revenue Growth', code: "yahoo_key_stats('quarterly revenue growth')")
match_phrases_to_intent(['quarterly revenue growth', 'revenue growth for last quarter', 'revenue growth over last quarter'], intent)

# Gross profit
Intent.create(name: 'Gross profit', code: "yahoo_key_stats('gross profit')")
match_phrases_to_intent(['gross profit'], intent)

# Net income available to common
Intent.create(name: 'Net income available to common', code: "yahoo_key_stats('net income available to common')")
match_phrases_to_intent(['net income available to common'], intent)

# Quarterly earnings growth
Intent.create(name: 'Quarterly earnings growth', code: "yahoo_key_stats('net income available to common')")
match_phrases_to_intent(['quarterly earnings growth', 'earnings growth for last quarter', 'earnings growth over last quarter'], intent)

# Total cash
Intent.create(name: 'Total cash', code: "yahoo_key_stats('total cash')")
match_phrases_to_intent(['total cash', 'cash'], intent)

# Total cash per share
Intent.create(name: 'Total cash per share', code: "yahoo_key_stats('total cash per share')")
match_phrases_to_intent(['total cash per share', 'cash per share', 'total cash/share', 'cash/share', 'tcs', 'tc/s'], intent)

# Total debt
Intent.create(name: 'Total debt', code: "yahoo_key_stats('total debt')")
match_phrases_to_intent(['total debt', 'debt'], intent)

# Total debt/equity
Intent.create(name: 'Total debt/equity', code: "yahoo_key_stats('total debt/equity')")
match_phrases_to_intent(['total debt/equity', 'debt/equity', 'tbe', 'tb/e'], intent)

# Current ratio
Intent.create(name: 'Current ratio', code: "yahoo_key_stats('current ratio')")
match_phrases_to_intent(['current ratio', 'ratio'], intent)

# Operating Cash Flow
Intent.create(name: 'Operating cash flow', code: "yahoo_key_stats('operating cash flow')")
match_phrases_to_intent(['operating cash flow', 'cash flow'], intent)

# Levered Free Cash Flow
Intent.create(name: 'Levered Free Cash Flow', code: "yahoo_key_stats('levered free cash flow')")
match_phrases_to_intent(['levered free cash flow', 'free cash flow'], intent)

# Beta
Intent.create(name: 'Beta', code: "yahoo_key_stats('beta')")
match_phrases_to_intent(['beta', 'risk'], intent)

# 52 week change
Intent.create(name: '52 week change', code: "yahoo_key_stats('52 week change')")
match_phrases_to_intent(['52 week change', 'year change'], intent)

# s&p 52 week change
Intent.create(name: 'S&P 52 week change', code: "yahoo_key_stats('s&p 52 week change')")
match_phrases_to_intent(['S&P500 52 week change', 'S&P500 year change'], intent)

# 3 month average volume
Intent.create(name: '3 month average volume', code: "yahoo_key_stats('3 month average volume')")
match_phrases_to_intent(['Average 3 month volume', '3 month volume', 'Average three month volume', 'three month volume'], intent)

# 10 day average volume
Intent.create(name: '10 day average volume', code: "yahoo_key_stats('10 day average volume')")
match_phrases_to_intent(['Average 10 day volume', '10 day volume', 'Average ten day volume', 'ten day volume'], intent)

# Shares Outstanding
Intent.create(name: 'Shares outstanding', code: "yahoo_key_stats('shares outstanding')")
match_phrases_to_intent(['shares outstanding', 'outstanding shares'], intent)

# % held by insiders
Intent.create(name: '% held by insiders', code: "yahoo_key_stats('% held by insiders')")
match_phrases_to_intent(['percent held by insiders', 'percentage held by insiders'], intent)

# % held by institutions
Intent.create(name: '% held by institutions', code: "yahoo_key_stats('% held by institutions')")
match_phrases_to_intent(['percent held by institutions', 'percentage held by institutions'], intent)

# Shares short
Intent.create(name: 'Shares short', code: "yahoo_key_stats('shares short')" )
match_phrases_to_intent(['shares short'], intent)

# Short ratio
Intent.create(name: 'Short ratio', code: "yahoo_key_stats('shares ratio')")
match_phrases_to_intent(['short ratio', 'short'], intent)

# Short % of float
Intent.create(name: 'Short % of float', code: "yahoo_key_stats('shorts % of float')")
match_phrases_to_intent(['short percent of float', 'short percentage of float'], intent)

# Shares short
Intent.create(name: 'Shares short', code: "yahoo_key_stats('shares short')")
match_phrases_to_intent(['shares short past month', 'past month shares short',' shares short last month', 'last month shares short', 'shares short previous month', 'previous month shares short'], intent)

# Forward annual dividend rate
Intent.create(name: 'Forward annual dividend rate', code: "yahoo_key_stats('forward annual dividend rate')")
match_phrases_to_intent(['forward annual dividend rate'], intent)

# Forward annual dividend yield
Intent.create(name: 'Forward annual dividend yield', code: "yahoo_key_stats('forward annual dividend yield')")
match_phrases_to_intent(['forward annual dividend yield', 'forward annual dividend'], intent)

# Trailing annual dividend rate
Intent.create(name: 'Trailing annual dividend rate', code: "yahoo_key_stats('trailing annual dividend rate')")
match_phrases_to_intent(['trailing annual dividend rate'], intent)

# Trailing annual dividend yield
Intent.create(name: 'Trailing annual dividend yield', code: "yahoo_key_stats('trailing annual dividend yield')")
match_phrases_to_intent(['trailing annual dividend yield', 'trailing annual dividend'], intent)

# 5 year average dividend yield
Intent.create(name: '5 year average dividend yield', code: "yahoo_key_stats('5 year average dividend yield')")
match_phrases_to_intent(['5 year average dividend yield', 'five year average dividend yield', '5 year dividend yield', 'five year divident yield'], intent)

# Payout ratio
Intent.create(name: 'Payout ratio', code: "yahoo_key_stats('payout ratio')")
match_phrases_to_intent(['payout ratio'], intent)

# Last Split Factor
Intent.create(name: 'Last Split Factor', code: "yahoo_key_stats('last split factor')")
match_phrases_to_intent(['last split factor', 'last split'], intent)

# Last Split Date
Intent.create(name: 'Last Split Date', code: "yahoo_key_stats('last split date')")
match_phrases_to_intent(['last split date'], intent)

# Both Holdings
Intent.create(name: 'Both Holdings', code: "yahoo_key_stats('both holdings')")
match_phrases_to_intent(['holdings', '13f holdings', 'insider and institutional holdings', '13f', '13f forms'], intent)

# Insider holdings
Intent.create(name: 'Insider holdings', code: "")
match_phrases_to_intent(['insider holdings', '13f insider holdings', '13f insider'], intent)

# Institutional Holdings
intent = Intent.create(name: 'Institutional Holdings', code: '["http://whalewisdom.com/stock/holdings?id=#{whalewisdom_stock_id}&q1=#{whalewisdom_quarter_id}&change_filter=1,2,3,4,5&_search=false&rows=25&page=1&sidx=shares_change&sord=asc", "http://whalewisdom.com/stock/holdings?id=#{whalewisdom_stock_id}&q1=#{whalewisdom_quarter_id}&change_filter=1,2,3,4,5&_search=false&rows=25&page=1&sidx=shares_change&sord=desc"]')
match_phrases_to_intent(['institutional holdings', '13f institutional holdings', '13f institutional'], intent)
























































