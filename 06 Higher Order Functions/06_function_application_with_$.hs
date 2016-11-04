--we can use the $ to applicate a function
-- it is righ associative
-- it eliminates the ned for parenthesis

app1 = sum (map sqrt [1..130])
app1' = sum $ map sqrt [1..130]

app2 = sqrt (3 + 4 + 9)
app2' = sqrt $ 3 + 4 + 9


app3 = sum (filter (> 10) (map (*2) [2..10]))
app3' = sum  $ filter (> 10)  $ map (*2) [2..10]

-- function application can be treated as any other function
-- we can map function application over a list of functions

app4 = map ($ 3) [(4+), (10*), (^2), sqrt]