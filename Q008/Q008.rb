contents = File.read("./Q008.txt").split("").select{|i| i!="\n"}.map{|k| k.to_i}
result = 0
(0..contents.length-5).each{|i| result=[result, contents[i..i+4].reduce(:*)].max}
puts result
