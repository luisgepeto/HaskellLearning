--strings are just lists of chars
--however, due to lazy evaluation, this can be inneficient when reading large files
--thats why we have bytestring
--we have strict and lazy
--strict can fill memory because they are read completely into memory
--lazy bytestring are not as lazy, stored in chunks of 64k
import System.Environment
import qualified Data.ByteString.Lazy as B
import qualified Data.ByteString as S

--pack  takes a list of byes and returns a ByteString
--it takes a lazy list and makes it less lazy
--pack :: [Word8] -> ByteString
demo1 = B.pack [99,97,110]
demo2 = B.pack [98..120]

--unpack is the reverse function
demo3 = B.unpack $ B.pack [99,97,110]

--fromChunks takes a list of strict byteString and makes it lazy
--toChunks takes a lazy list and makes it strict
demo4 = B.fromChunks [S.pack [40,41,42], S.pack [43,44,45], S.pack [46,47,48]]  

--in order to concatenate bytestring we use B.cons
--this is a lazy operator which will create 
--the strict version is B.cons'
demo5 = B.cons 85 $ B.pack [80,81,82,84]  
demo6 =  B.cons' 85 $ B.pack [80,81,82,84]  
--empty makes an empty bytestring

--we have similar functions as those in Data.list
--head, tail, init, null, length, map, reverse
--foldl, foldr, concat, takeWhile, filter, etc
--there are also functions that have the same name as in IO
--but in this case they return a bytestring
main = do
    (fileName1:fileName2:_) <-getArgs
    copyFile fileName1 fileName2

    
copyFile :: FilePath -> FilePath -> IO ()
copyFile source dest = do
    --reads a file lazily into ByteString
    contents <- B.readFile source
    B.writeFile dest contents
