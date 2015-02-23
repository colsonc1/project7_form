# app.rb
require 'sinatra'
require 'cat_api'
require 'holidapi'


class MyWebApp < Sinatra::Base
  get '/' do
    daysInMonth = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    time = Time.new

    @holidays = HolidApi.get(country: 'us', year: time.year, month: time.month).flatten
	@birthdayHolidays = HolidApi.get(country: 'us', year: 1991, month: 4).flatten

    @time = time
    erb :index
  end
end