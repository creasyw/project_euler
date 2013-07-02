
$h = Hash.new()
def count_terms (num)
  count = 1
  acc = num
  until acc == 1 do
    if acc%2 == 0 then acc /=2 else acc = acc*3+1 end
    count += 1
    if $h.has_key?(acc)
      return $h[acc]+count-1
    end
  end
  return count
end

result = 1
(1..1000000).each do |i|
  $h[i] = count_terms(i)
  if $h[result] < $h[i]
    result = i
  end
end

puts result



