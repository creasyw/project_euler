
def is_pythagorean (premeter)
  half = premeter / 2
  m = factors(half).select{|k| 0<(half/k-k) and (half/k-k)<k and half/k>k}
  return m.map{|k| [k, half/k-k]}.map{|k| [k.first**2-k.last**2,
    2*k.first*k.last, k.first**2+k.last**2]}
end

