require_relative "./factor.rb"

# The explanation refers to number.rkt
def is_pythagorean (premeter)
  half = premeter / 2
  m = factors(half).select{|k| 0<(half/k-k) and (half/k-k)<k and half/k>k}
  m.map{|k| [k, half/k-k]}.map{|k| [k.first**2-k.last**2,
    2*k.first*k.last, k.first**2+k.last**2]}
end

# The explanation refers to number.rkt
def num_of_pythagorean (num)
  candidates = factors(num).drop(1).select{|i| is_pythagorean(i).length!=0}
  (0..candidates.length-1).each{|i| if candidates[i]!=1
    (i+1..candidates.length-1).each{|j|
      temp=Math.log2(candidates[j].to_f/candidates[i])
      if candidates[j]!=1 and temp!=0 and temp.to_i==temp then candidates[j]=1 end}
  end}
  candidates.select{|i| i!=1}.length
end

def factorial (st, en)
  (st..en).reduce(:*)
end

