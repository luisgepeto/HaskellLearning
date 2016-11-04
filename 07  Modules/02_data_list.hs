import Data.List

--intersperse takes an element and puts it between each pair of elements
demo1 = intersperse '.' "MONKEY"
demo2 = intersperse 0 [1,2,3,4,5,6]

--intercalate takes a list and a list of lists
-- it puts the list between the list of lists and flattens
demo3 = intercalate " " ["hello", "world"]
demo4= intercalate [0,0,0] [[1,2,3],[4,5,6],[7,8,9]]

--transpose transposes a list of lists as a 2d matrix
demo5 = transpose [[1,2,3],[4,5,6],[7,8,9]]
demo6 = transpose ["hey","there","guys"]  

--Say we have the polynomials 3x2 + 5x + 9, 10x3 + 9 and 8x3 + 5x2 + x - 1 
--and we want to add them together.
polySum = map sum $ transpose [[0,3,5,9],[10,0,0,9],[8,5,1,-1]]


--foldl' and foldl1' are non lazy folds

--concat flattens a list of lists
demo7 = concat ["foo","bar","car"]  
demo8 = concat [[3,4,5],[2,3,4],[2,1,1]]  

--and takes values and returns true if all the values are true
demo9 = and $ map (>4) [5,6,7,8]
demo10 = and $ map (==4) [4,4,3,4]

-- or is like and but makes an or
demo11 = or $ map (==4) [2,3,4,5,6,1]
demo12 = or $ map (>4) [1,2,3]  


--any and all take a predicate and check if the list atisfy the values
demo13 = any (==4) [2,3,4,6,1,4]
demo14 = all (>4) [6,9,10]
demo15 = all (`elem` ['A'..'Z']) "HEYGUYSwhatsup"  
demo16 = any (`elem` ['A'..'Z']) "HEYGUYSwhatsup"  

--itarate takes a function and starting values
--applies the function to the starting value, then to the result and so on...
demo17 = take 10 $ iterate (*2) 1 
demo18 = take 3 $ iterate (++ "haha") "haha"

--splitAt takes number and a list and splits the list at the index
--returns a tuple
demo19 = splitAt 3 "heyman"  
demo20 = splitAt 100 "heyman"  
demo21 = splitAt (-3) "heyman"
demo22 = splitAt 1 [1,2,3]


--takeWhile returns a list until it is true
demo23 = takeWhile (>3) [6,5,4,3,2,1,2,3,4,5,4,3,2,1]  
demo24 = takeWhile (/=' ') "This is a sentence"  
--dropWhile is the oposite of takeWhile
demo25 = dropWhile (>3) [6,5,4,3,2,1,2,3,4,5,4,3,2,1]  
demo26 = dropWhile (/=' ') "This is a sentence"
--when did stocks exceeded 1000 for first time?
stock = [(994.4,2008,9,1),(995.2,2008,9,2),(999.2,2008,9,3),(1001.4,2008,9,4),(998.3,2008,9,5)]
stock' = head $ dropWhile (\(val, y, m, d) -> val < 1000) stock

--span is like takeWhile but returns a pair of lists, 
--one with the result of the takeWhile and the other with the rest
demo27 = span (/=4) [1,2,3,4,5,6,7]  
 --break is analogous but it breaks when the predicate is first true
demo28 = break (==4) [1,2,3,4,5,6,7]

--sort sorts a lists
demo29 = sort [8,5,3,2,1,6,4,2]  
demo30 = sort "This will be sorted soon"  

--group takes list and groups consecutive similar elements into a list
demo31 = group [1,1,1,1,2,2,2,3,3,3,4,4,5,6,7]
demo32 = map (\l@(x:xs) -> (x, length l)) . group . sort $ [1,1,1,1,2,2,2,3,3,3,4,4,5,6,7]

--inits and tails are like init and tail but recursively 
demo33 = inits "woot"
demo34 = tails "woot"  
demo35Search :: (Eq a) => [a] -> [a] -> Bool
demo35Search needle haystack = 
    let nlen = length needle
    in foldl (\acc x -> if take nlen x == needle then True else acc) False (tails haystack)

-- isInfixOf functions searches for a sublist in a list
demo36 = isInfixOf "cat" "im a cat burglar"
demo37 = isInfixOf "cat" "im a Cat burglar"

--isPrefixOf and isSuffixOf searches a sublist at the beggining and end of a list
demo38 = isPrefixOf "hey" "hey there"
demo39 = isPrefixOf "hey" "oh hey there"
demo40 = isSuffixOf "there" "oh hey there"
demo41 = isSuffixOf "there" "oh hey there!"

--elem and notElem check if is inside list
demo42 = elem 3 [1,2,3]
demo43 = notElem 4 [1,2,3]

--partition takes a list and predicate and returns pair of lists
--first list matches the predicate and second doesnt
demo44 = partition (`elem` ['A'..'Z'])  "BOBsidneyMORGANeddy"  