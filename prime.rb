
def gen_prime (n)
  candidates = (1..n).step(1).to_a
  final = (2..Math.sqrt(n).round+1).step(1).to_a
  for i in final
    if candidates[i-1]!=0 then candidates = candidates.collect{|k| k if k and k%i!=0 or k==i} end
  end
  return candidates[1..-1].collect{|k| k if k}.compact
end


num = 1000
puts "Under #{num}, found #{gen_prime(num).length} prime numbers" 

