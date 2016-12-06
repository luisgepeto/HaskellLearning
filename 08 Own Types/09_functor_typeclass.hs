--functor typeclass is for things that can be mapped over
--it is implemented like this
--int his case f is not aconcrete type
-- it is rather a type constructor with one parameter
--it receives a function that turns a to b and a functor aplied with one type
--returnning a functor applied to another type
-- class Functor f where
--     fmap :: (a -> b) -> f a -> f b

--here is how list is a functor
-- instance Functor [] where
--     fmap = map
--in this case map is just an fmap 
demo1 = fmap (*2) [1..3]
demo2 = map (*2) [1..3]

--maybe can also be a functor
-- instance Functor Maybe where
--     fmap f (Just x) = Just (f x)
--     fmap f Nothing = Nothing 

demo3 = fmap (++ " HEY GUYS IM INSIDE THE JUST") (Just "Something serious.")  
demo4 = fmap (++ " HEY GUYS IM INSIDE THE JUST") Nothing  
demo5 = fmap (*2) (Just 200)
demo6 = fmap (*2) Nothing

--lets make tree an instance of the functor typeclass
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)
singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree
treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
    | x == a = Node x left right
    | x < a = Node a (treeInsert x left) right
    | x > a = Node a left (treeInsert x right)
treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
    | x == a = True
    | x < a = treeElem x left
    | x > a = treeElem x right


instance Functor Tree where
    fmap f EmptyTree = EmptyTree
    fmap f (Node x leftsub  rightsub) = Node (f x) (fmap f leftsub) (fmap f rightsub)

demo7 = fmap (*2) EmptyTree
demo8 = fmap (*4) (foldr treeInsert EmptyTree [5,7,3,2,1,7])  

--we can make either an instance of the functor typeclass
-- but we need to partially apply the constructor
--because Either a b
--however we cannot apply f to  Left side 
--because it is of a different type
-- instance Functor (Either a) where
--     fmap f (Right x) = Right (f x)
--     fmap f (Left x) = Left x

demo9 = fmap (*2) $ Left "Some Error"
demo10 = fmap (*2) $ Right 4