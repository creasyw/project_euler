load "../factor.rb"
require 'set'

def is_product_sum (num, lookups)
  candidates = factors(num)[1..-2]
  if candidates.length ==0 then return 0 end
  for i in candidates
    if lookups.has_key?(num/i)
      for itr in lookups[num/i]
	lookups[num]<< iter<< i
      end
    end
  end
  for i in (0..(candidates.length.to_f/2).ceil)
    lookups[num]<< candidates[i]<< num/candidates[i]
  end
  index = Set.new
  for i in lookups[num]
    index.add(i.length+num-i.inject(:+))
  end
  return index.sort(), lookups
end

k = 12
result = (0..k).to_a.map{|i| i*0}
lookups = Hash.new(Array.new)
for i in (2..k*2)
  indice, lookups = is_product_sum(i, lookups)
  if indice.class == Array
    for j in indice
      if j<k and result[j]==0
	reult[j] == i
      end
    end
  end
end

puts result.uniq.inject(:+)


