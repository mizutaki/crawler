require 'open-uri'
require 'csv'

url = "http://www.mof.go.jp/jgbs/reference/interest_rate/jgbcm.csv"
csv = open(url)
csv_obj = CSV.new(open(url), {:encoding => "Shift_JIS", :headers => :first_row})
csv_obj.each do |row|
  #最終行のみ表示
  if csv_obj.eof?
    #puts row
    puts "基準日:#{row[0]}"
    puts "1年:#{row[1]}"
    puts "10年:#{row[10]}"
  end
end
