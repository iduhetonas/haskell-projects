{- 
 This is a bunch of Haskell problems, defined here:
 http://www.haskell.org/haskellwiki/H-99:_Ninety-Nine_Haskell_Problems
-}
module H99Prob where
import Data.List (foldl')


-- Problem #1!
myLast :: [a] -> a
myLast (x:xs) = if null xs
                then x
                else myLast xs

-------------------------------------------------------------------------------

-- Problem #2!
-- Efficient implementation to be implemented later
myButLast :: [a] -> a 
myButLast (x:_:[]) = x
myButLast (_:xs) = myButLast xs
                     

-- This is very inefficient, since it's O(n^2) with the length calls
myButLast' :: [a] -> a
myButLast' (x:xs) = if length xs == 1
                   then x
                   else myButLast' xs

-------------------------------------------------------------------------------

-- Problem #3!
-- Yes, we could easily do "list !! index", but I don't believe
-- this is in the spirit of the problem
--
-- TODO: I threw it in anyway, will update later
elementAt :: [b] -> Int -> b
elementAt list index = list !! index

-------------------------------------------------------------------------------

-- Problem #4!
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = (myLength xs) + 1


-------------------------------------------------------------------------------


-- Problem #5!
-- This time using folds, with a really awesome article: 
-- http://www.haskell.org/haskellwiki/Foldr_Foldl_Foldl'
myReverse :: [a] -> [a]
myReverse list = foldl' (\acc x -> x : acc) [] list


-------------------------------------------------------------------------------

--Problem #6!








