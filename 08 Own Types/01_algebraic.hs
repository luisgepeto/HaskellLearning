--we can define our own data types
--we need to supply a value constructor
--data Bool = False | True
--data Int = -2147483648 | -2147483647 | ... | -1 | 0 | 1 | 2 | ... | 2147483647

--we can export all of the types in this file into a module
-- setting .. exports all constructors for a type (i.e. Rectangles and Circles)
-- we can opt to not export any constructor and only be able to access
-- from functions such as baseCircle and baseRect
-- this hides the implementation to the user
module Shapes 
( Point(..)
, Shape(..)
, surface
, nudge
, baseCircle
, baseRect
) where


--define a shape which can be circle or rectangle
-- each shape has a constructor
--we can derive a type from another
data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving(Show)

--when definin a neew function we need to set the type it receives
--we pattern match against the constructor
surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ 2
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

demo1 = surface $ Circle 10 20 10
demo2 = surface $ Rectangle 0 0 100 100

--we need to derive from show typeclass to print
demo3 = Circle 10 20 10

--constructors are functions so we can partially apply them
demo4 = map (Circle 10 20) [4,5,6,6]

data Point = Point Float Float deriving (Show)
data Shape' = Circle' Point Float | Rectangle' Point Point deriving (Show)

--we can redefine functions in terms of predefined functions
surface' :: Shape' -> Float  
surface' (Circle' _ r) = pi * r ^ 2  
surface' (Rectangle' (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

demo5 = surface' (Rectangle' (Point 0 0) (Point 100 100))  
demo6 = surface' (Circle' (Point 0 0) 24)

-- create a function that moves a shape on x and y1
nudge :: Shape' -> Float -> Float -> Shape'
nudge (Circle' (Point x y) r) a b = Circle' (Point (x+a) (y+b)) r
nudge (Rectangle' (Point x1 y1) (Point x2 y2)) a b = Rectangle' (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))

demo7 = nudge (Circle' (Point 34 34) 10) 5 10   

-- we can create helper functions that ease working with points
baseCircle :: Float -> Shape'
baseCircle r = Circle' (Point 0 0) r

baseRect :: Float -> Float -> Shape'
baseRect width height = Rectangle' (Point 0 0) (Point width height)

demo8 = nudge (baseRect 40 100) 60 23 

