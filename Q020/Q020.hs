
largeMultiply strNum base = helper strNum 0 ""
  where
    helper a carry acc = case a of
        -- since the entire result is backward, we have to reverse the carry if
        -- it has more than one digit
        [] -> if carry == 0 then acc else acc ++ (reverse (show carry))
        -- this is a trick to convert a char to a string
        (x : xs) ->
            let num = (read (x : [])) * base + carry
            in helper xs (num `div` 10) (acc ++ (show (num `mod` 10)))

factorial x = helper "1" [2..x]
  where helper strNum lst = case lst of
          [] -> reverse strNum
          (x:xs) -> helper (largeMultiply strNum x) xs

sumFactorial x = sum $ map (\k -> read (k:[])) $ factorial x
