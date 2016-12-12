--this will read from file
import System.IO
import Data.Char
import System.Directory
import Data.List

main = do
    --binding the openFile action returns a handle
    --the handle represents where the file is
    handle <- openFile "girlfriend.txt" ReadMode
    --this function takes a file handle and reads the contents
    contents <- hGetContents handle
    putStr contents
    --we need to close the handle when finishing
    hClose handle

    --we can do something similar with the withFile function
    withFile "girlfriend.txt" ReadMode (\ handle -> do
        contents <- hGetContents handle
        putStr contents)


    --the same way we have hGetLine hPutStr hPutStrLn and hGetChar....
    --we have also the following functions
    --readFile reads the file lazily and we dont need a handle
    contents2 <- readFile "girlfriend.txt"
    putStr contents2

    --writeFile overwrites a file
    writeFile "girlfriendcaps.txt" (map toUpper contents2)


    --appendFile doesnt truncate the oytput file
    appendFile "girlfriendcaps.txt" "this is an appended line"

    --we can determine how often the file gets read
    withFile "girlfriend.txt" ReadMode (\handle -> do
        hSetBuffering handle $ BlockBuffering (Just 2048)
        contents <- hGetContents handle
        putStr contents)

    --we can also flush the buffer whenever we want to
    handle <- openFile "todo.txt" ReadMode
    --creates a temporary file on the current directory
    (tempName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " _ " ++ line) [0..] todoTasks
    putStrLn "These are your TO-DO items:"
    putStr $ unlines numberedTasks
    putStrLn "Which one do you want to delete?"
    numberString <- getLine
    let number = read numberString
        newTodoItems = delete (todoTasks !! number) todoTasks
    hPutStr tempHandle $ unlines newTodoItems    
    hClose handle
    hClose tempHandle
    --delete the initial file
    removeFile "todo.txt"
    --creates a file
    renameFile tempName "todo.txt"