-- it is actual easier to compare the palindrom by converting it into string and
-- then revert and compare it to itself. These three operations are much faster
-- than the actual "math" way to comapre the number digit by digit, especially
-- for large number
isPalindrome :: (Integral a, Show a) => a -> Bool
isPalindrome x = str == reverse str where str = show x

-- I guess there is some smart way to find the numbers in a list that their
-- products are in decreasing order. But the complexity for all three digits
-- numbers are higher than simply trying them in segment. That is, calling this
-- function by 900 - 999, 800 - 899, and so on if the previous segments fail to
-- find any palindrome.
largestProductPalindrome :: (Integral a, Show a) => a -> a -> a
largestProductPalindrome x y =
    maximum . filter (isPalindrome) $ [ a * b | a <- range, b <- range ]
    where range = [y, y - 1 .. x]
