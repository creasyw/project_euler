def factors(n)
  # generate all factors divisible by n
  return (1..n).to_a.select{|x| n%x==0}
end



