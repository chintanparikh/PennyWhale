require 'open-uri'
require 'json'

module Financials 

	def self.get_income_statement ticker 

		endpoint = "http://financials.morningstar.com/ajax/ReportProcess4CSV.html?&t=#{ticker}&region=usa&culture=en-US&cur=USD&reportType=is&period=3&dataType=A&order=asc&columnY"
		data = self.parse_csv(endpoint)

		return {data: data}

	end

	def self.get_balance_sheet ticker 

		endpoint = "http://financials.morningstar.com/ajax/ReportProcess4CSV.html?&t=#{ticker}&region=usa&culture=en-US&cur=USD&reportType=bs&period=3&dataType=A&order=asc&columnY"
		data = self.parse_csv(endpoint)

		return {data: data}

	end

	def self.get_cash_flow ticker

		endpoint = "http://financials.morningstar.com/ajax/ReportProcess4CSV.html?&t=#{ticker}&region=usa&culture=en-US&cur=USD&reportType=cf&period=3&dataType=A&order=asc&columnY"
		data = self.parse_csv(endpoint)

		return {data: data}

	end

	def self.parse_csv endpoint

		begin 
        	response = RestClient.get(endpoint)
    	rescue 
     		#try again 
      		response = RestClient.get(endpoint)
    	end

		data = CSV.parse(response)
		data.shift
		return data

	end

end
