puts "My First <storng>Regular</strong>Expression." =~ /Regular/
puts $&

str = "My First <strong>Regular</strong> Expression."
matchdata = str.match(/<strong>(.*?)<\/strong>/)

puts matchdata.pre_match
puts matchdata.post_match
puts matchdata[0]
puts matchdata[1]
