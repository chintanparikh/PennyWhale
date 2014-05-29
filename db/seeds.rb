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
intent = Intent.create();
match_phrases_to_intent(['After hours', 'After hours price', 'After hours change'], intent)

# Annualized Gains
match_phrases_to_intent(['Annualized Gain', 'Annualized Gains'], intent)

# Ask (and realtime)
match_phrases_to_intent(['Ask', 'Ask Price'], intent)

# Ask Size
match_phrases_to_intent(['Ask Size'], intent)

# Average Daily Volume
match_phrases_to_intent(['Average volume', 'Average daily volume'], intent)

# Bid
match_phrases_to_intent(['Bid', 'Bid price'], intent)

# Bid size
match_phrases_to_intent(['Bid size'], intent)

# Book Value per Share
match_phrases_to_intent(['Book Value per Share', 'Book Value', 'bv/s', 'bs'], intent)

# Change + %
match_phrases_to_intent(['change', 'change in price', 'price change', 'change since open', 'change in percent'], intent)

# Change from Fifty Day Moving Average + %
match_phrases_to_intent(['change from fifty day moving average', 'change from fifty day average', 'change from 50 day moving average', 'change from 50 day average'], intent)

# Change from 200 Day Moving Average + %
match_phrases_to_intent(['change from two hundred day moving average', 'change from two hundred day average', 'change from 200 day moving average', 'change from 200 day average'], intent)

# Change from year high + %
match_phrases_to_intent(['change from year high'], intent)

# Commission
match_phrases_to_intent(['commission'], intent)

# Currency
match_phrases_to_intent(['currency'], intent)

# Days High
match_phrases_to_intent(["Day's high", "days high", "price high", "highest price in the last day", 'highest price in day', 'todays high'], intent)

# Days Low
match_phrases_to_intent(["Day's low", "days low", "price low", "lowest price in the last day", 'lowest price in day', 'todays low'], intent)

# Days Range + realtime
match_phrases_to_intent(["day's range", 'days range', 'range', 'todays range'], intent)

# Days Value Change
match_phrases_to_intent(["day's value change", "days value change", 'value cahnge today', 'todays value change'], intent)

# Dividend pay date
match_phrases_to_intent(['dividend pay date', 'dividend date'], intent)

# Trailing Annual Dividend Yield + %
match_phrases_to_intent(['trailing annual dividend yield', 'trailing annual dividend yield percent', 'trailing annual dividend yield percentage'], intent)

# Diluted EPS
match_phrases_to_intent(['diluted eps', 'eps', 'earnings per share', 'diluted earnings per share'], intent)

# EBITDA
match_phrases_to_intent(['EBITDA', 'earnings'], intent)

# EPS Estimate Current Year
match_phrases_to_intent(['eps estimate this year', 'eps estimate current year'], intent)

# EPS Estimate Next Quarter
match_phrases_to_intent(['eps estimate next quarter', 'eps estimate'], intent)

# EPS Estimate Next Year
match_phrases_to_intent(['eps estimate next year'], intent)

# Ex Dividend Date
match_phrases_to_intent(['ex dividend Date'], intent)

# 50 Day Moving Average
match_phrases_to_intent(['fifty day moving average', '50 day moving average', 'average', 'price average', 'average price'], intent)

# Shares Float
match_phrases_to_intent(['shares float', 'float'], intent)

# High Limit
match_phrases_to_intent(['high limit'], intent)

# Holdings Gain + %
match_phrases_to_intent(['holdings gain', 'gain from holdings', 'holdings gain percentage', 'percentage holdings gain'], intent)

# Holdings Value
match_phrases_to_intent(['holdings value'], intent)

# Low Limit
match_phrases_to_intent(['low limit'], intent)

# Market Capitalization
match_phrases_to_intent(['market cap', 'market Capitalization'], intent)

# Name
match_phrases_to_intent(['name'], intent)

# One Year Target Price
match_phrases_to_intent(['One year target price', 'target price for one year', 'target price'], intent)

# Open
match_phrases_to_intent(['open'], intent)

