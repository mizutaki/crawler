require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.yahoo.co.jp'))

nodesets = doc.xpath('//title')
puts nodesets.text
puts nodesets.inner_text
puts nodesets.first.inner_text

nodesets.each { |nodeset|
  puts nodeset.content()
  puts nodeset.text
  puts nodeset.inner_text
}
