
def end_eightynine (num)
  loop do
    if num == 89
      return true
    elsif num == 1
      return false
    else
      num = num.to_s.split(//).map{|i| i.to_i**2}.inject{|sum,x| sum+x}
    end
  end
end

count = 0
(1..10000000).each do |n|
  if end_eightynine(n) then count +=1 end
end
puts count
