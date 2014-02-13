module H99Prob where


-- Problem #1!
myLast :: [a] -> a
myLast (x:xs) = if null xs
                then x
                else myLast xs

-------------------------------------------------------------------------------
