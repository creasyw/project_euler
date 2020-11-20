import qualified Data.Matrix as Matrix
import qualified Data.Vector as Vector
import qualified Data.List as List

main = interact matrixProcess

matrixProcess :: String -> String
matrixProcess s = show
  $ iterateMatrix
  $ Matrix.fromList 20 20
  $ map (\x -> read x::Int) $ words s

iterateMatrix m = helper 1 m 0
  where helper startRow cm acc =
          if (Matrix.nrows cm == 1 && Matrix.ncols cm == 1)
          then max acc $ Matrix.getElem 1 1 cm
          else if Matrix.ncols cm == 1
               then helper (startRow + 1) (Matrix.submatrix (startRow + 1) (Matrix.nrows m) 1 (Matrix.ncols m) m) $ max (maxValue cm) acc
               else helper startRow (Matrix.submatrix 1 (Matrix.nrows cm) 2 (Matrix.ncols cm) cm) $ max (maxValue cm) acc
-- get the maximum value among diagnal, first row, and first column
maxValue m =
  max (helper $ Matrix.getRow 1) $
  max (helper $ Matrix.getCol 1) (helper Matrix.getDiag)
  where helper f = List.maximum $ productOfFour $ Vector.toList $ f m

-- only check the maximum value in the diagnal direction
maxDiag m = List.maximum $ productOfFour $ Vector.toList $ Matrix.getDiag m

matrixMirror m = helper 1 (Matrix.ncols m) m
  where helper c1 c2 cm =
          if c1 >= c2
          then cm
          else helper (c1 + 1) (c2 - 1) $ Matrix.switchCols c1 c2 cm

-- get the product of every four elements
productOfFour lst =
  case lst of [] -> []
              (x:xs) -> (List.product $ take 4 lst) : (productOfFour xs)
