-- a type can be made an instance of a type class if it supports the behavior
--typeclasses are like interfaces
--haskell automatically makes our types instances of following typeclasses
-- Eq Ord Enum Bounded Show Read

--Eq compares elements
-- Show and Read identify objects that can be converted to or from String
data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     } deriving (Eq, Show, Read)


person1 = Person {firstName = "Michael", lastName = "Diamond", age = 43}  
person2 = Person {firstName = "Adam", lastName = "Horovitz", age = 41}  
person3 = Person {firstName = "Adam", lastName = "Yauch", age = 44}
person1' = Person {firstName = "Michael", lastName = "Diamond", age = 43}

--Eq DEMO
demo1 = person1 == person2
demo2 = person2 == person3
demo3 = person3 == person1
--deriving from Eq compares constructors and all properties
demo4 = person1 == person1'
--because Person implements Eq we can use it in expressions that have this constraint
people = [person1, person2, person3]
demo5 = person1 `elem` people

--Show/Read DEMO
demo6 = person1
demo7 = show person2
demo8 = read "Person {firstName =\"Michael\", lastName =\"Diamond\", age = 43}" :: Person
demo9 = read "Person {firstName =\"Michael\", lastName =\"Diamond\", age = 43}" == person1

--when deriving from ord the constructurs are considered
--a constructor defined first is smaller than the ones that come after
--data Bool = False | True deriving (Ord)
demo10 = True `compare` False
demo11 = True > False
demo12 = True < False
demo13 = Nothing < Just 100
demo14 = Nothing > Just (-5000)
demo15 = Just 3 `compare` Just 2
demo16 = Just 100 > Just 50

--we can use enumerations with the help of Enum and Bounded
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
           deriving(Eq, Ord, Show, Read, Bounded, Enum)

demo17 = show Wednesday
demo18 = read "Saturday" :: Day
demo19 = Saturday == Sunday
demo20 = Saturday > Friday
--bounded interface properties
demo21 = minBound :: Day
demo22 = maxBound :: Day
--enum properties
demo23 = succ Monday
demo24 = pred Saturday
demo25 = [Thursday .. Sunday]
