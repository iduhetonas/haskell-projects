module Main
  where

import Control.Concurrent
import Sorting

main = do
  --print . quicksort $ "Hello! Strings are technically lists of characters, so you'll definitely be able to sort this!"
  --print . bubblesort $ "Hello! Strings are technically lists of characters, so you'll definitely be able to sort this!"
  print . bubblesort $ "Hello! Strings are technically lists of characters, so you'll definitely be able to sort this!"
