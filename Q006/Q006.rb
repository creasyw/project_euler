n = 100
puts (1..n).to_a.reduce(:+)**2 - (1..n).to_a.reduce{|sum,i| sum+i**2}
