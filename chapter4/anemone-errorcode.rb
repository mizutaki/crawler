require 'anemone'

urls = []
urls.push("http://www.hatena.ne.jp/")

opts = {
  :depth_limit => 1,
  :obey_robots_txt => true
}

Anemone.crawl(urls, opts) do |anemone|
  anemone.on_every_page do |page|
    puts page.url
    raise '500 ERROR!:' + page.url.path.to_s if page.code == 500
  end
  anemone.after_crawl do |pages|
    puts "hogee"
  end
end
