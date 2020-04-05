-- I'm so proud of myself :)

-- Hide the recursive function within a nicer API
-- Actually, the result coming out of this function is backward, but since we
-- only care about the sum of all digits, it doesn't matter.
multiply strNum base = helper strNum 0 ""
  where helper a carry acc = case a of
          [] -> if carry == 0 then acc else acc ++ (show carry)
          -- this is a trick to convert a char to a string
          (x:xs) -> let num = (read (x:[])) * base + carry in
            helper xs (num `div` 10) (acc ++ (show (num `mod` 10)))


sumOfPowerTwo x = sum $ map (\x -> read (x:[])) $ helper x "1"
  where helper powers acc = if powers == 0 then acc
                            else helper (powers - 1) $ multiply acc 2
