import qualified Data.Map as Map
import Data.Char as Char

digitFactorials :: Int -> [Int]
digitFactorials x = map (factorial . Char.digitToInt) $ show x
  where factorial i = if i > 0 then product [1..i] else 1


sumCuriousNum :: Int -> Int
sumCuriousNum limit = sum $ filter isCurious [3..limit]
  where isCurious x = x == (sum $ digitFactorials x)
        digitFactorials x = map (getfactorial . Char.digitToInt) $ show x
        -- Using a Map cuts about 2/3 of running time compared with calculate
        -- the factorial for each digit for every number
        getfactorial i = Map.findWithDefault 1 i factorialMap
        factorialMap = Map.fromList [(x, product [1..x]) | x <- [1..9]]
