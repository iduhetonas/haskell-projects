module SingleLists where

cons' :: a -> [a] -> [a]
cons' val lst = val : lst

snoc' :: a -> [a] -> [a]
snoc' val lst = lst ++ [val]
