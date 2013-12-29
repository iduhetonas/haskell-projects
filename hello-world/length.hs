-- Example from Learn You a Haskell on learnyouahaskell.com

length' :: (Num a) => [a] -> a
length' [] = 0
length' (_:xs) = 1 + length' xs


-- This is of the type (Fractional a) => [a] -> a
-- because the (/) operator is (Fractional a) => a -> a -> a
-- Therefore, this is constrained by (/), which makes sense now
mean' :: (Fractional a) => [a] -> a
mean' all@(x:xs) = (foldl (+) x xs) / length' all
