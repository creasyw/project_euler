require "Matrix"

module Matrix_extend
  class :: Matrix
    def diagonal
      # concatenate the lagest possible square matrix from the object
      # and return its diagonal elements in a array
      result = []
      [self.row_size(), self.column_size()].min.times do |i|
	  result << self[i,i]
      end
      result
    end
    
    def rotate
      cn = self.column_size
      result = []
      cn.times do |i| result<<self.column(cn-1-i) end
      Matrix[*result]
    end

    def Matrix.from_a(arr)
      # build matrix based on input array
      Matrix[*arr]
    end

    def Matrix.zeros(x, y)
      # build matrix with all zeros
      Matrix.build(x,y){|x,y| x=0}
    end

    def Matrix.ones(x, y)
      # build matrix with all ones
      Matrix.build(x,y){|x,y| x=1}
    end

    #
    # Create a matrix by vertically merge two existing matrix
    #
    #   x = Matrix[[1, 2], [3, 4]]
    #   y = Matrix[[5, 6], [7, 8]]
    #   Matrix.vstack(x, y)
    #   => Matrix[[1, 2], [3, 4], [5, 6], [7, 8]]
    #
    def Matrix.vstack(m1, m2)
      if  m1.column_size != m2.column_size
	raise ArgumentError,
	  "The two input matrices have different dimensions"
      end
      Matrix[*m1, *m2]
    end

    #
    #
    # Create a matrix by horizontally merge two existing matrix
    #
    #   x = Matrix[[1, 2], [3, 4]]
    #   y = Matrix[[5, 6], [7, 8]]
    #   Matrix.hstack(x, y)
    #   => Matrix[[1, 2, 5, 6], [3, 4, 7, 8]]
    #
    def Matrix.hstack(m1, m2)
      if  m1.row_size != m2.row_size
	raise ArgumentError, 
	  "The two input matrices have different dimensions"
      end
      result = []
      m1.row_size.times do |i|
	  result << m1.row(i).to_a+m2.row(i).to_a
      end
      Matrix[*result]
    end
  end
end



