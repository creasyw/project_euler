require "Prime"

puts Prime.each(1000000).select{|i| (1..i.to_s.length).all?{|j| Prime.prime?(i.to_s.split('').rotate(j).join('').to_i)}}.count
