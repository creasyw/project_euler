def is_pandigit (n)
  result = n.to_s
  count = 2
  while result.length < 9 do
    result += (count*n).to_s
    count += 1
  end
  if result.split("").sort.reduce(:+) == "123456789" then return result
  else return 0
  end
end

puts (2..9999).map{|i| is_pandigit(i)}.select{|i| i!=0}.max
