require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://yahoo.co.jp'))

puts doc%'//title'
puts doc/'//title'
puts doc.at('//title')

puts doc.at_xpath('//title')

puts doc.at_css('title')

puts doc.css('title')[0]

puts doc.search('title')

puts doc.search('title')[0]

puts doc.xpath('//title')

puts doc.xpath('//title')[0]

puts doc.xpath('//title').first
