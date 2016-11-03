--folds let us reduce the list to some single value
--fold takes a binary function, a starting value and a list to fold
-- binary fuctions takes two parameters.

--left fold
-- the lambda function takes two parameters and returns the new accumulator
sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

--can be rewritten as
sum'' :: (Num a) => [a] -> a
sum'' = foldl (+) 0


elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl (\acc x -> if  x == y then True else acc) False ys

--foldr works in a similar fashion just a right fold
--accumulator changes place
--right folds are mostly used when building a new list from a list
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs

--foldl1 and foldr1 are like foldl and foldr but they assume the starting value
--they can cause errros with empty lists

maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) [] 

product' :: (Num a) => [a] -> a
product' = foldr (\x acc -> x*acc) 1
product'' :: (Num a) => [a] -> a
product'' = foldr1 (*)

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x acc -> if p x then x : acc else acc) []

head' :: [a] -> a
head' = foldr1 (\x _ -> x)

last' :: [a] -> a
last' = foldl1 (\_ x -> x)


-- we have analogous functions scanr, scanr1 and scanl, scanl1
-- they report intermediate steps
scan1 = scanl (+) 0 [3,5,2,1]  
scan2 = scanr (+) 0 [3,5,2,1]  
scan3 = scanl1 (\acc x -> if x > acc then x else acc) [3,4,5,3,7,9,2,1]
scan4 = scanl (flip (:)) [] [3,2,1]  

--How many elements does it take for the sum of 
--the roots of all natural numbers to exceed 1000?
sqrtSums :: Int
sqrtSums = length(takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1