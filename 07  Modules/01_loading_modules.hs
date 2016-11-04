--modules are bits of functionality
--Prelude module is the default module

import Data.List
--import only selected functions
-- import Data.List (nub, sort)
--import excluding selected functions
-- import Data.List hiding (sort)
--when a module has coliding definitions we do the following
import qualified Data.Map as M

numUniques :: (Eq a) => [a] -> Int
-- nub removes duplicated elements
numUniques = length . nub
numUniques' = numUniques [1,2,2,3]

