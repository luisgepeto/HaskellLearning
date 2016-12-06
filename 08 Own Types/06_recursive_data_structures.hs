--we can have recursive data structures
--we can define a list as follows
data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)
--in this example Cons is the same as :
demo1 = Empty
demo2 = 5 `Cons` Empty
demo3 = 4 `Cons` (5 `Cons` Empty)  

--we can define a function to be infix by adding just special characters
--this means it is right associative with precedence 5
-- * operator would be infixl 7
-- with higher number, higher precedence
infixr 5 :-:
data List' a = Empty' | a :-: (List' a) deriving (Show, Read, Eq, Ord)

demo4 = 3 :-: 4 :-: 5 :-: Empty'

--we can declare our own functions
-- it is possible to pattern match on :-: because it is a constructor 
infixr 5 .++
(.++) :: List' a -> List' a -> List' a
Empty' .++ ys = ys
(x :-: xs) .++ ys = x :-: (xs .++ ys) 

a = 3 :-: 4 :-: 5 :-: Empty'
b = 6 :-: 7 :-: Empty'  
demo5 = a .++ b 


--lets implement a binary search tree
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)
--creates a singleton tree
singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree
--inserts an element into a new tree
treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
    | x == a = Node x left right
    | x < a = Node a (treeInsert x left) right
    | x > a = Node a left (treeInsert x right)
-- checks if element is in tree
treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
    | x == a = True
    | x < a = treeElem x left
    | x > a = treeElem x right
--lets implement a tree with a fold
nums = [8,6,4,1,7,3,5]
numsTree = foldr treeInsert EmptyTree nums
demo6 = treeElem 8 numsTree
demo7 = treeElem 100 numsTree

