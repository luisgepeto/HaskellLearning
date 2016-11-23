--data sets offers sets 
--all elements in a set are unique
--they are ordered
--faster than working with lists
import qualified Data.Set as Set
import Data.List

text1 = "I just had an anime dream. Anime... Reality... Are they so different?"  
text2 = "The old man left his garbage can out and now his trash is all over my lawn!"

--fromlist creates a set
set1 = Set.fromList text1
set2 = Set.fromList text2  

--elements in both sets
demo1 = Set.intersection set1 set2
--elements different in sets
demo2 = Set.difference set1 set2
demo2' = Set.difference set2 set1
--unites bothsets
demo3 = Set.union set1 set2

--there are functions such as
--null, size, member, empty, singleton, insert, delete
demo4 = Set.null Set.empty  
demo5 = Set.null $ Set.fromList [3,4,5,5,4,3]  
demo6 = Set.size $ Set.fromList [3,4,5,3,4,5]  
demo7 = Set.singleton 9  
demo8 = Set.insert 4 $ Set.fromList [9,3,8,1]  
demo9 = Set.insert 8 $ Set.fromList [5..10]  
demo10 = Set.delete 4 $ Set.fromList [3,4,5,4,3,4,5]


--we can check sets for subsets or proper subsets
demo11 = Set.fromList [2,3,4] `Set.isSubsetOf` Set.fromList [1,2,3,4,5]  
demo12 = Set.fromList [1,2,3,4,5] `Set.isSubsetOf` Set.fromList [1,2,3,4,5]  
--proper subset means that not all elements match
demo13 = Set.fromList [1,2,3,4,5] `Set.isProperSubsetOf` Set.fromList [1,2,3,4,5]  
demo13' = Set.fromList [1,2,3,4] `Set.isProperSubsetOf` Set.fromList [1,2,3,4,5]
demo14 = Set.fromList [2,3,4,8] `Set.isSubsetOf` Set.fromList [1,2,3,4,5]

--we an also map and filter over a set
demo15 = Set.filter odd $ Set.fromList [3,4,5,6,7,2,3,4]
demo16 = Set.map (+1) $ Set.fromList [3,4,5,6,7,2,3,4]

--we can remove duplicates from a list faster than with nub
--however we require that the types are of type Ord
setNub xs = Set.toList $ Set.fromList xs
demo17 = setNub "HEY WHATS CRACKALACKIN"  
demo18 = nub "HEY WHATS CRACKALACKIN"  