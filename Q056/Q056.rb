def sum_digit (n)
    n.to_s.split("").map{|i| i.to_i}.reduce(:+)
end

puts (2..99).map{|i| (1..99).map{|j| i**j}}.flatten.map{|i| sum_digit(i)}.max

