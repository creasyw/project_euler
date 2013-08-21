require_relative "../number.rb"

x = (3..1000).map{|i| num_of_pythagorean(i)}
puts x.index(x.max)+3
