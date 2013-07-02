puts File.read("Q013.txt").split("\n").map{|i| i.to_i}.reduce(:+).to_s.
  split("").take(10).join.to_i
