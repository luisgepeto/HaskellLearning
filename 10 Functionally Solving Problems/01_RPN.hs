--this is a RPN calculator

--we need a functio to take a String and produce a number
solveRPN :: (Floating a, Read a) => String -> a
--we will fold each element with a function and push them into a list
--solveRPN expression = head (foldl foldingFunction [] (words expression))
--point free style
solveRPN = head . foldl foldingFunction [] . words
    --our folding function takes the stack and the current item
    --we need to pattern match against operations
    where   foldingFunction (x:y:ys) "*" = (x*y):ys
            foldingFunction (x:y:ys) "+" = (x+y):ys
            foldingFunction (x:y:ys) "-" = (y-x):ys
            foldingFunction (x:y:ys) "/" = (y / x):ys  
            foldingFunction (x:y:ys) "^" = (y ** x):ys  
            foldingFunction (x:xs) "ln" = log x:xs  
            foldingFunction xs "sum" = [sum xs]  
            foldingFunction xs numberString = read numberString:xs

demo1 = solveRPN "10 4 3 + 2 * -"  
demo2 = solveRPN "2 3 +"
demo3 = solveRPN "90 34 12 33 55 66 + * - +"  
demo4 = solveRPN "90 34 12 33 55 66 + * - + -"  
demo5 = solveRPN "90 34 12 33 55 66 + * - + -"  
demo6 = solveRPN "90 3 -"
demo7 = solveRPN "2.7 ln"  
demo8 = solveRPN "10 10 10 10 sum 4 /"  
demo9 = solveRPN "10 10 10 10 10 sum 4 /"  
demo0 = solveRPN "10 2 ^"  
  