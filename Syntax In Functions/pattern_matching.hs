lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry bad luck"

--patter matching is like switches
sayMe :: (Integral a) => a -> String
sayMe 1 = "One"
sayMe 2 = "Two"
sayMe 3 = "Three"
sayMe 4 = "Four"
sayMe 5 = "Five"
sayMe x = "Not between 1 and 5"


--can be used with recursion ORDER IS IMPORTANT
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n-1)


--always include a generic case
charName :: Char -> String  
charName 'a' = "Albert"  
charName 'b' = "Broseph"  
charName 'c' = "Cecil" 


--without pattern matching
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)  
addVectors a b = (fst a + fst b, snd a + snd b)
--with pattern matching
addVectors' :: (Num a) => (a, a) -> (a, a) -> (a, a)  
addVectors' (x1, y1) (x2, y2) = (x1 + x2, y1+y2)    


-- how to extract nth element from tuple with patterns
first:: (a,b,c) -> a
first (x, _, _) = x
second:: (a,b,c) -> b
second (_, y, _) = y
third:: (a,b,c) -> c
third (_, _, z) = z


--patterns on list compregensions
xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
--without patterns  
function = [fst x + snd x | x <- xs]
--with patterns
function' = [a+b | (a, b) <- xs]


--parameter maching works with lists to
head' :: [a] -> a
head' [] = error "cant call head on an empty list"
head' (x:_) = x

tell :: (Show a) => [a] -> String  
tell [] = "The list is empty"  
tell (x:[]) = "The list has one element: " ++ show x  
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y  
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y


length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

--As patterns let us pattern match the whole element also
capital :: String -> String  
capital "" = "Empty string, whoops!"  
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x] ++ " Rest of the letters are " ++ xs