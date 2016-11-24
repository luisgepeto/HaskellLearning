data Person = Person String String Int Float String String deriving (Show)

guy = Person "Buddy" "Flinkenstein" 43 184.2 "526-2928" "Chocolate"

--if we wanted to retrieve information we have to do
firstName :: Person -> String  
firstName (Person firstname _ _ _ _ _) = firstname  
    
lastName :: Person -> String  
lastName (Person _ lastname _ _ _ _) = lastname  
    
age :: Person -> Int  
age (Person _ _ age _ _ _) = age  
    
height :: Person -> Float  
height (Person _ _ _ height _ _) = height  
    
phoneNumber :: Person -> String  
phoneNumber (Person _ _ _ _ number _) = number  
    
flavor :: Person -> String  
flavor (Person _ _ _ _ _ flavor) = flavor  

demo1 = firstName guy
demo2 = lastName guy
demo3 = age guy
demo4 = height guy
demo5 = phoneNumber guy
demo6 = flavor guy

--there is another way to do this. 
--This creates automatically lokup fields and functions
--this is called record syntax
data Person' = Person' { firstName' :: String
                       , lastName' :: String
                       , age' :: Int
                       , height' :: Float
                       , phoneNumber' :: String
                       , flavor' :: String    
                       } deriving(Show)

guy' = Person' "Buddy" "Flinkenstein" 43 184.2 "526-2928" "Chocolate"
demo1' = firstName' guy'
demo2' = lastName' guy'
demo3' = age' guy'
demo4' = height' guy'
demo5' = phoneNumber' guy'
demo6' = flavor' guy'


--this also affects how the types are shown
--(print guy and guy')
demo7 = guy
demo8 = guy'
--we can also put fields not in order
guy2 = Person' { firstName' = "Henry"
                , lastName'="Ford"
                , height' = 10
                ,flavor'="Other"
                ,phoneNumber'="aaa"
                , age'=5}
