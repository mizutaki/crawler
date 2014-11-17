require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open(
  'http://www.yahoo.co.jp', :proxy => 'http://localhost:5433'))

puts doc.title
