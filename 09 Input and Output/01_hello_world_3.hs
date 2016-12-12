import Control.Monad

main = do
    --we can create a single IO action with the help of sequence
    rs <- sequence [getLine, getLine, getLine]
    print rs
    sequence (map print [1,2,3,4,5])
    --maping a functions over a list and seuqncing is so common
    --therefore mapM and mapM_ exist
    --mapM takes a function and a list and sequences it
    --mapM_ does the same but throws the result later
    mapM print [1,2,3]
    --mapM_ print [4,5,6]
    --forM is like mapM only with switche dparamters
    --this is useful in some cases such as
    colors <- forM [1,2,3,4] (\a -> do
        putStrLn $"Which color do you associate with the number "++show a++"?"
        color <- getLine
        return color)
    putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "
    mapM putStrLn colors
    --forever takes an io action and repeats the action forever
    --forever $ do
    --    putStrLn "Give Me some input:"
    --    l <- getLine
    --    putStrLn $ map toUpper l