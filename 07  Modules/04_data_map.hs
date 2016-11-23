--association lists are like dictionaries
import qualified Data.Map as Map

phoneBook = 
    [
        ("betty","555-2938")  
        ,("bonnie","452-2928")  
        ,("patsy","493-2928")  
        ,("lucille","205-2928")  
        ,("wendy","939-8282")  
        ,("penny","853-2492")  
    ]

--crashes on emtpy list
findKey :: (Eq k) => k -> [(k,v)] -> v
findKey key xs = snd . head . filter (\(k,v) -> key == k) $ xs

--this doesnt fail on a non existing key
findKey' :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey' key [] = Nothing
findKey' key ((k,v):xs) = if key == k then Just v else findKey' key xs

--we can implement with fold
findKey'' :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey'' key = foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing


--however it is faster to work with maps!!!!
--fromList takes a list and returns a map
demo1 = Map.fromList phoneBook
--duplicates are discarded
demo2 = Map.fromList [(1,2),(3,4),(3,2),(2,5)]
--it is important to notice that keys need to be orderable to be used in maps

--empty is an empty map
demo3 = Map.empty
--insert takes a key and a value an inserts it into a map
demo4 = Map.insert 3 100 Map.empty
demo5 = Map.insert 5 600 (Map.insert 4 200 ( Map.insert 3 100  Map.empty))
demo6 = Map.insert 5 600 . Map.insert 4 200 . Map.insert 3 100 $ Map.empty  

fromList' :: (Ord k) => [(k,v)] -> Map.Map k v
fromList' = foldr (\(k,v) acc -> Map.insert k v acc) Map.empty
demo7 = fromList' [(1,2),(3,4),(3,2),(2,5)]

--null checks if a map is empty
demo8 = Map.null Map.empty
demo9 = Map.null $ Map.fromList [(1,2)]

--size checks the size of the map
demo10 = Map.size Map.empty
demo11 = Map.size $ Map.fromList [(2,4),(3,3),(4,2),(5,4),(6,4)]

--singleton takes a key and a value and creates a map with one mapping
demo12 = Map.singleton 3 9  

--lookup operates like the list equivalent, returning the value
demo13 = Map.lookup 3 $ Map.fromList [(1,2),(3,2),(2,5)]
demo14 = Map.lookup 10 $ Map.fromList [(1,2),(3,2),(2,5)]

--member takes a key and amap and checks if it is in the map
demo15 = Map.member 3 $ Map.fromList [(3,6),(4,3),(6,9)]
demo16 = Map.member 3 $ Map.fromList [(2,5),(4,5)]    

-- map and filter work like they did on lists (operate only on values)
demo17 = Map.map (*100) $ Map.fromList [(1,1),(2,4),(3,9)]  

--toList is the inverse operatino to fromList
demo18 = Map.toList . Map.insert 9 2 $ Map.singleton 4 3  

--keys and elems return the list of keys or values
demo19 = Map.keys $ Map.fromList [(1,1),(2,4),(3,9)]
demo19' = map fst . Map.toList $  Map.fromList [(1,1),(2,4),(3,9)]
demo20 = Map.elems $ Map.fromList [(1,1),(2,4),(3,9)]
demo20' = map snd . Map.toList $  Map.fromList [(1,1),(2,4),(3,9)]

--fromListWith adds a function to decide what to do with duplicate keys
phoneBook' =   
    [
        ("betty","555-2938")  
        ,("betty","342-2492")  
        ,("bonnie","452-2928")  
        ,("patsy","493-2928")  
        ,("patsy","943-2929")  
        ,("patsy","827-9162")  
        ,("lucille","205-2928")  
        ,("wendy","939-8282")  
        ,("penny","853-2492")  
        ,("penny","555-2111")  
    ]  
phoneBookToMap :: (Ord k) => [(k, String)] -> Map.Map k String
phoneBookToMap xs = Map.fromListWith (\number1 number2 -> number1 ++ ", "++number2) xs
demo21 = Map.lookup "patsy" $ phoneBookToMap phoneBook'

--we can use this for several manipulations
demo22 = Map.fromListWith max [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]
demo23 = Map.fromListWith (+) [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]

--insertwith is similar to fromlistwith    
demo24 = Map.insertWith (+) 3 100 $ Map.fromList [(3,4),(5,103),(6,339)]  