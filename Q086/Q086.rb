
def shortest_path (limit)
  c = 0
  a = 2
  while c < limit do
    a += 1
    for bc in 3..2*a
      if (bc*a)%12!=0 then next end
      s = Math.sqrt(bc**2+a**2)
      if s.to_i == s then c += [bc, a+1].min-(bc+1)/2 end
    end
  end
  print "PE086 = %d\n"%(a)
end

shortest_path(1000000)

