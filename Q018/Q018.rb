# although "flooding" is enough for this specific problem in both
# algorithm complexity and performance, the better way is to reverse the
# pyramid so that there is no twisted work for the first and last element
m = File.read("Q018.txt").split("\n").map{|i| i.split(" ").map{|k| k.to_i}}.reverse
(1..m.length-1).each do |i|
  m[i].length.times do |j|
    m[i][j] += [m[i-1][j], m[i-1][j+1]].max
  end
end

puts m[-1][0]

