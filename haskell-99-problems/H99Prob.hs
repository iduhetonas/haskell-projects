{- 
 This is a bunch of Haskell problems, defined here:
 http://www.haskell.org/haskellwiki/H-99:_Ninety-Nine_Haskell_Problems
-}
module H99Prob where
import Data.List (foldl', foldl1')

data NestedList a = Elem a | List [NestedList a]


-- Problem #1!
myLast :: [a] -> a
myLast (x:xs) = if null xs
                then x
                else myLast xs

-------------------------------------------------------------------------------

-- Problem #2!
-- Efficient implementation
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

elementAt :: [b] -> Int -> b
elementAt (x:xs) index = if index == 0
                         then x
                         else elementAt xs (index - 1)

-------------------------------------------------------------------------------

-- Problem #4!
myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = (myLength xs) + 1


-------------------------------------------------------------------------------


-- Problem #5!
-- This time using folds, with a really awesome article: 
-- http://www.haskell.org/haskellwiki/Foldr_Foldl_Foldl'
myReverse :: [a] -> [a]
myReverse list = foldl' (\acc x -> x : acc) [] list


-------------------------------------------------------------------------------

-- Problem #6!
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome list = 
  let reverseList = myReverse list
  in list == reverseList

-------------------------------------------------------------------------------

-- Problem #7!

-- Data definition of NestedList in the problem
-- Rules:

flatten :: NestedList a -> [a]
flatten (List a) = foldl' (++) [] $ map flatten a
flatten (Elem a) = [a]


-------------------------------------------------------------------------------

-- Problem #8!

compress :: (Eq a) => [a] -> [a]
compress all@(x:y:xs) = if x == y
                        then compress (y:xs)
                        else x:compress (xs)
compress (x:[]) = x:[]

-------------------------------------------------------------------------------

-- Problem #9!
--
-- [a,a,a,a,b,b,b,c,c,c]
-- ([a,a,a,a],[b,b,b,c,c,c])
-- first = [a,a,a,a]
-- second = [b,b,b,c,c,c]
--
-- [[a,a,a,a], second]
--
-- So close!
--pack ::(Eq a) => [a] -> [[a]]
--pack all@(x:xs) = 
--  let list = break (x /=) all
--      first = fst list
--      second = snd list
--  in [first, second]

-- Adapted from http://www.haskell.org/haskellwiki/99_questions/Solutions/9
pack ::(Eq a) => [a] -> [[a]]
pack (x:xs) = (x : takeWhile (==x) xs) : pack (dropWhile (==x) xs)



