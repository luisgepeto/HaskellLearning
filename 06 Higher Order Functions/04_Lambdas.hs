-- lambdas are anonymous functions
-- we use \

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
    | even n = n : chain (div n 2)
    | odd n = n : chain (n*3 +1)

numLongChains :: Int
numLongChains = length(filter (\xs -> length xs > 15) (map chain [1..100]))

-- can take any numbers of parameters
lambda = zipWith (\a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5]  

-- we can pattern match in lambdas
lambda2 = map (\(a,b) -> a + b) [(1,2),(3,5),(6,3),(2,6),(2,5)]  