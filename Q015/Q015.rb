load "../matrix_extend.rb"

side = 21
m = Matrix.zeros(side,side)

side.times do |i|
  side.times do |j|
    x = m.to_a
    if i == 0
      x[i][j] = 1
    elsif j == 0 
      x[i][j] = 1
    else
      x[i][j] = x[i-1][j]+x[i][j-1]
    end
    m = Matrix.from_a(x)
  end
end

puts m.[](side-1, side-1)

