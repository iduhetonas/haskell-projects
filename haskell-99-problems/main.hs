module Main (main) where
import OnetoTen (myLast)

main = do
  print . myLast $ "Hooray! Here's a really big string!"
