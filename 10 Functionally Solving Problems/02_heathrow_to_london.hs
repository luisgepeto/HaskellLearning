--hethrow to london 
--repreesent the shortest path possible in a bifurcation
{- input looks like this:
50  
10  
30  
5  
90  
20  
40  
2  
25  
10  
8  
0  

           50   A1   5    A2   40   A3   10   A4
        --------**--------**--------**--------**
                ||        ||        ||        ||
HEATHROW      30||      20||      25||       0|| LONDON
                ||        ||        ||        ||
        --------**--------**--------**--------**
           10   B1   90   B2   2    B3   8    B4



--each node has its info and two roads except for the last one 
--data Node = Node Road Road | EndNode Road
--each road has a length and a node it points to
--data Road = Road Int Node
--for example the first part would be Road 50 A1
-- where A1 would be a Node with Roads that point to B1 and A2
--we could also define Node as:
--data Node = Node Road (Maybe Road)
--so that last nodes dont have another road


--HOWEVER we can  simplify this
--We view each of the sections as a collection of two main roads and an intersection
--i.e. 50, 10, 30 | 5, 90, 20... etc
-}
import Data.List

data Section = Section { getA :: Int, getB :: Int, getC :: Int } deriving (Show)
type RoadSystem = [Section]  

heathrowToLondon :: RoadSystem
heathrowToLondon = [Section 50 10 30, Section 5 90 20, Section 40 2 25, Section 10 8 0]

data Label = A | B | C deriving (Show)
type Path = [(Label, Int)]

--this enables to define an optimal path function
--optimalPath :: RoadSystem -> Path
--for example the answer would be
--[(B,10),(C,30),(A,5),(C,20),(B,2),(B,8)]  

--lets implement a function!
--this takes the previous optimal path and a new section and gives the new optimal paths
roadStep :: (Path, Path) -> Section -> (Path, Path)
roadStep (pathA, pathB) (Section a b c) =
    --these are the previous optimal prices to reach the paths
    let priceA = sum $ map snd pathA
        priceB = sum $ map snd pathB
        forwardPriceToA = priceA + a
        crossPriceToA = priceB + b + c
        forwardPriceToB = priceB + b
        crossPriceToB = priceA + a + c
        newPathToA = if forwardPriceToA <= crossPriceToA
                        then (A, a):pathA
                        else (C, c):(B,b):pathB
        newPathToB = if forwardPriceToB <= crossPriceToB
                        then (B,b):pathB
                        else (C,c):(A,a):pathA
    in (newPathToA, newPathToB)

--we can apply this function to the first section of the highway
demo1 = roadStep ([],[]) (head heathrowToLondon)
--then on the second element
demo2 = roadStep demo1 (heathrowToLondon !! 1)
--and so on...


optimalPath :: RoadSystem -> Path
optimalPath roadSystem = 
    let (bestAPath, bestBPath) = foldl roadStep ([],[]) roadSystem
    in if sum (map snd bestAPath) <= sum (map snd bestBPath)
        then reverse bestAPath
        else reverse bestBPath

--THIS is the ANSWER, weneed to convert it!;
demo3 = optimalPath heathrowToLondon

--make a function that splits a list into a list of lists of same size
groupsOf :: Int -> [a] -> [[a]]
groupsOf 0 _ = undefined
groupsOf _ [] = []
groupsOf n xs = take n xs : groupsOf n (drop n xs)

--and then into the program!
main = do
    contents <- getContents
    let threes = groupsOf 3 (map read $ lines contents)
        roadSystem = map (\[a,b,c] -> Section a b c) threes
        path = optimalPath roadSystem
        pathString = concat $ map (show . fst) path
        pathPrice = sum $ map snd path
    putStrLn $ "The best path to take is: " ++ pathString  
    putStrLn $ "The price is: " ++ show pathPrice  

