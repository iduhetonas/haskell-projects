module Sorting 
  where
-- Implementation of quicksort from memory.
--
-- Hoping to extend this into a concurrent program that I 
-- attempted in C a long time ago.
--

-- Steps to quicksort:
-- 1) Take the first element as the "midpoint"
-- 2) Put >= into first list, < into second
-- 3) Call recursively and join the lists, i.e. 
-- (quicksort list1) ++ (quicksort list2)
--
-- *) When it works correctly, run each recursive call as a separate thread

quicksort :: (Ord a) => [a] -> [a]
quicksort ([]) = []
quicksort (x:xs) = quicksort list1 ++ [x] ++ quicksort list2
  where
    list1 = filter (<= x) xs
    list2 = filter (>  x) xs


-- Bubblesort
--
-- Adapted from:
-- http://rosettacode.org/wiki/Sorting_algorithms/Bubble_sort#Haskell
--
-- The idea here is interesting. This is able to track the "state" of the 
-- program by setting a case | guard syntactic sugar where the toplevel of the 
-- function calls a sub-function to bubblesort a list. If the bubblesort fails 
bubblesort :: (Ord a) => [a] -> [a]
bubblesort list = case _bubblesort list of
                       pass | list == pass -> pass
                            | otherwise    -> bubblesort pass
  where _bubblesort (x:y:xs) = if x > y
                               then y : (_bubblesort (x : xs))
                               else x : (_bubblesort (y : xs))
        _bubblesort list = list
