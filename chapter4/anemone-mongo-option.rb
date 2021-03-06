require 'anemone'
require 'mongo'

urls = []
urls.push("http://www.yahoo.co.jp")

opts = {
  :storage => Anemone::Storage::MongoDB(
  Mongo::Connection.new.db('clawler'), "documents")

}

Anemone.crawl(urls, opts) do |anemone|
  anemone.on_every_page do |page|
    puts page.url
    p page.doc.xpath("//title/text()").to_s if page.doc
  end
end
