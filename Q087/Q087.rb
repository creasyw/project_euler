require 'set'

def gen_prime (n)
  candidates = (1..n).step(1).to_a
  final = (2..Math.sqrt(n).round+1).step(1).to_a
  for i in final
    if candidates[i-1]!=0 then candidates = candidates.collect{|k| k if k and k%i!=0 or k==i} end
  end
  return candidates[1..-1].collect{|k| k if k}.compact
end

limit = 50000000
primes = gen_prime(Math.sqrt(limit).round)
result = Set.new

for i in primes
  for j in primes
    sum = i**2+j**3
    if sum >= limit then break end
    for k in primes
      sum2 = sum+k**4
      if sum2 >= limit then break end
      result.add(sum2)
    end
  end
end

puts "Q087:", result.length


