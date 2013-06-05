# just the translation from solution2 in python

puts (100..1000).map{|x| (x..1000).map{|y| x*y}}.flatten.select{|k| k.to_s.reverse==k.to_s}.max


