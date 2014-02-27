module Main where
import UnitTesting.UnitTests
import Test.QuickCheck

main :: IO ()
main = quickCheck (prop_idempotent :: [Integer] -> Bool)
