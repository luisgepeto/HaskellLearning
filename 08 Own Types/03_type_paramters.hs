-- we can have constructors that receives types as arguments
--data Maybe a = Nothing | Just a
--we can pass any type as argument to the Maybe type
--the list type is a type paramter


--without type paramters
data Car = Car { company :: String  
                , model :: String  
                , year :: Int  
                } deriving (Show) 

--with type parameters 
data Car' a b c = Car' { company' :: a  
                     , model' :: b  
                     , year' :: c   
                     } deriving (Show)  

--is this really an advantage???
--lets define a function for the first Car
tellCar :: Car -> String  
tellCar (Car {company = c, model = m, year = y}) = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y  
 
stang = Car {company="Ford", model="Mustang", year=1967}
demo1 = tellCar stang

--what if the same function had a generic Car
    --we notice that the function signature is more complex
tellCar' :: (Show a) => Car' String String a -> String  
tellCar' (Car' {company' = c, model' = m, year' = y}) = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y

demo2 = tellCar' $ Car' "Ford" "Mustang" 1967
demo3 = tellCar' $ Car' "Ford" "Mustang" "nineteen sixty seven"

--it is possible to add a class constrain g in a data declaration such as
--data (Ord k) => Map k v =...
--however we dont benefit that much


data Vector a = Vector a a a deriving (Show)

vplus :: (Num t) => Vector t -> Vector t -> Vector t
vplus (Vector i j k) (Vector l m n) = Vector (i+l) (j+m) (k+n)

vectMult :: (Num t) => Vector t -> t -> Vector t
vectMult (Vector i j k) m = Vector (i*m) (j*m) (k*m)

scalarMult :: (Num t) => Vector t -> Vector t -> t
scalarMult (Vector i j k) (Vector l m n) = i*l + j*m + k*n

demo4 = Vector 3 5 8 `vplus` Vector 9 2 8
demo5 = Vector 3 5 8 `vplus` Vector 9 2 8 `vplus` Vector 0 2 3
demo6 = Vector 3 9 7 `vectMult` 10
demo7 = Vector 4 9 5 `scalarMult` Vector 9.0 2.0 4.0
demo8 = Vector 2 9 3 `vectMult` (Vector 4 9 5 `scalarMult` Vector 9 2 4) 