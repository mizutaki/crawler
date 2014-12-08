require 'sinatra'
require 'json'
require 'nokogiri'
require 'open-uri'

require_relative 'db_operation'

get '/' do
	op = DBOperation.new
	@residence_info = op.show
  puts 'sinatra!'
  erb :index
end

get '/details/*' do
	url = params[:splat][0]
	puts params[:ar]
	puts params[:bs]
	puts params[:bc]
	#TODO URLを結合して、リクエストを送る
	JSON.generate({"foo" => "bar"})
end
