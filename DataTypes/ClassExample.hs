-- Exporting the data type and the deconstructor, 
-- but NOT the data constructor
module ClassExample 
  (
    AnonClass(fromAnonClass)
  , anonClass
  ) where

newtype AnonClass a = AnonClass {
  fromAnonClass :: [a]
} deriving (Eq, Ord, Show)

anonClass :: [a] -> AnonClass a
anonClass = AnonClass
