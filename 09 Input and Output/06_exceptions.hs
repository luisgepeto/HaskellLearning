--exceptions can ebthrown by normal code or IO code
--HOWEVER they can only be caught during the execution of IO code
--DONT MIX EXCEPTIONS AND PURE CODE
--It is better to use types like Either and Maybe


import System.Environment
import System.IO
--we can check if the file exists
import System.Directory
--or we can catch the exception
import Control.Exception
import System.IO.Error


--this mght throw an exception if the supplied args point to a non existing file
main = do
    (fileName:_) <- getArgs
    --this is one solution
    fileExists <- doesFileExist fileName
    if fileExists
        then do
            contents <- readFile fileName
            putStrLn $ "The file has " ++ show (length (lines contents)) ++ " lines!"
        else do
            putStrLn "No such file!"
    catch toTry handler
    catch toTry handler'
    
    

toTry :: IO ()
toTry = do
            (fileName:_) <- getArgs
            contents <- readFile fileName
            putStrLn $ "The file has " ++ show (length (lines contents)) ++ " lines!"

--this handler catches all exceptions! (bad practice)
handler :: IOError -> IO ()
handler e = putStrLn "Whoops had some trouble!"

--this handler catches certain exceptiions and rethrows!
handler' :: IOError -> IO()
handler' e
    --we can get error information with ioe Functions
    | isDoesNotExistError e = case ioeGetFileName e of
        Just path -> putStrLn $ "Whoops! File does not exist at: " ++ path  
        Nothing -> putStrLn "Whoops! File does not exist at unknown location!" 
    --rethrowing the error
    | otherwise = ioError e
--we can have predicates that act on IOError
--isAlreadyExistsError
--isDoesNotExistError
--isAlreadyInUseError
--isFullError
--isEOFError
--isIllegalOperation
--isPremissionErrror
--isUserErrror - evaluates to true when we throw an error using userError
