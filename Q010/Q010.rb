require "Prime"

puts Prime.take_while{|i| i<2000000}.reduce(:+)
