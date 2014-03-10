-- file: ch14/MultiplyTo.hs
-- Found at http://book.realworldhaskell.org/read/monads.html
module ListMonadExample where

multiplyTo :: Int -> [(Int, Int)]
multiplyTo n = do
  x <- [1..n]
  y <- [x..n]
  guarded (x * y == n) $ return (x, y)
  where
    guarded :: Bool -> [a] -> [a]
    guarded True xs = xs
    guarded False _ = []

