--we can pass arguments on the command line
--there is getARgs function
--this gets the arguments with which the program was run
--getProgName contains the program name
--they live in System.Environmnet

import System.Environment
import Data.List

main = do 
    args <- getArgs
    progName <- getProgName
    putStrLn "The arguments are: "
    mapM putStrLn args
    putStrLn "The program name is: "
    putStrLn progName


