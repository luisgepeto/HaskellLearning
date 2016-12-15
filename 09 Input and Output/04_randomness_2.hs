--it offers the ability to get a good rancom number generetor
--this generator is stored in the global generator
import System.Random
import Data.List
import Control.Monad(when)

main = do
    --everytime this runs it gets a new random generator 
    --however, it will be the same for the complete gprogram generator
    gen <- getStdGen
    putStrLn $ take 20 $ randomRs ('a','z') gen

    --a way to have more randoms is to generate all we need and then split
    let randomChars = randomRs ('a','z') gen 
        (first20, rest) = splitAt 20 randomChars
        (second20, _ ) = splitAt 20 rest
    putStrLn first20
    putStrLn second20

    --another way is to request a newGenerator
    --thisupdated the new default generator too
    gen' <- newStdGen
    putStrLn $ take 20 $ randomRs ('a','z') gen'
    gen'' <- getStdGen
    putStrLn $ take 20 $ randomRs ('a','z') gen''

    --we can do a program that guesses the number of the user
    askForNumber gen''

askForNumber :: StdGen -> IO ()
askForNumber gen = do
    let (randNumber, newGen) = randomR (1,10) gen :: (Int, StdGen)
    putStr "Which number in the range from 1 to 10 am I thinking of? "
    numberString <- getLine
    when (not $ null numberString) $ do
        let number = read numberString
        if randNumber == number 
            then putStrLn "You are correct!"
            else putStrLn $ "Sorry, it was " ++ show randNumber
        askForNumber newGen



