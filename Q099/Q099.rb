result = 1
linenum = largest = 0
IO.foreach "base_exp.txt" do |line|
  linenum += 1
  base, expo = line.split(',').collect{|i| i.to_i}
  benchmark = expo*Math.log10(base)
  if largest < benchmark then largest=benchmark; result = linenum end
end
puts result
