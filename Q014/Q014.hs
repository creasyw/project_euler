-- a couple of things:
-- 1. I can feel the typeclass is still looming in the background but it is not
-- so annoying, at least for this question. For example, I cannot use = map !?
-- itme= to check if an item is in a map, because the return value is a =Maybe=,
-- which cannot be use as a concrete type in =zip=. As a result, I have to use
-- =member= to return a boolean
-- 2. I have to keep looking up at Hoogle since everything is not intuitively
-- right - the =Map.foldl= only folds value, but not key, and =Map.findMax= or
-- =Map.loopupMax= only look up the pair with max key (the different between
-- them is the typeclass =Maybe=). To find the pair with max value, I have to
-- use =Map.foldlWithKey=.
-- 3. The pair of key and value is a "tuple". The only intuitively correct place
-- in this question is to disassemble and assemble them in the anonymous
-- function to find the pair with max value.
-- 4. I love =where=.
-- mic drop

import Data.Map.Strict as Map

findLength register num acc = if member num register
    then Map.union register $ Map.fromList $ zip acc [val .. (length acc) + val]
    else findLength register (next num) (num : acc)
  where
    val = register ! num + 1
    next x = if x `mod` 2 == 0 then x `div` 2 else 3 * x + 1

collatz x = Map.foldlWithKey
    (\(ak, av) key val -> if val > av then (key, val) else (ak, av))
    (1, 1)
    register
  where
    register = Prelude.foldl
        (\acc num -> findLength acc num [])
        (Map.fromList [(1, 1)])
        [2 .. x]
