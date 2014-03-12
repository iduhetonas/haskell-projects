{-# LANGUAGE FlexibleContexts #-}
-- Found on http://book.realworldhaskell.org/read/monad-transformers.html
-- file: ch18/LocalReader.hs
module LocalExample where
import Control.Monad.Reader

myName :: MonadReader String m => String -> m String
myName step = do
  name <- ask
  return (step ++ ", I am " ++ name)

localExample :: Reader String (String, String, String)
localExample = do
  a <- myName "First"
  b <- local (++"dy") (myName "Second")
  c <- myName "Third"
  return (a, b, c)

localExample' :: Reader String (String, String, String)
localExample' = do
  (,,) `liftM` (myName "First") 
       `ap` (local (++"dy") (myName "Second")) 
       `ap` (myName "Third")
