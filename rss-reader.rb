# _*_ coding:utf-8 *_*
require 'nokogiri'
require 'open-uri'
require 'mysql2'

client = Mysql2::Client.new(:host => "localhost", :username => "residence", :password => "residence_pass", :database => "residence_db")

url = ''
#pn ページ数
#pc 表示件数 10,20,30,50,100
xml = Nokogiri::XML(open(url).read)
#puts xml.xpath('/rss/channel')
item_nodes = xml.xpath('//item')
count = 0
item_nodes.each do |item|
  count += 1
  title = item.xpath('title').text
  link = item.xpath('link').text
  description = item.xpath('description').text
  client.query("INSERT INTO residence(id, url, description) VALUES (#{count},'#{link}', '#{description}')")
end
