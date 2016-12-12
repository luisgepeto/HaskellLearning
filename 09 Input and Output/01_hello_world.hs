import Data.Char 

main = do
    putStrLn "hello world!"
    putStrLn "what is your first name?"
    --this binds the getline result to the name variable
    --in order to read any data from the IO we need to use <-
    firstName <- getLine
    putStrLn "what is your last name?"
    lastName <- getLine
    --the last action cannot be bound to a name
    putStrLn ("Hey "++ firstName ++ " "++lastName++", you rock!")
    --we can also have let bindings without the in part in do blocks
    let bigFirstName = map toUpper firstName
        bigLastName = map toUpper lastName
    putStrLn $ "hey " ++ bigFirstName ++ " " ++ bigLastName ++ ", how are you?" 

