myTuple = (8, 11)
fst' = fst myTuple
snd' = snd myTuple

-- the zip function will merge two lists into tuples
zip' = zip [1,2,3,4,5] [5,5,5,5,5]  
lazyZip = zip [1.. ] ["one", "two", "three", "four", "five"]  

--triangles problem
triangles =  [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]   
rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]  
rightTrianglesPerimeter x = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == x]