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

all_roles = ["admin", "super", "regular", "guest"]
logged_in_roles = ["admin", "super", "regular"]
paid_roles = ["admin", "super"]

# General Intent
intent = Intent.create(name: "Default", code: "", executable_by: all_roles)

# After Hours Price
intent = Intent.create(name: 'After Hours Price', code: "pull_from_yahoo('c8')", executable_by: all_roles)
match_phrases_to_intent(['After Hours', 'After Hours Price', 'After Hours Change'], intent)

# Ask (and realtime)
intent = Intent.create(name: 'Ask', code: 'realtime_pull_from_yahoo("b2", "a0")', executable_by: all_roles)
match_phrases_to_intent(['Ask', 'Ask Price', 'Price'], intent)

# Ask Size
intent = Intent.create(name: 'Ask Size', code:"pull_from_yahoo('a5')", executable_by: all_roles)
match_phrases_to_intent(['Ask Size'], intent)

# Average Daily Volume
intent = Intent.create(name: 'Average Daily Volume', code:"pull_from_yahoo('a2')", executable_by: all_roles)
match_phrases_to_intent(['Average Volume', 'Average Daily Volume'], intent)

# Bid
intent = Intent.create(name: 'Bid', code: 'realtime_pull_from_yahoo("b3", "b0")', executable_by: all_roles)
match_phrases_to_intent(['Bid', 'Bid Price'], intent)

# Bid size
intent = Intent.create(name: 'Bid Size', code:"pull_from_yahoo('b6')", executable_by: all_roles)
match_phrases_to_intent(['Bid Size'], intent)

# Book Value per Share
intent = Intent.create(name: 'Book Value per Share', code:"pull_from_yahoo('b4')", executable_by: all_roles)
match_phrases_to_intent(['Book Value per Share', 'Book Value', 'BV/S'], intent)

# Change + %
intent = Intent.create(name: 'Price change', code: "pull_from_yahoo('c0')", executable_by: all_roles)
match_phrases_to_intent(['Change', 'Change in Price', 'Price Change', 'Change since Open', 'Change in Percent'], intent)

# Change from Fifty Day Moving Average + %
intent = Intent.create(name: 'Change from Fifty Day Moving Average', code: "percent_change_yahoo('m7','m8')", executable_by: all_roles)
match_phrases_to_intent(['Change from Fifty day Moving Average', 'Change from Fifty Day Average', 'Change from 50 Day Moving Average', 'Change from 50 Day Average'], intent)

# Change from 200 Day Moving Average + %
intent = Intent.create(name: 'Change from Two Hundred Day Moving Average', code: "percent_change_yahoo('m5', 'm6')", executable_by: all_roles)
match_phrases_to_intent(['Change from Two Hundred Day Moving Average', 'Change from Two Hundred Day Average', 'Change from 200 Day Moving Average', 'Change from 200 Day Average'], intent)

# Change from year high + %
intent = Intent.create(name: 'Change from Year High', code: "percent_change_yahoo('k4','k5')", executable_by: all_roles)
match_phrases_to_intent(['Change from Year High'], intent)

# Commission
intent = Intent.create(name: 'Commission', code:"pull_from_yahoo('c3')", executable_by: all_roles)
match_phrases_to_intent(['Commission'], intent)

# Currency
intent = Intent.create(name: 'Currency', code:"pull_from_yahoo('c4')", executable_by: all_roles)
match_phrases_to_intent(['Currency'], intent)

# Days High
intent = Intent.create(name: 'Days High', code:"pull_from_yahoo('h0')", executable_by: all_roles)
match_phrases_to_intent(["Day's High", "Days High", "Price High", "Highest Price in the Last Day", 'Highest Price in Day', 'Todays High'], intent)

# Days Low
intent = Intent.create(name: 'Days Low', code:"pull_from_yahoo('g0')", executable_by: all_roles)
match_phrases_to_intent(["Day's Low", "Days Low", "Price Row", "Lowest Price in the Last Day", 'Lowest Price in Day', 'Todays Low'], intent)

