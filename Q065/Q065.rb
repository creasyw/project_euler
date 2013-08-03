def convergent (n)
  lst = ([2,1] + (3..n).map{|i| if i%3==0 then i/3*2 else 1 end}).reverse
  result = [1, lst.first]
  for i in lst.drop(1)
    result = [result[1], result[1]*i+result[0]]
  end
  return result
end

puts convergent(100)[1].to_s.split("").map{|i| i.to_i}.reduce(:+)

