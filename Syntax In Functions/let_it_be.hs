-- let allows to create variables in the expression but they are local to a guard
-- they can be used to pattern match
cylinder :: (RealFloat a) => a -> a -> a  
cylinder r h = 
    let sideArea = 2 * pi * r * h  
        topArea = pi * r ^2  
    in  sideArea + 2 * topArea  

-- we can put let expressions almost anywhere
ex1 = 4*  (let a = 9 in a +1)+2
square' = [let square x = x * x in (square 5, square 3, square 2)] 
--define multiple variables 
tuple' = (let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)
--pattern match in let
pattern' = (let (a,b,c) = (1,2,3) in a+b+c) * 100  


-- use let in list comprehensions
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi  | (w,h) <- xs, let bmi = w / h ^ 2]