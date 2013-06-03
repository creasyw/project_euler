require 'set'
load "../primes.rb"

limit = 500
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


