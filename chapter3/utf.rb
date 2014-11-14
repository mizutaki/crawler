require 'nokogiri'
require 'open-uri'

html = open(
  "http://www.amazon.co.jp/gp/bestsellers/").read.encode("UTF-8", "Shift-JIS", :invalid => :replace, :undef => :replace)
doc = Nokogiri.HTML(html)
puts doc.xpath('//title').text
