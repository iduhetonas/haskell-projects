module PureProblems
  where

--------------------------------------------------------------------------------

-- Program to remove an element value from a list
--
remove :: (Eq a) => a -> [a] -> [a]
remove _   [] = []
remove acc (x:xs) = if x == acc
                    then remove acc xs
                    else x : (remove acc xs)
                      
-- Found a cool problem mentioned on the Haskell-cafe mailing list here:
-- http://www.seas.upenn.edu/~cis194/hw/06-laziness.pdf
--
-- In essence, the problem states:
-- 
-- Define the stream
-- ruler :: Stream Integer
-- which corresponds to the ruler function
-- 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, . . .
-- where the nth element in the stream (assuming the first element
-- corresponds to n = 1) is the largest power of 2 which evenly divides n


-- The stream part is boring, decided to go
-- simple and pure instead
ruler :: (Integral a) => [a] -> [a]
ruler [] = []
ruler (x:xs) = (powerTwo x) : ruler xs

powerTwo :: (Integral a) => a -> a
powerTwo num = if (num `mod` 2) /= 0
               then 0
               else powerTwo (num `div` 2) + 1

--------------------------------------------------------------------------------

-- Swapping letters to numbers

-- Utilizes non-determinism in lists
-- Ends up being O(26n) == O(n)
-- Treating !(a-z,A-Z) as 27
letterToNum :: String -> [Int]
letterToNum list = do
  x <- list
  return $ getNum 1 x (['a'..'z']++['A'..'Z'])
    where getNum _   _    []     = 27
          getNum idx char (x:xs) | char == x = idx
                                 | otherwise = getNum (idx + 1) char xs
