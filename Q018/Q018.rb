m = File.read("Q018.txt").split("\n").map{|i| i.split(" ").map{|k| k.to_i}}
m[1] = m[1].map{|i| i += m[0][0]}
(1..m.length-2).each do |i|
  m[i+1][0] += m[i][0]
  (1..m[i].length-1).each do |j|
    m[i+1][j] += [m[i][j-1], m[i][j]].max
  end
  m[i+1][-1] += m[i].last
end

puts m[-1].max

