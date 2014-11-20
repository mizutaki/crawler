require 'open-uri'
require 'rexml/document'
require 'date'

url = "http://blog.livedoor.jp/staff/index.rdf"

doc = REXML::Document.new(open(url))
doc.elements.each('rdf:RDF/item') do |item|
  dc_date = Date.parse(item.elements['dc:date'].text)

  #7日以内に追加されたデータ、処理対象とする
  if (Date.today - dc_date).to_i <= 7 
    #巡回対象とするURLの表示
   puts item.elements['link'].text
  end
end
