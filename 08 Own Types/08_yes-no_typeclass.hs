--we can try to implement a javasceipt-ish if in haskell
class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False
    yesno _ = True

instance YesNo [a] where
    yesno [] = False
    yesno _ = True

--id is a library function that takes a paramter and returns the same
instance YesNo Bool where
    yesno = id

instance YesNo (Maybe a) where
    yesno (Just _) = True
    yesno Nothing = False

demo1 = yesno $ length []
demo2 = yesno "haha"
demo3 = yesno ""
demo4 = yesno $ Just 0
demo5 = yesno True
demo6 = yesno []
demo7 = yesno [0,0,0]

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal then yesResult else noResult

demo8 = yesnoIf [] "YEAH!" "NO!"  
demo9 = yesnoIf [2,3,4] "YEAH!" "NO!"  
demo10 = yesnoIf True "YEAH!" "NO!"  
demo11 = yesnoIf (Just 500) "YEAH!" "NO!"  
demo12 = yesnoIf Nothing "YEAH!" "NO!"  
  