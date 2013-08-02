require "Prime"

def truncate_prime (n)
  return (1..n.to_s.length-1).select{|i|
    Prime.prime?(n.to_s.split("").first(i).reduce(:+).to_i)==false or
    Prime.prime?(n.to_s.split("").last(i).reduce(:+).to_i)==false}.length==0
end

count = 0
generator = Prime.instance()	#ruby prime generator
result = []
for i in generator
  if i < 10 then next end
  if count == 11 then break end
  if truncate_prime(i)
    result << i
    count += 1
  end
end

puts result.join(" ")
puts result.reduce(:+)