# Days Range + realtime
intent = Intent.create(name: 'Days Range', code: 'pull_from_yahoo("m0")', executable_by: all_roles)
match_phrases_to_intent(["Day's Range", 'Days Range', 'Range', 'Todays Range'], intent)

# Days Value Change + realtime
intent = Intent.create(name: 'Days Value Change', code: 'pull_from_yahoo("w1")', executable_by: all_roles)
match_phrases_to_intent(["Day's Value Change", "Days Value Change", 'Value Change Today', 'Todays Value Change'], intent)

# Dividend pay date
intent = Intent.create(name: 'Dividend Pay Date', code:"pull_from_yahoo('r1')", executable_by: all_roles)
match_phrases_to_intent(['Dividend Pay Date', 'Dividend Date'], intent)

# Trailing Annual Dividend Yield + %
intent = Intent.create(name: 'Trailing Annual Dividend Yield', code: "percent_change_yahoo('d0','y0')", executable_by: all_roles)
match_phrases_to_intent(['Trailing Annual Dividend Yield', 'Trailing Annual Dividend Yield Percent', 'Trailing Annual Dividend Yield Percentage'], intent)

# Diluted EPS
intent = Intent.create(name: 'Diluted EPS', code:"pull_from_yahoo('e0')", executable_by: all_roles)
match_phrases_to_intent(['Diluted EPS', 'EPS', 'Earnings per Share', 'Diluted Earnings per Share'], intent)

# EBITDA
intent = Intent.create(name: 'EBITDA', code:"pull_from_yahoo('j4')", executable_by: all_roles)
match_phrases_to_intent(['EBITDA', 'Earnings'], intent)

# EPS Estimate Current Year
intent = Intent.create(name: 'EPS Estimate Current Year', code:"pull_from_yahoo('e7')", executable_by: all_roles)
match_phrases_to_intent(['EPS Estimate this Year', 'EPS Estimate Current Year', 'EPS Estimate for this Year'], intent)

# EPS Estimate Next Quarter
intent = Intent.create(name: 'EPS Estimate Next Quarter', code:"pull_from_yahoo('e9')", executable_by: all_roles)
match_phrases_to_intent(['EPS Estimate Next Quarter', 'EPS Estimate'], intent)

# EPS Estimate Next Year
intent = Intent.create(name: 'EPS Estimate Next Year', code:"pull_from_yahoo('e8')", executable_by: all_roles)
match_phrases_to_intent(['EPS Estimate Next Year'], intent)

# Ex Dividend Date
intent = Intent.create(name: 'Ex Dividend Date', code:"pull_from_yahoo('q0')", executable_by: all_roles)
match_phrases_to_intent(['EX Dividend Date'], intent)

# 50 Day Moving Average
intent = Intent.create(name: '50 Day Moving Average', code:"pull_from_yahoo('m3')", executable_by: all_roles)
match_phrases_to_intent(['Fifty Day Moving Average', '50 Day Moving Average', 'Price average', 'Average price'], intent)

# Shares Float
intent = Intent.create(name: 'Shares Float', code:"pull_from_yahoo('f6')", executable_by: all_roles)
match_phrases_to_intent(['Shares Float', 'Float'], intent)

# Holdings Gain + %
intent = Intent.create(name: 'Holdings Gain', code: "percent_change_yahoo('g4','g1')", executable_by: all_roles)
match_phrases_to_intent(['Holdings Gain', 'Gain from Holdings', 'Holdings Gain Percentage', 'Percentage Holdings Gain'], intent)

# Market Capitalization
intent = Intent.create(name: 'Market Capitalization', code: 'pull_from_yahoo("j1")', executable_by: all_roles)
match_phrases_to_intent(['Market Cap', 'Market Capitalization'], intent)

# Name
intent = Intent.create(name: 'Name', code:"pull_from_yahoo('n0')", executable_by: all_roles)
match_phrases_to_intent(['Name'], intent)

# One Year Target Price
intent = Intent.create(name: 'One Year Target Price', code:"pull_from_yahoo('t8')", executable_by: all_roles)
match_phrases_to_intent(['One Year Target Price', 'Target Price for One Year', 'Target Price'], intent)

