--we can define recursively
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "no maximum of empty list"
maximum' [x] = x
maximum' (x:xs) 
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs


maximum'' :: (Ord a) => [a] -> a
maximum'' [] = error "no maximum of empty list"
maximum'' [x] = x
maximum'' (x:xs) = max x (maximum'' xs)