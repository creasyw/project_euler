diff :: (Integral a) => a -> a -> a
diff x y = (sum([x..y])) ^ 2 - sum([k^2 | k <- [x..y]])
