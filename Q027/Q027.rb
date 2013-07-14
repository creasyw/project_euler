require "Prime"

puts (-999..999).to_a.product((-999..999).to_a).map { |a, b|
	[(0..100).take_while { |n| Prime.prime?(n**2 + a*n + b)}.count, a * b]
}.max[1]