# PEG Ratio
match_phrases_to_intent(['PEG', 'peg ratio', 'p/eg ratio', 'p/eg', 'price to earnings growth', 'price to earnings growth ratio'], intent)

# PE Ratio
match_phrases_to_intent(['PE', 'p/e', 'PE Ratio', 'P/E ratio', 'price to earnings ratio', 'price to earnings'], intent)

# Percent Change From Fifty Day Moving Average
match_phrases_to_intent(['percent change from fifty day moving average', 'fifty day moving average percent change', 'percent change from 50 day moving average', '50 day moving average percent change'], intent)

# Percent Change From Two Hundred Day Moving Average
match_phrases_to_intent(['percent change from two hundred day moving average', 'two hundred day moving average percent change', 'percent change from 200 day moving average', '200 day moving average percent change'], intent)

# Change in percent from year high
match_phrases_to_intent(['change in percent from year high', 'year high percent change'], intent)

# Change in percent from year low
match_phrases_to_intent(['change in percent from year low', 'year low percent change'], intent)

# Previous Close
match_phrases_to_intent(['previous close'], intent)

# Price book
match_phrases_to_intent(['price book'], intent)

# Price over EPS estimate for current year
match_phrases_to_intent(['price over eps estimate for current year'], intent)

# Price over EPS estimate for next year
match_phrases_to_intent(['price over eps estimate for next year'], intent)

# Revenue
match_phrases_to_intent(['revenue'], intent)

# Shares Owned
match_phrases_to_intent(['shares owned', 'shares retention'], intent)

# Shares Outstanding
match_phrases_to_intent(['shares outstanding'], intent)

# Short Ratio
match_phrases_to_intent(['short ratio'], intent)

# 200 day moving average
match_phrases_to_intent(['two hundred day moving average', '200 day moving average', '200 day average', 'two hundred day average', '200 day price average'], intent)

# Volume
match_phrases_to_intent(['volume'], intent)

# Year High
match_phrases_to_intent(['year high', '52 week high'], intent)

# Year Low
match_phrases_to_intent(['year low', '52 week low'], intent)

# Year range
match_phrases_to_intent(['year range', 'years range'], intent)

# Enterprise Value
match_phrases_to_intent(['enterprise value', 'value', 'valuation'], intent)

# Trailing P/E
match_phrases_to_intent(['Trailing PE', 'trailing p/e', 'Trailing PE Ratio', 'Trailing P/E ratio', 'trailing price to earnings ratio', 'trailing price to earnings'], intent)

# Forward P/E
match_phrases_to_intent(['Forward PE', 'forward p/e', 'Forward PE Ratio', 'Forward P/E ratio', 'forward price to earnings ratio', 'forward price to earnings'], intent)

# Price/Sales
match_phrases_to_intent(['Price/Sales', 'Price/Sales ratio', 'PS ratio', 'ps', 'p/s', 'p/s ratio', 'price sales', 'price sales ratio'], intent)

# Price/Book
match_phrases_to_intent(['Price/Book', 'Price/Book ratio', 'PB ratio', 'pb', 'p/b', 'p/b ratio', 'price book', 'price book ratio'], intent)

# Enterprise Value/Revenue
match_phrases_to_intent(['Enterprise Value/Revenue', 'ev/r', 'enterprise value revenue', 'evr ratio', 'evr', 'enterprise value over revenue'], intent)

# Enterprise Value/EBITDA
match_phrases_to_intent(['Enterprise Value/EBITDA', 'Enterprise Value over EBITDA'], intent)

# Fiscal year ends
match_phrases_to_intent(['Fiscal year ends', 'end of fiscal year'], intent)

# Most recent quarter
match_phrases_to_intent(['Most recent quarter'], intent)

# Profit margin
match_phrases_to_intent(['Profit margin'], intent)

# Operating margin
match_phrases_to_intent(['operating margin'], intent)

# Return on assets
match_phrases_to_intent(['return on assets', 'roa'], intent)

# Return on equity
match_phrases_to_intent(['return on equity', 'roe'], intent)

