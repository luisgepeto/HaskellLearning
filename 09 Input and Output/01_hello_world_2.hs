--make a program that reads a line reversed
import Control.Monad

main = do
    line <- getLine
    if null line
        --the return action creates a fake IO action with the passed element
        then do
            --other helpful functions are
            --putStr prints to terminal without new line
            putStr "Hey"
            --putChar puts a char into the terminal
            putChar 't'
            --print takes a value instance of show and calls show
            print True
            --getChar reads a character from input
            c <- getChar
            putChar c
            --when function is in control.monad 
            --if true it returns an IO action, if false it returns the default return()
            when (c /= ' ') $ do
                putChar c
                --sequence allows to perform io actions after another
                rs <- sequence [getLine, getLine, getLine]
                print rs
                main
        --we have to put the do inside the else because we have to return
        --one IO action in both conditions
        else do
            putStrLn $ reverseWords line
            --we call recursively main to go back to the start
            main

reverseWords :: String -> String
reverseWords = unwords . map reverse . words