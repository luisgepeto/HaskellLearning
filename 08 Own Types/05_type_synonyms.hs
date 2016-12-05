import qualified Data.Map as Map

-- type synonyms only helo when readint the program
--this is done with the type keyword
--type String = [Char]
type PhoneNumber = String  
type Name = String  
type PhoneBook = [(Name,PhoneNumber)]


--this way we can define new functions in a more clear way
inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool  
inPhoneBook name pnumber pbook = (name,pnumber) `elem` pbook  

--we can also parameterize type synonyms
type AssocList k v = [(k,v)]

-- we can partially apply type constructors
type IntMap  = Map.Map Int


--there is a special type called either
--data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)
--we can store two different data types in a single one
--for some computations errors are stored in the left part
--and results in the right part
demo1 = Right 20
demo2 = Left "w00t"

--a hight school has locker witha code
--students tell the supervisor the locker they want and he gives the code
--if th elocker is in use they dont get the code and they give a new locker number

data LockerState = Taken | Free deriving (Show, Eq)
type Code = String
type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map =
    case Map.lookup lockerNumber map of
        Nothing -> Left $ "Locker number " ++ show lockerNumber ++ " doesn't exist"
        Just (state, code) -> if state /= Taken
                                then Right code
                                else Left $ "Locker " ++ show lockerNumber ++ " is already taken"


lockers = Map.fromList   
    [(100,(Taken,"ZD39I"))  
    ,(101,(Free,"JAH3I"))  
    ,(103,(Free,"IQSA9"))  
    ,(105,(Free,"QOTSA"))  
    ,(109,(Taken,"893JJ"))  
    ,(110,(Taken,"99292"))  
    ]  


demo3 = lockerLookup 101 lockers
demo4 = lockerLookup 100 lockers
demo5 = lockerLookup 102 lockers
demo6 = lockerLookup 110 lockers
demo7 = lockerLookup 105 lockers