comprehension1 = [x*2 | x <- [1..10]]

-- predicates are separated by a comma
predicate1 = [x*2 | x <- [1..10], x*2 >=12]
predicate2 = [ x | x <- [50..100], mod x 7 == 3]  
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
--multople predicates
predicate3 = [ x | x <- [10..20], x /= 13, x /= 15, x /= 19]  
--multiple input lists combine each other
combined = [ x*y | x <- [2,5,10], y <- [8,10,11]]  
combined2 = [ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]
combined3 = [ x ++" "++y | x <- ["hello", "world"], y <- ["just", "another", "list"]]

--unimportant parameter with underscore
length' xs = sum [1 | _ <- xs]

removeNonUppercase st = [c | c <- st, elem c ['A'..'Z']]
--several levels
listOfLists = [[1, 2, 3],[4, 5, 6],[7, 8, 9]]
evenLists lls = [ [l|l <- ls, even l] | ls <- lls]  