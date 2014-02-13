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

main = do
  return $ ruler [1..20000]

