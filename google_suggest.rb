require 'open-uri'
require 'uri'
require 'rexml/document'

base_url = 'http://www.google.com/complete/search?h1=ja&output=toolbar'
keyword = URI.encode('Ruby on Rails')
url = "#{base_url}&q=#{keyword}"
doc = REXML::Document.new(open(url).read.encode("UTF-8"))
doc.elements.each('toplevel/CompleteSuggestion/suggestion') do |element|
  puts element.attributes["data"]
end
