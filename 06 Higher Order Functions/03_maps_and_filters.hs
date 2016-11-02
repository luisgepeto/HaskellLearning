--map takes a function and a list and applies that function to all elements
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

map1 = map' (replicate 3) [3..6]  
map2 = map (map (^2)) [[1,2],[3,4,5,6],[7,8]]  

--filter takes a predicate and returns a list
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
    | p x = x : filter' p xs
    | otherwise = filter' p xs

filter1 = filter' (>3) [1,5,3,2,1,6,4,3,2,1]
filter2 = filter' even [1..10]  
filter3 = filter' (`elem` ['A'..'Z']) "i lauGh At You BecAuse u r aLL the Same"  

--we can achieve a quicksort
quicksort' :: (Ord a) => [a] -> [a]    
quicksort' [] = []    
quicksort' (x:xs) =     
    let smallerSorted = quicksort' (filter' (<=x) xs)  
        biggerSorted = quicksort' (filter' (>x) xs)   
        in  smallerSorted ++ [x] ++ biggerSorted  


largestDivisible :: (Integral a) => a  
largestDivisible = head (filter p [100000,99999..])  
    where p x = x `mod` 3829 == 0 

-- find the sum of all odd squares that are smaller than 10000
--takeWhile function takes a predicate and a list and returns while the predicate is true
sumOdd = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))            
sumOdd' = sum (takeWhile (<10000) [n^2 | n <- [1..], odd(n^2)])


-- collatz
-- how many chains have a length greater than 15
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
    | even n = n : chain (div n 2)
    | odd n = n : chain (n*3 +1)

numLongChains :: Int
numLongChains = length (filter isLong (map chain [1..100]))
    where isLong xs = length xs > 15

-- we can map incomplete functions too
listOfFuns = map (*) [0..]
listOfFuns' = (listOfFuns !! 4) 5