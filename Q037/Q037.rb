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
  if count == 15 then break end
  if truncate_prime(i)
    result << i
    count += 1
  end
end
result = result.last(11)
puts result.join(" ")
puts result.reduce(:+)

