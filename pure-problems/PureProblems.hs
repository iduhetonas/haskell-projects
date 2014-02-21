module PureProblems
  where

--------------------------------------------------------------------------------

-- Program to remove an element value from a list
--
remove :: (Eq a) => a -> [a] -> [a]
remove acc [] = []
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

--class LetterDigit a where
--  digit ::  a -> Int
--  letter :: a -> Char
--
---- Is there a better way to do this?
--instance LetterDigit Int where
--  letter 1 = 'a'
--  letter 2 = 'b'
--  letter 3 = 'c'
--  -- Ugh
--
--instance LetterDigit Char where
--  digit

--letterToNum :: String -> [Int]
--letterToNum (x:xs) = 
