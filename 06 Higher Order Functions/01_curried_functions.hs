-- curriend functions allow functions to take more than one parameter
-- we can partially applicate functions
multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x*y*z

multTwoWithNine :: (Num a) => a -> a -> a
multTwoWithNine = multThree 9

multWithEighteen :: (Num a) => a -> a 
multWithEighteen = multTwoWithNine 2

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred x = compare 100 x

-- infix functions can also be partially applied
divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum x = elem x ['A'..'Z']
isUpperAlphanum' :: Char -> Bool
isUpperAlphanum' = (`elem`  ['A'..'Z'])

--the only special case of a partially applied function is substraction
substractFromFour :: (Num a) => a -> a
substractFromFour = (subtract 4) 