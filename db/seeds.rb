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
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['Ask', 'Ask Price'], intent)

# Ask Size
intent = Intent.create(name: 'Ask Size', code:"pull_from_yahoo('a5')")
match_phrases_to_intent(['Ask Size'], intent)

# Average Daily Volume
intent = Intent.create(name: 'Average Daily Volume', code:"pull_from_yahoo('a2')")
match_phrases_to_intent(['Average volume', 'Average daily volume'], intent)

# Bid
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['Bid', 'Bid price'], intent)

# Bid size
intent = Intent.create(name: 'Bid	Size', code:"pull_from_yahoo('b6')")
match_phrases_to_intent(['Bid size'], intent)

# Book Value per Share
intent = Intent.create(name: 'Book Value per Share', code:"pull_from_yahoo('b4')")
match_phrases_to_intent(['Book Value per Share', 'Book Value', 'bv/s', 'bs'], intent)

# Change + %
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['change', 'change in price', 'price change', 'change since open', 'change in percent'], intent)

# Change from Fifty Day Moving Average + %
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['change from fifty day moving average', 'change from fifty day average', 'change from 50 day moving average', 'change from 50 day average'], intent)

# Change from 200 Day Moving Average + %
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['change from two hundred day moving average', 'change from two hundred day average', 'change from 200 day moving average', 'change from 200 day average'], intent)

# Change from year high + %
# TODO
Intent.create(name: '', code: '')
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
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(["day's range", 'days range', 'range', 'todays range'], intent)

# Days Value Change
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(["day's value change", "days value change", 'value cahnge today', 'todays value change'], intent)

# Dividend pay date
intent = Intent.create(name: 'Dividend Pay Date', code:"pull_from_yahoo('r1')")
match_phrases_to_intent(['dividend pay date', 'dividend date'], intent)

# Trailing Annual Dividend Yield + %
# TODO
Intent.create(name: '', code: '')
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
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['holdings gain', 'gain from holdings', 'holdings gain percentage', 'percentage holdings gain'], intent)

# Holdings Value
intent = Intent.create(name: 'Holdings Value', code:"pull_from_yahoo('v1')")
match_phrases_to_intent(['holdings value'], intent)

# Low Limit
intent = Intent.create(name: 'Low Limit', code:"pull_from_yahoo('l3')")
match_phrases_to_intent(['low limit'], intent)

# Market Capitalization
# TODO
Intent.create(name: '', code: '')
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
# TODO
Intent.create(name: '', code: '')
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
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['enterprise value', 'value', 'valuation'], intent)

# Trailing P/E
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['Trailing PE', 'trailing p/e', 'Trailing PE Ratio', 'Trailing P/E ratio', 'trailing price to earnings ratio', 'trailing price to earnings'], intent)

# Forward P/E
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['Forward PE', 'forward p/e', 'Forward PE Ratio', 'Forward P/E ratio', 'forward price to earnings ratio', 'forward price to earnings'], intent)

# Price/Sales
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['Price/Sales', 'Price/Sales ratio', 'PS ratio', 'ps', 'p/s', 'p/s ratio', 'price sales', 'price sales ratio'], intent)

# Price/Book
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['Price/Book', 'Price/Book ratio', 'PB ratio', 'pb', 'p/b', 'p/b ratio', 'price book', 'price book ratio'], intent)

# Enterprise Value/Revenue
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['Enterprise Value/Revenue', 'ev/r', 'enterprise value revenue', 'evr ratio', 'evr', 'enterprise value over revenue'], intent)

# Enterprise Value/EBITDA
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['Enterprise Value/EBITDA', 'Enterprise Value over EBITDA'], intent)

# Fiscal year ends
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['Fiscal year ends', 'end of fiscal year'], intent)

# Most recent quarter
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['Most recent quarter'], intent)

# Profit margin
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['Profit margin'], intent)

# Operating margin
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['operating margin'], intent)

# Return on assets
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['return on assets', 'roa'], intent)

# Return on equity
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['return on equity', 'roe'], intent)

# Revenue per share
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['revenue per share', 'rs', 'r/s', 'rs ratio', 'r/s ratio', 'revenue/share'], intent)

# Quarterly revenue growth
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['quarterly revenue growth', 'revenue growth for last quarter', 'revenue growth over last quarter'], intent)

# Gross profit
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['gross profit'], intent)

# Net income available to common
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['net income available to common'], intent)

# Quarterly earnings growth
# TODO
Intent.create(name: 'Quarterly earnings growth', code: '')
match_phrases_to_intent(['quarterly earnings growth', 'earnings growth for last quarter', 'earnings growth over last quarter'], intent)

# Total cash
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['total cash', 'cash'], intent)

# Total cash per share
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['total cash per share', 'cash per share', 'total cash/share', 'cash/share', 'tcs', 'tc/s'], intent)

# Total debt
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['total debt', 'debt'], intent)

# Total debt/equity
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['total debt/equity', 'debt/equity', 'tbe', 'tb/e'], intent)

# Current ratio
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['current ratio', 'ratio'], intent)

# Operating Cash Flow
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['operating cash flow', 'cash flow'], intent)

# Levered Free Cash Flow
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['levered free cash flow', 'free cash flow'], intent)

# Beta
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['beta', 'risk'], intent)

# 52 week change
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['52 week change', 'year change'], intent)

# s&p 52 week change
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['S&P500 52 week change', 'S&P500 year change'], intent)

# 3 month average volume
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['Average 3 month volume', '3 month volume', 'Average three month volume', 'three month volume'], intent)

# 10 day average volume
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['Average 10 day volume', '10 day volume', 'Average ten day volume', 'ten day volume'], intent)

# Shares Outstanding
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['shares outstanding', 'outstanding shares'], intent)

# % held by insiders
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['percent held by insiders', 'percentage held by insiders'], intent)

# % held by institutions
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['percent held by institutions', 'percentage held by institutions'], intent)

# Shares short
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['shares short'], intent)

# Short ratio
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['short ratio', 'short'], intent)

# Short % of float
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['short percent of float', 'short percentage of float'], intent)

# Shares short
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['shares short past month', 'past month shares short',' shares short last month', 'last month shares short', 'shares short previous month', 'previous month shares short'], intent)

# Forward annual dividend rate
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['forward annual dividend rate'], intent)

# Forward annual dividend yield
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['forward annual dividend yield', 'forward annual dividend'], intent)

# Trailing annual dividend rate
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['trailing annual dividend rate'], intent)

# Trailing annual dividend yield
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['trailing annual dividend yield', 'trailing annual dividend'], intent)

# 5 year average dividend yield
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['5 year average dividend yield', 'five year average dividend yield', '5 year dividend yield', 'five year divident yield'], intent)

# Payout ratio
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['payout ratio'], intent)

# Last Split Factor
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['last split factor', 'last split'], intent)

# Last Split Date
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['last split date'], intent)

# Both Holdings
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['holdings', '13f holdings', 'insider and institutional holdings', '13f', '13f forms'], intent)

# Insider holdings
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['insider holdings', '13f insider holdings', '13f insider'], intent)

# Institutional Holdings
# TODO
Intent.create(name: '', code: '')
match_phrases_to_intent(['institutional holdings', '13f institutional holdings', '13f institutional'], intent)
























