# Open
intent = Intent.create(name: 'Open', code:"pull_from_yahoo('a0')", executable_by: all_roles)
match_phrases_to_intent(['Open'], intent)

# PEG Ratio
intent = Intent.create(name: 'PEG Ratio', code:"pull_from_yahoo('r5')", executable_by: all_roles)
match_phrases_to_intent(['PEG', 'PEG ratio', 'P/EG ratio', 'P/EG', 'Price to Earnings Growth', 'Price to Earnings Growth Ratio'], intent)

# PE Ratio
intent = Intent.create(name: 'PE Ratio', code: 'pull_from_yahoo("r0")', executable_by: all_roles)
match_phrases_to_intent(['PE', 'P/E', 'PE Ratio', 'P/E ratio', 'Price to Earnings Ratio', 'Price to Earnings'], intent)

# Previous Close
intent = Intent.create(name: 'Previous Close', code:"pull_from_yahoo('p0')", executable_by: all_roles)
match_phrases_to_intent(['Previous close'], intent)

# Price book
intent = Intent.create(name: 'Price Book', code:"pull_from_yahoo('p6')", executable_by: all_roles)
match_phrases_to_intent(['Price Book'], intent)

# Price over EPS estimate for current year
intent = Intent.create(name: 'Price/EPS estimate for current year', code:"pull_from_yahoo('r6')", executable_by: all_roles)
match_phrases_to_intent(['Price Over EPS Estimate for Current Year'], intent)

# Price over EPS estimate for next year
intent = Intent.create(name: 'Price/EPS estimate for next year', code:"pull_from_yahoo('r7')", executable_by: all_roles)
match_phrases_to_intent(['Price Over EPS Estimate for Next Year'], intent)

# Revenue
intent = Intent.create(name: 'Revenue', code:"pull_from_yahoo('s6')", executable_by: all_roles)
match_phrases_to_intent(['Revenue'], intent)

# Shares Owned
intent = Intent.create(name: 'Shares Owned', code:"pull_from_yahoo('s1')", executable_by: all_roles)
match_phrases_to_intent(['Shares Owned', 'Shares Retention', 'Shares Retained'], intent)

# Shares Outstanding
intent = Intent.create(name: 'Shares Outstanding', code:"pull_from_yahoo('j2')", executable_by: all_roles)
match_phrases_to_intent(['Shares Outstanding'], intent)

# Short Ratio
intent = Intent.create(name: 'Short Ratio', code:"pull_from_yahoo('s7')", executable_by: all_roles)
match_phrases_to_intent(['Short Ratio'], intent)

# 200 Day Moving Average
intent = Intent.create(name: '200 Day Moving Average', code:"pull_from_yahoo('m4')", executable_by: all_roles)
match_phrases_to_intent(['Two Hundred Day Moving Average', '200 Day Moving Average', '200 Day Average', 'Two Hundred Day Average', '200 Day Price Average'], intent)

# Volume
intent = Intent.create(name: 'Volume', code:"pull_from_yahoo('v0')", executable_by: all_roles)
match_phrases_to_intent(['Volume'], intent)

# Year High
intent = Intent.create(name: 'Year High', code:"pull_from_yahoo('k0')", executable_by: all_roles)
match_phrases_to_intent(['Year High', '52 Week High'], intent)

# Year Low
intent = Intent.create(name: 'Year Low', code:"pull_from_yahoo('j0')", executable_by: all_roles)
match_phrases_to_intent(['Year Low', '52 Week Low'], intent)

# Year range
intent = Intent.create(name: 'Year range', code:"pull_from_yahoo('w0')", executable_by: all_roles)
match_phrases_to_intent(['Year Range', 'Years Range'], intent)

# Enterprise Value
intent = Intent.create(name: 'Enterprise Value', code: "yahoo_key_stats('enterprise value')", executable_by: all_roles)
match_phrases_to_intent(['Enterprise Value', 'Value', 'Valuation'], intent)

