load "../factor.rb"

def is_amicable (n)
  m = factors(n)[0..-2].reduce(:+)
  m != n and n == factors(m)[0..-2].reduce(:+)
end

puts (2..9999).select{|i| is_amicable(i)}.reduce(:+)

