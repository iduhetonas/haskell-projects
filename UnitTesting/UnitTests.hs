module UnitTesting.UnitTests where

import ConcurrencyProblems.Sorting

prop_idempotent :: Ord a => [a] -> Bool
prop_idempotent xs = quicksort ( quicksort xs ) == quicksort xs
