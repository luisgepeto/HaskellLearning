--to generate random numbers we have system.random
--it exports several functions
--random :: (RandomGen g, Random a) => g -> (a,g)
--We have new typeclases
--RandomGen acts as sources of randonmness
--Random is for things that can take random values
--the system.random exports the stfgen which is an instance of RandomGen
import System.Random

--mkStdGen createsa  random generator
--this will always return the same random because the randomgen is the same
demo1 = random (mkStdGen 100) :: (Int, StdGen)
demo2 = random (mkStdGen 949494) :: (Int, StdGen)
--we can cast to different types of randoms
demo3 = random (mkStdGen 949488) :: (Bool, StdGen)
demo4 = random (mkStdGen 949494) :: (Integer, StdGen)
--it returns a new generator for us!!!!

threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins gen =
    let (firstCoin, newGen) = random gen
        (secondCoin, newGen') = random newGen
        (thirdCoin, _) = random newGen'
    in (firstCoin, secondCoin, thirdCoin)

demo5 = threeCoins $ mkStdGen 21
demo6 = threeCoins $ mkStdGen 22

--ther is also a function called randoms that returns an infinite numver of randoms
demo7 = take 5 $ randoms (mkStdGen 11) :: [Int]
demo8 = take 5 $ randoms (mkStdGen 11) :: [Bool]
demo9 = take 5 $ randoms (mkStdGen 11) :: [Float]

--this function doesnt return a generator because its infinite
--we can accomplish that as follows
finiteRandoms :: (RandomGen g, Random a, Num n, Eq n) => n -> g -> ([a], g)
finiteRandoms 0 gen = ([], gen)
finiteRandoms n gen =
    let (value, newGen) = random gen
        (restOfList, finalGen) = finiteRandoms (n-1) newGen
    in (value:restOfList, finalGen)

demo10 = finiteRandoms 3 (mkStdGen 10) :: ([Int], StdGen)

--randomR gets a random from a range
--randomR :: (RandomGen g, Random a) => (a,a) -> g -> (a, g)
demo11 = randomR (1,6) (mkStdGen 359353) :: (Int, StdGen)
--we can also produce a stream of randomRs
demo12 = take 10 $ randomRs (1,6) (mkStdGen 35935335) :: [Int]
demo13 = take 10 $ randomRs ('a','z') (mkStdGen 3) :: [Char]


 