# Trailing P/E
intent = Intent.create(name: 'Trailing P/E', code: "yahoo_key_stats('trailing p/e')", executable_by: all_roles)
match_phrases_to_intent(['Trailing PE', 'Trailing P/E', 'Trailing PE Ratio', 'Trailing P/E ratio', 'Trailing Price to Earnings Ratio', 'Trailing Price to Earnings'], intent)

# Forward P/E
intent = Intent.create(name: 'Forward P/E', code: "yahoo_key_stats('forward p/e')", executable_by: all_roles)
match_phrases_to_intent(['Forward PE', 'Forward P/E', 'Forward PE Ratio', 'Forward P/E Ratio', 'Forward Price to Earnings Ratio', 'Forward Price to Earnings'], intent)

# Price/Sales
intent = Intent.create(name: 'Price/Sales', code: "yahoo_key_stats('price/sales')", executable_by: all_roles)
match_phrases_to_intent(['Price/Sales', 'Price/Sales Ratio', 'PS Ratio','P/S', 'P/S ratio', 'Price Sales', 'Price Sales Ratio', 'Price to Sales Ratio', 'Price to Sales'], intent)

# Price/Book
intent = Intent.create(name: 'Price/Book', code: "yahoo_key_stats('price/book')", executable_by: all_roles)
match_phrases_to_intent(['Price/Book', 'Price/Book Ratio', 'PB Ratio', 'PB', 'P/B', 'P/B ratio', 'Price Book', 'Price Book Ratio', 'Price to Book Ratio'], intent)

# Enterprise Value/Revenue
intent = Intent.create(name: 'Enterprise Value/Revenue', code: "yahoo_key_stats('enterprise value/revenue')", executable_by: all_roles)
match_phrases_to_intent(['Enterprise Value/Revenue', 'EV/R', 'Enterprise Value Revenue', 'EVR Ratio', 'EVR', 'Enterprise Value over Revenue'], intent)

# Enterprise Value/EBITDA
intent = Intent.create(name: 'Enterprise Value/EBITDA', code: "yahoo_key_stats('enterprise value/ebitda')", executable_by: all_roles)
match_phrases_to_intent(['Enterprise Value/EBITDA', 'Enterprise Value over EBITDA', 'EV/EBITDA'], intent)

# Fiscal year ends
intent = Intent.create(name: 'Fiscal year ends', code: "yahoo_key_stats('fiscal year ends')", executable_by: all_roles)
match_phrases_to_intent(['Fiscal Year Ends', 'End of Fiscal Year'], intent)

# Most recent quarter
intent = Intent.create(name: 'Most recent quarter', code: "yahoo_key_stats('most recent quarter')", executable_by: all_roles)
match_phrases_to_intent(['Most Recent Quarter'], intent)

# Profit margin
intent = Intent.create(name: 'Profit Margin', code: "yahoo_key_stats('profit margin')", executable_by: all_roles)
match_phrases_to_intent(['Profit Margin'], intent)

# Operating margin
intent = Intent.create(name: 'Operating margin', code: "yahoo_key_stats('operating margin')", executable_by: all_roles)
match_phrases_to_intent(['Operating Margin'], intent)

# Return on assets
intent = Intent.create(name: 'Return on assets', code: "yahoo_key_stats('return on assets')", executable_by: all_roles)
match_phrases_to_intent(['Return on Assets', 'ROA'], intent)

# Return on equity
intent = Intent.create(name: 'Return on equity', code: "yahoo_key_stats('return on equity')", executable_by: all_roles)
match_phrases_to_intent(['Return on Equity', 'ROE'], intent)

# Revenue per share
intent = Intent.create(name: 'Revenue per Share', code: "yahoo_key_stats('revenue per share')", executable_by: all_roles)
match_phrases_to_intent(['Revenue per Share', 'R/S', 'RS Ratio', 'R/S Ratio', 'Revenue/Share'], intent)

# Quarterly revenue growth
intent = Intent.create(name: 'Quarterly Revenue Growth', code: "yahoo_key_stats('qtrly revenue growth')", executable_by: all_roles)
match_phrases_to_intent(['Quarterly Revenue Growth', 'Revenue Growth for Last Quarter', 'Revenue Growth over Last Quarter'], intent)

