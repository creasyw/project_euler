
def sum_diagonal (nlayer)
  result = [1]
  (1..nlayer-1).to_a.map{|i| result+= (1..4).to_a.map{|j| result[-1]+2*i*j}}
  return result.reduce(:+)
end

# "1001 by 1001 spiral" is the 500th layer
puts sum_diagonal(500)

