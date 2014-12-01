require 'google-search'

Google::Search::Web.new(:query => 'クローラー').each do |item|
	puts item.uri
	puts item.title
end
