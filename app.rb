require 'sinatra'
require 'holidapi'


class MyWebApp < Sinatra::Base
	get '/' do

		params['month'] ||= Time.new.month
		params['day'] ||= Time.new.day
		params['year'] ||= Time.new.year

		@Holidays_Date = HolidApi.get(month: params['month'], day: params['day'], year: params['year'])

		erb :index
	end
end