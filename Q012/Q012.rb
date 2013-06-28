load "../factor.rb"

limit = 500
acc = 2
num = 1

until factors(num).length > limit do
  num += acc
  acc += 1
end

puts num


