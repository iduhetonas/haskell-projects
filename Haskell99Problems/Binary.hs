module Binary where

data Tree a = Empty | Branch a (Tree a) (Tree a)
  deriving (Show, Eq)

-- One interest I have is to convert this into a generalized Tree class with an
-- instantiation, rather than a concrete data structure


