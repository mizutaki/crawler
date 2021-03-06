require 'anemone'
require 'nokogiri'
require 'kconv'

#カテゴリ名とサブカテゴリ名を取得するクローラ

#クロールの起点となるURLを指定
urls = [
  "http://www.amazon.co.jp/gp/bestsellers/digital-text/2291657051/",
  "http://www.amazon.co.jp/gp/bestsellers/digital-text/2291905051/",
  "http://www.amazon.co.jp/gp/bestsellers/books/466298",
  "http://www.amazon.co.jp/gp/bestsellers/books/466282"]

Anemone.crawl(
  urls, :depth_limit => 0) do |anemone|

  anemone.on_every_page do |page|
    #文字コードをUTF-8に変換したうえで、Nokogiriでパース
    doc = Nokogiri::HTML.parse(page.body.toutf8)

    category = doc.xpath(
      "//*[@id='zg_browseRoot']/ul/li/a").text

    #カテゴリ名の表示
    sub_category = doc.xpath(
      "//*[@id=\"zg_listTitle\"]/span").text
  
    puts category+"/"+sub_category
  end
end

  
