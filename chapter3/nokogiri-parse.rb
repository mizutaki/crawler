require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://google.co.jp'))
p doc
