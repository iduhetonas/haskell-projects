{- 
 This is a bunch of Haskell list problems, defined here:
 http://www.haskell.org/haskellwiki/H-99:_Ninety-Nine_Haskell_Problems
-}
module H99Arithmetic where

import Data.List
import Data.Ord
import H99List(encode)

-- Problem #31!
isPrime :: Int -> Bool
isPrime 2 = True
isPrime var = 
  let list = [2.. (var-1)]
      filtList = filter (isModZero $ var) list
  in  if null filtList
      then False
      else True
  where
  isModZero x y | mod x y == 0 = True
                | otherwise = False

--------------------------------------------------------------------------------


-- Problem #32!
myGCD :: (Integral a) => a -> a -> a
myGCD first second = 
  case rem first second of
       result | result == 0 -> second
              | otherwise   -> myGCD second result

--------------------------------------------------------------------------------


-- Problem #33!
-- Need to figure out how to make this point-free
coprime :: (Integral a) => a -> a -> Bool
coprime first second = (==1) $ myGCD first second


--------------------------------------------------------------------------------

-- Problem #34!
totient :: Int -> Int
totient num = 
  let totFunc = coprime num
  in length . filter (/=False) $ map totFunc [1..(num-1)]


--------------------------------------------------------------------------------

-- Problem #35!
-- Very surprised that this worked on the first try.
-- Though using an input of 1 yields an infinite loop
primeFactors :: Int -> [Int]
primeFactors num = 
  case findFact num [2..] of
    result | result == num -> result : []
           | otherwise ->  result : primeFactors (div num result)
  where
    findFact nm (x:xs) | nm == 1 || nm == -1 = nm  
                       | rem nm x == 0 = x        
                       | nm == x = x
                       | otherwise = findFact nm xs

--------------------------------------------------------------------------------


-- Bonus problem
-- This takes in a list of numbers (i.e. [1.100]) and returns the most prime
-- factors inside the list.
-- TODO: This could be way more efficient, especially in primeFactors
mostPrimeFactors :: [Int] -> [Int]
mostPrimeFactors list = maximumBy (comparing length) $ map primeFactors list

--------------------------------------------------------------------------------


-- Problem #36!
-- This solves (a, b) as (b, a) instead
prime_factors_mult :: Int -> [(Int, Int)]
prime_factors_mult = encode . primeFactors


--------------------------------------------------------------------------------

-- Problem #37!
--totient' :: Int -> Int
--totient' num = 
--  let list = prime_factors_mult num
--  in calc list
--  where
--    calc (x:xs) = ((snd x) - 1) * (snd x) ** ((fst x) - 1) * calc xs
