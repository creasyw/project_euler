-- it is actual easier to compare the palindrom by converting it into string and
-- then revert and compare it to itself. These three operations are much faster
-- than the actual "math" way to comapre the number digit by digit, especially
-- for large number
isPalindrome :: (Integral a, Show a) => a -> Bool
isPalindrome x = (show x) == (reverse (show x))

largestProductPalindrome :: (Integral a, Show a) => a -> a -> a
largestProductPalindrome x y =
    maximum . filter (isPalindrome) $ [ a * b | a <- range, b <- range ]
    where range = [y, y - 1 .. x]
