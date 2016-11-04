-- function composition (f o g)(x) = f(g(x))
-- call function g with parameter and call function f with g(x)
-- we do it with .
--(.) :: (b -> c) -> (a -> b) -> a -> c
--f . g  = \x -> f (g x)

negatives = map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24] 
negatives2 = map (negate . abs) [5,-3,-6,7,-3,2,-19,24]  


other = map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]
other2 = map (negate . sum . tail) [[1..5],[3..6],[1..7]]

--what happens with multiple parameters?
-- we need to partially apply functions so that they only have one parameter
ex1 = sum (replicate 5 (max 6.7 8.9))
ex1' = sum . replicate 5 . max 6.7 $ 8.9

ex2 = replicate 100 (product (map (*3) (zipWith max [1,2,3,4,5] [4,5,6,7,8])))
ex2' = replicate 100 . product . map (*3) . zipWith max [1,2,3,4,5] $ [4,5,6,7,8]

--we can define functions in point free style i.e. with one missing paramter
sum' :: (Num a) => [a] -> a     
sum' xs = foldl (+) 0 xs     
--point free style
sum'' :: (Num a) => [a] -> a     
sum'' = foldl (+) 0

--other example
fn x = ceiling (negate (tan (cos (max 50 x))))
fn' = ceiling . negate . tan . cos . max 50  

--rewrting with function composition
oddSquareSum :: Integer  
oddSquareSum = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))
oddSquareSum' :: Integer  
oddSquareSum' = sum . takeWhile (<10000) . filter odd . map (^2) $ [1..]
--however we can improve readability by defining
oddSquareSum'' :: Integer  
oddSquareSum'' = 
    let oddSquares = filter odd $ map (^2) [1..]
        belowLimit = takeWhile (<10000) oddSquares
    in sum belowLimit
    