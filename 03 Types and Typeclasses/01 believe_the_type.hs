--type declaration on functions
removeNonUppercase :: [Char] -> [Char]  
removeNonUppercase st = [ c | c <- st, elem c ['A'..'Z']]   

-- the last parametr is the reutnr type
addThree :: Int -> Int -> Int -> Int  
addThree x y z = x + y + z  


--data types:
-- Int
-- Integer (not bounded)
-- Float
-- Double
-- Bool
-- Char