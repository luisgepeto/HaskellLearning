-- functions can take functions as parameters
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

--gets two lists and applies a function to zip them
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

--flips the arguments
flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x

--can also be defined as
flip'' :: (a -> b -> c) -> (b -> a -> c)
flip'' f y x = f x y


result = flip' zip [1,2,3,4,5] "hello"
result' = zipWith (flip' div) [2,2..] [10,8,6,4,2]  