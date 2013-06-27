load "../matrix_extend.rb"

# the produce could be splitted into three parts:
# 1. horizontal and vertical -- horizontal products for matrix and its rotation
# 2. lower-left for both matrix and its rotation
# 3. upper-right for both matrix and its rotation
pro_length = 4
m = Matrix.from_a(File.read("Q011.txt").split("\n").map{|i| i.split(" ").map{|k| k.to_i}})
m90 = m.rotate
side = m.row_size
result = 0

side.times do |i|
  acc = (0..(side-4)).map{|j| m.row(i)[j..(j+3)].reduce(:*)}
  acc += (0..(side-4)).map{|j| m90.row(i)[j..(j+3)].reduce(:*)}

  less_row = m.minor(i..side,0..side)
  less_col = m.minor(0..side,i..side)
  less_row90 = m90.minor(i..side,0..side)
  less_col90 = m90.minor(0..side,i..side)
  if less_row.row_size >= 4
    acc += (0..(less_row.row_size-4)).map{|j| less_row.diagonal[j..(j+3)].reduce(:*)}
    acc += (0..(less_row.row_size-4)).map{|j| less_row90.diagonal[j..(j+3)].reduce(:*)}
  end
  if less_col.row_size >= 4
    acc += (0..(less_col.column_size-4)).map{|j| less_col.diagonal[j..(j+3)].reduce(:*)}
    acc += (0..(less_col.column_size-4)).map{|j| less_col90.diagonal[j..(j+3)].reduce(:*)}
  end
  result = [acc.max, result].max
end

puts result


