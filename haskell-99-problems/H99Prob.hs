module H99Prob where


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
