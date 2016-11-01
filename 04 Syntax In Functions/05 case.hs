-- pattern matchin on parameters in functions definition
head' :: [a] -> a  
head' [] = error "No head for empty lists!"  
head' (x:_) = x  

head'' :: [a] -> a  
head'' xs = case xs of  [] -> error "No head for empty lists!"  
                        (x:_) -> x  

-- cases can be used anywhere not only on function definitions
describeList :: [a] -> String  
describeList xs = "The list is " ++ case xs of [] -> "empty."  
                                               [x] -> "a singleton list."   
                                               xs -> "a longer list."  


describeList' :: [a] -> String  
describeList' xs = "The list is " ++ what xs  
    where what [] = "empty."  
          what [x] = "a singleton list."  
          what xs = "a longer list."  