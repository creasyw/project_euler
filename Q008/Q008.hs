import Data.Char as Char
import System.IO as IO

largestProduct :: Integral a => [a] -> [a] -> a -> a -> a
largestProduct lst currLst currVal acc = case lst of
    []       -> max currVal acc
    (x : xs) -> largestProduct xs newLst nextVal (max currVal acc)
      where
        newLst  = (tail currLst) ++ [x]
        nextVal = if head currLst == 0
            then foldl (*) 1 newLst
            else currVal `div` (head currLst) * x

readNum range = do
    handle <- IO.openFile
        "/Users/qionw/workspace/project_euler/Q008/Q008.txt"
        IO.ReadMode
    contents <- IO.hGetContents handle
    let lst     = map Char.digitToInt $ head $ lines contents
        currLst = take range lst
        currVal = foldl (*) 1 currLst
    print $ largestProduct lst currLst currVal currVal
    IO.hClose handle

-- Two things that almost killed me...
-- 1) the conversion between `IO` types and the regular data types. When I read
-- the logic about "separating purity vs. impurity" in the Haskell code, I think
-- it is great without knowing how hard and obscure it is to use in the actual
-- code. 2) the complains from the compiler is all over the place. I kinda
-- understand this too... since the nature of currying, it is hard for compiler
-- to know if there is a missing parameter at one place, or it is just another
-- derived function, which changes everything that follows that error. I missed
-- the initial value at the `foldl` in `largestProduct` and had a million issues
-- from compiler.
