--types can also be partially applied
--types have their own metatype called kind
-- :k Int   -> this returns Int :: *
--A star means that it is a concrete types

-- :k Maybe
-- Maybe :: * -> *
--Maybe means that it takes a concrete type and returns a concrete type

-- :k Maybe Int
-- Maybe Int :: *

-- :k Either  
-- Either :: * -> * -> *
--we canpartially apply Either
-- :k Either String  
-- Either String :: * -> *  
--further applying
-- :k Either String Int  
-- Either String Int :: *  

class Tofu t where
    tofu :: j a -> t a j

data Frank a b  = Frank {frankField :: b a} deriving (Show)  
