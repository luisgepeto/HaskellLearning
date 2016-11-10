import Data.List
import Data.Function
import Data.Char
-- has functions that deal with chars
--isControl - checksif is a  control character
--isSpace -character is whitespace(tab, newline, etc)
--isLower - is lower case
--isUpper - is upper case
--isAlpha - is a ltter
--isAlphaNum - is a letter or number
--isPrint - is printable
--isDigit - checks wether a character is a digit
--isOctDigit - octal digit
--isHexDigit - hex digit
--isLetter - a letter
--isMark - checks for preceding accents for letters
--isNumber - checks for numeric
--isPunctuation - checks for punctuation
--isSymbol - fancy math symbol
--isSeparator - unicode spaces and separators
--isAscii - checks for first 128 characters of unicode
--isLatin1 -- checks first 256 char of unicode
--isAsciiUpper -- ascii upper case
--isAsciiLower -- ascii lower case

demo1 = all isAlphaNum "bobby283"
demo2 = all isAlphaNum "eddy the fish!"

demo3 = words "hey guys its me"
demo4 = groupBy ((==) `on` isSpace) "hey guys its me"  
demo5 = filter (not . any isSpace) . groupBy ((==) `on` isSpace) $ "hey guys its me"  

--there is also generalcategory information on a char
--generalCategory can be tested for equality
demo6 = map generalCategory " \t\nA9?|"


--toUpper - converts to uppercase
--toLower - converts to lowercase
--toTitle - converts to title case (same as uppercase)
--digitToInt - converts a char to an int (0-9 or A-F, a-f)
demo7  = map digitToInt "34538"
demo8 = map digitToInt "FF85AB"

--intToDigit is the reverse functions
demo9 = intToDigit 15

--ord and chr functions convert characters to their corresponding numbers
demo10 = ord 'a'
demo11 = chr 97
demo12 = map ord "abcdefgh🐲👽"

--caesar cypher shifts characters fixed number of positions
encode :: Int -> String -> String
encode shift msg =
    let ords = map ord msg
        shifted  = map (+shift) ords
    in map chr shifted

decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg