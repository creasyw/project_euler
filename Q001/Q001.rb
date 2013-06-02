n = 1000
puts (1..(n-1)).select{|x| x%3==0 or x%5==0}.reduce(:+)