# Gross profit
intent = Intent.create(name: 'Gross profit', code: "yahoo_key_stats('gross profit')", executable_by: all_roles)
match_phrases_to_intent(['Gross profit'], intent)

# Net income available to common
intent = Intent.create(name: 'Net income available to common', code: "yahoo_key_stats('net income avl to common')", executable_by: all_roles)
match_phrases_to_intent(['Net Income Available to Common', 'Net Income'], intent)

# Quarterly earnings growth
intent = Intent.create(name: 'Quarterly earnings growth', code: "yahoo_key_stats('qtrly earnings growth')", executable_by: all_roles)
match_phrases_to_intent(['Quarterly Earnings Growth', 'Earnings Growth for Last Quarter', 'Earnings Growth over Last Quarter'], intent)

# Total cash
intent = Intent.create(name: 'Total cash', code: "yahoo_key_stats('total cash')", executable_by: all_roles)
match_phrases_to_intent(['Total Cash', 'Cash'], intent)

# Total cash per share
intent = Intent.create(name: 'Total cash per share', code: "yahoo_key_stats('total cash per share')", executable_by: all_roles)
match_phrases_to_intent(['Total Cash per Share', 'Cash per Share', 'Total Cash/Share', 'Cash/Share', 'TC/S'], intent)

# Total debt
intent = Intent.create(name: 'Total debt', code: "yahoo_key_stats('total debt')", executable_by: all_roles)
match_phrases_to_intent(['Total Debt', 'Debt'], intent)

# Total debt/equity
intent = Intent.create(name: 'Total debt/equity', code: "yahoo_key_stats('total debt/equity')", executable_by: all_roles)
match_phrases_to_intent(['Total Debt/Equity', 'Debt/Equity'], intent)

# Current ratio
intent = Intent.create(name: 'Current ratio', code: "yahoo_key_stats('current ratio')", executable_by: all_roles)
match_phrases_to_intent(['Current Ratio', 'Ratio'], intent)

# Operating Cash Flow
intent = Intent.create(name: 'Operating cash flow', code: "yahoo_key_stats('operating cash flow')", executable_by: all_roles)
match_phrases_to_intent(['Operating Cash Flow', 'Cash Flow'], intent)

# Levered Free Cash Flow
intent = Intent.create(name: 'Levered Free Cash Flow', code: "yahoo_key_stats('levered free cash flow')", executable_by: all_roles)
match_phrases_to_intent(['Levered Free Cash Flow', 'Free Cash Flow'], intent)

# Beta
intent = Intent.create(name: 'Beta', code: "yahoo_key_stats('beta')", executable_by: all_roles)
match_phrases_to_intent(['Beta', 'Risk'], intent)

# 52 week change
intent = Intent.create(name: '52 week change', code: "yahoo_key_stats('52-week change')", executable_by: all_roles)
match_phrases_to_intent(['52 Week Change', 'Year Change'], intent)

# s&p 52 week change
intent = Intent.create(name: 'S&P 52 week change', code: "yahoo_key_stats('s&p500 52-week change')", executable_by: all_roles)
match_phrases_to_intent(['S&P500 52 Week Change', 'S&P500 Year Change'], intent)

# 3 month average volume
intent = Intent.create(name: '3 month average volume', code: "yahoo_key_stats('avg vol')", executable_by: all_roles)
match_phrases_to_intent(['Average 3 Month Volume', '3 Month Volume', 'Average Three Month Volume', 'Three Month Volume'], intent)

# 10 day average volume
intent = Intent.create(name: '10 day average volume', code: "yahoo_key_stats('avg vol')", executable_by: all_roles)
match_phrases_to_intent(['Average 10 Day Volume', '10 Day Volume', 'Average Ten Day Volume', 'Ten Day Volume'], intent)

# Shares Outstanding
intent = Intent.create(name: 'Shares outstanding', code: "yahoo_key_stats('shares outstanding')", executable_by: all_roles)
match_phrases_to_intent(['Shares Outstanding', 'Outstanding Shares'], intent)

