require 'open-uri'
require 'nokogiri'

require_relative 'news-site.rb'
require_relative 'news-yomiuri'

def get_nokogiri_doc(url)
  begin
    html = open(url)
  rescue OpenURI::HTTPError
    return
  end
  Nokogiri::HTML(html.read, nil, 'utf-8')
end

site = NewsSite.new(Yomiuri.new)
doc = get_nokogiri_doc(site.url)
titles = site.scrape(doc)
titles.each {|key, value|
  puts key
  puts value
}
