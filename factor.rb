require "Prime"

def factors(n)
  # generate all factors divisible by n
  return (1..n).to_a.select{|x| n%x==0}
end

def prime_factors(n)
  return  factors(n).select{|k| k.prime?}
end

# because ruby cannot load file which load another file
# I put the number operation in the same file with factors
def is_pythagorean (premeter)
  half = premeter / 2
  m = factors(half).select{|k| 0<(half/k-k) and (half/k-k)<k and half/k>k}
  return m.map{|k| [k, half/k-k]}.map{|k| [k.first**2-k.last**2,
    2*k.first*k.last, k.first**2+k.last**2]}
end


