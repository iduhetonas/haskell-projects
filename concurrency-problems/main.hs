module Main
  where

import Control.Concurrent
import Concurrency

main = return . quicksort $ "Hello! Strings are technically lists of characters, so you'll definitely be able to sort this!"
