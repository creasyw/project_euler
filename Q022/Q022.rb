x = File.read("names.txt").split(",").map{|i| i.gsub(/\"/,'')}.sort
result = 0
x.length.times do |i|
  result += (i+1)*x[i].each_byte.map{|j| j-64}.reduce(:+)
end
puts result


