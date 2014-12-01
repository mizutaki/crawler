# _*_ coding:utf-8 *_*
require 'nokogiri'
require 'open-uri'

url = ''
#pn ページ数
#pc 表示件数 10,20,30,50,100
xml = Nokogiri::XML(open(url).read)
#puts xml.xpath('/rss/channel')
item_nodes = xml.xpath('//item')
item_nodes.each do |item|
  #puts item.xpath('title').text
  #puts item.xpath('link').text
  des = item.xpath('description').text
end