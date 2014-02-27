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

isModZero :: Int -> Int -> Bool
isModZero x y = if   mod x y == 0
                then True
                else False

--------------------------------------------------------------------------------


-- Problem #32!
