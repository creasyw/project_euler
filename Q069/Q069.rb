load "../primes.rb"

puts (2..1000000).map{|i| i.to_f/coprime(i).length}.each_with_index.max[1]+2



