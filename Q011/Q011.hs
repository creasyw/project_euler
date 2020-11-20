import qualified Data.Matrix as Matrix
import qualified Data.Vector as Vector
import qualified Data.List as List

main = interact matrixProcess

matrixProcess :: String -> String
matrixProcess s = show
  $ iterateMatrix
  $ Matrix.fromList 20 20
  $ map (\x -> read x::Int) $ words s

iterateMatrix m = List.maximum
  [maxRow m, maxDiag m, maxRow (Matrix.transpose m), maxDiag (Matrix.transpose m),
   maxDiag mm, maxDiag (Matrix.transpose mm)]
  where mm = matrixMirror m

-- get the maximum value of all rows in the given matrix
-- Note that we can do transpose to the matrix and apply this function again to get the value for all columns
maxRow m = helper 1 (Matrix.nrows m) 0
  where helper currentRow rowNum acc =
          if currentRow == rowNum
          then max acc $ maxValue $ Matrix.getRow currentRow m
          else helper (currentRow + 1) rowNum $ max acc $ maxValue $ Matrix.getRow currentRow m

-- get the maximum value of the lower half of all diagonal vectors of a given matrix
-- It needs a transpose to search through the other half of the diagnals
-- It looks very similar to maxRow. The reason to keep them separate is we need
-- to do a mirror matrix and apply another round of diagnal twice for the uppoer
-- and lower half of the mirrored matrix. This function is required after all.
-- As a result, it's clearer to keep the maxRow to also perform a single task
maxDiag m = helper 1 (Matrix.nrows m) m 0
  where helper currentRow rowNum cm acc =
          if currentRow == rowNum
          then max acc $ maxValue $ Matrix.getDiag cm
          else helper (currentRow + 1) rowNum
               (Matrix.submatrix (currentRow + 1) (Matrix.nrows m) 1 (Matrix.ncols m) m)
               $ max acc $ maxValue $ Matrix.getDiag cm

-- flip the matrix so that we could get the diagnal vecter in the opposite direction
matrixMirror m = helper 1 (Matrix.ncols m) m
  where helper c1 c2 cm =
          if c1 >= c2
          then cm
          else helper (c1 + 1) (c2 - 1) $ Matrix.switchCols c1 c2 cm

-- get the maximum of a veter with the largest product for the adjacent four elements
maxValue v = List.maximum $ productOfFour $ Vector.toList v

-- get the product of every four elements
productOfFour lst =
  case lst of [] -> []
              (x:xs) -> (List.product $ take 4 lst) : (productOfFour xs)
