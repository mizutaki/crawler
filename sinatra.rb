require 'sinatra'
require 'json'
require 'nokogiri'
require 'open-uri'

require_relative 'db_operation'

get '/' do
	op = DBOperation.new
	@residence_info = op.show
  erb :index
end

get '/details/*' do
	url = params[:splat][0].gsub("http:/", "https://")
	ar = params[:ar]
	bs = params[:bs]
	bc = params[:bc]
	request_url = url + "?ar=#{ar}&bs=#{bs}&bc=#{bc}"
	#詳細情報を取得する
	html = Nokogiri::HTML(open("#{request_url}").read)
	html.xpath("/html/body/div[1]/div[5]/div[6]/table")
end
