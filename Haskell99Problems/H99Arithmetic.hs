{- 
 This is a bunch of Haskell list problems, defined here:
 http://www.haskell.org/haskellwiki/H-99:_Ninety-Nine_Haskell_Problems
-}
module H99Arithmetic where

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
