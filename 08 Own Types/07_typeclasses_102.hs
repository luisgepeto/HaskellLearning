--typeclasses are like interfaces
--this is how the Eq typeclass is defined in Prelude
--it is only necessary to implement the signatures of the methods that 
--the typeclass will implement
--we can define the functions in term of each other
--to define a new typeclass we use the keyword class
--to derive from an existing typeclass we use the keyword instance 
--class Eq a where  
    --(==) :: a -> a -> Bool  
    --(/=) :: a -> a -> Bool  
    --x == y = not (x /= y)  
    --x /= y = not (x == y)  


data TrafficLight = Red | Yellow | Green
--because /= is defined in terms of == we only need to define one of them
instance Eq TrafficLight where
    Red == Red = True
    Green == Green = True
    Yellow == Yellow = True
    _ == _ = False

instance Show TrafficLight where
    show Red = "Stop!"
    show Yellow = "Caution!"
    show Green = "Go!!!"

demo1 = Red == Red
demo2 = Red == Yellow
demo3 = Red `elem` [Red, Yellow, Green]
demo4 = [Red, Yellow, Green]