-- Difference between do and >>=
module Main where

monadOne :: IO (Maybe String)
monadOne = do
  a <- getLine
  b <- getLine
  return Nothing
  c <- getLine
  return $ Just (a ++ b ++ c)


--monadTwo :: IO (Maybe a)
--monadTwo = Just 1 >>= Just 2 >>= Nothing >>= Just 3

main :: IO (Maybe String)
main = monadOne
