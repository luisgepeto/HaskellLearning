range1 = [1..20]
range2 = ['a'..'z']
range3 = [2, 4 .. 20]
range4 = [3, 6..20]
range5 = [0.1,0.3..1]

--infinite list
--first 100 multiples of 13
take' = take 100 [13, 26..] 

--cycle create infinite list
lol = take 12 (cycle "LOL")
repeat' = take 3 (repeat "1")
replicate' = replicate 3 "hello"