-- struggled a bit on the signature of the helper function (or the actual
-- implementation of the =scanl=). =scanl= use the initiate value as the first
-- element in the generated list. Also, I paused a bit thinking about the
-- iterations in Haskell and finally realized that all loops can be converted to
-- recursive function.

numRoutes num = last $ helper 2 (replicate num 1)
  where
    helper numRow lst = if numRow == num
        then scanl (+) 1 lstTail
        else helper (numRow + 1) (scanl (+) 1 lstTail)
        where lstTail = tail lst
