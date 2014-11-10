require 'nokogiri'
require 'open-uri'

html = open(
  "http://www.amazon.co.jp/gp/bestsellers/","r:shift_JIS")
doc =Nokogiri.HTML(html, nil, "ShiftJIS")

puts doc.xpath('//title').text
