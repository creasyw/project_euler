require "matrix"

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
    end
end



