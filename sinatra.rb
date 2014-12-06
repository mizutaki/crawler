require 'sinatra'
require 'json'
require_relative 'db_operation'

get '/' do
	op = DBOperation.new
	@residence_info = op.show
  puts 'sinatra!'
  erb :index
end

get '/details/*' do
	JSON.generate({"foo" => "bar"})
end
