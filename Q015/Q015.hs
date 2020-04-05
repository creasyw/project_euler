
numRoutes num = last $ helper 2 (replicate num 1)
  where
    helper numRow lst = if numRow == num
        then scanl (+) 1 lstTail
        else helper (numRow + 1) (scanl (+) 1 lstTail)
        where lstTail = tail lst
