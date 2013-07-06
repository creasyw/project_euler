load "../factor.rb"

def is_abandon (n)
  n < factors(n)[0..-2].reduce(:+)
end

pool = (2..28123-12).select{|i| is_abandon(i)}
result = Array(1..28123)

pool.length.times do |i|
  (i..pool.length-1).each do |j|
    # there is no need to test if the summation is in the list
    # if not, the delete operation will return only nil (:
    result.delete(pool[i]+pool[j])
  end
end

puts result.reduce(:+)

