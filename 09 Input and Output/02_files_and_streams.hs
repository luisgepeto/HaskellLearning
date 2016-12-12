--getcontents is an I/O action that teads from standard input 
-- until it encounters and end of file character
--it does lazy I/O
import Data.Char

main = do    
    --contents <- getContents
    --putStr (shortLinesOnly contents)
    --the pattern of getting contents and transform it is so common that
    --it has been wrapped on the interact function
    interact shortLinesOnly

shortLinesOnly :: String -> String
shortLinesOnly input =
    let allLines = lines input
        shortLines = filter (\line -> length line < 10) allLines
        result = unlines shortLines
    in result