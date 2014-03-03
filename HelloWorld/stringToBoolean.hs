module StringToBool where

import Data.Char

stringToBool :: String -> [Bool]
stringToBool (x:xs) | isLower x = True : stringToBool xs
                    | otherwise = False : stringToBool xs
stringToBool [] = []

stringToBool' :: String -> [Bool]
stringToBool' = map (isLower)
