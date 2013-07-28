puts (1..1000000).select{|i| i.to_s.reverse==i.to_s and i.to_s(2).reverse==i.to_s(2)}.reduce(:+)
