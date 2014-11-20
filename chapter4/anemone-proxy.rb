require 'anemone'

urls = []
urls.push("http://www.yahoo.co.jp/")

opts = {
  :proxy_host => 'localhost',
  :proxy_port => '5433',
  :obey_rbots_txt => true,
  :depth_limit => 0
}

Anemone.crawl(urls, opts) do |anemone|
  anemone.on_every_page do |page|
    puts page.doc.xpath("//title/text()").to_s if page.doc
  end
end
