require "Matrix"

module Matrix_extend
    class :: Matrix
        def diagonal()
            # concatenate the lagest possible square matrix from the object
            # and return its diagonal elements in a array
            result = []
            [self.row_size(), self.column_size()].min.times do |i|
                result << self[i,i]
            end
            return result
        end
        
        def Matrix.from_a(arr)
            # build matrix based on input array
            return Matrix[*arr]
        end

        def Matrix.vstack(m1, m2)
            return Matrix[*m1, *m2]
        end

        def Matrix.hstack(m1, m2)
            raise "The two input matrices have different dimensions"
            unless m1.row_size == m2.row_size or
                   m1.column_size == m2.column.size
            end
            result = []
            m1.row_size.times do |i|
                result << m1.row(i)+m2.row(i)
            end
            return Matrix[*result]
        end
    end
end