# % held by insiders
intent = Intent.create(name: '% held by insiders', code: "yahoo_key_stats('% held by insiders')", executable_by: all_roles)
match_phrases_to_intent(['Percent Held by Insiders', 'Percentage Held by Insiders'], intent)

# % held by institutions
intent = Intent.create(name: '% held by institutions', code: "yahoo_key_stats('% held by institutions')", executable_by: all_roles)
match_phrases_to_intent(['Percent Held by Institutions', 'Percentage Held by Institutions'], intent)

# Short ratio
intent = Intent.create(name: 'Short ratio', code: "yahoo_key_stats('short ratio')", executable_by: all_roles)
match_phrases_to_intent(['Short Ratio', 'short'], intent)

# Short % of float
intent = Intent.create(name: 'Short % of float', code: "yahoo_key_stats('shorts % of float')", executable_by: all_roles)
match_phrases_to_intent(['Short Percent of Float', 'Short Percentage of Float'], intent)

# Shares short
intent = Intent.create(name: 'Shares short', code: "yahoo_key_stats('shares short')", executable_by: all_roles)
match_phrases_to_intent(['Shares Short', 'Shares Short Past Month', 'Past Month Shares Short','Shares Short Last Month', 'Last Month Shares Short', 'Shares Short Previous Month', 'Previous Month Shares Short'], intent)

# Forward annual dividend rate
intent = Intent.create(name: 'Forward annual dividend rate', code: "yahoo_key_stats('forward annual dividend rate')", executable_by: all_roles)
match_phrases_to_intent(['Forward Annual Dividend Rate'], intent)

# Forward annual dividend yield
intent = Intent.create(name: 'Forward annual dividend yield', code: "yahoo_key_stats('forward annual dividend yield')", executable_by: all_roles)
match_phrases_to_intent(['Forward Annual Dividend Yield', 'Forward Annual Dividend'], intent)

# Trailing annual dividend rate
intent = Intent.create(name: 'Trailing annual dividend rate', code: "yahoo_key_stats('trailing annual dividend rate')", executable_by: all_roles)
match_phrases_to_intent(['Trailing Annual Dividend Rate'], intent)

# Trailing annual dividend yield
intent = Intent.create(name: 'Trailing annual dividend yield', code: "yahoo_key_stats('trailing annual dividend yield')", executable_by: all_roles)
match_phrases_to_intent(['Trailing Annual Dividend Yield', 'Trailing Annual Dividend'], intent)

# 5 year average dividend yield
intent = Intent.create(name: '5 year average dividend yield', code: "yahoo_key_stats('5 year average dividend yield')", executable_by: all_roles)
match_phrases_to_intent(['5 Year Average Dividend Yield', 'Five Year Average Dividend Yield', '5 Year Dividend Yield', 'Five Year Dividend Yield'], intent)

# Payout ratio
intent = Intent.create(name: 'Payout ratio', code: "yahoo_key_stats('payout ratio')", executable_by: all_roles)
match_phrases_to_intent(['Payout Ratio'], intent)

# Last Split Factor
intent = Intent.create(name: 'Last Split Factor', code: "yahoo_key_stats('last split factor')", executable_by: all_roles)
match_phrases_to_intent(['Last Split Factor', 'Last Split'], intent)

# Last Split Date
intent = Intent.create(name: 'Last Split Date', code: "yahoo_key_stats('last split date')", executable_by: all_roles)
match_phrases_to_intent(['Last Split Date'], intent)

# # Both Holdings
# intent = Intent.create(name: 'Both Holdings', code: "yahoo_key_stats('both holdings')", executable_by: all_roles)
# match_phrases_to_intent(['holdings', '13f holdings', 'insider and institutional holdings', '13f', '13f forms'], intent)

# Insider holdings
# intent = Intent.create(name: 'Insider holdings', code: "", executable_by: all_roles)
# match_phrases_to_intent(['insider holdings', '13f insider holdings', '13f insider'], intent)

# Institutional Holdings
intent = Intent.create(name: 'Institutional Holdings', code: 'dataroma_holdings', executable_by: paid_roles)
match_phrases_to_intent(['Institutional Holdings', '13F Institutional Holdings', '13F Institutional', 'Holdings'], intent)
























































