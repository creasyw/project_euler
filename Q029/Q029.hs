import Data.Set as Set

-- there is another approach to optimize the space complexity:
-- 1. Assuming the max possible solution is a * b
-- 2. Get the factors of b
-- 3. For every b1 where b1 is a factor of b, if a^b1 less then the upper limit
--    of a, minus one from the possible solution
-- It takes 0.03 seconds to use brutal force, so it doesn't have to go with the
-- optimization

distinctPowers a b = length $ Set.fromList [x^y | x <-[2..a], y <-[2..b]]
