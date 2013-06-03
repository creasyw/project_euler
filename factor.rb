require "Prime"

def factors(n)
  # generate all factors divisible by n
  return (1..n).to_a.select{|x| n%x==0}
end

def prime_factors(n)
  return  factors(n).select{|k| k.prime?}
end