# Revenue per share
match_phrases_to_intent(['revenue per share', 'rs', 'r/s', 'rs ratio', 'r/s ratio', 'revenue/share'], intent)

# Quarterly revenue growth
match_phrases_to_intent(['quarterly revenue growth', 'revenue growth for last quarter', 'revenue growth over last quarter'], intent)

# Gross profit
match_phrases_to_intent(['gross profit'], intent)

# Net income available to common
match_phrases_to_intent(['net income available to common'], intent)

# Quarterly earnings growth
match_phrases_to_intent(['quarterly earnings growth', 'earnings growth for last quarter', 'earnings growth over last quarter'], intent)

# Total cash
match_phrases_to_intent(['total cash', 'cash'], intent)

# Total cash per share
match_phrases_to_intent(['total cash per share', 'cash per share', 'total cash/share', 'cash/share', 'tcs', 'tc/s'], intent)

# Total debt
match_phrases_to_intent(['total debt', 'debt'], intent)

# Total debt/equity
match_phrases_to_intent(['total debt/equity', 'debt/equity', 'tbe', 'tb/e'], intent)

# Current ratio
match_phrases_to_intent(['current ratio', 'ratio'], intent)

# Operating Cash Flow
match_phrases_to_intent(['operating cash flow', 'cash flow'], intent)

# Levered Free Cash Flow
match_phrases_to_intent(['levered free cash flow', 'free cash flow'], intent)

# Beta
match_phrases_to_intent(['beta', 'risk'], intent)

# 52 week change
match_phrases_to_intent(['52 week change', 'year change'], intent)

# s&p 52 week change
match_phrases_to_intent(['S&P500 52 week change', 'S&P500 year change'], intent)

# 3 month average volume
match_phrases_to_intent(['Average 3 month volume', '3 month volume', 'Average three month volume', 'three month volume'], intent)

# 10 day average volume
match_phrases_to_intent(['Average 10 day volume', '10 day volume', 'Average ten day volume', 'ten day volume'], intent)

# Shares Outstanding
match_phrases_to_intent(['shares outstanding', 'outstanding shares'], intent)

# % held by insiders
match_phrases_to_intent(['percent held by insiders', 'percentage held by insiders'], intent)

# % held by institutions
match_phrases_to_intent(['percent held by institutions', 'percentage held by institutions'], intent)

# Shares short
match_phrases_to_intent(['shares short'], intent)

# Short ratio
match_phrases_to_intent(['short ratio', 'short'], intent)

# Short % of float
match_phrases_to_intent(['short percent of float', 'short percentage of float'], intent)

# Shares short
match_phrases_to_intent(['shares short past month', 'past month shares short',' shares short last month', 'last month shares short', 'shares short previous month', 'previous month shares short'], intent)

# Forward annual dividend rate
match_phrases_to_intent(['forward annual dividend rate'], intent)

# Forward annual dividend yield
match_phrases_to_intent(['forward annual dividend yield', 'forward annual dividend'], intent)

# Trailing annual dividend rate
match_phrases_to_intent(['trailing annual dividend rate'], intent)

# Trailing annual dividend yield
match_phrases_to_intent(['trailing annual dividend yield', 'trailing annual dividend'], intent)

# 5 year average dividend yield
match_phrases_to_intent(['5 year average dividend yield', 'five year average dividend yield', '5 year dividend yield', 'five year divident yield'], intent)

# Payout ratio
match_phrases_to_intent(['payout ratio'], intent)

# Last Split Factor
match_phrases_to_intent(['last split factor', 'last split'], intent)

# Last Split Date
match_phrases_to_intent(['last split date'], intent)

# Both Holdings
match_phrases_to_intent(['holdings', '13f holdings', 'insider and institutional holdings', '13f', '13f forms'], intent)

# Insider holdings
match_phrases_to_intent(['insider holdings', '13f insider holdings', '13f insider'], intent)

# Institutional Holdings
match_phrases_to_intent(['institutional holdings', '13f institutional holdings', '13f institutional'], intent)
























































