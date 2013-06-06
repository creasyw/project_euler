
n = 20
x = (1..n).to_a
(1..n-1).each{|i| x[i+1..n-1] = x[i+1..n-1].map{|k| if k%x[i]==0 then k/x[i] else k end}}
puts x.reduce(:*)
