urls =[]
urls.push("https://www.youtube.com/watch?v=zTsCcjLqsRo")
urls.push("http://www.youtube.com/watch?v=MfeittF-qI")

urls.each {|url|
  puts url
  system("youtube-dl -t #{url}")
}
