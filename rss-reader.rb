# _*_ coding:utf-8 *_*
require 'nokogiri'
require 'open-uri'
require 'mysql2'

client = Mysql2::Client.new(:host => "localhost", :username => "residence", :password => "residence_pass", :database => "residence_db")

url = ''
#pn ページ数
#pc 表示件数 10,20,30,50,100
xml = Nokogiri::XML(open(url).read)
item_nodes = xml.xpath('//item')
count = 0
arr = []
item_nodes.each do |item|
  count += 1
  title = item.xpath('title').text
  link = item.xpath('link').text
  description = item.xpath('description').text
  n = description.gsub("：", "").to_s
  o = n.scan(/\S+/)#空白文字[\t\r\n\f]以外にマッチ
  warking_time = o[1]#バス徒歩
  rent = o[3]#賃料管理費・共益費
  deposit = o[5]#敷金・礼金
  layout = o[7]#間取り
  azimuth = o[9]#方位
  building_year = o[11]#築年
  real_estate_company_name = o[13]#不動産会社名
  real_estate_company_phonenumber = o[15]#不動産会社電話
  client.query("INSERT INTO residence(id, url, warking_time, rent, deposit, layout, azimuth, building_year, real_estate_company_name, real_estate_company_phonenumber) VALUES (#{count},'#{link}', '#{warking_time}', '#{rent}', '#{deposit}', '#{layout}','#{azimuth}','#{building_year}', '#{real_estate_company_name}', '#{real_estate_company_phonenumber}')")
end

result = client.query("SELECT * FROM residence")
result.each do |item|
  puts item["building_year"]
end


