 puts  (1..100).map{|i| (1..100).map{|x| if (i**x).to_s.length==x then 1 else 0 end}}.flatten.reduce(:+)
