require 'anemone'

#ページ指定クローラ

#クロールの起点となるURLを指定
urls = [
  "http://www.amazon.co.jp/gp/bestsellers/digital-text/2291657051/",
  "http://www.amazon.co.jp/gp/bestsellers/digital-text/2291905051/",
  "http://www.amazon.co.jp/gp/bestsellers/books/466298",
  "http://www.amazon.co.jp/gp/bestsellers/books/466282"]

Anemone.crawl(
  urls, :depth_limit => 0) do |anemone|

  anemone.on_every_page do |page|
   puts page.url
  end
end

  
